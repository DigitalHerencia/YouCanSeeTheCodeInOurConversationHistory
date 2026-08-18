---
title: 'The Hipster Stack™ Technology Stack\tsdown.config.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\tsdown.config.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.tsdown.config.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\tsdown.config.ts'
source_file: 'tsdown.config.ts'
source_sha256: '3289bbeeadc6f3d7248f3f115924c3dd20365b7ba9e04956cc04d12cd392282d'
generated: true
---

# `tsdown.config.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\tsdown.config.ts`
> SHA-256: `3289bbeeadc6f3d7248f3f115924c3dd20365b7ba9e04956cc04d12cd392282d`

```ts
import { defineConfig } from 'tsdown';

export default defineConfig({
  entry: ['packages/cli/src/cli.ts'],
  format: 'esm',
  clean: true,
  dts: false,
  banner: { js: '#!/usr/bin/env node' },
  noExternal: [/^@clack\/prompts$/, /^@hipster-stack\//],
});

```