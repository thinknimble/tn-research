---
layout: note
title: "AI Agent Engineering"
date: 2026-02-28
status: budding
attribution: ai-supported
authors: ["William Huster"]
tags:
  [
    AI,
    agents,
    engineering,
    architecture,
    orchestration,
    multi-agent,
    coding-agents,
    reinforcement-learning,
  ]
related_essays: [our-agency-of-agents]
updated: 2026-02-28
summary: "Building production AI agents is still mostly unsolved engineering. The core loop is simple (~200 lines), but production requires context management, agent coordination, trust, and infrastructure that's still being figured out."
---

## Overview

Building production AI agents is still mostly unsolved engineering. The core architecture is deceptively simple - a tool-calling loop in ~200 lines - but production reality requires context management, agent coordination, and infrastructure that's still being figured out. This note collects sources and patterns relevant to the [[Agency of Agents]] essay.

---

## The Core Architecture

An [HN discussion](https://news.ycombinator.com/item?id=46545620) (citing Thorsten Ball's "How to Build an Agent") revealed that the fundamental agent loop is just: send prompt + tools to LLM, execute tool calls, loop with updated context. **The hard part isn't the loop - it's everything around it.** Dynamic TODO lists prevent premature termination (disabling them drops performance "1-2 grade jumps"). Context management is routinely underestimated - one commenter noted that DIY builders often "lose the rest of the year" on that step alone.

## Production Lessons

Armin Ronacher's [practical lessons from building agents](https://lucumr.pocoo.org/2025/11/21/agents-are-hard/) are worth reading in full. The highlights: skip high-level SDK abstractions and target provider SDKs directly (Anthropic, OpenAI) because model differences are too significant. Manage caching explicitly rather than relying on platform magic. Use reinforcement (injecting reminders after each tool call) as the dynamic guidance mechanism. Isolate failures in subagents to avoid polluting the main context. Use a shared filesystem as the coordination layer between tools.

## Parallel Agent Teams at Scale

Nicholas Carlini at Anthropic demonstrated [16 Claude instances working in parallel](https://www.anthropic.com/engineering/building-c-compiler) to build a 100,000-line C compiler that boots Linux - nearly 2,000 sessions, $20K in costs, 2 weeks of runtime. Key patterns: infinite loop harness in containers, git-based synchronization with task locks via text files, fresh container per session, specialized agent roles (code quality, performance, documentation), and no orchestration agent - emergent coordination via shared state. The most important insight: **the test harness design matters more than the model.** Source: [github.com/anthropics/claudes-c-compiler](https://github.com/anthropics/claudes-c-compiler).

## Agent Orchestration

In May 2025, before agent orchestration became widely discussed, I predicted the category:

> Agents of agents - with Nimble Claude, I put Claude Code in a docker container and wrote an API around it that lets you send in commands from Slack or anywhere. Because he's in a docker container, he has a sandbox to create files and execute programs. I gave him his own access to GitHub and Heroku as well. The thought is: what if Nimble Claude had a tool that let him spin up/down other Claudes and then send them instructions? That would be a coding and infrastructure challenge, but I don't think it's terribly difficult. I'm not sure yet how I would position this as a product. It could just be selling access to a tool that does this or it could enable a particular workflow in a specific domain. I'd call this an "ahead of the curve" idea. I think people are probably already working on it and we'll see hype/a big product category in the next year or so - whenever agents become trustworthy enough to let loose on entire projects and coordinate with each other. There's a big safety and cyber security question in the middle of this that would be interesting to pontificate about.
>
> — William Huster, May 2025

The Nimble Claude setup itself (March 2025) - a containerized agent with sandbox, GitHub/Heroku access, and Slack as the interface - predated and predicted the core pattern that Ramp's Inspect, Stripe's Minions, OpenClaw, and the background-agents framework all independently converged on months later. By February 2026, the orchestration prediction has also materialized in frameworks with `sessions_spawn`, subagent management, and isolated sessions. The key open questions I identified - safety, cybersecurity implications, and product positioning - remain very relevant.

## The Trust Gap

Orchestration tools like [Conductor](https://www.conductor.build/) and [claude-squad](https://github.com/smtg-ai/claude-squad) let you run parallel coding agents in isolated workspaces. But launching agents in parallel is the easy part - the hard part is trusting them. And there's a structural limit to parallelism:

> The design → code → test loop is still fundamentally serial per feature. You can only use 100s of agents when your problem is embarrassingly parallel.
>
> — [@whusterj](https://x.com/whusterj), February 2026

<div class="conversation">
{% message author-id="neil-shah" name="first" time="December 21, 2025 at 10:31 PM" %}
https://www.conductor.build/
{% endmessage %}

{% message author-id="william-huster" name="first" time="December 22, 2025 at 9:59 AM" %}
This is cool. There is also: https://github.com/smtg-ai/claude-squad and a few others.

This sort of thing doesn't really solve my problem, though. Using this, I am still the bottleneck and babysitting, except now it's a room full of toddlers and it's even easier to lose context (maybe I'm just describing management 🫠).

This also doesn't add much value beyond its nice UI. I can do the same thing "my way" with tmux and some wrapper scripts that tell Claude to use git worktrees. But I find that whole approach is fragile, because then Claude doesn't have fully isolated environments to run and test its code. And so I go back to working with just one Claude on a single project with a large "rolling" context window (because it codes best this way) + maybe firing up another instance or two for quick tasks on other things.

I think nice UIs can sell. People are still reinventing the todo app. But launching multiple parallel agents is the easy part. I want to be able to actually trust them.

My theory is that the world is too complex for a single LLM to affordably "do it all." I believe there will be a trend in business towards smaller, affordable LLMs paired with proprietary process definitions. I think that is a durable model for the foreseeable future. Product-wise, I think we should try to build something that enables the process definition part.
{% endmessage %}

{% message author-id="william-huster" name="first" time="December 22, 2025 at 10:02 AM" %}
Armin Ronacher just published a year in review where he suggests that we should consider replacing the pull request model and even Git itself with something that better separates human and AI contributions: https://news.ycombinator.com/item?id=46352875

Maybe I'm stuck in my ways, but I don't see a need. Treating Claude as a separate employee goes partway, though, because I can keep various contributions from my account visibly separate from Claude's.

It may be useful to remove PRs from my process though and focus only on "molding the clay" of outputs I see in staging.
{% endmessage %}

{% message author-id="neil-shah" name="first" time="December 22, 2025 at 10:16 AM" %}
Yeah, that's interesting. I've always found pull requests to be like the end of the chapter. So git has a pretty good transaction history - but it's a lot of individual sentences, but a pull request is like reading a book. But I've been out of the game for long enough so I don't have a strong opinion on this. Let me know how the experiment goes.
{% endmessage %}

{% message author-id="william-huster" name="first" time="December 26, 2025 at 6:17 PM" %}
Here's a timely interview with Steve Yegge. He and Gene Kim (who coined the term DevOps) just published a book called "Vibe Coding." He starts by saying there's a type of dev, usually senior with 12-15 years experience who is pushing back. I'm not sure how widespread that attitude is, but of course Steve really disagrees with them.

He mentions how working with AIs is a skill that requires hundreds if not thousands of hours of hands-on experience to master. I think that's an interesting point to consider for positioning of a "serious" AI product. He thinks as I do that agent orchestration is the next big step and calls it the "factory farming era" of coding. We'll delete our IDEs and move from pair coding to checking our dashboard of AI agents.

He says no one has solved the part where you have to merge the work of multiple AI coders together. At the moment I plan to work around by having one AI per repo, but as they point out in this interview, it is a cop-out. Fine for agencies, but wouldn't really work for single-project engineering teams. This is a matter of complexity and coordination.

I think our core case is and has always been that managing complexity and coordination -> desired outcomes is the hard part and the "true" role of a senior dev is to accomplish that, so we could appeal to senior engineers on those grounds without making them feel threatened that the AI will take their job. "Your job has always had a greater purpose and now you are actually free to do it."

https://youtu.be/zuJyJP517Uw?si=c-xOhHJIwI4xMAA4
{% endmessage %}

</div>

## The Factory Model

The enterprises solving the trust gap are building proprietary agent infrastructure - what [background-agents.com](https://background-agents.com/) calls "the self-driving codebase." The pattern: isolated sandboxes, event-driven triggers, deterministic governance layers, and human review gates. Background agents "receive a trigger, reason about the problem, write code, run tests, and open a pull request" autonomously, excelling at repetitive, well-defined tasks with bounded blast radius.

**Ramp's Inspect** ([builders.ramp.com](https://builders.ramp.com/post/why-we-built-our-background-agent)) writes ~30% of all PRs merged to their frontend and backend repos. Key insight: "Owning the tooling lets you build something significantly more powerful than an off-the-shelf tool will ever be." Agents access the same tools engineers use (Sentry, Datadog, LaunchDarkly, GitHub, Slack), run in Modal sandboxes with 30-minute repo rebuilds, and can spawn nested child sessions for parallel research. Multiplayer-first design lets teams collaborate in a live session.

**Stripe's Minions** ([stripe.dev](https://stripe.dev/blog/minions-stripes-one-shot-end-to-end-coding-agents)) merges 1,300+ PRs per week with zero human-written code. The "one-shot" model goes from Slack message to CI-passing PR with no human interaction in between. Architecture: devbox sandboxes (10-second spin-up), "blueprint" orchestration that interleaves deterministic nodes (git, linting, testing) with free-flowing agent nodes, and a "Toolshed" of ~500 MCP tools for internal context. Agents get an intentionally small subset of tools - deliberate constraint, not unlimited capability. [Part 2](https://stripe.dev/blog/minions-stripes-one-shot-end-to-end-coding-agents-part-2) details the blueprint pattern and scaling lessons.

The common thread: these companies didn't adopt off-the-shelf orchestration tools. They built proprietary process definitions around their codebases - exactly the "smaller LLMs + proprietary process definitions" model predicted in the Trust Gap discussion above.

## Agent Threads as Literate Programming

Gustav van Rooyen argues that [agent conversation threads are the modern embodiment of Knuth's literate programming](https://gvrooyen.substack.com/p/literate-agents). Where Knuth's 1984 WEB system "wove" documentation and "tangled" code from the same source, agent threads capture both intent (user prompts) and implementation (agent reasoning + code) in a persistent, shareable format. Best practice emerging: one thread, one git commit - every line of code annotated with its reasoning.

## Beyond LLMs: The Alberta Plan

Rich Sutton, Michael Bowling, and Patrick Pilarski's ["The Alberta Plan for AI Research"](https://arxiv.org/abs/2208.11173) argues for an agent-centric approach to AI grounded in reinforcement learning rather than language modeling. The core premise: intelligence emerges from agents that continuously interact with a complex world, learning to predict and control their sensory input over time. The agent architecture decomposes into perception (situational state), policy (state → action), value function (state → expected reward), and transition model (enabling planning). The plan extends this with feature-based subtasks and temporally extended options - a fundamentally different path from scaling transformer architectures. If LLMs hit the complexity walls described in [[Verification Complexity]], Sutton's agent-first framework may point toward the architectural shift needed to break through.

## Supporting Infrastructure

[Telos](https://github.com/danielmiessler/Telos) (Daniel Miessler) provides structured templates for "Deep Context" - mission, goals, strategies, KPIs - that agents need to make aligned decisions. As AI becomes more capable, the bottleneck shifts from "what can AI do?" to "what should AI do in this specific context?"

[Walkie](https://walkie.sh/) enables zero-infrastructure P2P encrypted communication between agents using Hyperswarm DHT. No servers, no IP addresses - just a shared channel name and secret. Interesting primitive for multi-agent coordination, though production readiness (persistence, reliability) remains unclear.

## The Inflection Point

SemiAnalysis argues [Claude Code marks the "Web 2.0 moment" for AI](https://newsletter.semianalysis.com/p/claude-code-is-the-inflection-point): the shift from selling tokens (call-and-response) to orchestrating tokens into outcomes (agentic workflows). Claude Code accounts for 4% of GitHub public commits, projected to hit 20%+ by end of 2026. METR data shows autonomous task horizons doubling every 4-7 months. The pattern extends beyond coding: any READ-THINK-WRITE-VERIFY workflow is automatable, touching ~33% of the global workforce. Current adoption: 84% of developers use AI but only 31% use agents - the gap is where the next wave hits.
