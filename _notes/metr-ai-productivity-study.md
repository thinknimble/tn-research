---
layout: note
title: "METR Study - AI Actually Slowed Developers Down"
date: 2026-01-30
updated: 2026-01-30
status: seed
attribution: curated
authors: ["METR (Nate Rush et al.)", "Claude (AI Assistant)"]
source: "https://arxiv.org/abs/2507.09089"
summary: "Randomized controlled trial found AI tools (Cursor + Claude) increased completion time by 19% for experienced developers on real projects. Contradicts both developer forecasts (24% faster) and expert predictions. Raises questions about AI productivity claims."
tags: [AI, productivity, research, measurement, cursor, developer-experience, rct]
---

## Shocking Finding

**Hypothesis**: AI tools make developers faster  
**Reality**: AI tools made developers **19% slower**

16 experienced open-source developers, 246 tasks in mature projects (avg 5 years experience on these projects), early 2025 AI frontier tools (Cursor Pro + Claude 3.5/3.7 Sonnet).

## The Prediction Gap

**Before tasks**: Developers forecast AI would reduce completion time by **24%**  
**After tasks**: Developers estimated AI reduced time by **20%**  
**Actual result**: AI **increased** completion time by **19%**

**Expert predictions were also wrong**:
- Economics experts: 39% shorter
- ML experts: 38% shorter

## Study Design

- **Randomized controlled trial** (RCT) - gold standard methodology
- Each task randomly assigned to allow/disallow AI tools
- Real mature projects, not toy examples
- Experienced developers with moderate AI experience
- 51 pages, 8 tables, 22 figures analyzing results

## Possible Explanations Investigated

Researchers examined 20 properties that could contribute to slowdown:
- Size and quality standards of projects
- Prior developer experience with AI tooling
- Task complexity
- Experimental artifacts

**Conclusion**: "Although the influence of experimental artifacts cannot be entirely ruled out, the robustness of the slowdown effect across our analyses suggests it is unlikely to primarily be a function of our experimental design."

## Why This Matters

Most AI productivity claims are based on:
- Self-reported surveys (biased)
- Synthetic/toy tasks (not representative)
- % of code generated (wrong metric)

This is a **rigorous RCT on real projects** - rare and valuable.

## Open Questions

1. **What caused the slowdown?**
   - Context switching overhead?
   - Over-reliance on suggestions?
   - Quality checking AI output takes longer than writing?
   
2. **Is "speed" the right metric?**
   - What about cognitive load, exhaustion, ability to manage non-dev tasks?
   - Long-term maintainability of AI-generated code?

3. **Task type matters?**
   - Maybe AI helps with some tasks, hurts with others?
   - Experienced devs on familiar codebases different from greenfield work?

4. **Is this early-2025 specific?**
   - Tools improving rapidly
   - Will late-2025 or 2026 tools show different results?

## Connections

### Related Notes
- **[[unit-of-work-ai-productivity]]** - AI productivity should be measured by outcomes, not speed or code %
- **[[programming-deflation]]** - Challenges assumption that cheaper code = productivity
- **[[ai-code-craft-critique]]** - AI generates verbose, braindead style code - checking may take longer
- **[[building-agents-still-hard]]** - Technical challenges with AI tools still significant

## The Uncomfortable Truth

This study contradicts the narrative that AI universally boosts developer productivity. It suggests:

1. **Measured productivity ≠ perceived productivity** (developers thought they were faster)
2. **Expert intuition can be wrong** (both econ and ML experts predicted speedup)
3. **Context matters enormously** (experienced devs on mature projects ≠ junior devs on new code)

## Questions About Methodology

**Valid questions**:
- Speed-only focus misses cognitive load, exhaustion, multitasking
- Mature projects with experienced devs may not generalize
- Did study account for code quality/maintainability?

**But**: RCT methodology is rigorous. Can't dismiss findings just because inconvenient.

## Next Steps

- Read full 51-page paper for detailed analysis
- Compare with other productivity studies
- Consider writing response showing "our receipts" for TN productivity gains
- Define and measure productivity holistically, not just speed

---

**Curator's Note**: This is the most rigorous challenge to AI productivity claims I've seen. The gap between perception (20-24% faster) and reality (19% slower) is startling. However, sample size is small (16 devs) and context specific (experienced devs on familiar mature projects). Need to read full paper before strong conclusions. But dismissing it as "bad methodology" without evidence would be intellectual dishonesty.

**Key question**: What drives the perception/reality gap? Why do devs *feel* more productive when they're actually slower?
