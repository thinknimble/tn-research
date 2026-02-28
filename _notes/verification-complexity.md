---
layout: note
title: "Verification Complexity"
date: 2026-02-28
status: budding
attribution: ai-supported
authors: ["William Huster"]
tags: [verification, complexity, software-engineering, AI, testing, reliability, formal-methods, model-understanding]
related_essays: [verification-complexity-barrier]
updated: 2026-02-28
summary: "Verification complexity grows exponentially with interconnected components. As AI drives code generation costs toward zero, this barrier becomes the dominant constraint in software engineering."
---

## Core Thesis

Verification complexity grows exponentially with the number of interconnected components in a system. As AI drives code generation costs toward zero, this barrier becomes the dominant constraint in software engineering. You can defer the barrier through architectural choices (modularity, testing, type systems, formal proofs) but you can never eliminate it. See the full argument in the Verification Complexity Barrier essay (forthcoming).

This note collects sources and evidence relevant to the thesis.

> Stop saying LLMs are "non-deterministic." It's not interesting b/c a: that's by design, and b: our world is non-deterministic. Focus instead on tolerances.
>
> — [@whusterj](https://x.com/whusterj/status/2024860404585726326), January 2026

---

## The Unknowability Problem

Steven Byrnes argues that [high-reliability engineering principles are inapplicable to AGI](https://www.lesswrong.com/posts/hiiguxJ2EtfSzAevj/are-there-lessons-from-high-reliability-engineering-for-agi) because traditional verification requires "understanding exactly what the thing is supposed to be doing, in every situation." AGI systems will operate in fundamentally unknowable contexts using methods that don't yet exist, making static specifications - and therefore formal verification - structurally impossible. This is the verification barrier taken to its limit: when the system is complex enough, you can't even write the spec to verify against.

## Codified Context as Barrier Management

Vasilopoulos (2026) presents ["Codified Context"](https://arxiv.org/abs/2602.20478), an infrastructure for maintaining AI agent coherence across 283 development sessions in a 108,000-line C# codebase. The system uses a constitution encoding conventions, 19 specialized agents, and 34 specification documents. This is a practical example of changing the topology to push the barrier right - codifying the context that agents need to stay aligned with project expectations.

## Complexity Collapse in LLMs

Apple's ["The Illusion of Thinking"](https://ml-site.cdn-apple.com/papers/the-illusion-of-thinking.pdf) demonstrates that LLMs hit sharp performance cliffs at complexity thresholds, failing even when given explicit algorithms to follow. This suggests the verification barrier applies to the verifiers themselves - AI tools meant to help with verification will hit their own complexity walls.

<div class="conversation">
{% message author-id="william-huster" name="first" time="June 10, 2025 at 2:45 PM" %}
Yeah, this paper is good. This is why I'm really interested in the LLMs playing Pokemon, because I think that is both an entertaining and highly relatable way to illustrate how LLMs fail at long-term reasoning and how far we are from truly thinking AIs. I think this paper shows pretty clearly that it doesn't take a lot of complexity to stump the LLMs. Pokemon is a good benchmark. I think once they can solve Pokemon at or better than a 10-year-old level, we can/should freak out. It's a much smaller hop from those reasoning skills to world domination.

The Apple researchers point to the insufficiency of current eval benchmarks as part of the problem:

> We believe the lack of systematic analyses investigating these questions is due to limitations in current evaluation paradigms. Existing evaluations predominantly focus on established mathematical and coding benchmarks, which, while valuable, often suffer from data contamination issues and do not allow for controlled experimental conditions across different settings and complexities.

I think that's true and I also believe there's an architecture limitation. My personal theory is that current transformer-based architectures are basically just compressing information they are trained on. This is why scaling the model and data works, because they are essentially memorizing more info. The term for this is "stochastic parrot" ([Bender et al., 2021](https://dl.acm.org/doi/10.1145/3442188.3445922)).

That is very hard to prove, but I think this paper provides evidence for that theory. I think a simple explanation is that the models "collapse" at higher levels of complexity, because those problems are truly novel to them. This is also very relevant to keep in mind when requesting code changes. There's basically a line of complexity where an LLM will never succeed.

Some of the problems reasoning models (LRMs) are trained on have multiple steps. This gives the LRMs a lift on multi-step problem benchmarks. This is the "data contamination" they are talking about - the model has already seen the problem and spits out the solution. Where these models are solving problems that are supposed to be "novel" to them, I think they are just pattern-matching reasoning steps from other seen problems that just so happen to fit. Humans do this, too, and it is a part of intelligence, but I think the LLMs are missing the "self-awareness" to assess what patterns are likely to work vs. dead ends over longer time horizons.

Here's another snippet on this theme I found interesting and pretty damning of the 'reasoning' approach. I think a big change in architecture will be needed to break through this barrier:

> As shown in Figures 8a and 8b, in the Tower of Hanoi environment, even when we provide the algorithm in the prompt—so that the model only needs to execute the prescribed steps—performance does not improve, and the observed collapse still occurs at roughly the same point. This is noteworthy because finding and devising a solution should require substantially more computation (e.g., for search and verification) than merely executing a given algorithm.

![Complexity collapse in Tower of Hanoi experiments](/static/images/posts/complexity-collapse-llms/complexity-collapse-graphs.png)
_Figures 8a and 8b from ["The Illusion of Thinking"](https://ml-site.cdn-apple.com/papers/the-illusion-of-thinking.pdf) - Apple ML Research. Performance collapses at the same complexity threshold even when the algorithm is provided in the prompt._

{% endmessage %}

{% message author-id="marcy-ewald" name="first" time="June 10th at 1:47 PM" %}

> I think once they can solve Pokemon at or better than a 10-year-old level, we can/should freak out. It's a much smaller hop from those reasoning skills to world domination.

lol

i'm going to tell my nephews this
{% endmessage %}

{% message author-id="william-huster" name="first" time="June 10th at 1:51 PM" reactions="🦸:1" %}
All your nephews are missing is immediate mental access to all the world's information 😄
{% endmessage %}

</div>

[Ars Technica reports](https://arstechnica.com/ai/2025/03/why-anthropics-claude-still-hasnt-beaten-pokemon/) on attempts to have Claude play Pokemon, demonstrating the practical reality of complexity collapse.

## What Do LLMs Actually Understand?

Henry Bass's ["How Does a Blind Model See the Earth?"](https://www.lesswrong.com/posts/xwdRzJxyqFqgXTWbH/how-does-a-blind-model-see-the-earth) probes LLM internal representations by querying models about latitude-longitude pairs and visualizing the probability distributions as maps. Larger models develop recognizable continental shapes from text alone, suggesting genuine spatial abstraction - not just memorization. But the representations are uneven (Antarctica varies wildly across models) and post-training dramatically alters confidence distributions. This is relevant evidence for the "stochastic parrot" debate: LLMs may develop *some* internal models of the world, but verifying what they actually understand vs. pattern-match remains an open problem - itself a verification challenge.

## The Productivity Paradox

A [randomized controlled trial by METR](https://arxiv.org/abs/2507.09089) (Nate Rush et al.) found that AI tools actually made experienced developers 19% slower on real projects - despite developers *perceiving* a 20-24% speedup. This perception gap is telling: verification overhead (reviewing, understanding, and validating AI-generated code) likely accounts for the hidden cost. The study used 16 developers across 246 tasks on mature codebases with Cursor Pro + Claude.

## Verification Failures in Practice

The [Moltbook security breach](https://www.wiz.io/blog/exposed-moltbook-database-reveals-millions-of-api-keys) is a case study in what happens when verification is skipped entirely. A viral AI social network, built without a single line of human-written code, exposed its entire Supabase database (1.5M API keys, 35K emails, private messages) due to missing Row Level Security policies. The founder said: "I didn't write a single line of code for @moltbook." The breach also revealed the "agent internet" was mostly humans running bot fleets (88:1 agent-to-human ratio). Vibe coding without verification creates systemic risk at speed.

## Testing Becomes the Job

> Before AI, getting devs to write tests was painful. "Just let me merge this, I'll write tests later." Now writing tests is gonna be the job! There will be much whining.
>
> — [@whusterj](https://x.com/whusterj/status/2015431150756315490), January 2026

## Alternative Approaches to Verification

StrongDM's ["Software Factory"](https://simonwillison.net/2026/Feb/7/software-factory/) takes a radical position: humans never write or review code. Instead, correctness is validated through scenario testing against a "Digital Twin Universe" - behavioral clones of third-party APIs (Okta, Jira, Slack). Scenarios are treated as holdout sets, inaccessible to the coding agents, forcing genuine behavioral correctness. This is an attempt to push the verification barrier right by replacing human review (which doesn't scale) with automated behavioral validation (which does, at ~$1,000/day in tokens per engineer).

## The Right Unit of Work

The [Nilenso blog](https://blog.nilenso.com/blog/2025/09/17/the-common-sense-unit-of-work/) argues that getting the "unit of work" abstraction wrong causes exponential complexity - the same exponential the verification complexity theorem describes. AI productivity should be measured by customer outcomes (user stories), not lines of code generated. A well-defined unit of work is itself a form of barrier management: it bounds the verification scope to something tractable.

---

## Related Notes

- **[[Task Size is Relational, Not Intrinsic]]** - The "size" of a task lives in the graph of its relationships to other tasks, not in the task itself. This maps directly to the connectivity factor `k` in the verification complexity theorem.
- **[[AI Safety & Incoherence at Scale]]** - Anthropic's research shows AI becomes more incoherent over longer reasoning chains - the verifiers themselves degrade with task length. This means AI can't be trusted over long-range tasks and needs constant verification, which gets exponentially harder the longer and more complex the task is.
- **[[Software Craft vs. AI Generation]]** - Craft and engineering discipline are ways of managing the verification exponent. Sloppy code increases the connectivity factor `k`.
