---
layout: project
title: "AI Search with LLM Embeddings"
subtitle: "Semantic search with vector embeddings"
date: 2023-09-07
status: archived
banner_image: "https://placehold.co/800x600/d1c4e9/5e35b1?text=AI+Search"
description: "Prototype application demonstrating semantic search capabilities using natural language, enabling job description matching through vector embeddings and PostgreSQL with pgvector."
technologies:
  - Python
  - Django
  - PostgreSQL
  - pgvector
  - OpenAI Embeddings
  - Semantic Search
  - AI/ML
github_url: "https://github.com/thinknimble/embeddings-search-demo"
tags:
  - ai
  - embeddings
  - search
  - django
  - pgvector
  - demo
---

## Overview

AI Search with LLM Embeddings is a prototype application that showcases the power of semantic search using vector embeddings. It enables users to search job descriptions using natural language queries, demonstrating how AI-powered search can understand intent and context rather than just matching keywords.

## Video Tutorials

### Quick Introduction

<div class="youtube-embed">
  <iframe width="100%" height="100%" src="https://www.youtube.com/embed/ZCPUmC37HLU" title="AI Search with LLM Embeddings - Quick Intro" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

Watch this short introduction to get a quick overview of the AI search capabilities and see the demo in action.

### Deep Dive Tutorial

<div class="youtube-embed">
  <iframe width="100%" height="100%" src="https://www.youtube.com/embed/OPy4dLHdZng" title="AI Search with LLM Embeddings - Deep Dive Tutorial" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

This comprehensive tutorial walks through the entire implementation, explaining the concepts behind vector embeddings, semantic search, and how to build similar applications.

## Features

- **Semantic Search**: Find relevant job descriptions based on meaning, not just keywords
- **Natural Language Queries**: Search using conversational descriptions of ideal candidates
- **Vector Embeddings**: Utilizes OpenAI embeddings for semantic understanding
- **PostgreSQL Integration**: Leverages pgvector extension for efficient vector similarity search
- **Django Backend**: Built on Django for robust web application framework
- **Real-time Results**: Fast search results with similarity scoring
- **Scalable Architecture**: Designed to handle large datasets efficiently

## How It Works

### 1. Data Ingestion

Job descriptions are processed and converted into vector embeddings using OpenAI's embedding models. These high-dimensional vectors capture the semantic meaning of the text.

### 2. Storage

Embeddings are stored in PostgreSQL using the pgvector extension, which provides efficient indexing and similarity search capabilities for vector data.

### 3. Query Processing

When a user enters a search query:

- The query is converted to an embedding vector
- pgvector performs a similarity search against stored embeddings
- Results are ranked by semantic similarity

### 4. Results

The most semantically similar job descriptions are returned, even if they don't contain the exact keywords from the query.

## Technical Architecture

```
┌─────────────┐     ┌─────────────┐     ┌──────────────┐
│   Frontend  │────▶│   Django    │────▶│  PostgreSQL  │
│    (Web)    │     │   Backend   │     │  + pgvector  │
└─────────────┘     └─────────────┘     └──────────────┘
                            │
                            ▼
                    ┌─────────────┐
                    │  OpenAI API │
                    │ (Embeddings)│
                    └─────────────┘
```

## Contributing

This is a demonstration project designed for learning. We welcome contributions that:

- Improve documentation and tutorials
- Add new search features
- Optimize performance
- Extend to new use cases

Visit our [GitHub repository](https://github.com/thinknimble/embeddings-search-demo) to explore the code and contribute!
