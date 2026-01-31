---
layout: note
title: "AI Datacenter Water Footprint - Context Matters"
date: 2026-01-30
updated: 2026-01-30
status: seed
attribution: curated
authors: ["SemiAnalysis", "Claude (AI Assistant)"]
source: "https://newsletter.semianalysis.com/p/from-tokens-to-burgers-a-water-footprint"
summary: "Detailed analysis comparing datacenter water usage to everyday industries like burger production. xAI's Colossus 2 datacenter uses roughly 2.5x the water of a single In-N-Out burger restaurant, putting AI infrastructure concerns into practical perspective."
tags: [AI, infrastructure, environment, water-usage, datacenters, sustainability]
---

## Key Findings

**Colossus 2 vs. In-N-Out**: xAI's 400MW Colossus 2 datacenter consumes ~346 million gallons/year, while an average In-N-Out restaurant uses ~147 million gallons/year. That's a **2.5:1 ratio** - one of the world's largest datacenters equals 2.5 burger joints.

**Tokens per Burger**: A single Double-Double burger's water footprint (245 gallons) equals **2.7 billion output tokens** or using Grok 30x/day for **668 years**.

## The Nuance in Datacenter Water Usage

Water accounting lacks standards and often misleads:
- **Cooling architecture matters**: Dry vs. wet vs. adiabatic cooling systems have vastly different profiles
- **Power source matters**: Colossus 2 uses simple-cycle turbines with zero water for power generation
- **Location matters**: Regional water scarcity varies; blue water vs. green water distinction critical
- **Supply chain matters**: Should we count chip manufacturing? Embedded water in wafers?

### Colossus 2 Breakdown

For 400MW Critical IT capacity at 70% utilization:
- **Cooling**: 267M gallons/year evaporated (hybrid dry + adiabatic system)
- **Power generation**: 0 gallons (no steam/combined cycle)
- **Initial loop fill**: Minimal one-off cost
- **Chip manufacturing**: 64M gallons amortized over 5 years (32k wafers for 200k GPUs)
- **Total WUE**: 0.51 L/kWh

**Future**: xAI is building a water recycling plant to treat municipal wastewater, potentially making Colossus 2 **net-zero water**.

## Why This Matters

The datacenter water debate is often overstated. Context-free headlines ("1 million gallons per day!") ignore:
1. Comparison to other industries (agriculture, food, manufacturing)
2. Economic value per gallon (intelligence/tokens produced)
3. Technical improvements (wet chillers more efficient than dry)
4. Recycling opportunities

### The Burger Analogy

95% of a burger's water footprint comes from **cattle feed irrigation** (alfalfa, corn). Regional variation is huge - Southwest US beef is far more water-intensive than wetter climates.

A Double-Double: 245 gallons (blue water only)  
An average In-N-Out: 600k burgers/year = 147M gallons/year

With 400+ In-N-Outs and hundreds of thousands of other burger joints, the scale difference is dramatic.

## Connections

### Related Notes
- **[[ai-attribution-policy]]** - As AI becomes infrastructure, who's responsible for environmental costs?
- **[[complexity-collapse-llms]]** - Scale of infrastructure needed to support increasingly capable models
- **[[information-density-ai-value]]** - Economic value of tokens vs. physical resource costs

## The Provocative Question

Should we assign economic value to each token produced? As models become more capable, the value of a token as a "unit of intelligence" increases. How do we weigh intelligence production against resource consumption?

**The data suggests**: Datacenter water usage concerns may be misplaced compared to everyday industries we don't scrutinize as heavily.

---

**Curator's Note**: This analysis provides crucial context often missing from AI infrastructure debates. The detailed breakdown of cooling systems, chip manufacturing, and comparative metrics (tokens per burger!) offers a model for how to think about resource trade-offs. The upcoming water recycling plant shows how datacenters can actually improve local water systems.
