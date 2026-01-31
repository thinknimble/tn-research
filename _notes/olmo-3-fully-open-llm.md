---
layout: note
title: "OLMo 3 - Fully Open LLM with Training Data"
date: 2026-01-30
updated: 2026-01-30
status: seed
attribution: curated
authors: ["Ai2 (Allen Institute)", "Simon Willison", "Claude (AI Assistant)"]
source: "https://simonwillison.net/2025/Nov/22/olmo-3/"
summary: "OLMo 3 from Ai2 is 'best fully open 32B-scale thinking model' with full training data, training process, and checkpoints. Open training data enables auditing for backdoors and data contamination - a crucial advantage over open-weight-only models."
tags: [AI, open-source, llm, training-data, transparency, security, backdoors, olmo]
---

## What Makes OLMo "Fully Open"

Unlike most open weight models, OLMo includes:
- ✅ Model weights
- ✅ **Full training data** (Dolma 3 corpus)
- ✅ **Training process** documentation
- ✅ **Checkpoints** throughout training

**This is rare.** Most "open" models only release weights.

## OLMo 3 Release

Four 7B models:
- OLMo 3-Base
- OLMo 3-Instruct
- OLMo 3-Think
- OLMo 3-RL Zero

Two 32B models:
- OLMo 3-Think (32B) - "best fully open 32B-scale thinking model"
- OLMo 3-Base (32B)

**Focus**: Strong emphasis on **interpretability** - inspect intermediate reasoning traces and trace behaviors back to data/training decisions.

## Training Data: Dolma 3

~9.3 trillion token corpus from:
- Web pages
- Science PDFs (processed with olmOCR)
- Codebases
- Math problems and solutions
- Encyclopedic text

**Dolma 3 Mix**: 5.9 trillion tokens (~6T) with:
- Higher proportion of coding and math data
- Strong decontamination (extensive deduplication, quality filtering)
- Careful data mixing control

**Web standards respected**: Don't collect from sites that disallow it, no paywalled content.

### Token Efficiency

Trains on **~6x fewer tokens** than competition (e.g., Qwen 3 32B) while reaching similar performance levels.

Not trained on fully licensed data (still includes web crawl), so doesn't solve that concern.

## OlmoTrace: Tracing Outputs to Training Data

**The killer feature**: Inspect where/how model learned to generate parts of response.

**Access via**: playground.allenai.org → run prompt → click "Show OlmoTrace"

**How it works**: Uses Ai2's infini-gram to find phrase matches in training data.

**Simon's experience**: Disappointingly, training documents shown weren't relevant (ego-prompt test: "Generate conference bio for Simon Willison"). Appears to do simple phrase matching without semantic relevance filtering.

**Potential**: Closes gap between training data and model behavior - see not just *what* model does, but *why*.

## Why Open Training Data Matters: Backdoor Security

**Anthropic paper (Oct 2025)**: Just **250 poisoned documents** can add backdoor to LLMs of any size. Small carefully crafted trigger prompts can cause undesired behavior.

**Implication**: Impossible to audit training data of closed models like Qwen, Llama, etc.

**OLMo advantage**: Full training data transparency enables:
- Auditing for poisoned samples
- Verification of no backdoors
- Understanding data contamination in benchmarks

### Data Contamination Research

Nathan Lambert (Ai2 researcher):
> "We're excited about future of RL Zero research on OLMo 3 precisely because everything is open. Researchers can study interaction between reasoning traces and downstream model behavior."

Helps answer questions about RLVR results on Qwen models - hints at data contamination on math/reasoning benchmarks.

## Performance: The Overthinker

Simon's test: "Generate an SVG of a pelican riding a bicycle"

**32B Think model**: 
- Thought for **14 minutes 43 seconds**
- Output **8,437 tokens** (mostly thinking trace)
- Produced decent SVG with bicycle, pelican, wings, feet on pedals

**Compared to OLMo 2** (March 2025): Significant improvement - actually resembles prompt.

**Compared to Qwen 3 32B**: OLMo 3 performed better on this creative task.

## Competition in "Fully Open" Space

Ai2 compares to:
- Stanford's **Marin**
- Swiss AI's **Apertus**

Not much competition - most models only open-weight, not open-training-data.

## The Trajectory

**OLMo 1** (Feb 2024) → **OLMo 2** (Mar 2025) → **OLMo 3** (Nov 2025)

Improvements have been significant across each release.

## Why This Matters

### Security Implications

With rise of AI agents and autonomous systems, **auditable training data becomes security critical**. Can't verify no backdoors without it.

### Research Implications

Open training data enables studying:
- Data contamination in benchmarks
- Why models exhibit certain behaviors
- How training decisions affect outcomes
- Reproducibility of research

### Competitive Implications

"Fully open" is much smaller category than "open weight." If security/auditability matters (especially in enterprise/government), this could be decisive advantage.

## Connections

### Related Notes
- **[[ai-attribution-policy]]** - Training data transparency crucial for attribution
- **[[complexity-collapse-llms]]** - Auditing training data helps understand failure modes
- **[[building-agents-still-hard]]** - Model choice matters; transparency may matter more as agents become critical infrastructure

## The Hope

Simon: "I hope we see more competition in this space, including further models in the OLMo series."

**Why competition matters**: 
- Drives "fully open" standards higher
- Creates alternatives to closed models
- Enables security-conscious deployments
- Advances transparency research

---

**Curator's Note**: The backdoor security angle is underappreciated. 250 poisoned docs is tiny - any model without auditable training data is potentially compromised. As AI moves from "toy" to "infrastructure," this matters more. OlmoTrace needs work (phrase matching insufficient), but the vision is right. The 6x token efficiency is impressive and suggests Ai2 has strong data curation.

**Key insight**: "Open weight" ≠ "fully open." Training data transparency is the real differentiator for security-critical applications.
