---
layout: note
title: "AI Attribution Policy"
date: 2025-09-06
tags: [ai, ethics, attribution, transparency, writing]
attribution: human-written
status: budding
---

William: I am cooking up another article about the game theory and ethics of AI attribution. Like how do you represent your work in an environment where other people have or have not adopted AI, or where the norms are such that everyone else is using AI, or they suspect you're using AI, or trust of AI is lower than you think it should be, etc etc.

The short version is that I think you should tag your works as one of three categories (at a minimum):

- **"AI Generated"** - Content primarily created by AI with minimal human intervention
- **"AI Supported"** - Content created through collaboration between human and AI
- **"Human Written"** - Content created entirely by human effort

And be honest about it!

The trouble is that works in the second category could range from like 10%-90% AI generated and still count as "not purely AI generated." So it might be useful to have different tiers of AI-supported works, but I don't want to over-engineer it. And I think even if people are being honest, they are generally not good at being self-aware enough to quantify their contribution versus AI in a more granular way.

I also don't think we should go to the extreme of auditing every line of writing or code for its AI or non-AI providence (except in environments like school exams). Even though AI generates a lot of my code now, I still look at it as a tool and I am still the auteur - at least for now - so I own the work and represent it as my own, not the AI. After all, I would not credit VS Code for writing my code, even though it's an indispensable tool for me now, and through automated reformatting touches every line.

I think the same can be said for prose writing, but the distinction is a bit muddier because natural language is so flexible. Anyway, curious your thoughts as I put this together.

## Implementation

On this site, all content includes an `attribution` field in the front matter that indicates the level of AI involvement. This badge is displayed prominently on each piece of content and links back to this policy note for transparency.
