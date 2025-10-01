---
layout: project
title: "TN Agent Launcher"
subtitle: "Orchestration framework for AI agents"
date: 2025-08-01
end_date: present
status: active
banner_image: "https://placehold.co/800x600/e1bee7/6a1b9a?text=TN+Agent+Launcher"
description: "A Python framework for launching, managing, and orchestrating AI agents with support for multiple LLM providers and agent architectures."
technologies:
  - Python
  - LangChain
  - OpenAI
  - Anthropic
  - AsyncIO
  - Docker
github_url: "https://github.com/thinknimble/tn-agent-launcher"
tags:
  - ai
  - agents
  - llm
  - orchestration
  - python
---

## Why Us

We've spent a decade and a half building software for people who do everything from running nonprofits to moving millions in payments to wrangling spreadsheets that look like they were designed as a form of punishment. What jumps out after you've built enough of these is how the same patterns keep showing up. The work people actually want to do is buried under the work they have to do. We're good at seeing those patterns, and we're even better at translating solutions from one domain to another. If there's a way to make the annoying parts go away, we'll find it. For years, we've applied traditional software tools to those problems, and now we're using the newest tool in our toolbelt – AI.

## What We're Doing Here

We're putting our own jobs under a microscope and asking, "What could we automate out of existence?" There's a reason we chose this career, and a lot of our time is not spent on things we could talk about at parties (trust me, eyes gloss over at the mention of the perfect Jira ticket structure). What we want to work on is the hard questions, the pattern we saw in user journeys between two totally different industries, the way one product hit its market and took off. There's a lot of things we could work on in a day, and we want to spend more time on the stuff in our zone of genius.

We've been building things behind the scenes for dozens of companies in the last 15 years, and we want to take this opportunity to publicly build our replacement Agency. We're starting with a launcher for agents—tools that pick up the grunt work so we can spend more time on the parts that actually matter. And we're doing it in public, in this repo, so anyone can see how we're thinking, what we're testing, and what actually works.

## Why This Thing

Our team is comfortable with AI because we're comfortable with tech. We've been finding the right tool for the job for 15 years. But most people aren't going to touch a command line, and they shouldn't have to learn five new tools just to automate something basic.

That's why we're building both a Python framework for developers and an app for everyone else. You shouldn't need to be technical to automate the boring parts of your job.

We want this to work for the person who's never opened a terminal and for the person who lives in one. Build the agent once, test if it actually helps, then let it run so you can work on things that matter.

## Why You Should Care

Jobs are a big part of how we define ourselves. You probably didn't sign up for your role because you love moving data from A to B or filling out forms. You wanted to make a difference, see your skills shine, work with people you respect. The reality is, the stuff you actually wanted to do gets buried under status reports and ticket grooming and meetings about meetings. We're trying to flip that ratio. If we do this right, you get more time for the work that makes you proud and less time for the stuff that makes you roll your eyes. And you can see it all unfold, right here, the proof in the repo pudding (that's a metaphor, right?).

## Where to Start

We're starting with the things that take the least magic and the most time, and documenting every step. We're taking what works, and applying it to our stances for how to build a good agent.

We plan to document what makes for good automation, how we're evaluating the usefulness of agents, and how we're setting up a system of agents to work well together. We're building a feedback loop between these projects to automate, test, refine, abstract, and repeat. If you want to follow along, clone the repo, try it out, or just watch us work. The whole point is to make this accessible, transparent, and—hopefully—a little bit inspiring.

## How to Use This

**If you're not a developer:**
Download the app (coming soon) and point it at the repetitive task you want to automate. The app walks you through describing what you need, tests if an agent can handle it, and shows you the results before it runs for real.

**If you're a developer:**
Install the Python framework and build custom agents:

```bash
# Install from GitHub
pip install git+https://github.com/thinknimble/tn-agent-launcher.git

# Or clone and install locally
git clone https://github.com/thinknimble/tn-agent-launcher.git
cd tn-agent-launcher
pip install -e .
```

## What This Actually Does

We're building a Python framework to test which parts of our jobs are worth automating. Not everything should be an agent. Sometimes a script is better. Sometimes you should just do it yourself.

Here's what the framework helps with:

- **Figure out if automation actually helps**: Track whether the agent saved you time or just created more work to manage
- **Work with any AI provider**: OpenAI, Anthropic, whatever comes next. No lock-in.
- **Handle the boring infrastructure**: Rate limits, retries, logging. You shouldn't have to rebuild this every time.
- **Build on what works**: We're documenting our "stances" - patterns we've learned about what makes a good agent


## How We Think About Agents

Not every task needs an agent. Sometimes a script is better. Sometimes you should just do it yourself. Here's how we're thinking about it:

**When agents make sense:**
- Tasks that happen over and over with slight variations
- Jobs where the "right answer" changes based on context
- Work that requires judgment calls but follows patterns you can teach

**When they don't:**
- One-off tasks that'll never happen again
- Jobs where the rules are crystal clear and never change
- Anything where the setup takes longer than just doing the work

### What's Inside

**Agent Base**: A starting point that handles the plumbing (errors, retries, logging) so you can focus on what your agent actually does.

**Launcher**: Runs your agents without you babysitting them. Queues up tasks, manages resources, deals with failures.

**Provider Layer**: Talks to whatever AI service you're using. Switch between OpenAI and Anthropic without rewriting code.

**Stances**: Our term for the accumulated wisdom about what makes a good agent. We're documenting these as we go. View these on the app.

## What We're Using This For

We're testing this on our own work first:
- **PRD to GitHub issues**: Turned a 45-minute task into a 5-minute review. Testing on 3 client projects right now.
- **Status reports from PR activity**: Generated our first weekly report in 2 minutes vs the usual 60 minute client update meeting.
- **Client meeting notes → implementation docs**: Still testing - jury's out on whether this actually saves time

If it works for us, it might work for you. If it doesn't, tell us why, and let's fix it.


## Want to Help?

If you want to follow along, build your own agent, or want to know what an agent actually does, let us know. Open issues if something breaks or doesn't make sense. The whole point is to make this accessible, transparent, and —hopefully— a little bit inspiring.

Check out the GitHub repository to see what we're working on next.