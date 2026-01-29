---
layout: essay
title: "Infinite UI: What's Really Different about GenAI Software"
date: 2025-09-07
updated: 2025-09-07
authors: ["William Huster"]
tags: [ai, ui-design, product-design, genai, software-architecture]
attribution: human-written
status: evergreen
summary: "The real difference between traditional and GenAI software is not nondeterminism, but instead the much larger state spaces GenAI can represent. Products are now explorable territories rather than fixed paths."
image: /static/images/essays/infinite-ui-og.png
---

People keep saying the paradigm shift with GenAI is about determinism versus nondeterminism, and I'll admit that it bothers me. I think they're pointing at the right thing but using the wrong words. The real difference is the sheer size of the state space of the user interface.

In case the term is unfamiliar, engineers think a lot about "state spaces." That is, the set of all possible configurations a system can be in. It might sound technical, but the concept is simple. If traditional software is a small town with a grid of streets you can memorize, then GenAI software is a sprawling metropolis where you can't possibly walk every street before new neighborhoods emerge. They are huge virtual spaces.

The hard part of building user interfaces has always been juggling all the possible states that the UI could end up in. As you develop a UI and add features, the state space undergoes a combinatorial explosion.[^1] This leads to all sorts of weird and unpredictable bugs.

I experienced this recently on a [chess app I've been building for a founder](https://app.opening.guru). I added two new features: board flipping and an autoplay toggle. These new features interacted with almost every existing feature. Adding board flipping multiplied the state space by two. Adding the autoplay toggle again multiplied the state space by two. Let's say the number of possible states before those features was 24. After these features it is 24 × 4 = 96 possible states. Our test plan just got a lot longer.

But 96 is still a manageable number. We can reasonably enumerate and test all 96 cases. It's possible to walk through the code and examine the connection points. It's even possible to choose to ignore or block certain connections to deliberately prune the possible states. It's an explicitly defined and bounded problem.

By contrast, [Gian Segato of Anthropic](https://giansegato.com/essays/probabilistic-era) describes GenAI as a function with practically infinite inputs and outputs:

```
F(∞) -> {∞, ∞, ∞}
```

The number of possible states you get out of the box with a GenAI is practically infinite. I say "practically" because LLMs have a finite number of parameters and tokens, so there does exist an astronomically large finite number that represents the size of the state space. But it's such a large number that we cannot hope to manually or even automatically test all of them before the end of this universe or the next. So, fine, it's "infinite."

## Unpredictable is not the same as random

It is fair to say that unpredictability is a very real consequence of this new paradigm. Imagine this state space as a giant haunted mansion: that is now your product. The users of your product will inevitably find a candelabra in the study that makes a bookshelf spin around, revealing a secret corkscrew slide to a Frankenstein lab, and there they will make monsters.

But people are conflating unpredictability with randomness. A `temperature=0`[^2] (deterministic) model still has the "haunted mansion" property, but _it has zero randomness_. Even so, the space is so large and sensitive to input that the results will feel random. Users can find a Frankenstein lab candelabra. This unpredictability does not come down to dice rolls. It originates from the sheer impossibility of comprehensively mapping the space beforehand so you can find and uninstall the problematic candle holders.

I get that unpredictability is closely associated with randomness, but just because you can't predict something does not mean its cause was random.

[Gian Segato recently wrote](https://giansegato.com/essays/probabilistic-era) that GenAI is "ontologically different... moving away from deterministic mechanicism, a world of perfect information and perfect knowledge." I don't think the difference is entirely ontological or that it hinges on determinism. But I agree with the second half of his sentence. The difference is epistemological - _how do we know what we know_ about the spaces within the LLM and by extension our applications? Whether the space is emergent or randomly generated, this should be the central question.

And as I wrote in my [AI Onion essay](/essays/ai-onion-framework/), the issue for founders and product designers is epistemological because we cannot know all the nooks and crannies of our own product. We have to build from the ground up, carefully probing at every layer of our AI solution. To try to know our own GenAI product is now a science like studying the world - well, a fun-house mirror image of the world.

So people are using "nondeterminism" as a shorthand for this large state space phenomenon. My point is that this user interface unpredictability is not a direct result of the stochasticity in the models (though that complicates things). It is rather the result of the huge unmapped state space of the LLM, this massive, multi-billion parameter function that is directly handed to users to execute.

## The inversion

The result of having an infinite function with an incomprehensible state space is that we have to _remove_ features and put up guardrails to build a useful app. This chipping away, carving, and molding is a process we apply to the massive state space to restrict the pathing through it so the AI works more predictably and doesn't run amok, wasting users' time (or worse).

Compare that to how we worked previously. We actually had to _add_ features to build paths. Now we get features "for free" and must remove them.

The old paradigm of software design was a "railroad experience," whereas AI presents a "sandbox experience." Traditional software was an elevator; GenAI software is a Wonkavator, an elevator that moves in all directions. Traditional software had limited dimensionality; GenAI software has unquantifiable dimensionality.

This is why security is such a big problem with AI. It's like you've created a REST API with a billion billion billion endpoints, and now after the fact you have to figure out how to test and manage permissions on all of them.

## Constraining without nerfing

Segato makes a useful observation about the tension between control and capability: "The more you try to control the model, the more you'll nerf[^3] it... intelligence and control start becoming opposing needs."

We experienced this when prompting our GoPursue coach agent. Our early attempts put in too many guardrails and nerfed the agent. But I think we can develop techniques that effectively limit the user's range of motion in the state space and guard against specific actions without hobbling the agent.

Role-playing is one technique that works well. Simply telling an agent something like "you are a cancer research assistant" is extremely effective. It immediately snaps its responses into a more clinical space while preserving its capacity for reasoning, tool use, and so on.

There are other approaches too. Marcy Ewald on our team has been thinking about constraints as a "spotlight" rather than guardrails, which means showing the AI which path has been walked frequently and letting it tell you what it thinks about those paths. This suggests that not only can things be blocked or chipped away in GenAI systems, they can also be intensified, and we should look at that as an equally useful tool.

## Conclusion

I very much support Segato's conclusion that an empirical, scientific approach is necessary. Because this is fundamentally an epistemological problem, the state space is too large to reason about deductively. You have to explore it like actual territory, just like the real world.

Organizations that build using an empirical approach will succeed in this new era of technology. So if you're building AI applications, stop worrying about nondeterminism and randomness. Focus instead on carving useful paths through the massive state space LLMs hand us. That's the real challenge and opportunity.

---

_This essay prompted an [engaging team discussion](/notes/infinite-ui/#team-discussion) about the implications of infinite state spaces for product design and the future of SaaS applications._

**Acknowledgments:** Thanks to [Marcy Ewald](/authors/marcy-ewald/) and [Neil Shah](/authors/neil-shah/) for reviewing drafts of this essay and contributing their thoughts and feedback.

---

[^1]: [Combinatorial explosion](https://en.wikipedia.org/wiki/Combinatorial_explosion) refers to the rapid growth in complexity that occurs when combining multiple elements, where the number of possible combinations grows exponentially rather than linearly.

[^2]: [Temperature](<https://en.wikipedia.org/wiki/Temperature_(machine_learning)>) is a parameter in language models that controls randomness in output generation. Temperature=0 makes the model deterministic, always selecting the most likely next token, while higher values introduce more randomness and creativity.
[^3]: In gaming and software contexts, to "nerf" means to weaken or reduce the effectiveness of something, typically through updates or changes that make it less powerful than it was before.
