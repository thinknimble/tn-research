# ThinkNimble Research Institute

This is the Jekyll-based static site for the ThinkNimble Research Institute, hosted at [research.thinknimble.com](https://research.thinknimble.com).

## Overview

The ThinkNimble Research Institute website serves as a platform for publishing research papers, technical reports, and blog posts related to our work in technology, software engineering, and human-computer interaction.

## Technology Stack

- **Jekyll** - Static site generator
- **GitHub Pages** - Hosting
- **CloudFlare** - DNS and CDN

## Local Development

### Prerequisites

- Ruby (2.7 or higher)
- Bundler
- Jekyll

### Setup

1. Clone the repository:

```bash
git clone https://github.com/thinknimble/tn-research.git
cd tn-research
```

2. Install dependencies:

```bash
bundle install
```

3. Run the development server:

```bash
bundle exec jekyll serve
```

4. Open your browser to `http://localhost:4000`

## Content Structure

### Publications

Research publications are stored in the `_publications/` directory. Each publication should be a Markdown file with the following front matter:

```yaml
---
layout: publication
title: "Your Publication Title"
date: 2024-01-01
authors:
  - Author One
  - Author Two
abstract: "Brief description of the publication"
pdf_url: "/path/to/pdf" # optional
arxiv_url: "https://arxiv.org/..." # optional
doi: "10.xxxx/xxxxx" # optional
---
```

### Blog Posts

Blog posts are stored in the `_posts/` directory following Jekyll's naming convention:
`YYYY-MM-DD-post-title.md`

## Deployment

The site is automatically deployed to GitHub Pages when changes are pushed to the `main` branch. CloudFlare handles DNS routing from research.thinknimble.com to the GitHub Pages site.

## Development Resources

### Placeholder Image Services

For development and prototyping, these services can generate placeholder images:

- **placehold.co** - Simple colored placeholders with text: `https://placehold.co/800x600/2E7D32/81C784?text=Text+Here`
- **placeholders.io** - Abstract geometric patterns: `https://placeholders.io/800/600/abstract%20geometric?seed=12345` (requires numeric seed)
- **picsum.photos** - Random photos: `https://picsum.photos/seed/yourtext/800/600`

## Future Features

### Backlinks System

A bidirectional linking system for essays and notes that would automatically display "References to this page" showing all other pages that link to the current content. This would help create a knowledge graph where ideas are interconnected.

**Implementation Notes:**

- Requires generating a `/search-index.json` file during Jekyll build
- Would scan all content for internal links and create reverse references
- Useful for building a digital garden with interconnected ideas
- Similar to backlinks in tools like Obsidian or Roam Research

To implement:

1. Create a Jekyll plugin to generate the search index at build time
2. Add the backlinks sections back to `_layouts/essay.html` and `_layouts/note.html`
3. Include JavaScript to fetch and display the backlinks

## Contributing

For ThinkNimble team members:

1. Create a feature branch
2. Make your changes
3. Submit a pull request for review

## License

Copyright © ThinkNimble. All rights reserved.

## Contact

For questions about the website or research inquiries:

- Email: hello@thinknimble.com
- GitHub: [github.com/thinknimble](https://github.com/thinknimble)
