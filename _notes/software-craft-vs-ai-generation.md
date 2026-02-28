---
layout: note
title: "Software Craft vs. AI Generation"
date: 2026-02-28
status: budding
attribution: ai-supported
authors: ["William Huster"]
tags: [AI, software-craft, code-quality, technique, arts-crafts-movement, engineering-discipline]
updated: 2026-02-28
summary: "AI-generated code optimizes for speed but can't address the deeper problem: building software well at scale. The gap between 'good enough' and 'craft' is widening."
---

## Overview

AI-generated code optimizes for speed and quantity but can't address the deeper problem: we still haven't figured out how to build software well at scale. The gap between "good enough" and "craft" is widening, not narrowing.

---

## The Ellul Critique

Alex Wennerberg's ["AI Code and the Loss of Craft"](https://alexwennerberg.com/blog/2026-01-25-slop.html) applies Jacques Ellul's concept of *technique* - the reduction of all activity to efficient means toward measured ends. Under technique's regime, software is "good" if it maximizes metrics with minimal effort. AI agents are the logical extension: they thrive in the "nihilistic space of pure optimization" (Spotify's algorithmic muzak) and fail where craft matters (Bandcamp's curated indie scene).

The practical reality matches: AI generates verbose code in a "braindead style" with flat, ugly designs and recognizable aesthetic tells. It works best on well-defined, already-solved problems (unit tests, simple DB functions). Attempts to generalize have "largely failed and produced code that is novel and impressive only in its monstrosity."

The call to action is a Software Arts & Crafts movement, inspired by Ruskin and Morris's response to industrialization. When craft becomes more scarce, it becomes more valuable. There's a treasure trove of unexplored computing paradigms beyond the narrow C/Unix → JavaScript/Web branch we're on. See [Permacomputing](https://permacomputing.net/).

## Engineering Discipline in ML

[The Pragmatic Programmer for Machine Learning](https://ppml.dev/) (Scutari & Malvestio) argues that software engineering practices are critically undervalued in ML. The reproducibility crisis in academia and catastrophic failures in industry (Knight Capital, Zillow's algorithm) stem from the same root cause: treating engineering discipline as secondary to model performance. Sculley et al.'s insight applies broadly: 90% of the complexity in ML systems is *not* the model itself.

---

## Connections

- **[[Verification Complexity]]** - Craft and engineering discipline are ways of managing the verification exponent. Sloppy code increases the connectivity factor `k`.
- **[[AI Economics & the Productivity Paradox]]** - Kent Beck's programming deflation: the middle disappears, craft and commodity diverge.
- **[[AI Agent Engineering]]** - Ronacher's lesson that abstractions are premature echoes the craft argument: stay close to the metal until you understand the problem.
