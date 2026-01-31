---
layout: note
title: "Build vs Buy in the Age of AI"
date: 2026-01-30
updated: 2026-01-30
status: budding
attribution: curated
authors: ["Marty Cagan (SVPG)", "Claude (AI Assistant)"]
source: "https://www.svpg.com/article-build-vs-buy-in-the-age-of-ai/"
summary: "The future of build vs buy is 'yes to both.' Vibe coding won't kill SaaS because business rules and logic are hard. Companies will buy component services accessed by both humans and AI agents via MCP protocol. Hard part remains discovering the right solution to build."
tags: [AI, product-management, saas, business-software, mcp, user-programming, architecture]
---

## The Core Question

With AI "vibe coding" tools (Lovable, Bolt, Cursor), will everyone build and nobody buy? Will SaaS die?

**Answer**: No. The future is "yes to both."

## User Programming Evolution

**1979**: VisiCalc (first spreadsheet) - programming for non-technical people  
**1991**: Visual Basic - first low-code option  
**2020s**: Low-code/no-code wave  
**2024+**: Vibe coding - programming language is now English

Each generation lowers skill barrier, but doesn't eliminate need for purchased solutions.

## Why SaaS Won't Die: Business Rules

The reason business software (procurement, invoicing, payments, budgeting, payroll, CRM, customer service) won't be replaced by user-programmed solutions:

### Thousands of Complex Business Rules

Behind every enterprise business solution:
- **Thousands** of often complex business rules
- **Millions** of lines of business logic
- Rules capture constraints around policy, compliance, security, legal, financial, pricing

**The hidden complexity**:
- Most non-technical people have little idea these rules exist
- Even technical people struggle because rules are embedded in code
- People who defined/implemented rules have often moved on
- Documentation (rarely) exists, almost never explains reasoning/nuance

### Product Managers' Role

This is the knowledge product managers acquire to **define viable solutions**.

This is why addressing **technical debt is hard** - have to tease out business rules and decide which still apply.

**The value**: A system that captures, manages, enforces thousands of essential business rules is real work to create, but valuable to have.

## The Big Change Coming

Today: Business solutions designed to be used by **people**

Future: Solutions will be used by:
1. **Humans** (as before)
2. **AI agents** (acting on behalf of humans)
3. **Custom solutions** (vibe-coded or hand-coded) built on top of component services

## The Enabler: Model Context Protocol (MCP)

Industry has needed this since advent of internet, but only now becoming reality.

**What it is**: Widely accepted protocol to describe business services that can be read by **computers**, not just people.

**Proposed by**: Anthropic (~1 year ago)  
**Status**: Rapidly gaining traction

**Why it matters**: Solves long-standing architectural problem of programmatic access to business services.

## The New Architecture

Companies will:

1. **Buy** complex component services for important business functions
2. **Build** custom workflows/agents on top via:
   - AI agents (created by vendors, integrators, or customers)
   - Custom solutions generated from vibe-coding tools
   - Traditional hand-coded integrations

**Components designed for dual access**: Both humans and software (agents + workflows)

## The Hard Part Remains

As more non-technical people create solutions beyond simple personal time-savers, they need to learn what product world learned:

**The hard part is rarely building and delivering the solution.**  
**The hard part is discovering the right solution to build.**

## Implications

### For SaaS Vendors

- Not doomed, but must evolve
- Design services for both human and programmatic access
- Provide MCP interfaces
- May need to provide AI agents as part of offering

### For Enterprises

- Constraints of limited IT resources will ease
- More people can build solutions
- But complexity of business rules remains
- Integration challenges shift from "can we connect?" to "should we connect?"

### For User Programmers

- Democratized building is real
- But discovery (what to build) still requires skill
- Understanding business context/rules is critical
- Product management skills become more valuable, not less

## Connections

### Related Notes
- **[[command-line-for-everyone]]** - Making complex systems accessible via better interfaces
- **[[programming-deflation]]** - Abundant cheap code, but value in integration/judgment
- **[[unit-of-work-ai-productivity]]** - Discovery and definition matter more than implementation speed
- **[[literate-agents]]** - MCP as protocol for agent-to-service communication

## The Philosophical Shift

**Old paradigm**: Build or buy is a trade-off  
**New paradigm**: Buy components, build integrations/workflows  

**Old value**: Implementing business logic  
**New value**: Discovering and orchestrating the right combination

This isn't about replacing SaaS. It's about composability.

## Why It Took 30 Years

MCP solves problem that wasn't technically constrained. Sometimes you have to wait for stars to align:

1. Need for agent economy (AI agents widespread)
2. Need for programmatic access (vibe coding democratized)
3. Industry maturity (enough painful integration experience)
4. Standards leadership (Anthropic with LLM context)

All four finally converged in 2024-2025.

---

**Curator's Note**: Marty Cagan nails the nuance here. The hype says "vibe coding kills SaaS" but reality is "vibe coding makes SaaS more valuable as composable components." The insight about business rules is crucial - most people building with AI don't realize the iceberg of complexity beneath enterprise software. MCP as the enabling protocol is the key architectural insight. This predicts "command line for business logic" - which is exactly what we've been exploring.

**Key takeaway**: Future isn't build vs buy. It's buy components + build orchestration. Value shifts from implementation to discovery and integration.
