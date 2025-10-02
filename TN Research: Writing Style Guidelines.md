TN Research: Writing Style Guidelines
Core Principles

Professional and approachable

We write with the clarity, tone, and structure of academic work, but without unnecessary jargon. Our goal is to make complex ideas accessible to thoughtful readers.

Joyful curiosity

We want to inspire others by sharing not just information, but our excitement about learning and thinking. When appropriate, let humor and personality shine through. Show that research can be fun, that learning is rewarding, and that intellectual curiosity is something to celebrate. Let your enthusiasm be contagious.

Passion grounded in evidence

Our enthusiasm should come through in our writing, but it is ultimately tethered to research, data, experience, and careful reasoning. We share what excites us about a topic while maintaining intellectual honesty about limitations and uncertainties.

Authority with humility

We've done our research and have valuable insights to share. We cite sources, present evidence, and make clear arguments. At the same time, we acknowledge what we don't know. We present competing viewpoints fairly, and we position ourselves as fellow learners rather than final arbiters.

Thoughtful perspectives, not hype

We develop and share real opinions based on our research and experience. We recognize significant trends and changes—like AI's potential—without feeding hype cycles. We offer practical tools to help readers navigate uncertainty. We aren't entirely neutral, of course. We have our own views and stances on things. But those views are earned through investigation, not adopted for engagement and social media vanity metrics.

Clear and not too clever

Every sentence should serve the reader's understanding. We favor simple words over complex ones, active voice over passive, concrete examples over abstract theories. If we can explain something in five words instead of fifteen, we do.

Ideas, rigorously tested

Like software, ideas evolve through iteration and feedback. You can prototype a concept in an afternoon, but mature ideas take years of testing, refinement, and exposure to real-world complexity. We share ideas at different stages of development—some are fresh prototypes, others are thoroughly argued and battle-tested. We're transparent about where each idea sits in its lifecycle. Ideas at different stages have value, but readers deserve to know what level of thought they are getting.

What to Avoid

- Academic stuffiness: We're rigorous, not rigid. Avoid unnecessary formality
- Hype and superlatives: Let the ideas speak for themselves
- Assumed expertise: Define terms; don't assume everyone knows what you know
- Unexamined claims: Every assertion should be backed by evidence or clearly marked as speculation
- Walls of text: Break it up; make it scannable
- Engagement-bait hot takes: Don't adopt positions for clicks or controversy. Our views come from investigation, not metrics
- False neutrality: Don't hide behind "some say..." when you have a researched perspective
- Listicle shallowness: "7 Ways to..." rarely does justice to complex topics. Develop ideas properly

Before Publishing

Ask yourself:

- Does this represent our research honestly and accurately?
- Would this be valuable to someone encountering these ideas for the first time?
- Have I cited sources where appropriate?
- Have I signaled the maturity level of this idea? (exploring vs. tested framework)
- Does this connect to our broader knowledge base through wiki-style links?
- Have I taken a clear position, or just described what others think?
- Is my enthusiasm backed by evidence and reasoning?
- Would this make someone excited to learn more, or just informed?
- Is the structure clear and logical?
- Could I cut 20% of the words without losing meaning?

Practical checks:

- Review the frontmatter of your new content (title, author, date, categories, excerpt, status) for accuracy
- Preview your pull request at <pr-branch>.tn-research.pages.dev to catch formatting issues before merging

Detailed Guidelines

:information_source: The sections below provide more specific guidance on style, formatting, and technical content. Use these as reference when you need detailed advice on a particular aspect of writing.

Voice & Tone

- First person plural ("we"): "We" should be the default perspective for articles. It creates a sense of shared exploration and ownership of the research.
  - It's fine to use "I" when talking about personal experiences and opinions, just make sure it's clear who is speaking.
- Take clear positions: State what you think and why. Avoid excessive hedging ("perhaps," "maybe," "it seems")—but be honest about uncertainty when it exists. "We believe X because Y and Z" is stronger than "It seems like X might be true."
- Balance enthusiasm with rigor: Let your excitement about a topic come through, but back it up. "This is fascinating because..." not just "This is amazing!"
- Signal idea maturity: Be explicit about whether you're sharing a fresh thought or a well-tested framework. "We're exploring..." vs. "Our research shows..."
- Avoid hype language: Skip superlatives (revolutionary, game-changing, unprecedented) unless you can truly defend them. Let the ideas demonstrate their significance.
- Use concrete examples: Abstract concepts need real-world grounding. Show, don't just tell.

Structure & Formatting

- Wiki-style linking: Our research site is a web of knowledge. Use [[Note Title]] to link between articles, creating connections between related concepts. Each piece should connect to the broader knowledge base.
- Headers structure arguments: Use h2/h3 hierarchy to guide readers through your reasoning. Headers should preview the argument, not just label topics.
- Develop ideas fully: Resist listicle-style shallowness. One well-argued point beats five superficial ones. Give concepts the space they need.
- Readable paragraphs: Break up dense text (2-4 sentences typically), but let ideas dictate length. Don't sacrifice development for artificial brevity.

Citations & Sources

Our ideas should always be grounded in evidence.

When to cite:

- Primary research or data: Always link to the original study, dataset, or documentation
- Surprising or counterintuitive claims: Back up anything that might make readers skeptical
- Direct quotes or paraphrases: Credit the original author
- Foundational concepts: Link to definitive explanations when introducing complex ideas

When citation isn't necessary:

- Common knowledge in your field: No need to cite that "Python is a programming language"
- Your own original analysis: If you ran the experiment or did the analysis, you're the source
- General observations: "Many developers prefer..." doesn't need a citation if it's widely understood

How to cite:

- Inline links for short citations: Link key phrases naturally: "According to recent research on developer productivity..."
- Footnotes for longer citations or asides: Use footnotes when you need to provide additional context, commentary, or longer bibliographic details that would interrupt the flow[^1]
- Primary sources first: Link directly to the paper, documentation, or data—not to someone else's summary
- Persistent URLs: Use DOIs for academic papers, archived versions for web content when possible
- Multiple sources for contested claims: If experts disagree, acknowledge it and link to multiple perspectives

Footnote syntax in Markdown:

This is a sentence with a footnote reference[^1].

[^1]: This is the footnote text. It can include [links](URL), multiple sentences, and additional context that would clutter the main text. The footnote will appear at the bottom of the page.

You can also use descriptive labels instead of numbers:

The study found significant results[^smith2023].

[^smith2023]: Smith, J. (2023). "Developer Productivity in Remote Teams." Journal of Software Engineering, 45(2), 123-145. https://doi.org/10.1234/example

Claims vs. Speculation:

- Claims require evidence: "Studies show X" needs a link. "X correlates with Y" needs data.
- Mark speculation clearly: Use phrases like "We suspect...", "Our hypothesis is...", "This suggests..." when you're theorizing
- Personal opinion gets labeled: "In our experience..." or "We believe..." signals this is observation, not proven fact
- Express uncertainty Saying "the evidence is mixed" or "this remains an open question" builds trust

Special cases:

- AI-assisted research: If you used AI to help summarize or analyze sources, mention it: "With assistance from Claude, we analyzed..."
- Paywalled content: Link anyway, but note when content requires access: "(paywalled)"
- Personal communications: "In conversation with [Person], they noted..." (link to their website/profile if available)

Example:
Recent studies on remote work productivity show mixed results, with some teams reporting gains while others experience challenges. The difference often comes down to communication practices rather than technology choices. We suspect—though this hasn't been rigorously tested—that team size also plays a role.

AI Attribution

:robot_face: We believe in transparency about AI's role in our content creation. Every piece of content includes an attribution field in the frontmatter to clearly communicate how AI was involved.

Attribution categories:

- Human Written: Content created entirely by human effort without AI assistance
- AI Supported: Content created through human-AI collaboration (the most common category)
- AI Generated: Content primarily created by AI with minimal human intervention

In the frontmatter:

---

layout: post
title: "Your Article Title"
author: "Author Name"
date: 2024-03-15
attribution: "AI Supported"

---

Our philosophy:

- We recognize AI as a tool, similar to an IDE, spell-checker, or research assistant
- We acknowledge the complexity of quantifying AI's contribution
- We prioritize transparency over precision in attribution
- We're developing this policy iteratively as the technology and our understanding evolve

When to use each category:

- Human Written: You wrote every word yourself, perhaps with spell-check or grammar tools
- AI Supported: You used AI to help research, draft, edit, or refine your writing (most collaborative work)
- AI Generated: AI created the bulk of the content with minimal human editing

For our complete policy, including philosophical considerations and moral concerns, see our AI Attribution Policy.

Linking Strategy

Use links to create pathways for deeper exploration of our web of knowledge without cluttering your main narrative.

Internal links (wiki-style):

- Use double brackets: [[Note Title]] links to other notes in your knowledge base
- Link liberally: Connect related concepts, previous articles, and foundational ideas
- Make links contextual: The link text should make sense even if you can't click it
  - Good: "See our previous analysis of [[Remote Work Productivity]]"
  - Bad: "Click [[here]]" or "See [[this note]]"
- Create bidirectional connections: When you reference an old note, consider updating that note to link back

External links:

- Link to primary sources: Original research, official documentation, canonical references
- Open in context: Inline links keep readers in your article; consider context before using "open in new tab"
- Use descriptive anchor text: Help readers know what they're clicking
  - Good: “Django's official documentation on migrations"
  - Bad: “Link" or "Click here"
- Check link validity: Broken links erode trust. Use link checkers or archived versions when appropriate

Link density:

- 3-5 links per paragraph is typical for research content
- Too many links can be overwhelming; prioritize the most valuable references
- Too few links makes readers question your sources

When to use footnotes vs. inline links:

- Inline: Short, direct references that support the main point
- Footnote: Tangential information, longer citations, or "for the curious" asides

Link maintenance:

- Use archive.org or perma.cc for web content that might disappear
- For papers, prefer DOI links (e.g., https://doi.org/10.1234/example) over journal URLs
- Note when links are paywalled: ([paywalled](URL))

Examples:

✅ Good linking:

The [[Zettelkasten Method]] has gained popularity among researchers and writers. Sönke Ahrens describes it as a thinking tool, not just storage, emphasizing that connections between notes matter more than individual notes themselves.

❌ Poor linking:

The Zettelkasten Method has gained popularity. Click here to learn more about it. Also see this and this other thing.

Visual Elements

Visual content on our research site should enhance the meaning of the article, not simply decorate it. We don't use meaningless stock or AI generated images as window dressing. This goes for both images within an article and banner images that appear in social media unfurls.
:thinking_face: When in doubt, prefer text over an image, unless the image truly expresses something that text alone cannot!

When to use visuals:

- Screenshots: Demonstrate UI, show step-by-step processes, or highlight specific features
- Charts/graphs: Present data, trends, or comparisons
- Concept diagrams: Illustrate abstract ideas, mental models, or processes

Image guidelines:

- Captions add context: Explain what readers should notice: "Figure 1: The spike in latency corresponds to the cache invalidation"
- High contrast and clarity: Ensure text in images is readable; avoid low-contrast color schemes
- Consistent style: Use similar visual styles within an article

File formats:

- PNG for screenshots and diagrams with text
- JPG for photos
- SVG for diagrams when Mermaid isn't suitable
- Optimize all images before publishing

Screenshots:

- Crop tightly: Show only what's relevant
- Highlight key areas: Use boxes, arrows, or annotations to direct attention
- Privacy: Redact any sensitive information (API keys, emails, personal data)

Charts/graphs:

- Clear axes, titles, and labels: Every chart should be self-explanatory
- Caption with interpretation: Explain to readers what the chart means
- Honest visualization: Start Y-axis at zero unless you have good reason (and explain why)
- Accessible colors: Use colorblind-friendly palettes; don't rely on color alone to convey information

Diagrams:

- Mermaid syntax can be used for flowcharts, sequence diagrams, and architecture diagrams (support will be added to the site)
- Keep diagrams focused—split complex systems into multiple simpler diagrams
- Label clearly; use arrows and flow direction intentionally
- For now, diagrams can be created as images and embedded, or included as Mermaid code blocks for future rendering

Terminology & Jargon

Technical precision is important, but we must make make sure that the average reader can understand us and benefit from our writing.

Introducing technical terms:

- Define on first use: The first time you use a technical term, explain it briefly
  - Good: "We used a directed acyclic graph (DAG)—a data structure with no circular dependencies—to model the workflow"
  - Don't assume readers know every acronym or concept
- Link to canonical definitions: For complex concepts, link to authoritative explanations

When to use jargon:

- Your audience knows it: If writing for developers, "API endpoint" needs no explanation
- No simpler alternative exists: Some technical terms are the clearest way to communicate
- Precision matters: "Idempotent" means something specific that "safe to repeat" doesn't fully capture

When to avoid jargon:

- Simpler words work just as well: "Use" instead of "utilize," "end" instead of "terminate"
- You're excluding readers unnecessarily: If a concept can be explained in plain language, do it
- Jargon stacking: Don't pile multiple technical terms in one sentence without explanation

Consistency:

- Pick one term and stick with it: Don't alternate between "function," "method," and "procedure" for the same concept
- Use industry-standard terminology: Call it "React" not "React.js" (unless context demands precision)
- Create a project glossary if you find yourself using the same specialized terms repeatedly

Acronyms:

- Spell out on first use: "Artificial Intelligence (AI)" then "AI" thereafter
- Exception for universally known terms: HTTP, URL, API don't need spelling out in technical content
- Avoid alphabet soup: Don't write sentences like "The SLA for the API's CRUD operations via REST..."

Code & Technical Content

Present technical content with appropriate context so readers can grasp both what the code does and why it matters.

Inline code vs. code blocks:

- Inline code (backticks): Use for variable names, function calls, file paths, and short commands within sentences
  - Example: "The getUserData() function returns a Promise<User> object"
- Code blocks (triple backticks): Use for multi-line examples, complete functions, or anything requiring syntax highlighting
  - Always specify the language: `python or `javascript

Before showing code:

- Set the context: What problem does this solve? What's the before-state?
- State your assumptions: Required dependencies, environment, or prior setup
- Explain the approach: Give readers the mental model before the implementation

In the code itself:

- Comments explain why, not what: Good: // Cache to avoid expensive API calls. Bad: // Set x to 5
- Keep examples focused: Show the relevant parts. Use ... or comments to indicate omitted boilerplate
- Real code over pseudocode: When possible, show working code readers can actually run

After the code:

- Highlight key points: What should readers notice? What's clever or unusual?
- Note limitations: What doesn't this handle? When would you need a different approach?
- Link to full implementation: If you've condensed for clarity, provide the complete version

Language-specific formatting:

- Python: Follow PEP 8; prefer descriptive names over brevity
- JavaScript/TypeScript: Use modern ES6+ syntax; indicate if Node.js or browser
- Shell/Bash: Include $ prompt if showing commands; use #!/bin/bash if showing scripts
- SQL: Uppercase keywords, use clear table/column names

Examples:

❌ Don't do this:

def f(x):
return x \* 2

✅ Do this:

def calculate_processing_time(base_time_seconds):
"""
Estimates total processing time accounting for setup overhead.
In practice, setup typically doubles the base processing time.
"""
return base_time_seconds \* 2

Working examples:

- Prefer complete, runnable code when feasible
- If posting snippets, note what's needed to run them: "This assumes you've already imported requests and set API_KEY"
- Consider linking to a full working example in a gist or repository
