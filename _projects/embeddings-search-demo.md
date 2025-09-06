---
layout: project
title: "AI Search with LLM Embeddings"
subtitle: "Semantic search with vector embeddings"
date: 2023-09-07
status: archived
banner_image: "https://placehold.co/800x600/455A64/90A4AE?text=AI+Search"
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

## Installation

```bash
# Clone the repository
git clone https://github.com/thinknimble/embeddings-search-demo.git
cd embeddings-search-demo

# Set up Python environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Set up PostgreSQL with pgvector
# Ensure PostgreSQL is installed with pgvector extension
createdb embeddings_demo
psql -d embeddings_demo -c "CREATE EXTENSION vector;"

# Configure environment variables
cp .env.example .env
# Add your OpenAI API key and database credentials to .env

# Run migrations
python manage.py migrate

# Load sample data (if provided)
python manage.py load_sample_data

# Start the development server
python manage.py runserver
```

## Usage Example

```python
# Example: Search for a candidate
query = "Experienced Python developer with machine learning background and strong communication skills"

# The system will find job descriptions that semantically match this query,
# even if they use different terminology like:
# - "ML engineer with Python expertise"
# - "Data scientist proficient in Python and deep learning"
# - "Software engineer with AI/ML experience"
```

## Key Technologies

### pgvector
PostgreSQL extension that provides vector similarity search capabilities:
- Supports exact and approximate nearest neighbor search
- Efficient indexing with IVFFlat and HNSW
- Integrates seamlessly with existing PostgreSQL features

### OpenAI Embeddings
- Converts text to high-dimensional vectors
- Captures semantic meaning and relationships
- Enables cross-lingual search capabilities

### Django
- Robust web framework for rapid development
- ORM integration with pgvector
- Admin interface for data management

## Use Cases

This demo showcases techniques applicable to:
- **Recruitment Platforms**: Match candidates with job openings
- **Content Discovery**: Find related articles or documents
- **E-commerce**: Semantic product search
- **Knowledge Management**: Enterprise document search
- **Customer Support**: Find relevant support articles
- **Research**: Academic paper discovery

## Learning Resources

This project serves as an educational resource for developers interested in:
- Vector databases and embeddings
- Semantic search implementation
- PostgreSQL pgvector extension
- Building AI-powered search applications
- Django integration with ML features

## Performance Considerations

- **Embedding Generation**: Cached to avoid redundant API calls
- **Index Selection**: Uses appropriate pgvector indexes for dataset size
- **Batch Processing**: Processes embeddings in batches for efficiency
- **Query Optimization**: Implements pagination and result limiting

## Future Enhancements

Potential areas for expansion:
- Multi-modal search (text + images)
- Fine-tuned embeddings for domain-specific accuracy
- Hybrid search combining semantic and keyword matching
- Real-time embedding updates
- Advanced filtering and faceted search

## Contributing

This is a demonstration project designed for learning. We welcome contributions that:
- Improve documentation and tutorials
- Add new search features
- Optimize performance
- Extend to new use cases

Visit our GitHub repository to explore the code and contribute!