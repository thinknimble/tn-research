# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

ThinkNimble Research Institute website - a Jekyll-based static site for publishing research papers, technical reports, and blog posts. Hosted on GitHub Pages at research.thinknimble.com.

## Available Sub-Agents

### Project-Specific Agents

#### research-note-generator
**Location:** `.claude/agents/research-note-generator.md`

Use this agent to create concise research notes from web links. The agent will:
- Fetch and analyze web content
- Extract key arguments and insights
- Generate a properly formatted Jekyll note with front matter
- Create wiki-style links to related concepts
- Suggest appropriate tags for discoverability

Example usage: When you find an interesting article, paper, or blog post that should be added to the research knowledge base.

#### writing-style-reviewer
**Location:** `.claude/agents/writing-style-reviewer.md`

Use this agent to review markdown content against ThinkNimble Research writing style guidelines. The agent provides:
- Critical but constructive feedback on writing quality
- Specific suggestions for improvement with examples
- Checks for citation quality, clarity, and audience accessibility
- Focus on substance over grammar/spelling

This agent is also used automatically in GitHub Actions to review PRs that modify notes, essays, or posts.

Example usage: When reviewing draft content before publishing, or when you want feedback on how well a piece adheres to our style guidelines.

### Global Agents (Available Across All Projects)

#### git-commit-pr-manager
**Location:** `~/.claude/agents/git-commit-pr-manager.md`

Use for creating git commits and pull request descriptions. See global CLAUDE.md for details.

## Development Commands

The project uses [Just](https://github.com/casey/just) for task management and Docker for containerized development.

### Docker Development (Recommended)

```bash
# Start development server (with live reload on port 4001)
just up

# Stop Docker containers
just down

# Build Docker image
just build

# Clean all artifacts and Docker resources
just reset
```

To run with drafts enabled:
```bash
JEKYLL_DRAFTS=true just up
```

### Content Creation

```bash
# Create a new note
just new-note "Your Note Title"

# Create a new essay
just new-essay "Your Essay Title"

# Create a new project
just new-project "Your Project Title"
```

These commands will create properly formatted markdown files with all required frontmatter fields.

### Utilities

```bash
# Check for broken links
just check-links
```

**IMPORTANT**: The user will ALWAYS run build and serve commands themselves. Never execute these commands - just make the code changes and the user will handle building and serving.

## Architecture and Key Components

### Content Types and Collections

The site uses Jekyll collections for different content types:

- **`_posts/`**: Blog posts (Jekyll convention: `YYYY-MM-DD-title.md`)
- **`_essays/`**: Long-form essays and research discussions
- **`_notes/`**: Knowledge base entries with wiki-style linking
- **`_publications/`**: Formal research publications

### Custom Features

1. **Wiki-style Links**: The `_plugins/wiki_links.rb` plugin converts `[[Note Title]]` syntax to proper links between notes and essays.

2. **Theme System**: Dark/light mode support implemented in `_includes/theme-system.html` with CSS media queries for automatic switching.

3. **Homepage**: Combined view of posts, essays, and publications sorted by date (see `index.html`).

### Front Matter Requirements

#### Authors
```yaml
---
layout: author
name: "Full Name"
slug: author-slug
bio: "Brief bio/description"
profile_pic: https://url-to-image-or-placeholder
email: email@example.com # optional
twitter: handle # optional
linkedin: profile # optional
github: username # optional
website: https://website.com # optional
---
```

To reference authors in content:
- Essays: Use `authors: ["Author Name"]` in front matter
- The author byline will automatically display with mini avatar and link to author profile

#### Publications
```yaml
---
layout: publication
title: "Title"
date: YYYY-MM-DD
authors:
  - Author Name
abstract: "Brief description"
attribution: [human-written/ai-supported/ai-generated] # required
pdf_url: "/path/to/pdf" # optional
arxiv_url: "https://arxiv.org/..." # optional
doi: "10.xxxx/xxxxx" # optional
---
```

#### Essays
```yaml
---
layout: essay
title: "Title"
date: YYYY-MM-DD
authors: [optional]
abstract: [optional]
attribution: [human-written/ai-supported/ai-generated] # required
status: [draft/published] # optional
related_notes: [note-slug-1, note-slug-2] # optional
---
```

#### Notes
```yaml
---
layout: note
title: "Title"
date: YYYY-MM-DD
tags: [tag1, tag2]
attribution: [human-written/ai-supported/ai-generated] # required
---
```

### CSS Architecture

Main stylesheet: `static/css/style.css`
- Literary serif font stack (Crimson Text, Georgia, etc.)
- Responsive design with mobile-first approach
- Syntax highlighting with Pygments (light) and Dracula (dark) themes
- Custom styles for hero section, article lists, and content types

### Key Layout Files

- `_layouts/default.html`: Base template
- `_layouts/essay.html`: Essay template with backlinks and related notes
- `_layouts/note.html`: Note template with wiki-link support
- `_layouts/post.html`: Blog post template

## Project-Specific Conventions

1. **Attribution Policy**: All content must include an `attribution` field in the front matter with one of three values:
   - `human-written`: Content created entirely by human effort
   - `ai-supported`: Content created through human-AI collaboration
   - `ai-generated`: Content primarily created by AI with minimal human intervention
   
   Attribution badges are displayed on all content and link to the attribution policy note. When building upon existing work, always credit original authors (see CONTRIBUTING.md).

2. **Content Focus**: Research papers, technical insights, and educational content related to technology, software engineering, and HCI.

3. **Wiki Links**: Use `[[Note Title]]` syntax in notes and essays to create connections between content.

4. **Status Badges**: Essays can have status indicators (draft/published) via the `status` front matter field.

5. **Homepage Hero**: Full viewport height section with centered content (recently updated to `min-height: 100vh`).

## GitHub Pages Deployment

The site automatically deploys to GitHub Pages when changes are pushed to the main branch. CloudFlare handles DNS routing from research.thinknimble.com.

## Licensing

- **Code**: Apache License 2.0
- **Content**: Creative Commons Attribution 4.0 International (CC BY 4.0)