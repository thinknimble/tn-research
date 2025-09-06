---
layout: project
title: "TN Forms"
subtitle: "Type-safe form management for TypeScript"
date: 2021-11-01
end_date: present
status: active
banner_image: "https://placehold.co/800x600/C62828/EF5350?text=TN+Forms"
description: "A powerful TypeScript library for building and managing forms with full type safety, validation, and state management."
technologies:
  - TypeScript
  - JavaScript
  - React
  - Vue.js
  - Form Validation
github_url: "https://github.com/thinknimble/tn-forms"
tags:
  - forms
  - validation
  - typescript
  - frontend
  - library
---

## Overview

TN Forms is a TypeScript-first form library that provides robust form handling with complete type safety. It offers a flexible API for building complex forms while maintaining simplicity for basic use cases.

## Features

- **Full Type Safety**: Leverage TypeScript's type system for compile-time form validation
- **Framework Agnostic**: Works with React, Vue, or vanilla JavaScript
- **Built-in Validation**: Comprehensive validation rules with custom validator support
- **State Management**: Efficient form state handling with minimal re-renders
- **Field Arrays**: Support for dynamic form fields and nested structures
- **Error Handling**: Intelligent error display and field-level error management
- **Async Validation**: Support for server-side validation and async validators

## Installation

```bash
# npm
npm install @thinknimble/tn-forms

# yarn
yarn add @thinknimble/tn-forms

# pnpm
pnpm add @thinknimble/tn-forms
```

## Basic Usage

```typescript
import { createForm } from '@thinknimble/tn-forms';

const form = createForm({
  email: {
    value: '',
    validators: ['required', 'email']
  },
  password: {
    value: '',
    validators: ['required', 'minLength:8']
  }
});

// Full type safety
form.fields.email.value = 'user@example.com';
form.validate();
```

## Key Concepts

### Type-Safe Forms
Every form field is fully typed, providing autocomplete and compile-time checking for field names, values, and validation rules.

### Validation Pipeline
A flexible validation system that supports:
- Built-in validators (required, email, min/max, patterns)
- Custom validators with full type inference
- Async validation for server-side checks
- Cross-field validation and dependencies

### State Management
Efficient state updates with:
- Minimal re-renders in React/Vue
- Dirty state tracking
- Touch state for better UX
- Form-level and field-level error states

## Framework Integration

### React
```typescript
import { useForm } from '@thinknimble/tn-forms/react';

function MyForm() {
  const form = useForm({
    // form config
  });
  
  return (
    <form onSubmit={form.handleSubmit}>
      {/* form fields */}
    </form>
  );
}
```

### Vue
```typescript
import { useForm } from '@thinknimble/tn-forms/vue';

export default {
  setup() {
    const form = useForm({
      // form config
    });
    
    return { form };
  }
}
```

## Use Cases

- Complex multi-step forms
- Dynamic form generation
- Form builders
- Survey applications
- Data entry systems
- User registration and authentication flows

## Contributing

TN Forms is open source and welcomes contributions. Visit our GitHub repository to report issues or submit pull requests.