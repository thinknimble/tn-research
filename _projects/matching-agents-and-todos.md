---
layout: project
title: "Matching Agents and To-Do's"
subtitle: "Teaching AI to understand what you actually mean"
date: 2025-10-01
end_date: present
status: active
banner_image: "https://placehold.co/800x600/e1bee7/6a1b9a?text=Matching+Agents"
description: "A system that matches your natural language tasks to the right specialized agents, so you don't have to remember which tool does what."
technologies:
  - Python
  - LangChain
  - OpenAI
  - Anthropic
  - Vector Embeddings
tags:
  - ai
  - agents
  - nlp
  - productivity
  - workflow
---

## The Context

I have like 47 things on my to-do list at any given time. Some are vague ("figure out the deployment thing"), some are specific ("update the API endpoint to return user preferences"). And now I have this whole [Agency of Agents](/projects/agency-of-agents/) with specialized agents that could help - a PRD analyzer, a meeting transcriber, a status report generator.

But here's the annoying part: I have to remember which agent does what and manually assign tasks. Or I just use ChatGPT for everything and lose the benefit of having these specialized agents that know our workflow.

So I'm building a tool to help me make sure I use the right tools at the right time, and don't forget any to-do's. It's like Motion's "AI calendar/task system" but instead of just reorganizing my calendar, it suggests which agent should handle each task.

## The Idea

A plugin that lays over your to-do list and matches tasks to the right agent from your Agency of Agents. You write down "need to turn this week's meeting notes into tickets" and it suggests the Meeting → Tickets agent. You write "figure out why the deploy failed" and it knows that's different from "write a PRD for the new feature."

The flow:
1. I dump my to-do list in Google Tasks (or wherever - in the future we can support any task manager you already love)
2. The system matches each task to agents I've already built
3. It groups similar tasks together - do all your PRDs back to back, batch all your status reports
4. Agents run on tasks they can handle autonomously, or create to-do's for things they recognize are missing
5. I get a morning review session for anything that needs my input

Instead of me context-switching between 12 different types of work, I do focused blocks and let the agents handle the translation work.

## How It Works

### 1. Task Analysis
Parse your to-do list and figure out:
- What are you actually trying to accomplish?
- What context does this need? (related tasks, previous work, domain knowledge)
- Can this run autonomously or does it need human input?

### 2. Agent Matching
Compare each task against your Agency of Agents:
- What domain does this live in?
- What's the output format? (GitHub issue, status report, PRD)
- Which agent has the right capabilities?

### 3. Context Assembly
- Identify what data the agent needs (last 5 client meeting transcripts, current sprint issues, etc.)
- Pull that context from your structured data store
- Show you what it's about to send for approval
- Only then generate the prompt with that specific context

So if you're running the Meeting → Tickets agent, it doesn't get access to your entire Google Drive. It gets the specific meeting doc you pointed at, plus maybe the current sprint board for context. Or, asks you for the right data.

### 4. Execution Coordination
For tasks that can run autonomously:
- Agent runs with the approved context
- Results get added to your review queue
- You approve/reject/edit in bulk

For tasks that need your input:
- System flags them and explains why
- You provide the missing context
- Agent runs with your additions

For tasks you may have missed:
- System checks your monthly goals and compares to your to-do's
- Suggests to-do's you may have missed
- You approve/reject/edit

## Current Status

**Weekend project territory.** I built a vibe coded version with Figma Make and Claude, on our tn-bootstrapper.
- Connects to Google Tasks API 
- Allows for upload of prompts / agents
- Suggests agents with confidence scores
- Learns from my corrections when I override its suggestions

The question isn't whether it's technically possible - it clearly is. The questions are:
- Will I actually use it, or is this solving a problem I don't really have?
- Does the matching overhead save time, or does it just add another step?
- How good does the matching need to be before I trust it enough to let things run autonomously?

## Where We Could Go

The interface I want is proactive notifications that understand my workflow:

**Friday at 4pm:**
"It's Friday. Bet you didn't send client roundups. I prepped them and they're ready for your review here."

**Tuesday morning:**
"It's Tuesday and you have all your client check-ins. Here's the Friday summaries, and here's what from your task list to monitor this week."

**Monday afternoon:**
"You don't have tasks queued in GitHub for Cue for next week. Do you have a PRD? Want to build one?"

It's not just "which agent should run on this task" - it's "based on your calendar, your recurring responsibilities, and your current task list, here's what needs to happen and I already started it for you."

I'm sure this exists somewhere, but if it could plug into my Agency of Agents instead of generic AI, it would actually understand *how* I work, not just *what* I'm working on.

## What We're Learning

### The Interface Is More Important Than The Matching
Getting a perfect agent match doesn't matter if I have to manually trigger it every time. The magic is in "it's Friday, you always do this on Friday, I already did it."

### Trust Comes From Explanations
"I picked the Status Report agent because it's Friday and you have 3 client check-ins next week" is way more trustworthy than silent automation.

### Context Permissions Are The Hard Part
I don't want to give agents unfettered access to everything. But I also don't want to manually approve every document reference. The right model is probably: "This agent wants access to the last 5 meeting notes from Project X. Approve once and remember for next time?"

### Batching Similar Work Actually Saves Time
If I could do all my PRDs in one focused 2-hour block instead of scattering them across the week, that alone would be worth building this.


## Open Questions

1. **What's the minimum viable version?**
   - What actually saves me the most time?
   - What do I remember to use?

2. **How does it learn my patterns?**
   - If I override a suggestion, does it update the model?
   - If I always run Status Reports on Friday at 4pm, does it start suggesting that automatically?
   - How do I avoid it learning bad habits?

3. **What's the context approval UX?**
   - "This agent wants access to [these 5 docs]. Approve?"
   - "Remember this approval for similar tasks?"
   - How do I revoke access later if I change my mind?

4. **Is this actually better than just using ChatGPT?**
   - The whole point is that specialized agents know our workflow
   - But if the overhead of matching/approving/batching is too high...
   - Maybe the real win is just "run these recurring tasks automatically" and forget the smart matching?

## Why This Matters

Right now I have a few specialized agents in the [Agency of Agents](/projects/agency-of-agents/). I can remember what each one does and usually remember to use them. But I often forget because it takes as much time to use it as it does to do it myself. The cognitive load of "should I use an agent for this?" kills the momentum. If I have to stop, think about which agent, go find it, set it up, and run it - I'll just do the task myself.

But if the system just says "Hey, I can do that for you" in a system I'm already using, I just might start to automate myself.


## Related Research

- [[Agency of Agents]] - The specialized agents this system coordinates
- [[Tour of Duty in the AI Era]] - How role-based agents fit into career development
- [[Distribution vs Depth]] - Using agents to extract patterns from task assignments
