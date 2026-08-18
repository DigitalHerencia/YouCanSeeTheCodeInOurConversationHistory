---
title: 'The Hipster Stack™ Technology Stack\vitest.config.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\vitest.config.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.vitest.config.ts'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-hipster-stack-technology-stack
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Hipster Stack™ Technology Stack\vitest.config.ts'
source_file: 'vitest.config.ts'
source_sha256: '7fdf72900ed7ada39ee27ff182d8671c21cfdc035930243aa076e70bd0f1843e'
generated: true
---

# `vitest.config.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\vitest.config.ts`
> SHA-256: `7fdf72900ed7ada39ee27ff182d8671c21cfdc035930243aa076e70bd0f1843e`

```ts
import { defineConfig } from 'vitest/config';

export default defineConfig({
  test: {
    include: ['tests/**/*.test.ts'],
    exclude: ['template/**', 'node_modules/**', 'dist/**'],
    testTimeout: 15_000,
  },
});

```