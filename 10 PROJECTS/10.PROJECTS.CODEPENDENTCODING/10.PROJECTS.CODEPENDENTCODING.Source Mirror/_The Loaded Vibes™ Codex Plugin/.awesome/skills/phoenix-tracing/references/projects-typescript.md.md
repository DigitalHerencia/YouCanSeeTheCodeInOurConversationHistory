---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\projects-typescript.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\projects-typescript.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-tracing.references.projects-typescript.md'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-loaded-vibes-codex-plugin
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\projects-typescript.md'
source_file: 'projects-typescript.md'
source_sha256: '506d8ca4e7b8f2a161e7083ce2e5f8605453af02ca81055ba193b7e184a4d2e9'
generated: true
---

# `projects-typescript.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\projects-typescript.md`
> SHA-256: `506d8ca4e7b8f2a161e7083ce2e5f8605453af02ca81055ba193b7e184a4d2e9`

````markdown
# Phoenix Tracing: Projects (TypeScript)

**Organize traces by application using projects (Phoenix's top-level grouping).**

## Overview

Projects group traces for a single application or experiment.

**Use for:** Environments (dev/staging/prod), A/B testing, versioning

## Setup

### Environment Variable (Recommended)

```bash
export PHOENIX_PROJECT_NAME="my-app-prod"
```

```typescript
process.env.PHOENIX_PROJECT_NAME = "my-app-prod";
import { register } from "@arizeai/phoenix-otel";
register();  // Uses "my-app-prod"
```

### Code

```typescript
import { register } from "@arizeai/phoenix-otel";
register({ projectName: "my-app-prod" });
```

## Use Cases

**Environments:**
```typescript
// Dev, staging, prod
register({ projectName: "my-app-dev" });
register({ projectName: "my-app-staging" });
register({ projectName: "my-app-prod" });
```

**A/B Testing:**
```typescript
// Compare models
register({ projectName: "chatbot-gpt4" });
register({ projectName: "chatbot-claude" });
```

**Versioning:**
```typescript
// Track versions
register({ projectName: "my-app-v1" });
register({ projectName: "my-app-v2" });
```

````