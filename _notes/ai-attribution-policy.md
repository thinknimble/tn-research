---
layout: note
title: "AI Attribution Policy"
date: 2025-09-06
updated: 2025-09-07
tags: [ai, ethics, attribution, transparency, writing]
attribution: human-written
status: budding
authors: ["William Huster"]
summary: "Our commitment to transparent use of AI through clear attribution levels: AI-generated, AI-supported, and human-written content."
---

## Our Implementation

On this site, all content includes an `attribution` field in the front matter that indicates the level of AI involvement. This badge is displayed prominently on each piece of content and links back to this policy note for transparency.

## I. Initial Thoughts

I am cooking up another article about the game theory and ethics of AI attribution. How do you represent your work in an environment where other people have or have not adopted AI, or where the norms are such that everyone else is using AI, or they suspect you're using AI, or trust of AI is lower than you think it should be? Etc etc.

The short version is that I think you should tag your works as one of three categories (at a minimum):

- **"AI Generated"** - Content primarily created by AI with minimal human intervention
- **"AI Supported"** - Content created through collaboration between human and AI
- **"Human Written"** - Content created entirely by human effort

And be honest about it!

The trouble is that works in the "AI Supported" category could range from 10%-90% AI generated and still count as "not purely AI generated." So it might be useful to have different tiers of AI-supported works, but I don't want to over-engineer it. And I think even if people are being honest, they are generally not good at being self-aware enough to quantify their contribution versus AI in a more granular way.

I also don't think we should go to the extreme of auditing every line of writing or code for its AI or non-AI providence (except in environments like school exams). Even though AI generates a lot of my code now, I still look at it as a tool and I am still the _auteur_—at least for now—so I own the work and represent it as my own, not the AI. After all, I would not credit VS Code for writing my code, even though it's an indispensable tool for me now, and through automated reformatting touches every line.

I think the same can be said for prose writing, but the distinction is a bit muddier because natural language is so flexible. Anyway, curious your thoughts as I put this together.

## II. Moral Hazards

Moral Hazard is an economic behavior concept, defined as: a **"lack of incentive to guard against risk where one is protected from its consequences."**[^1]

This is just the "seed" of an idea at this point, but it occurs to me that there are at least two levels of moral hazard in using GenAI to produce writing: (1) at the GenAI training level and (2) at the GenAI usage level.

### Moral Hazard in GenAI Training

There are plenty of examples of how cavalier the major GenAI companies have been when it comes to the legal risks of using copyrighted works for training. OpenAI and Anthropic are both involved in high profile legal battles over their training data, which they surely must have seen coming. It's clear they made a calculated bet that their upside would be greater than the legal costs.

In addition to that, it's fairly common knowledge at this point that [GenAI lies to us (Simon Willison, Apr 2023)](https://simonwillison.net/2023/Apr/7/chatgpt-lies/). It hallucinates and confabulates, which can lead to the generation of plausible-looking but incorrect information. This has improved across all models since the launch of ChatGPT in Nov 2022, but OpenAI and the others do not have a good incentive to hold back the technology and put in absolute safeguards. Quite the opposite. I argue that given the property of GenAI as an [Infinite User Interface](/notes/infinite-ui), safety will be an endless problem, and a practical impossibility. The only safe strategy is to avoid using it completely, but there is a vanishingly small probability that will happen at this point.

How does OpenAI handle these inherent risks? A small disclaimer that AI can at times be wrong or produce misleading information. _Caveat emptor_ - all risk is assumed by the end user (the principal), not the agent (OpenAI).

### Moral Hazard in GenAI Usage

GenAI can provide tremendous leverage when generating work for others. This is another situation where the creator's incentives are misaligned with the consumer. A creator of social media content, for instance, is incentivized to produce a high volume of content tailored for engagement. In the worst case, this leads to a systemic pressure to produce fake and outrageous viral videos, news, and information. That media is also most likely to be amplified.

Even if the intentions of the content creator are good, the incentives do not necessarily reward thoroughness and accuracy, so the risks of bad information are again assumed by the consumers of the content and not by the creator.

Some ideas to counteract this: more friction by platform owners to create new accounts and produce or publish new content, more accountability from both platforms and consumers, and reputational backpressure from consumers against bad actors to incentivize quality content vs. AI slop.

## III. Game Theory

Another 'seed' of an idea: if you believe that GenAI confers an advantage to you over your peers, you may be incentivized to conceal the fact you are using it and take credit for its outputs. This can be modeled in terms of game theory as one of a set of strategies for AI use disclosure and attribution.

For instance, the "conceal" strategy might work well on the anonymous Internet, but entails major trust and reputational risks in a "repeat game" scenario, such as a workplace.

## IV. References & Resources

### (1) Article ["Hypographic Media?"](https://db7894.github.io/hypographic-media) by Daniel Bashir

In this article, the author Daniel Bashir discusses a different, but related idea that might help explain what makes attribution hard. Borrowing terms from his article, when we look at a published work, we are looking at the "orthograph"—the final product—but we almost never have traces of the "hypographs"—the queries, AI prompts, or the "human-generated" ideas—that were used to produce it.

A hypograph then is intermediate and ephemeral text that is used to _retrieve_ an orthograph and then discarded. Bashir gives the example of Roman letter sequences that Chinese language writers use to digitally locate Chinese characters. Google searches and GenAI prompts can also be thought of as hypergraphs. You don't have to internalize knowledge (aka an orthograph) if you know the "shortcuts" to retrieve that knowledge.

Here's another example from Bashir's article that gets at the difficulty and importance of attribution in an academic context: "The orthograph—an essay with no accompaniment—may no longer be sufficient evidence to conclude that understanding has occurred unless produced in specific circumstances." In other words, how can we be sure that a student has really understood the material they wrote about? When we watch a YouTube video or read an article (like this one!), how can we be certain that the author knows what they are talking about or that they can be trusted?

The jumping off point for Bashir's discussion is a quote he attributes to historian [Thomas Mullaney](https://history.stanford.edu/people/thomas-mullaney), who said, “We have hypographic mediums, but no hypographic _media_.”

Trying to unpack this in other words: because prompting and querying with GenAI typically happens in private and then only share the best outputs of the AI are shared, we end up lacking shared cultural artifacts of the process.

This line of thought leads to the bleak and nihilistic conclusions of ["Dead Internet Theory" (Wikipedia)](https://en.wikipedia.org/wiki/Dead_Internet_theory). I am personally more optimistic and don't believe that the Internet is "dead." But I admit that most of the time I _cannot know_ if I'm reading bot or human text.

In a way, hypergraphic mediums are _anti_-cultural and culture-destroying, rather than culture building like shared cultural media that are "socially realized structures of communication"[^2] (think oral histories, books, theater, movies, etc.).

GenAI is therefore a hypographic _medium_, because you use ephemeral prompts to retrieve the actual information you want. Given this, Bashir tries to imagine what hypographic media might look like. He suggests that maybe it would look like a commit history in a software context, but not for the code—which he says is part of the artifact—but for the process documents that surround the code and explain the thought process that led to the final artifact.

#### How Much Does Idea Attribution Matter to Culture?

The concepts of hypergraphs and orthographs is compelling to me and I will think on it more. I am also concerned about the prospect of cultural destruction and collapse as a result of technological progress. However, Bashir's suggested antidotes might imply tighter surveillance and auditing of the creative process. That doesn't sit well with me, except in rigorous contexts like school exams.

The history of human culture building through creative pursuits is centered on the exchange of ideas. "Good artists borrow, great artists steal" is a quote often attributed to Pablo Picasso. That attribution is ironically not verifiable,[^3] but it points to the idea that tracing the origins of a creative notion, even in a time before AI, is really difficult. And again, a culture is defined by the socially recognizable patterns in its artifacts and processes. Purely original ideas actually look random in a cultural context. They might as well _be_ random, because to be part of a culture by definition _requires_ a minimum amount of social coherence and consistency.

Furthermore, the creative provenance of an artwork might lead to an interesting discussion in the culture and society around the work. For instance, an obvious copycat artist might create a scandal that "goes viral." The process of how that discussion unfolds is itself part of the culture. Art works—orthographs—end up taking on a life of their own in the collective conscious.

In some respects, I'm actually excited by how [GenAI has liberated information](/notes/genai-information-liberation), but we will continue to grapple with what it means to "own" ideas, to take credit, and to have the work we produce continuously subsumed into the training corpora of GenAI models to be melted down and blended with everyone else's ideas.

---

[^1]: [Oxford English Dictionary, via Google](https://www.google.com/search?q=define+moral+hazard+oxford)
[^2]: [Lisa Gitelman's definition](https://web.mit.edu/uricchio/Public/television/Gitelman.pdf) cited in Bashir's article.
[^3]: Steve Jobs famously promulgated this quote in a 1996 interview, and he attributed it to Picasso, but there is more evidence that the originator of the idea was T.S. Eliot, who wrote in _The Sacred Wood. Essays on Poetry and Criticism_ "Immature poets imitate; mature poets steal;" ([_The Sacred Wood_, 1920, page 114](https://dn790008.ca.archive.org/0/items/sacredwoodessays00eliorich/sacredwoodessays00eliorich.pdf)). And for a great exploration of how creativity is essentially founded on idea exchange, see Kirby Ferguson's excellent "Everything is a Remix" YouTube films: ["Everything is a Remix" (2010 Original)](https://www.youtube.com/watch?v=9pLCIoBZzd4), ["Everything is a Remix" (2023 Edition)](https://www.youtube.com/watch?v=X9RYuvPCQUA), and ["AI Is Remixing Everything..."](https://www.youtube.com/watch?v=9pLCIoBZzd4)
