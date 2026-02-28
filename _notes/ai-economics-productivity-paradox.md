---
layout: note
title: "AI Economics & the Productivity Paradox"
date: 2026-02-28
status: budding
attribution: ai-supported
authors: ["William Huster"]
tags: [AI, economics, productivity, labor-market, pricing, general-purpose-technology, agentic-ai]
updated: 2026-02-28
summary: "AI is a general-purpose technology whose economic impact is structural, not incremental. Token costs drop fast but total costs stay high, and the productivity gains remain elusive at enterprise scale."
---

## Overview

AI is a general-purpose technology whose economic impact is structural, not incremental. Historical parallels (electricity, the printing press) suggest transformation takes decades of organizational restructuring. Meanwhile, token costs are dropping fast but total costs remain high, and the labor market effects are uneven. This note collects the key economic arguments.

---

## AI as General-Purpose Technology

Krugman and Brynjolfsson discuss ["the productivity paradox"](https://paulkrugman.substack.com/p/how-should-we-think-about-the-economics): why transformative technologies fail to show up in productivity statistics. The Paul David pattern from electricity adoption took 30-40 years - factories initially just replaced steam engines with electric motors, keeping the same layout. Real gains came only when a new generation of managers distributed motors throughout factories, enabling assembly lines. AI is in the "replacing the steam engine" phase. True productivity gains require reimagining workflows, not just speeding them up.

## Labor Market Exposure

The influential OpenAI paper ["GPTs are GPTs"](https://arxiv.org/abs/2303.10130) (Eloundou et al., 2023) exploits the double meaning: Generative Pre-trained Transformers as General-Purpose Technology. Key finding: ~80% of the U.S. workforce could have at least 10% of tasks affected by LLMs, with higher-income jobs facing *greater* exposure. The real multiplier is software built on top of LLMs (3-4x more tasks affected than raw models alone), suggesting the scaling path runs through product development, not just model improvements.

## Programming Deflation

Kent Beck frames the economics of AI-generated code as ["programming deflation"](https://tidyfirst.substack.com/p/programming-deflation) - but unlike traditional deflation, it's driven by genuine productivity gains. Two contradictory predictions: the substitution effect (fewer programmers) vs. Jevons' Paradox (cheaper code = explosion of demand = more programmers). His key insight: the middle disappears. Commodity code floods the market while the gap with carefully crafted software widens. Value migrates from writing code to understanding what to build and how systems fit together.

## Token Pricing: Unit Cost vs. Total Cost

Token prices have dropped dramatically - commodity models ~50x cheaper over 3 years, frontier models 50-90% cheaper per generation. But daily agent costs remain $100-500/day for complex workflows despite unit price reductions. A single refactoring task can burn 230-460K tokens across planning, generation, testing loops, and review. The critical insight: optimize for value per dollar (outcomes), not cost per token. Current provider economics are unsustainable (OpenAI projected $74B cumulative losses by 2028), and prices may stabilize or reverse as investors demand returns.

## The Abundance Trap

Emad Mostaque's ["The Last Economy"](https://www.thelasteconomy.com/docs/the-last-economy/introduction) is a dramatic manifesto arguing we're in a ~1,000-day window before irreversible economic transformation. The core paradox: stock markets at all-time highs while life satisfaction hits record lows. He proposes three stable futures: Digital Feudalism (the default - a few corporations control AI, everyone else on UBI), the Great Fragmentation (data nationalism, algorithmic cold war), or Human Symbiosis (the hardest path, requiring us to change). Worth reading for the framing even if you discount the urgency.

## Agents as Economic Actors

An [academic survey](https://arxiv.org/abs/2509.01063) (Koh et al., Sept 2025) reframes AI agents as economic actors rather than tools, examining how agents with long-horizon planning will interact with humans, shape markets, and what institutional infrastructure is needed. Key implications: contract law, liability, market design to prevent agent collusion, and trust mechanisms for verification.

## The Enterprise Adoption Gap

McKinsey/QuantumBlack's ["Seizing the Agentic AI Advantage"](https://www.mckinsey.com/capabilities/quantumblack/our-insights/seizing-the-agentic-ai-advantage) quantifies the paradox at enterprise scale: ~78% of companies report using gen AI, yet over 80% see no measurable bottom-line impact and only 1% consider their AI strategy mature. The diagnosis: companies scaled horizontal copilots (chatbots, code assistants) that deliver diffuse, hard-to-measure gains, while ~90% of transformative vertical use cases remain stuck in pilot. Their proposed solution - agentic AI embedded deep in core workflows - echoes the Paul David pattern above: replacing steam engines with electric motors isn't enough; you have to redesign the factory.

## Build vs. Buy

Marty Cagan argues the future is ["yes to both"](https://www.svpg.com/article-build-vs-buy-in-the-age-of-ai/) - vibe coding won't kill SaaS because enterprise software embeds thousands of complex business rules that took years to accumulate. The new architecture: buy complex component services, build custom workflows and agents on top, with MCP (Model Context Protocol) as the enabling standard for programmatic access. The hard part remains discovering the right solution to build, not building it.
