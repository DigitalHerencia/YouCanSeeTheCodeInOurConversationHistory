---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\setup-typescript.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\setup-typescript.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-evals.references.setup-typescript.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\setup-typescript.md'
source_file: 'setup-typescript.md'
source_sha256: '8425b5b2c12c7f7d19696431c5eee4dc2566fd74d123f789484b297a3b026d77'
generated: true
---

# `setup-typescript.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\setup-typescript.md`
> SHA-256: `8425b5b2c12c7f7d19696431c5eee4dc2566fd74d123f789484b297a3b026d77`

````markdown
# Setup: TypeScript

Packages required for Phoenix evals and experiments.

## Installation

```bash
# Using npm
npm install @arizeai/phoenix-client @arizeai/phoenix-evals @arizeai/phoenix-otel

# Using pnpm
pnpm add @arizeai/phoenix-client @arizeai/phoenix-evals @arizeai/phoenix-otel
```

## LLM Providers

For LLM-as-judge evaluators, install Vercel AI SDK providers:

```bash
npm install ai @ai-sdk/openai      # Vercel AI SDK + OpenAI
npm install @ai-sdk/anthropic      # Anthropic
npm install @ai-sdk/google         # Google
```

Or use direct provider SDKs:

```bash
npm install openai                 # OpenAI direct
npm install @anthropic-ai/sdk      # Anthropic direct
```

## Quick Verify

```typescript
import { createClient } from "@arizeai/phoenix-client";
import { createClassificationEvaluator } from "@arizeai/phoenix-evals";
import { registerPhoenix } from "@arizeai/phoenix-otel";

// All imports should work
console.log("Phoenix TypeScript setup complete");
```

````