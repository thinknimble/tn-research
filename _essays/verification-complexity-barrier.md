---
layout: essay
title: "The Verification Complexity Barrier"
date: 2026-02-28
updated: 2026-02-28
authors: ["William Huster"]
tags: [verification, complexity, software-engineering, ai, testing, ai-agents, software-architecture]
attribution: human-written
status: budding
summary: "If a program has components with a connectivity factor greater than zero, verification complexity increases superlinearly with each new component. The time required to fully verify the system always exceeds the time to generate its components, and as AI drives generation time toward zero, you hit the barrier sooner."
image: /static/images/essays/verification-complexity-barrier/verification-complexity-barrier-chart.png
related_notes: [verification-complexity, task-size-relational]
---

I am developing a formal theorem I call the Verification Complexity Barrier.

In a nutshell, if a program has some components `n` that have connectivity factor of `k > 0`, then verification complexity increases superlinearly for each new component. Therefore the time required to fully verify the system always exceeds time to generate components.

After a while, because it's superlinear, the verification complexity takes off and becomes impossible to keep up with in some finite amount of time. This was true before AI, but is much starker now as code generation time trends towards zero. You hit the barrier sooner.

![Chart from the interactive Complexity Barrier model. Cumulative dev time in sprints against component count. The ideal line without verification rises slowly and linearly. The line with verification curves upward and goes vertical at the asymptote n* of 28.5 components. Sliders below set team capacity, generation rate, test setup cost, automated coverage, and the residual verification exponent.](/static/images/essays/verification-complexity-barrier/verification-complexity-barrier-chart.png)
_The interactive model. For any finite team capacity, there exists a component count that cannot be reached._

We all have finite capacity - even AI agents - so there will always be a certain number of components `n` where the wall is hit. You must spend more and more effort on verification for each new component in the system.

The best thing you can do is spend time changing the "topology" of the problem - change the software architecture - so that the exponent of verification complexity is lowered (Lehman[^1]) and the curve is flattened. You can bundle components into modules, you can add automated tests, you can use formal proofs, you can use type systems. These things push the barrier to the right. They buy you more components and a more complex system. But the theorem suggests you can only ever defer the barrier, never completely eliminate it.

AI Agents can burn tokens all day long generating software components and tests for those components. They can find bugs and fix them, but they cannot prove the absence of bugs (per Dijkstra[^2], Rice[^3], Smith[^4], and others). And "Bug" needs to be defined against someone's spec for what "working" and "not buggy" looks like. The more you build with Agents, the heavier the verification burden becomes.

This may sound like the same trite observation others have made on X: "Our bottleneck is no longer writing code, but reviewing code"[^5] and "I am the bottleneck now."[^6] True, but I don't think anyone has captured the magnitude of the problem. The math is: at a certain component count `n`, it is literally impossible for you, your team, and your agents to completely verify a system. The bottleneck goes to zero, and nothing gets through.

So what software companies do in the real world is release incompletely verified software and massively scale up. This shifts the burden of verification onto their customers, because "given enough eyeballs, all bugs are shallow" (Raymond[^7]). If you can get enough eyeballs, this is a very cost-effective way to shift the barrier to the right by massively increasing your team's capacity. You walk the tightrope of doing enough internal verification before release so you don't lose customers, while tolerating a certain amount of escaped bugs, which - if those bugs matter at all - your customers will find for you.

Meanwhile, massively scaling up just accepts the growing cost of complexity. You can push `n*` from 15 to 30 by quadrupling your capacity. To get to 60 you need to quadruple again, and then again to get to 120. Your cost curve is superlinear to get linear gains in system size. At a big enough scale, you amortize the cost across your customer base and the economics work.

Contrast that with a sufficiently complex vibecoded app built for a small audience - high complexity costs can't be amortized at small scale. I expect to see many people and companies try and fail at vibecloning complex SaaS in the near term. Complexity cost economics only scale with audience size (I will share another model for this).

I do think SaaS prices will be corrected downwards to account for savings in code generation, but I predict that once the irrational exuberance for vibing fades, we'll see that it still makes sense to buy rather than self-build complex SaaS.

A broader implication is that AI Agents will never be able to self-verify. Humans, too, will never be able to fully verify their behavior, because LLMs are by design of maximal complexity. Did you see the size of those error bars in the latest METR results?[^8] The longer the horizon on a task, the more spread in AI agent outcomes. This is the Barrier in action. Spread is a feature of GenAI, but in practice it means heaps more output to review and verify.

The Complexity Barrier shows you literally won't have time to review it all. At the inflection point of verification complexity, you have to fall back on vibes. The implication for fast-takeoff AGI is even scarier: if AI does reach a point of recursive self-improvement, this theorem suggests it will be structurally impossible to know that behavior is aligned, because you won't be able to completely verify. Drift is bad enough in vibe coding. Runaway AI will drift massively and there's no way of knowing where it will end up.

All that's to say, verification should be the focal point of AI Engineering for the foreseeable future and maybe forever. That is: how do you capture what you want to do, refine that into specifics, and then follow up with automated tests, assertions, evals, and customer feedback to progressively harden your software?

The verification problem is acute now because of how cheap software generation is. Because of the superlinear nature of software verification complexity, companies that push hard on the barrier and successfully shift it right will have a built-in moat versus those who fail to put in the verification work.

Detailed blog post and interactive model incoming.

---

_This essay was first published as [a post on X](https://x.com/whusterj/status/2027771813346820349) on February 28, 2026. This page is the canonical version._

[^1]: [Lehman's laws of software evolution](https://en.wikipedia.org/wiki/Lehman%27s_laws_of_software_evolution), Wikipedia.
[^2]: Edsger W. Dijkstra, [The Humble Programmer (EWD340)](https://www.cs.utexas.edu/~EWD/transcriptions/EWD03xx/EWD340.html), 1972.
[^3]: [Rice's theorem](https://en.wikipedia.org/wiki/Rice%27s_theorem), Wikipedia.
[^4]: Brian Cantwell Smith, [The Limits of Correctness](https://cse.buffalo.edu/~rapaport/Papers/Papers.by.Others/smith.limits.pdf), 1985.
[^5]: Sahil Lavingia, [post on X](https://x.com/shl/status/1940881391216218415), July 2025.
[^6]: Thorsten Ball, [post on X](https://x.com/thorstenball/status/2022310010391302259), February 2026.
[^7]: [Linus's law](https://en.wikipedia.org/wiki/Linus%27s_law), Wikipedia.
[^8]: METR, [Measuring AI Ability to Complete Long Tasks](https://metr.org/blog/2025-03-19-measuring-ai-ability-to-complete-long-tasks/), March 2025.
