---
layout: project
title: "Agency of Agents"
subtitle: "Learning what agents are actually good for"
date: 2024-09-01
end_date: present
status: active
banner_image: "https://placehold.co/800x600/c8e6c9/2e7d32?text=Agency+of+Agents"
description: "We're building AI agents to handle the invisible translation work that keeps software projects moving and encodes our secret sauce - and sharing what we learn so other organizations can do the same."
technologies:
  - Python
  - LangChain
  - OpenAI
  - Anthropic
  - GitHub API
  - Slack API
github_url: "https://github.com/thinknimble/agency-of-agents"
tags:
  - ai
  - automation
  - workflow
  - agency
  - productivity
---

## The Context

Since 2017, we've been learning and relearning the tough lesson that Agency work is cyclical and requires constant vigilance. You're constantly selling work and refilling the pipeline and ensuring projects are closing out on time and weathering the Q4 slump and the Q2 spike. We've scaled and shrunk our team multiple times, fitting our staff to the recurring revenue levels we forecasted for the upcoming year. But in January 2025, we faced a fiscal cliff that we hadn't seen yet. There were a bunch of factors in that -- an unstable global economic outlook, a nonprofit freeze that affected some of our larger clients, and an AI headwind that made people unsure what development meant, and a sprinkle of our own failures to scale and prepare. We laid off over half our fulltime staff, people who had started their careers with us and grown into talented, thoughtful, experienced product builders. It was a horrible month, and not one I'd like to relive as a business owner.

But, over the next few months, we saw revenue stabilize and clients return, and we had to decide -- how can we deliver on client work with the stripped down staff that we have? How can our former managers transition back into IC roles? Do we need to find 1099s to contribute? How can we maintain our quality in this new environment?

And that's where the Agency of Agents idea was born. We have a "ThinkNimble Way [TM]" that we've crafted over the last 8 years. We like to think about software builds in a very specific way. From 2017-2024, we taught that system to real humans, who battle tested it with real clients, refined and improved it, and wove it into products we built.

As agents made their way into the AI scene, an interesting challenge arose. Could we teach a set of agents (maybe with a human in the loop), the ThinkNimble way? Could we encode our secret sauce into some agents? And if we could, could other agencies do the same, and we can all learn together?

That's the idea of the Agency of Agents. We're putting out, publicly, how we approach projects for our clients. Our iterative development cycles, from first product idea to rapid feature development, will be on display for feedback. We believe we deliver value not just from the time we spend on projects, but in the way we direct that time. Hopefully this repo will be a reflection of that value, made real.

## The Process

We figured we needed the piping between agents to be easy to edit. We went with Google docs. Then we mapped every step from idea to feature delivery in customer hands, and thought about the docs passed from phase to phase.

Here's how it works: Sales has a call. That transcript is the entry point for the hypothesis agent. That agent does transformation work and creates a hypothesis doc, which becomes the entry doc for the next agent. This repeats until we have a final delivery.

Then we had the idea for the [Agent Launcher](/projects/tn-agent-launcher/) - where we could test and refine agents and build them the right way. Now we're going through and refining the agents that are the most performant. We're slowly going to build out more over time, and see how much we can automate ourselves out of a job.

If we can do that, we'll get to stay above the AI line. We'll spend our time thinking about what to build, how to know it's the right path, what best practices are. We'll spend time with real people with real problems, making impact. We'll build our own products based on what we're learning. And our clients will get real value from the work we do with them. Each hour will go further with this team at our side.

## The Hypothesis

Before, we trained people in our way of thinking, put them on client problems, and watched them work magic. Now we're trying something different: we focus on the highest value things humans do well - thinking about the problem, exploring ways to solve it, refining it, codifying it, building the right architecture, selecting the right tools - and see if agents can handle the rest.

The test: what used to require a full team - can it be streamlined by agentic work if it's well crafted and the human shows up with the right context at the right time?

There's another thing. We've always struggled to make sure everyone uses best practices consistently. I fail to use my own best practices half the time and fall back on muscle memory. Can AI help us actually use the tools that document choices, explain decisions, and give us better outcomes?

## Starting Small

We spend a lot of time in meetings, as all companies do, translating context from one group of specialists to another. If the user experience team has a workflow they've battle tested, how do they tell the engineer about why they've decided on that direction, give them the north star and prioritization frameworks, and then get out of the way so the devs can do what their zone of excellence is? Right now, it's tickets. So we started refining our agents in one of the easiest to update practices - sharing context around implementation and priority details in tickets.

I wanted to start with something we could actually measure. We have a lot of historic data on tickets that were copied from Notion into Github, and then closed. I'm hoping this data provides a testbed for me to see if the analyzer agent can actually improve the creator agent.

These agents are perfect for an early test. There's a lot of variance in how our issues are created, and taking them from 70% useful to 90% doesn't change a lot of code. The output is extremely defined, and should be measurable. We should get clear feedback that we can implement on Agent Launcher stances.

## Why This Matters

Once we crack issue creation, we can go further into the creative work. So much time on each project goes into the administrative tasks that keep knowledge work moving freely:

- Documenting lightbulb moments in client meetings so developers can react quickly to implementation options
- Highlighting resource allocation so pivots can be made when we run into the research part of the R&D work we do
- Writing down all of the boundaries a feature needs to work within to provide real world value

Each agent we build teaches us how to decompose the next piece of creative work. We'll eventually get back to what only we can do, and have a knowledge pipeline that drives value for our clients.

## What We're Building Next

### PRD → GitHub Issue Agent
Turns product requirements into well-structured GitHub issues. This week I created new issues in a new client project using this agent [I've already noticed issues with actually using it in our workflows].

**What it does:**
- Extracts the 20% that matters from messy requirements
- Translates business needs into developer-ready boundaries
- Creates context-aware issues that developers can actually work with

**How we measure success:**
- Historic data: tickets copied from Notion → GitHub → closed
- Target: 70% useful → 90% useful
- Clear, measurable feedback for improving Agent Launcher stances

### Status Report Generator (Script, Not Agent)

To close out our first week on a new project, I needed a way to regularly generate status reports showing:
- GH issues that were moved
- Highlights from the week
- Scope creep
- Future tech debt
- Coordination issues

I started writing an agent to do that work, but Claude Code recommended a script instead. I dug a little deeper, agreed, and changed the process to a script. I have a few keywords I'm looking for, and I don't need an agent to continuously update how to find important details in the PRs.

Just goes to show you -- we're all still learning what the right use case is for AI.

## The Full Agent Pipeline [We'll see if this actually works]

We've built placeholders for the entire workflow, from sales call to final delivery. These haven't been refined through Agent Launcher yet [most are still pretty rough], but they map out the ThinkNimble Way:

### 📊 Sales Prospect Analyzer
Transforms raw meeting notes and transcripts into structured sales intelligence.
- Extracts key business context and pain points
- Identifies stakeholders and decision dynamics
- Produces actionable next steps for sales teams

### 🎯 Hypothesis Identifier
Helps founders articulate clear, testable product hypotheses mapped to validation sprints.
- Based on ThinkNimble's startup product strategy framework
- Converts vague ideas into specific, measurable experiments
- Creates 3-sprint validation roadmaps

### ✅ Business Model Validator
Systematically validates business models through structured assessment.
- Evaluates founder background, product viability, and market demand
- Provides quantitative health scores
- Identifies gaps and risks in business models

### 🎫 Meeting to Tickets
Transforms meeting transcripts into prioritized development tickets.
- Analyzes meeting content for actionable items
- Generates tickets with acceptance criteria and effort estimates
- Includes technical implementation notes

### 📄 Google Docs Fetcher
Downloads and converts Google Docs content for local processing.
- Searches and retrieves documents from Google Drive
- Converts to Markdown format with images
- Organizes content into project directories

**Note:** These agents are under construction. We're refining them one by one through Agent Launcher, measuring their performance against our historic project data, and our vibes. 

## Future Roadmap

Once we crack the core pipeline, we're eyeing:
- Client meeting → implementation options pipeline
- Resource allocation highlighter for R&D pivots
- Feature boundary documentation agent
- Knowledge pipeline that captures the invisible translation work

## How to Use This

If you're thinking about this for your organization:
1. Start with one high-volume, repeatable task (for us: GitHub issues)
2. Make sure you can measure improvement (70% → 90% useful)
3. Build with Google docs so anyone can edit the prompts
4. Test one agent at a time - don't try to automate everything at once

We're sharing our agents and our learning process in the repo. Fork it, adapt it, tell us what works for you. Or, call us.


## Related Research

- [[Tour of Duty in the AI Era]] - How agents become part of professional identity
- [[Pricing for Value Instead of Time]] - Agents as part of engagement value
- [[Distribution vs Depth]] - Using agents to extract patterns from bespoke work
