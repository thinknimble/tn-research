---
layout: note
title: "Evidence of Complexity Collapse in LLMs"
date: 2024-06-10
updated: 2024-09-07
status: budding
attribution: ai-supported
authors: ["William Huster", "Claude (AI Assistant)"]
summary: "Apple research suggests LLMs hit sharp performance cliffs at complexity thresholds, failing even when given explicit algorithms to follow. This suggests fundamental architectural limits."
tags: [AI, llm-limitations, reasoning, complexity, architecture, benchmarking]
---

## Core Concept

LLMs exhibit a phenomenon where their performance dramatically degrades when faced with problems beyond a certain complexity threshold. This isn't a gradual decline but often a sharp "collapse" where the model fails entirely, suggesting fundamental architectural limitations rather than just insufficient training.

## The Apple Research Findings

The paper ["The Illusion of Thinking"](https://ml-site.cdn-apple.com/papers/the-illusion-of-thinking.pdf) demonstrates that current LLMs fail at tasks requiring genuine reasoning, even when provided with explicit algorithms to follow.

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

## Real-World Evidence: Claude Fails at Pokemon

[Ars Technica reports](https://arstechnica.com/ai/2025/03/why-anthropics-claude-still-hasnt-beaten-pokemon/) on attempts to have Claude play Pokemon, demonstrating the practical reality of complexity collapse. Despite being one of the most advanced LLMs available, Claude struggles with the long-term planning and strategic thinking that children master easily in the game.

## Future Directions

Breaking through this barrier likely requires:

1. **New architectures** beyond transformers
2. **True reasoning capabilities** not pattern matching
3. **Self-assessment mechanisms** for strategy evaluation
4. **Working memory** for maintaining complex state

---
