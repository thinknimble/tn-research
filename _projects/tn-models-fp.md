---
layout: project
title: "TN Models"
subtitle: "Frontend API model service builder"
date: 2021-10-01
end_date: present
status: active
banner_image: "https://placehold.co/800x600/00695C/4DB6AC?text=TN+Models"
description: "A library for creating API models that mirror a RESTful backend. Handles serialization, and data transformation with type safety."
technologies:
  - TypeScript
  - JavaScript
  - Functional Programming
  - API Integration
  - fp-ts
github_url: "https://github.com/thinknimble/tn-models-fp"
tags:
  - models
  - api
  - functional-programming
  - typescript
  - data-layer
---

## Overview

TN Models FP is a TypeScript library that brings functional programming principles to API model management. It provides a type-safe, composable approach to handling data serialization, deserialization, and transformation between your frontend and backend.

## Features

- **Functional Approach**: Built on fp-ts for robust functional programming patterns
- **Type Safety**: Full TypeScript support with advanced type inference
- **API Integration**: Seamless integration with REST and GraphQL APIs
- **Data Transformation**: Powerful pipelines for data transformation
- **Immutable by Default**: Encourages immutable data patterns
- **Serialization**: Automatic camelCase/snake_case conversion
- **Validation**: Built-in validation with functional error handling
- **Composable**: Small, composable functions that work together

## Installation

```bash
# npm
npm install @thinknimble/tn-models-fp

# yarn
yarn add @thinknimble/tn-models-fp

# pnpm
pnpm add @thinknimble/tn-models-fp
```

## Core Concepts

### Models as Functions

Models are defined as pure functions that transform and validate data:

```typescript
import { model, field } from "@thinknimble/tn-models-fp";

const UserModel = model({
  id: field.number(),
  email: field.string().email(),
  name: field.string().optional(),
  createdAt: field.date(),
});

// Type is automatically inferred
type User = typeof UserModel._type;
```

### Functional Pipelines

Chain operations using functional composition:

```typescript
import { pipe } from "fp-ts/function";
import { map } from "fp-ts/Either";

const result = pipe(
  apiResponse,
  UserModel.decode,
  map((user) => ({
    ...user,
    displayName: user.name || user.email,
  }))
);
```

### Error Handling

Errors are handled using the Either monad pattern:

```typescript
const decoded = UserModel.decode(data);

if (isRight(decoded)) {
  // Success - decoded.right contains the valid user
  console.log(decoded.right);
} else {
  // Failure - decoded.left contains validation errors
  console.error(decoded.left);
}
```

## API Integration

### REST APIs

```typescript
const api = createApi({
  baseURL: "https://api.example.com",
  models: {
    user: UserModel,
    post: PostModel,
  },
});

// Automatically typed responses
const user = await api.get("/users/1"); // Returns Either<Error, User>
```

### GraphQL Integration

```typescript
const query = gql`
  query GetUser($id: ID!) {
    user(id: $id) {
      id
      email
      name
    }
  }
`;

const result = pipe(
  await client.query({ query, variables: { id: "1" } }),
  UserModel.decode
);
```

## Advanced Features

### Custom Transformers

Create custom field transformers for complex data types:

```typescript
const MoneyField = field.custom({
  decode: (value) => Money.fromCents(value),
  encode: (money) => money.toCents(),
});
```

### Nested Models

Support for complex nested structures:

```typescript
const OrderModel = model({
  id: field.string(),
  items: field.array(OrderItemModel),
  customer: UserModel,
  total: MoneyField,
});
```

## Use Cases

- Building type-safe API clients
- Data validation and transformation layers
- Frontend-backend contract enforcement
- Complex data modeling scenarios
- Functional programming in frontend applications

## Philosophy

TN Models FP embraces functional programming principles to create more predictable, testable, and maintainable code. By treating models as pure functions and errors as values, it eliminates many common runtime errors and makes data flow explicit.

## Contributing

We welcome contributions! Visit our GitHub repository for contribution guidelines and to browse open issues.
