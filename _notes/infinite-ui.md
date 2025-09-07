---
layout: note
title: "Infinite UI: The Real Difference Between Traditional and GenAI Software"
date: 2025-09-07
updated: 2025-09-07
authors: ["William Huster"]
tags: [ai, ui-design, product-design, genai, software-architecture]
attribution: human-written
status: budding
---

This is a draft of an article / idea I might term "Infinite UI" - which ties into the "command line for everyone" and is sort of my rebuttal to the recent (over)focus on determinism.

Here's a post by an early engineer at replit who recently switched to Anthropic [https://giansegato.com/essays/probabilistic-era](https://giansegato.com/essays/probabilistic-era) IMO he is also falling into this trap focusing too much on deterministic vs. probabilistic thing. But I liked these ideas:

1. GenAIs are massive complex functions with practically unlimited inputs and outputs.
2. GenAI products have a core contradiction: restricting a model to be more predictable for a given use case constrains its overall intelligence and usefulness. "The more you try to control the model, the more you'll nerf it... intelligence and control start becoming opposing needs."
3. Users of AI products are navigating a field of possible interactions
4. "You need to be a scientist" to build with GenAI - empiricism and continuous hypothesis testing are critical.

Point #1 illustrates AI as a function with infinite inputs and outputs:

```
F(∞) -> {∞, ∞, ∞}
```

Point #3 really appeals to me, and gives me an idea of what this conversation about non/determinism is really about. The old paradigm of software design was a "railroad experience," whereas AI presents more of a "sandbox experience."

I think people are using the language of non/determinism to approximate this concept. Trad software was an elevator, GenAI software is a wonkavator. Trad software had limited dimensionality, GenAI software has unquantifiable dimensionality.

The more I think about this, the more I believe that stochasticity is incidental. The real difference is in the sheer size of the state space of the user interface.

The hard part of UI programming has always been juggling all the possible states that the UI could end up in. It's a natural fact that as you develop a UI and add features, the size of state space undergoes a combinatorial explosion. This is what leads to all sorts of weird and unpredictable bugs. I experienced this on OpenMaster just this week. I added two new features: board flipping and an autoplay toggle. These new features interacted with almost every existing feature. That means that adding board flipping multiplied the state space by two. And then adding the autoplay toggle again multiplied the state space by two. Let's say the number of possible states before those features was 24. After these features it is 24 x 4 = 96 possible states. Our test plan just got a lot longer.

But 96 is still a manageable number! We can reasonably enumerate and test all 96 cases. It's possible to walk through the code and examine the connection points. It's even possible to choose to ignore or block certain connections to deliberately prune the possible states. It's an explicitly defined and bounded problem.

By contrast, the number of possible states you get out of the box with a GenAI is practically infinite. I say "practically," because LLMs have a finite number of parameters and tokens, so there does exist an (astronomically large) finite number that represents the size of the state space. But it's such a large number that we cannot hope to manually or even automatically test all of them before the end of this universe or the next. So, fine, it's "infinite."

Anyway, after all of this, I do think it is fair to say that unpredictability is very real consequence of this new paradigm. If you imagine this state space as a giant haunted mansion: that is now your product. And the users of your product will inevitably find a candelabra in the study that makes a bookshelf spin around, revealing a secret corkscrew slide to a Frankenstein lab, and there they will make monsters.

But people are conflating unpredictability with randomness. A temperature=0 (deterministic) model still has the "haunted mansion" property. Even with zero randomness, users can still find a Frankenstein lab candelabra. Importantly, this unpredictability does not come down to dice rolls. It originates from the sheer impossibility of comprehensively mapping the space beforehand so you can find and uninstall the problematic candle holders.

I get that unpredictability is closely associated with randomness, but just because you can't predict something, does not mean its cause was random.

In the article, he says "It's ontologically different. We're moving away from deterministic mechanicism, a world of perfect information and perfect knowledge." But I don't think the difference is ontological or that it hinges on determinism. I agree with the second half of his sentence, though. The difference is epistemological. Whether the space is emergent or randomly generated or not does not matter.

The issue here for product design is epistemological because we cannot know all the nooks and crannies of our own product. To try to know our own GenAI product is now a science like trying studying the world... well, a fun-house mirror image of the world.

So I guess people are using "nondeterminism" as a shorthand for this large state space phenomenon. My point is that this user interface unpredictability is not a direct result of the stochasticity in the models (though it doesn't hurt), it is rather the result of the huge unmapped state space of the LLM — a massive, multi-billion parameter function that is directly handed to users to execute.

More down to earth — this is why security is such a big problem with AI. It's like you've created a REST API with a billion billion billion endpoints, and now after the fact you have to figure out how to test and manage permissions on all of them. A tall task!

As for the tension of control and agent power, I think we experienced this when prompting GoPursue's coach agent. Our early attempts put in too many guardrails and "nerfed" the agent. I think we could develop and share a framework of techniques that effectively limit the user's range of motion in the state space (haunted mansion) and guard against specific actions without hobbling the agent.

Role playing is one technique I think works well. Simply telling an agent something like "you are a cancer research assistant" is extremely effective. It immediately snaps its responses into a more "clinical" space, while preserving its capacity for reasoning, tool use, etc. Can you think of any other techniques that focus the AI without trading off capability?

I do very much support his conclusion that an empirical scientific approach is necessary, because, again, as a fundamentally epistemological problem the state space is too large to reason about deductively. You have to explore it like actual territory, just like the real world:

> The elephant in the room when it comes to real-world live A/B testing is that it assumes you know what to optimize for in the first place. It implies knowing and quantifying the definition of success. In AI products, you basically can't.

Sounds like an excerpt from the ThinkNimble product playbook!

> Organizations that build using an empirical approach, think in probabilities, and measure complex trajectories will define the next era of technology.

I mean, I think those kinds of orgs (and people and patterns of thought) also defined every previous era of technology. The more things change, the more they stay the same. It's still solid advice.
