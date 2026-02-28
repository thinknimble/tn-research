---
layout: note
title: "Open & Offline Models"
date: 2026-02-28
updated: 2026-02-28
status: seed
attribution: ai-supported
authors: ["William Huster"]
tags: [AI, open-source, llm, training-data, transparency, security, open-models, offline]
summary: "Tracking the landscape of truly open and offline-capable AI models. Open weights alone aren't enough - training data transparency is the real differentiator for security-critical applications."
---

## Overview

ThinkNimble has a strong interest in open and offline-capable models. As AI moves from toy to infrastructure, the distinction between "open weight" (just the model) and "fully open" (weights + training data + process) becomes security-critical. This note tracks the landscape.

---

## OLMo 3: The Fully Open Benchmark

Ai2's [OLMo 3](https://simonwillison.net/2025/Nov/22/olmo-3/) releases what most "open" models don't: full training data (Dolma 3, ~9.3T tokens), training process documentation, and checkpoints - not just weights. Anthropic showed that just 250 poisoned documents can backdoor an LLM of any size, making auditable training data a security requirement. OLMo 3 trains on ~6x fewer tokens than competitors while reaching similar performance. Competitors in the "fully open" space: Stanford's Marin, Swiss AI's Apertus - but this remains a small category.

---

## Connections

- **[[Verification Complexity]]** - Open training data is itself a verification tool: you can audit what the model learned and why.
- **[[AI Agent Engineering]]** - As agents become critical infrastructure, model auditability becomes a security requirement.
