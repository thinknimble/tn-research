---
layout: project
title: "The Bootstrapper"
subtitle: "Production-ready Django SPA starter"
date: 2019-07-01
end_date: present
status: active
banner_image: "https://placehold.co/800x600/E65100/FFB74D?text=The+Bootstrapper"
description: "A production-ready Django SPA app on Heroku in 20 minutes or less! Complete cookiecutter template for building modern single-page applications with Django backend and React frontend."
# image: /static/images/projects/tn-spa-bootstrapper.jpg
technologies:
  - Django
  - Python
  - React
  - TypeScript
  - PostgreSQL
  - Heroku
  - Docker
  - uv
github_url: "https://github.com/thinknimble/tn-spa-bootstrapper"
legacy_github_url: "https://github.com/thinknimble/tn-bootstrapper"
website_url: "https://tn-spa-bootstrapper-staging.herokuapp.com/"
tags:
  - bootstrapping
  - django
  - cookiecutter
  - starter-template
---

## Overview

TN SPA Bootstrapper is a comprehensive cookiecutter template that helps you create production-ready Django single-page applications in minutes. Built with modern Python packaging (uv) and React, it provides a complete foundation with authentication, API setup, and deployment configuration.

## Current Version Features

The current bootstrapper (tn-spa-bootstrapper) includes:

- **Django 4.2+** with Django REST Framework
- **Python 3.12** by default with uv package manager
- **React with TypeScript** frontend
- **100% starting test coverage**
- **Secure by default** with SSL everywhere
- **Custom user model** ready to go
- **Optional ASGI/Channels** setup for WebSockets
- **Cloud Ready**: Amazon S3 or Google Cloud Storage for media
- **Email Integration**: Mailgun (default) or Amazon SES
- **Error Logging**: Rollbar integration
- **Pre-commit hooks** for code quality
- **Heroku Deployment** with Procfile included

## Quick Start

### Using TN CLI (Recommended)

If you have [TN CLI](/projects/tn-cli/) installed, you can bootstrap a new project with:

```bash
# Bootstrap a new Django SPA project
tn new-project
# or use the alias:
tn bootstrap

# Follow the interactive prompts
```

The TN CLI will use uvx (from the uv package manager) to run cookiecutter. If you don't have uv installed, run `tn install-uv` first.

### Using pipx

Alternatively, you can use pipx directly:

```bash
# Install pipx if you don't have it
# See: https://pipx.pypa.io/stable/installation/

# Install and run cookiecutter
pipx install cookiecutter
pipx run cookiecutter gh:thinknimble/tn-spa-bootstrapper

# Follow the prompts to configure your project
```

## Technology Stack

### Backend

- Django 4.2+ with Django REST Framework
- PostgreSQL database
- Custom user model with authentication
- Optional WebSocket support via Django Channels

### Frontend

- React with TypeScript
- Modern build tooling
- Production-optimized configuration

### DevOps & Tools

- Heroku deployment ready
- Docker support for development
- Pre-commit hooks for code quality
- Choice of unittest or pytest
- Optional Whitenoise for static files

## Use Cases

Perfect for:

- Rapid prototyping of web applications
- Starting new SaaS projects
- Building internal tools
- Creating client projects with consistent structure
- Learning modern full-stack development patterns

## Contributing

We welcome contributions! Please check out our GitHub repository for issues and pull request guidelines.
