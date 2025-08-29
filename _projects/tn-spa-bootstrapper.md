---
layout: project
title: "The Bootstrapper"
subtitle: "Production-ready Django SPA starter"
date: 2021-08-23
status: active
description: "A production-ready app on Heroku in 20 minutes or less! Complete starter template for building modern single-page applications with Django backend."
# image: /static/images/projects/tn-spa-bootstrapper.jpg
technologies:
  - TypeScript
  - Django
  - Python
  - Vue.js
  - React
  - PostgreSQL
  - Heroku
github_url: "https://github.com/thinknimble/tn-spa-bootstrapper"
website_url: "https://tn-spa-bootstrapper-staging.herokuapp.com/"
tags:
  - bootstrapping
  - django
  - cookiecutter
  - starter-template
---

## Overview

TN SPA Bootstrapper is a comprehensive cookiecutter template that helps you create production-ready Django single-page applications in minutes. It provides a complete foundation with authentication, API setup, frontend framework integration, and deployment configuration.

## Features

- **Full-Stack Setup**: Pre-configured Django backend with your choice of Vue.js or React frontend
- **Authentication Ready**: JWT authentication and user management out of the box
- **API First**: RESTful API structure with Django REST Framework
- **Database Ready**: PostgreSQL configuration for development and production
- **Deployment Configured**: One-click deployment to Heroku with all necessary configurations
- **Development Tools**: Hot reloading, linting, and testing setup included
- **TypeScript Support**: Full TypeScript configuration for type-safe frontend development

## Quick Start

```bash
# Install cookiecutter if you haven't already
pip install cookiecutter

# Generate your project
cookiecutter gh:thinknimble/tn-spa-bootstrapper

# Follow the prompts to configure your project
```

## Technology Stack

### Backend

- Django 4.x with Django REST Framework
- PostgreSQL database
- JWT authentication
- Celery for async tasks (optional)

### Frontend Options

- Vue.js 3 with Composition API
- React 18 with hooks
- TypeScript for type safety
- Tailwind CSS for styling
- Vite for fast builds

### DevOps

- Docker support for containerized development
- Heroku deployment configuration
- GitHub Actions CI/CD templates
- Environment-based configuration

## Use Cases

Perfect for:

- Rapid prototyping of web applications
- Starting new SaaS projects
- Building internal tools
- Creating client projects with consistent structure
- Learning modern full-stack development patterns

## Contributing

We welcome contributions! Please check out our GitHub repository for issues and pull request guidelines.
