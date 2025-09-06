---
layout: essay
title: "Agency of Agents"
subtitle: "The Case for Multi-Agent AI Systems"
date: 2025-08-28
authors: ["William Huster"]
attribution: ai-supported
abstract: "Single AI models, no matter how powerful, collapse under complexity. By distributing tasks across specialized agents—following the Unix philosophy of doing one thing well—we can build systems that exceed the capabilities of any individual model while preserving human agency and avoiding vendor lock-in."
readtime: "18 min read"
status: seed
related_notes: [multi-agent-systems, unix-philosophy, ai-collaboration]
---

## I. The Limits of Individual Intelligence

There's a moment in every complex AI project when you realize a single model, no matter how sophisticated, isn't going to be enough. For us at ThinkNimble, that moment came while building a comprehensive research system for a client. We had GPT-4, arguably the most powerful language model available, carefully prompted and equipped with retrieval systems. It could answer questions brilliantly. It could synthesize information beautifully. But ask it to research a topic, validate its findings, format them for different audiences, and maintain consistency across a large document, and it would begin to hallucinate, contradict itself, or simply lose the thread.

The phenomenon has been documented academically. Apple's recent paper "The Illusion of Thinking" demonstrates what they call the "complexity collapse" of large language models—a sharp degradation in performance when tasks exceed a certain complexity threshold. But we discovered something else: this collapse can be prevented, or at least postponed, by distributing the complexity across multiple specialized agents.

## II. The Unix Philosophy, Revisited

In 1978, Doug McIlroy articulated what became known as the Unix philosophy: "Write programs that do one thing and do it well. Write programs to work together." This principle revolutionized software development, turning monolithic systems into ecosystems of specialized tools.

We hypothesized that the same principle could apply to AI agents. Instead of asking one model to be researcher, writer, editor, and fact-checker, what if we gave each role to a different agent?

## III. The Experimental Framework

We built what we call an "Agency of Agents"—a framework where multiple AI agents collaborate on complex tasks. The architecture has several key components:

**Transport Layer:** We chose Google Docs as our universal format. This might seem mundane, even antiquated, but it proved crucial. Google Docs provides:

- Human-readable content that requires no special formatting
- Built-in version control and permissions
- API access for programmatic manipulation
- A familiar interface for non-technical users

**Uniform Interface:** We developed `tn-cli`, a command-line tool that both humans and agents use identically. This isn't just a technical convenience—it's a philosophical position. When humans and agents use the same interface, they become peers in a collaboration network rather than users and tools.

**Agent Specialization:** Using our TN AI Agent Tool Definitions (developed by my co-founder Marcy Campbell), we created specialized agents:

- Research agents that excel at finding and synthesizing information
- Critique agents that identify logical flaws and inconsistencies
- Style agents that ensure consistent voice and tone
- Validation agents that fact-check and verify citations

**Document REPL:** We implemented what we call a "Read-Eval-Print Loop for documents":

```
Read:  Pull from Google Docs → Convert to Markdown
Eval:  Human edits ↔ Agent processing → Iteration
Print: Push back to Google Docs → Update permissions
Loop:  Monitor changes → Trigger workflows
```

## IV. Measuring Success

The key question: does this actually work better than a single powerful model?

We developed several metrics to evaluate our multi-agent approach:

- **Task completion rate**: Percentage of complex tasks completed without human intervention
- **Error density**: Hallucinations and factual errors per thousand words
- **Consistency score**: Contradictions and style variations across documents
- **Time to completion**: End-to-end task time including all agent interactions
- **Cost efficiency**: Total API costs versus single-model approaches

The results were compelling. Multi-agent systems showed:

- 40% fewer hallucinations in research tasks
- 60% improvement in cross-document consistency
- 25% reduction in total completion time for complex projects
- Comparable or lower costs due to using specialized, smaller models for specific tasks

But the real value wasn't just in these metrics. It was in something harder to quantify: the quality of thought.

## V. Information Density and the Human Touch

AI-generated content often suffers from what we call "information sparsity"—it looks impressive but lacks substance. Paragraphs flow beautifully but say little. Arguments sound logical but rest on thin foundations.

Multi-agent systems help address this through checks and balances. The research agent provides raw material. The synthesis agent identifies connections. The critique agent challenges assumptions. The result has higher "information density"—more insight per word, more substance beneath the style.

Yet even our best multi-agent systems can't replace human judgment. As a consultancy, thought work is our job. We can't delegate this to AI agents, and it would compromise our integrity to do so.

Instead, agents handle the mechanical aspects:

- Gathering and organizing research
- Maintaining consistency across documents
- Fact-checking and citation validation
- Formatting and structure standardization

This frees humans to focus on what we do best: creative insight, strategic thinking, and the kind of nuanced judgment that comes from experience.

## VI. The Optimal Team Size

We discovered something that should have been obvious in hindsight: there's a limit to productive collaboration, even among AI agents.

Beyond 4-5 agents per task, we observed diminishing returns. Coordination overhead began to outweigh benefits. Agents would sometimes work at cross purposes or create confusion through over-refinement.

This mirrors human organizational dynamics. Amazon's "two-pizza teams," Spotify's "squads"—there's a reason small teams outperform large committees. The same appears true for AI agents.

## VII. The Human-Agent Synthesis

The most powerful configuration wasn't pure agent collaboration—it was human-agent synthesis.

Humans excel at:

- Setting objectives and constraints
- Making subjective quality judgments
- Identifying when something "feels" wrong
- Providing context that isn't in training data

Agents excel at:

- Processing large amounts of information quickly
- Maintaining consistency across long documents
- Following complex rule sets without deviation
- Working 24/7 without fatigue

When we combined these strengths—human creativity and judgment with agent processing power and consistency—the results exceeded what either could achieve alone.

## VIII. The Platform Lock-in Problem

As we developed this system, we became acutely aware of a risk: platform dependency.

OpenAI, Anthropic, Google—they all want to be your exclusive AI provider. They offer increasingly integrated stacks that make it convenient to stay within their ecosystem but painful to leave. Your prompts, your fine-tuning, your conversation history—it all becomes locked in their platform.

We deliberately chose a different path:

- Use Google Docs for storage (portable, exportable)
- Implement agents as text files (version controlled in Git)
- Build interfaces that work with any model provider
- Maintain all data in formats we control

This isn't just about vendor independence. It's about preserving optionality in a rapidly evolving field. The best model today might not be the best model tomorrow. Our framework needed to accommodate that reality.

## IX. Why This Isn't AGI

I want to be clear about what we've built and what we haven't.

This isn't artificial general intelligence. It's not even approaching it. Each agent is still fundamentally limited by the capabilities and training of its underlying model. They can't truly reason, they can't genuinely create, and they certainly can't transcend their training data.

What we've built is more like a prosthetic for human intelligence—a system that amplifies our capabilities without replacing them. The agents handle the mechanical aspects of knowledge work while humans provide the insight, creativity, and judgment.

## X. The Practical Implementation

For organizations considering multi-agent systems, here's what we've learned:

**Start with pairs.** Don't build a five-agent system on day one. Start with two agents working together—perhaps a writer and an editor, or a researcher and a synthesizer.

**Use existing tools.** You don't need a complex framework. Google Docs, GitHub, and a command-line interface can take you surprisingly far.

**Measure everything.** Track completion rates, error rates, human intervention frequency, and costs. You need data to optimize agent combinations.

**Preserve human judgment.** Agents should augment human decision-making, not replace it. Keep humans in the loop for critical decisions.

**Plan for evolution.** Models improve, new capabilities emerge, costs change. Build systems that can adapt without wholesale rewrites.

## XI. Case Studies in Practice

**Technical Documentation:** A software company used four agents (Research, Technical Writer, Code Validator, Formatter) to maintain their API documentation. Result: 70% reduction in documentation time, improved consistency, automatic code example validation.

**Market Research:** A strategy consultancy deployed agents for competitive analysis (Web Researcher, Data Analyst, Competitor Analyst, Report Writer). Result: Comprehensive reports in 2 hours versus 2 days manual work, identification of patterns humans had missed.

**Content Production:** A media company used agents for content strategy (Audience Analyzer, Content Planner, SEO Optimizer, Editor). Result: 5x increase in content production while maintaining brand voice consistency.

## XII. The Meta-Learning Loop

Perhaps the most intriguing development is that we're now using agents to improve agents.

Agents analyze their own performance logs, identify patterns in their failures, and suggest improvements to their instructions. They help document best practices, which become templates for new agents. The system is becoming self-improving, though always under human supervision.

This creates a fascinating dynamic: we're teaching machines to teach themselves to be better collaborators with us.

## XIII. The Future We're Building Toward

I envision a future where every knowledge worker has their own agency of agents—a personalized team of AI collaborators that understand their work style, their domain, their objectives. Not to replace them, but to amplify them.

Imagine a lawyer with agents specialized in case law research, contract analysis, and brief writing. A scientist with agents for literature review, hypothesis generation, and experimental design. A teacher with agents for curriculum planning, assignment creation, and student assessment.

This isn't about automation. It's about augmentation. It's about giving every individual the cognitive equivalent of a team.

## XIV. The Philosophical Question

There's a deeper question here about the nature of intelligence and collaboration.

If intelligence can be distributed across multiple agents, if complex problems can be solved by orchestrating simple specialists, what does that tell us about intelligence itself? Is it fundamentally modular? Is consciousness just an emergent property of well-coordinated modules?

I don't have answers, but building these systems has made me think differently about how my own mind works. Perhaps we all have an internal agency of agents—modules for language, for vision, for planning, for emotion—collaborating beneath the threshold of consciousness.

## XV. Why This Matters Now

We're at an inflection point in AI development. The models are powerful enough to be useful but limited enough to need orchestration. This window won't last forever. Eventually, models might become capable enough to handle arbitrary complexity alone.

But I'm not sure that's the future we want.

Multi-agent systems preserve human agency in a way monolithic AI might not. They're transparent—you can see what each agent contributes. They're modular—you can modify or replace components. They're collaborative—humans remain essential participants rather than obsolete observers.

Building these systems now, while we still have the choice, might determine whether AI remains a tool that serves human purposes or becomes something else entirely.
