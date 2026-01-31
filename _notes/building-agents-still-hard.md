---
layout: note
title: "Building Agents is Still Hard - Technical Lessons"
date: 2026-01-30
updated: 2026-01-30
status: budding
attribution: curated
authors: ["Armin Ronacher", "Claude (AI Assistant)"]
source: "https://lucumr.pocoo.org/2025/11/21/agents-are-hard/"
summary: "Practical lessons from building production AI agents. SDK abstractions break at scale, explicit cache management wins, reinforcement does heavy lifting, failures need isolation, and shared filesystem state is critical. Model choice still matters by task."
tags: [AI, agents, engineering, architecture, caching, tools, infrastructure]
---

## TL;DR

Building agents is still messy. SDK abstractions break once you hit real tool use. Caching works better when you manage it yourself. Reinforcement ends up doing more heavy lifting than expected. Failures need strict isolation to avoid derailing the loop. Shared state via filesystem-like layer is critical. Output tooling is surprisingly tricky.

## Agent SDK Lessons

### Skip High-Level Abstractions (For Now)

**Original choice**: Vercel AI SDK with provider abstractions  
**Current choice**: Target provider SDKs directly (OpenAI, Anthropic)

**Why the shift?**

1. **Model differences are significant** - requires custom agent abstraction per model
2. **Provider-side tools break unification** - Anthropic web search routinely destroys message history in Vercel SDK
3. **Cache management easier with native SDKs** - error messages clearer
4. **Abstractions not yet settled** - better to stay in control until patterns emerge

**The tradeoff**: Higher-level SDKs try to unify, but subtle differences (cache control, reinforcement needs, tool prompts, provider tools) mean building on top of their abstractions creates more problems than it solves.

## Explicit Cache Management Wins

**Anthropic's approach**: Makes you pay for caching and manage cache points explicitly.

**Initial reaction**: "Pretty dumb. Why doesn't the platform do this for me?"

**Current position**: "Vastly prefer explicit cache management."

### Why Explicit is Better

1. **Predictable costs** - know exactly what you're paying for
2. **Predictable utilization** - understand cache hit rates
3. **Context editing** - can split conversations, run parallel branches
4. **More control** - optimize cache strategy for your use case

### Cache Strategy with Anthropic

```
Cache Point 1: After system prompt
Cache Point 2: Beginning of conversation
Cache Point 3: Tail of conversation (moves up with messages)
```

**Workaround for cache invalidation**: Feed dynamic info (current time) as separate message later in context instead of in system prompt. Otherwise trashes cache.

**Result**: System prompt and tool selection stay static, cache stays hot.

## Reinforcement in the Agent Loop

Every tool execution = opportunity to inject more than just tool output.

### Uses of Reinforcement

1. **Remind about objectives** - overall goal + task status after each tool call
2. **Provide recovery hints** - when tool fails, suggest alternative approaches
3. **Inject state changes** - inform about background changes (e.g., parallel processing updated something)
4. **Self-reinforcement tools** - e.g., Claude Code's "todo write" tool just echoes back task list, but keeps agent focused

**Why it matters more now**: With explicit caching, system prompt must stay static. Reinforcement becomes the dynamic guidance mechanism.

## Isolate Failures

If you expect lots of failures during execution, hide them from main context.

### Two Approaches

**1. Subagents for iterative tasks**
- Run tasks that need iteration in subagent until success
- Report back only success + brief summary of failed approaches
- Agent learns what didn't work without context pollution

**2. Context editing (Anthropic)**
- Remove failures that didn't drive toward completion
- Preserve signal (what didn't work) but remove noise (full failure output)
- **Downside**: Trashes cache - unclear when trade-off is worth it

## Shared Filesystem State is Critical

For code execution and code generation agents, need **common place to store data**.

### Why Filesystem Works

**Scenario**: Image generation tool → write image → code execution tool reads it → unpack zip → inference tool describes images → code execution tool processes them

**Key insight**: Avoid dead ends where a task can only continue within one tool. Build tools that can take file paths to shared virtual filesystem.

```
ExecuteCode tool → access virtual filesystem
RunInference tool → access same virtual filesystem
GenerateImage tool → write to virtual filesystem
```

This allows arbitrary composition of tools without locking into specific sequences.

## The Output Tool Problem

Agent doesn't represent chat session - it completes tasks and sends final output to human via explicit "output tool" (e.g., sends email).

### Challenges

1. **Tone control is hard** - surprisingly difficult to steer wording compared to using main loop text output
2. **Subtool approach failed** - running another LLM (Gemini Flash) to adjust tone increased latency, reduced quality, lacked context
3. **Information leakage** - sometimes reveals implementation steps we didn't want in final output
4. **Doesn't always call it** - loop ends without output tool being invoked

**Workaround**: Remember if output tool was called. If loop ends without it, inject reinforcement message encouraging use of output tool.

## Model Choice

**Main loop**: Haiku and Sonnet still best tool callers. Gemini models also good. GPT family hasn't found success in main loop yet.

**Subtasks**:
- **Gemini 2.5**: Summarizing large docs, PDFs, extracting from images (avoids Sonnet safety filter issues)

**Cost insight**: Token cost alone doesn't define agent expense. Better tool caller completes job in fewer tokens. Cheaper models aren't necessarily cheaper in a loop.

## Testing and Evals - Unsolved

**The hardest problem**. Agentic nature makes it even harder.

- Can't just do evals in external system (too much context needed)
- Need evals based on observability data or instrumented test runs
- No existing solution has been satisfying yet

"Unfortunately, I have to report that at the moment we haven't found something that really makes us happy."

## Coding Agent Updates

Trialing **Amp** more - not objectively better, but:
- Love their thinking about agents (Oracle + main loop interaction)
- Feels like product built by people who use it (like Claude Code)
- Good for validating different agent designs

## Connections

### Related Notes
- **[[literate-agents]]** - Amp's thread model + reinforcement through context
- **[[complexity-collapse-llms]]** - Why tool calling quality matters more than speed
- **[[ai-code-craft-critique]]** - Craft still matters in agent design decisions

## Quick Additional Reads

- **What if you don't need MCP at all?** - Mario's minimalist CLI approach via Bash
- **The fate of "small" open source** - Platform APIs + AI killing tiny libraries (good!)
- **Tmux is love** - Great for interactive systems agents should work with

---

**Curator's Note**: This is gold for anyone building production agents. The explicit caching insight is particularly valuable - what seems like annoying manual work actually provides crucial control. The shared filesystem pattern solves a real composition problem. And the honesty about testing/evals being unsolved is refreshing - means we're not alone in struggling with this.

**Key takeaway**: Abstractions are premature. Stay close to provider SDKs until patterns emerge. Build your own agent loop.
