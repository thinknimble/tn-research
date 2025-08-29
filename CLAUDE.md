# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

ThinkNimble Research Institute website - a Jekyll-based static site for publishing research papers, technical reports, and blog posts. Hosted on GitHub Pages at research.thinknimble.com.

## Development Commands

### Building and Running
```bash
# Install dependencies
bundle install

# Run development server
bundle exec jekyll serve

# Build site
bundle exec jekyll build
```

**IMPORTANT**: The user will ALWAYS run build and serve commands themselves. Never execute `bundle exec jekyll build` or `bundle exec jekyll serve` - just make the code changes and the user will handle building and serving.

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

#### Publications
```yaml
---
layout: publication
title: "Title"
date: YYYY-MM-DD
authors:
  - Author Name
abstract: "Brief description"
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

1. **Attribution**: When building upon existing work, always credit original authors (see CONTRIBUTING.md).

2. **Content Focus**: Research papers, technical insights, and educational content related to technology, software engineering, and HCI.

3. **Wiki Links**: Use `[[Note Title]]` syntax in notes and essays to create connections between content.

4. **Status Badges**: Essays can have status indicators (draft/published) via the `status` front matter field.

5. **Homepage Hero**: Full viewport height section with centered content (recently updated to `min-height: 100vh`).

## GitHub Pages Deployment

The site automatically deploys to GitHub Pages when changes are pushed to the main branch. CloudFlare handles DNS routing from research.thinknimble.com.

## Licensing

- **Code**: Apache License 2.0
- **Content**: Creative Commons Attribution 4.0 International (CC BY 4.0)