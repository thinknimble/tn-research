---
layout: note
title: "AI's Environmental Impact"
date: 2026-01-30
updated: 2026-02-28
status: budding
attribution: ai-supported
authors: ["William Huster"]
tags: [AI, infrastructure, environment, water-usage, datacenters, sustainability, fact-checking]
summary: "The narrative that AI is an environmental catastrophe rests on shaky empirical ground. Multiple analyses show datacenter water usage is dramatically overstated relative to agriculture and other industries."
---

## Overview

The narrative that AI is an environmental catastrophe - particularly around water usage - has gained viral traction but rests on shaky empirical ground. Multiple independent analyses suggest the impact is dramatically overstated relative to other industries. The core problem is framing: context-free numbers sound alarming but collapse under comparison.

---

## The Burger Benchmark

SemiAnalysis [puts datacenter water usage in context](https://newsletter.semianalysis.com/p/from-tokens-to-burgers-a-water-footprint): xAI's 400MW Colossus 2 datacenter consumes ~346M gallons/year - roughly 2.5x a single In-N-Out restaurant (~147M gallons/year, mostly from cattle feed irrigation). A Double-Double burger's water footprint (245 gallons) equals ~2.7 billion output tokens.

**The nuance**: water accounting lacks standards and often misleads. Cooling architecture (dry vs. wet vs. adiabatic), power source (Colossus 2 uses zero-water turbines), location (regional scarcity varies), and supply chain (chip manufacturing) all matter. Colossus 2's WUE is 0.51 L/kWh, and xAI is building a water recycling plant targeting net-zero water.

## Individual Use is Negligible

Andy Masley argues that [individual ChatGPT use is not bad for the environment](https://andymasley.substack.com/p/individual-ai-use-is-not-bad-for). One ChatGPT prompt uses ~0.3 Wh - equivalent to 35 seconds of video streaming. A transatlantic flight equals 11.8 million ChatGPT questions. YouTube uses ~1% of global energy; ChatGPT will use ~0.12% by 2030. Netflix alone uses 2x ChatGPT's energy. The climate movement abandoned individual lifestyle shaming for systemic change years ago - yet oddly revived it for AI.

## The *Empire of AI* Fact-Check

Masley also [fact-checked *Empire of AI* by Karen Hao](https://andymasley.substack.com/p/empire-of-ai-is-wildly-misleading), the book that arguably launched the "AI is wasting water" narrative. The errors are significant:

- **4,500x overstatement**: Hao claims a Google data center would use "more than one thousand times" the water of Cerrillos's 88,000 residents. Masley traces this to a likely unit conversion error (cubic meters misreported as liters), inflating the comparison ~4,500x.
- **Consumption vs. withdrawal confusion**: Hao cites "1.1-1.7 trillion gallons" of freshwater by 2027, but the source study distinguishes withdrawal from consumption. Actual consumption is ~10% of her figure; only 3% involves potable water.
- **Uruguay framing**: Hao presents Uruguay's 80% freshwater-to-industry ratio as alarming colonialism. This ratio is standard globally, including the US.

The book juxtaposes colonial torture with data center water usage, framing the latter as continuation of the former. When the water numbers are corrected, the central narrative of the chapter collapses.

<div class="conversation">
{% message author-id="william-huster" name="first" time="February 28, 2026 at 5:44 PM" %}
Looks like he went head-to-head with Karen about Empire of AI: https://andymasley.substack.com/p/empire-of-ai-is-wildly-misleading

I think her book is what started the "AI is wasting water" tiktok meme. This is the bit I was referring to yesterday:

> Frame Uruguay as using an unacceptable amount of water on industry and farming, where it actually seems to use the same ratio as any other country.
> Frame the Uruguay proposed data center as using a huge portion of the region's water where it would actually use ~0.3% of the municipal water system, without providing any clear numbers.

These are all the significant mentions of data centers using water in the book. Read in this light, the chapter becomes somewhat ridiculous, because the rest includes descriptions of brutal acts of torture and plunder under colonialism, and then frames data center water use as a continuation of that same colonialism. If instead you see data centers using water in other countries as part of a simple trade the countries are making to get more taxable industry in the area, and that doesn't seem to harm water access, the central narrative thrust of the chapter becomes false.
{% endmessage %}

{% message author-id="william-huster" name="first" time="February 28, 2026 at 5:46 PM" %}
Karen responded to that Substack post and in her response she said "we have philosophical differences," which I'm having a hard time seeing in Andy's fact checking. It probably won't happen, but I'd be very much interested in seeing them debate and unpack those philosophical differences.
{% endmessage %}
</div>

---

## Connections

- **[[AI Economics & the Productivity Paradox]]** - Resource costs vs. economic value of AI output.
- **[[Verification Complexity]]** - Infrastructure scale needed to support increasingly capable models.
