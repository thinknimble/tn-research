---
layout: note
title: "A Command Line for Everyone"
date: 2025-06-30
updated: 2025-09-07
status: seed
attribution: ai-supported
authors: ["William Huster", "Marcy Ewald"]
summary: "Chatbots are the new command line interface - making complex computer operations accessible through natural language conversation."
tags:
  [
    AI,
    programming,
    prompt-engineering,
    natural-language-processing,
    future-of-coding,
  ]
---

## The Syntax Evolution

Programming languages have always been about translating human intent into machine instructions. Natural language with LLMs may be the final evolution of this translation layer.

<div class="conversation">
{% message author-id="william-huster" name="first" time="June 30th at 12:23 PM" %}
Good arguments in favor of Chatbots as the interface: [https://www.geoffreylitt.com/2025/06/29/chat-ai-dialogue](https://www.geoffreylitt.com/2025/06/29/chat-ai-dialogue)

I think chatbots are like "a command line for everyone."

Along those lines, this [30m talk by Karpathy](https://youtu.be/LCEmiRjPEtQ?feature=shared) is also worth watching - The key thing is that AI/ML models were like one-shot functions in the beginning, but now LLMs have made neural nets programmable and by extension computers are now increasingly programmable in natural language.
{% endmessage %}

{% message author-id="william-huster" name="first" time="Jul 1st at 11:36 AM" reactions="‼️:1" %}
I thought Marcy would find this particularly interesting in terms of product design and advice we give clients about what interfaces to build. I personally have steered clear of recommending chatbots as an interface, perhaps because it feels too cliche. The first article here made me rethink that.

I think we can develop a framework of when and where chatbots are appropriate. I think that like the command line, they work well as a liminal space between actions, like a hallway or intersection. They definitely help with routing people, And with tool use, they can actually "take you there" and do things for you. This also makes them a good way to compose multiple actions together in a flexible and custom way, which is not so easy to provide with a fixed graphical interface, because there is a multiplicative explosion of possible action combinations.
{% endmessage %}

{% message author-id="marcy-ewald" name="first" time="Jul 1st at 11:37 AM" %}
Yeah, I worked down this for a client a bit a couple weeks ago. A chat was a bit too open field for getting specific answers to recommend a student to an org, but the bounds of the chat we originally deployed got a lot of negative feedback from students.
{% endmessage %}

{% message author-id="marcy-ewald" name="first" time="Jul 1st at 11:42 AM" %}
I did some research with my boy claude here, that would probably extend to this conversation.

_Why We Chose Conversational Scaffolding_

The traditional onboarding approaches we researched - like Slack's 2024 evolution and Notion's AI-enhanced personalization - showed us that the most effective approaches treat conversation as scaffolding for value discovery rather than information delivery. Instead of progressive disclosure that forces predetermined paths, we needed something that could handle students taking the conversation in a ton of ways while still moving them toward structured outcomes.

The key breakthrough was realizing we needed invisible guardrails - students feel they're having a natural conversation while we systematically guide them through discovery milestones. This required conversational jujitsu (redirecting energy rather than blocking it) with **progressive state tracking**.
{% endmessage %}

{% message author-id="william-huster" name="first" time="Jul 1st at 12:01 PM" %}
Yeah, that's great. I like the framing of conversational scaffolding versus progressive disclosure. To put it another way, in this specific case the chatbot replaces the boring old survey → recommendations flow.

I wonder if students were frustrated because they didn't feel like they had enough control over what was going on. I realize the whole idea is to put them on rails, but if they are just answering questions and not told what actions they can take (or given any actions to take), then the chatbot is in control and the only fun and agency left to you is to try to break the chatbot.
{% endmessage %}

{% message author-id="marcy-ewald" name="first" time="Jul 1st at 12:04 PM" %}
Yeah, using the chatbot to address blank states in the app (Why don't I have any interviews scheduled? Why don't I have any industries selected?) helped me think about how to use the chatbot to elicit certain information, but then also allow students a place to just talk freely.
{% endmessage %}

</div>

## Examples of Traditional vs. Natural Language Syntax

Let's look at some examples of classic command-line and coding tasks. GenAI and coding assistants excel at translating these requests.

### File Search

**Natural**:

> "Show me all Python files modified in the last week that contain a process function"

**Bash**:

```bash
find . -name "*.py" -type f -mtime -7 | xargs grep "def process"
```

<div class="conversation">
{% message author-id="william-huster" name="first" time="Sep 7th, 2025 at 12:23 PM" %}
I'll be honest: even after 20 years using Linux, I would struggle to write this command on my own.
{% endmessage %}
</div>

### Data Transformation

**Natural**:

> "Count products over $100 by category, but only show categories with more than 5 items"

**SQL**:

```sql
SELECT COUNT(*), category
  FROM products
  WHERE price > 100
  GROUP BY category
  HAVING COUNT(*) > 5;
```

### Text Processing

**Natural**:

> "Find all mentions of 'pattern' and show me the second word from the first 10 matches"

**Unix**:

```bash
grep -r "pattern" . | head -10 | awk '{print $2}'
```

### And Beyond...

It can get so much more sophisticated than this! Coding assistants like Claude Code can draft, execute, and refine their own bash commands and scripts on the fly. They can translate vague high-level requests like "summarize how Feature X works in this codebase" into a structured exploration that uses the common Linux search tools demonstrated above like `sed`, `grep`, `find`, and `awk`.

The bash command example are particularly interesting because they use the pipe `|` operator to compose multiple single-purpose commands. This idea is core to the Unix design philosophy. Because GenAIs fundamentally operate on text, they can interoperate directly with these commands. So not only can they put Unix commands together like a human engineer, they can compose themselves into the data processing pipeline, too.

## Prompt Engineering

Natural language as code has created a new discipline: **prompt engineering**.

### Core Skills

1. **Specificity without verbosity**

   - Bad: "Can you please help me find some files?"
   - Good: "List all PDF files in /documents modified today"

2. **Structured thinking**

   - Break complex tasks into steps
   - Use numbered lists and bullets
   - Provide clear success criteria

3. **Context management**

   - Reference previous outputs explicitly
   - Maintain state across conversations
   - Use clear variable names ("the dataset from step 2")

4. **Error anticipation**
   - "If no results found, expand search to..."
   - "Ignore case sensitivity"
   - "Handle missing values by..."

## Advantages Over Traditional Syntax

1. **No memorization** - Describe what you want, not how
2. **Instant refactoring** - "Actually, make that recursive"
3. **Built-in documentation** - The code explains itself
4. **Graceful degradation** - Partial understanding still yields results
5. **Universal interface** - Same "syntax" for any domain

## Implications

### For Developers

- Writing clear requirements becomes more valuable than syntax knowledge
- Debugging shifts from code to prompts
- Architecture and design matter more than implementation

### For Non-Developers

- Complex automation becomes accessible
- The barrier is imagination, not technical skill
- Power users emerge without traditional training

### For Organizations

- "Citizen developers" can build real solutions
- Documentation and code merge into one
- Training focuses on problem-solving, not syntax

## The New Literacy

If natural language is the new programming syntax, then:

- **Clear communication** is the new coding skill
- **Structured thinking** is the new algorithm design
- **Prompt libraries** are the new code repositories
- **LLM interfaces** are the new IDEs

## Research & Sources

### Academic Perspectives

- **[MIT News (2024)](https://news.mit.edu/2024/natural-language-boosts-llm-performance-coding-planning-robotics-0501)**: "Natural language boosts LLM performance in coding, planning, and robotics" - Research showing improved performance when using natural language descriptions
- **[ACM Transactions on Software Engineering](https://dl.acm.org/doi/10.1145/3672456)**: "Self-Planning Code Generation with Large Language Models" - Demonstrates that self-planning approaches outperform direct generation
- **[AutoIOT Research (2024)](https://arxiv.org/html/2503.05346)**: "LLM-Driven Automated Natural Language Programming for AIoT Applications" - Shows decomposition of programming tasks using chain-of-thought prompts

### Industry Takes & Further Reading

- **[Stack Overflow Interview with Prof. Greg Benson](https://stackoverflow.blog/2024/11/07/no-code-only-natural-language-q-and-a-on-prompt-engineering-with-professor-greg-benson/)**: "No code, only natural language" - Discusses how prompts can be thought of as programs
- **[GitHub Blog](https://github.blog/ai-and-ml/generative-ai/prompt-engineering-guide-generative-ai-llms/)**: "A developer's guide to prompt engineering and LLMs" - Comprehensive guide on prompt engineering as new form of programming
- **[GitHub Awesome-Code-LLM](https://github.com/codefuse-ai/Awesome-Code-LLM)**: Curated list of language modeling research for code
- **[Prompting Guide for Code Generation](https://www.promptingguide.ai/prompts/coding)**: Practical guide for code generation with LLMs
- **[ArXiv Papers on Code Synthesis](https://ar5iv.labs.arxiv.org/html/2305.01598)**: "From Words to Code: Harnessing Data for Program Synthesis from Natural Language"

### Key Research Findings

- **"Prompts as Programs"**: English and other natural languages have become new programming languages
- **Chain-of-Thought (CoT)**: Enables step-by-step reasoning for complex tasks
- **Automatic Prompt Engineering (APE)**: Treats instructions as programs that can be optimized
- **LILO System**: Combines LLM proposals with exhaustive search for better code synthesis

### Notable Quotes from Research

- "Developers are already building software with LLMs using basic HTTP requests and natural language prompts"
- "There will likely be an entire generation of technical workers who will be able to generate useful computer programs without a formal computer science degree"
- "Prompts and LLMs can be used to either replace complex code, or perform functions that would be nearly impossible to achieve in conventional code"d
