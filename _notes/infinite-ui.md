---
layout: note
title: "Infinite UI: What's Really Different about GenAI Software"
date: 2025-09-07
updated: 2025-09-07
authors: ["William Huster"]
tags: [ai, ui-design, product-design, genai, software-architecture]
attribution: human-written
status: budding
summary: "The real difference between traditional and GenAI software is not determinism, but instead the much large state spaces GenAI can represent. Products are now explorable territories rather than fixed paths."
---

_This note has been developed into a full essay: [Infinite UI: What's Really Different about GenAI Software](/essays/infinite-ui/)_

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

The hard part of UI programming has always been juggling all the possible states that the UI could end up in. It's a natural fact that as you develop a UI and add features, the size of state space undergoes a combinatorial explosion. This is what leads to all sorts of weird and unpredictable bugs. I experienced this just this week on a chess app I've been building for a client. I added two new features: board flipping and an autoplay toggle. These new features interacted with almost every existing feature. That means that adding board flipping multiplied the state space by two. And then adding the autoplay toggle again multiplied the state space by two. Let's say the number of possible states before those features was 24. After these features it is 24 x 4 = 96 possible states. Our test plan just got a lot longer.

But 96 is still a manageable number! We can reasonably enumerate and test all 96 cases. It's possible to walk through the code and examine the connection points. It's even possible to choose to ignore or block certain connections to deliberately prune the possible states. It's an explicitly defined and bounded problem.

By contrast, the number of possible states you get out of the box with a GenAI is practically infinite. I say "practically," because LLMs have a finite number of parameters and tokens, so there does exist an (astronomically large) finite number that represents the size of the state space. But it's such a large number that we cannot hope to manually or even automatically test all of them before the end of this universe or the next. So, fine, it's "infinite."

## Unpredictable is NOT the same as random

Anyway, after all of this, I do think it is fair to say that unpredictability is very real consequence of this new paradigm. If you imagine this state space as a giant haunted mansion: that is now your product. And the users of your product will inevitably find a candelabra in the study that makes a bookshelf spin around, revealing a secret corkscrew slide to a Frankenstein lab, and there they will make monsters.

But people are conflating unpredictability with randomness. A `temperature=0` (deterministic) model still has the "haunted mansion" property. Even with zero randomness, users can still find a Frankenstein lab candelabra. Importantly, this unpredictability does not come down to dice rolls. It originates from the sheer impossibility of comprehensively mapping the space beforehand so you can find and uninstall the problematic candle holders.

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

## Team Discussion

After sharing this note, we had an engaging discussion about these concepts:

<div class="conversation">

{% message author-id="william-huster" name="first" time="Tuesday at 6:11 PM" %}
I am hopeful that there is still a place for high quality, opinionated SaaS apps, and that many of them won't include any AI. After all, we still print books and I think I heard vinyl album sales are at an all-time high.

With this article I'm mostly preoccupied with making a statement about the structure of "what is different" about doing product design and building apps with GenAI, compared to the traditional methods. And the central thesis of my article is (a) it is a paradigm shift, and (b) the paradigm shift comes down to this massive state space concept (and not determinism vs. nondeterminism as many are saying right now).

The result of having an infinite function with an incomprehensible state space (that also varies from model to model) is that we have to _remove_ features and put up guardrails to build a useful app. I say, this chipping away, carving, and molding is a process we are applying to the massive state space to restrict the pathing through it so the AI works more predictably and doesn't run amok, wasting users' time (or worse).

Compare that to how we worked previously - we actually had to _add_ features to build paths, now we get features "for free" and must remove them!

> So if the argument is well the problem is that you are thinking about software in an antiquated way, the point is that user's won't be using single service apps anymore and instead we will all have access to an AI that can do anything you want.

I think some people are making this argument, but not me. My conclusion is that although the product design and build process with GenAI is different, the meta-processes of building successful apps and businesses is not really different — hence the last couple of sentences in my article. I still think there's plenty of room for bespoke / standalone apps

ChatGPT has explicitly positioned itself as an "Operating System" and is definitely going to make a platform play to unseat Google as the nexus of information on the Internet. They are strategically targeting the younger generation to get them used to asking "chat" for everything they want.

So I expect that they will carve out specific "pathways" that will threaten or destroy other specific SaaS apps, but at the end of the day, my prediction is that they will always be a bland average trying to be everything to everyone, so standalone SaaS apps will never die, and if anything, _good_ SaaS products will be even more appreciated.
{% endmessage %}

{% message author-id="marcy-ewald" name="first" time="Wednesday at 3:52 PM" %}
this is fascinating. I have a few thoughts I'll add later
{% endmessage %}

{% message author-id="marcy-ewald" name="first" time="Wednesday at 4:46 PM" reactions="‼️:1" %}
This is quite the flip in user experience design: "we actually had to _add_ features to build paths, now we get features 'for free' and must remove them!"

Adding comparative context has been the most effective way I've been able to constrain answers from the AI in my own work. I've been thinking about it more as a spotlight rather than guardrails — showing the AI which path has been walked frequently, and letting it tell me what it thinks about those paths. Flipping the script in one of my projects in that way helped; instead of corralling the agent, now we ask what it thinks about all of the new information it has about the student and how it would use that information moving forward, given the role you mentioned above. That type of pattern was useful on another project too — refining the question before releasing the agent.

On the topic of restricting features, it's almost like shortcuts or paths of least resistance. The constraints around what you consider success as a business (quickness to haircut booking, matching users original parameters, exposing what the user actually wanted and building them a perfectly customized experience) really require that refinement you talked about.

Very interesting read, thanks for sharing.
{% endmessage %}

{% message author-id="william-huster" name="first" time="Thursday at 11:16 PM" reactions="❤️:1" %}
Yes, I think the reversal of adding <> removing features is the real core paradigm shift here for product and by extension business design.

I like the metaphor of spotlighting. That gives me the image of a "brain" / network of neural connections in a neural net lighting up with indistinct edges. And I think it raises a good point that not only can things be blocked or chipped away ("dimmed" perhaps?) in GenAI systems, they can also be intensified and we should look at that as an equally useful tool.
{% endmessage %}

</div>
