---
layout: essay
title: "The AI Onion"
subtitle: "A Framework for Incremental AI Implementation"
date: 2025-08-28
authors: ["William Huster"]
attribution: ai-supported
abstract: "Most AI implementations fail due to unnecessary complexity. Drawing from clinical trial methodology and personal loss, this essay presents a layered approach to AI deployment that starts simple and adds complexity only when measurement demands it."
readtime: "15 min read"
status: seed
published: false
related_notes: [ai-implementation, complexity-collapse, statistical-learning]
---

## I. The Statistical Foundation of Hope

Two years ago, my mother died of triple-negative breast cancer. She had spent her career as a biostatistician, designing clinical trials and analyzing whether new medicines actually worked. The irony wasn't lost on me: she dedicated her life to the mathematical machinery that validates cures, only to succumb to a cancer for which we haven't found one.

But here's what I learned from her work, and what shapes everything I'm about to tell you about AI implementation: statistics and probability—the unglamorous mathematics of uncertainty—are among humanity's greatest technological achievements. They let us distinguish signal from noise, correlation from causation, hope from false hope. They're why we know which medicines work and which are snake oil.

Modern AI is built entirely on this foundation. Every neural network, every language model, every pattern recognition system—they're all statistical machines, finding correlations in vast seas of data. When I work with AI now, I think of my mother's work, and I ask myself the question that drives much of what we do: Could these statistical machines, grown powerful enough, find the patterns that lead to cures we haven't discovered?

I believe they could. But not in the way most people think.

## II. The Problem with Complexity

There's a persistent myth in technology that more sophisticated solutions are inherently better. We see this everywhere in AI deployment: organizations jumping straight to fine-tuning models, building complex agentic systems, or investing millions in custom solutions before they've even validated that AI solves their problem.

At ThinkNimble, after working with hundreds of startups and nonprofits on AI implementations, we've observed a consistent pattern: **complexity is where AI projects go to die.**

This isn't just an engineering insight—it's a mathematical one. Recent research from Apple ("The Illusion of Thinking") demonstrates what we call "complexity collapse" in large language models. When you push these systems beyond a certain threshold of task complexity, they don't degrade gracefully; they fail catastrophically. The models that can write beautiful poetry and solve programming challenges suddenly can't execute a simple algorithm when the problem requires too many sequential steps.

This has profound implications for how we should approach AI implementation. If the models themselves collapse under complexity, why would we build complex systems around them?

## III. The Onion Metaphor

The AI Onion isn't really about onions, of course. It's about layers—specifically, about adding layers of capability only when simpler approaches have been exhausted and measured.

Here are the layers, from innermost to outermost:

1. **LLM** - The raw model itself
2. **Chat** - Basic conversational wrapper
3. **Prompting** - Carefully crafted instructions
4. **Dataset Building/Retrieval** - RAG and knowledge bases
5. **Evals** - Systematic testing and measurement
6. **Tool Use** - Function calling and API integration
7. **Fine-Tuning** - Model specialization
8. **Agentic Flows** - Multi-step autonomous systems

Most organizations should stop at layer 3.

This isn't defeatism—it's empiricism. In our work, we've found that well-crafted prompting solves approximately 70% of use cases. Adding retrieval brings that to 85%. The remaining 15% requires exponentially more investment for diminishing returns.

## IV. The Hypothesis-Driven Approach

My mother's work in clinical trials taught me something crucial: you don't run an experiment without a hypothesis. You need to know what you're testing and how you'll measure success before you begin.

The same principle applies to AI implementation, yet it's surprisingly rare. Organizations implement AI because it seems innovative, or because competitors are doing it, or because executives read about it in Harvard Business Review. These aren't hypotheses—they're hopes.

A proper hypothesis has two components:

1. **Objectives** - What specific outcome do you expect?
2. **Metrics** - How will you measure whether you achieved it?

For example: "We hypothesize that AI-assisted customer service will reduce average resolution time by 30% while maintaining satisfaction scores above 4.2/5.0."

Now you have something to test.

## V. The Clinical Trial of AI

What follows is essentially a clinical trial for AI implementation. You start with the simplest intervention (prompting) and measure its effect. Only if it fails to meet your metrics do you proceed to the next level of complexity.

This approach has several advantages:

**Speed to validation.** You can test prompting in days, not months. If it doesn't work, you've failed fast and cheap.

**Cost efficiency.** Each layer increases cost exponentially. Prompting costs cents; fine-tuning costs thousands; custom models cost millions.

**Maintainability.** Simple systems are easier to debug, modify, and explain. This matters more than most teams realize.

**Compound learning.** Each layer teaches you something about your problem that informs the next layer. The prompts that don't quite work reveal what retrieval should focus on. The retrieval gaps show what fine-tuning should address.

## VI. A Case Study in Restraint

I'm working with a world-class oncologist on an AI system for personalized cancer treatment recommendations. The temptation was to build something magnificent: a fine-tuned model trained on millions of medical papers, with agentic workflows querying dozens of databases, producing comprehensive treatment plans.

We started with prompting.

Specifically, we crafted prompts that helped the system understand medical terminology and reason about treatment interactions. We tested it with real oncologists on real (anonymized) cases. The results were promising but imperfect—about 60% useful.

So we added retrieval, connecting the system to medical literature databases. This brought us to 75% usefulness.

Then tool use, allowing the system to query drug interaction databases and clinical trial registries. Now we're at 85%.

We might never need fine-tuning. We certainly don't need agents. The system is already transforming how this oncologist practices medicine, helping identify treatment options that might otherwise be missed. It's not curing cancer, but it's helping doctors who are trying to cure cancer. Sometimes that's enough.

## VII. The Paradox of Simplicity

There's a paradox here that's worth examining. The most powerful AI models in existence—systems that can write code, compose symphonies, and engage in sophisticated reasoning—are often deployed in the simplest possible ways. A well-crafted prompt to GPT-4 frequently outperforms a fine-tuned smaller model with complex orchestration.

This suggests something profound about the nature of these systems. They're not traditional software that benefits from elaborate architecture. They're statistical engines that work best when pointed clearly at well-defined problems.

The Unix philosophy—small tools that do one thing well, composed into powerful systems—might not apply to AI the way we expected. Instead of composing many specialized models, we might do better with powerful general models applied simply.

## VIII. When Complexity Is Necessary

I don't want to imply that complexity is never warranted. There are genuine use cases for every layer of the onion. But they're rarer than you think.

Fine-tuning makes sense when:

- You have truly unique domain knowledge not in the training data
- The cost of errors is extremely high (medical diagnosis, legal advice)
- You need consistent voice/style across millions of interactions

Agentic systems make sense when:

- The task genuinely requires multiple sequential decisions
- Different steps require different capabilities
- Human oversight at each step is impractical

But even then, start simple. Build the agent with prompting first. Add complexity only when measurement demands it.

## IX. The Meta-Lesson

The AI Onion framework is, at its core, the application of the scientific method to AI implementation. It's the same approach my mother used in clinical trials: form a hypothesis, test with the simplest intervention, measure results, iterate based on data.

This isn't a new insight. It's ancient wisdom, dressed up for a new technology. But it's wisdom that's particularly easy to forget when the technology feels magical.

AI isn't magical. It's statistics—profound, powerful statistics, but statistics nonetheless. And statistics has always rewarded careful methodology over grand ambition.

## X. The Question That Remains

Could AI cure the cancer that killed my mother?

I think about this often. The answer isn't in building the most complex AI system possible. It's in applying statistical learning to biological data with the same methodical approach she applied to clinical trials. Start simple: can AI identify patterns in genetic data? Yes. Add complexity: can it predict drug interactions? Sometimes. Continue building: can it design new molecules? We're getting there.

Layer by layer, hypothesis by hypothesis, measurement by measurement. Not because it's faster—it isn't always. But because it's the only way we know actually works.

The AI Onion isn't really about AI. It's about humility in the face of complexity, discipline in the presence of hype, and the courage to start simple when everyone else is racing toward sophisticated solutions.

My mother would have appreciated that. She spent her career proving that small, careful steps—not grand leaps—are how we make real progress against the problems that matter.
