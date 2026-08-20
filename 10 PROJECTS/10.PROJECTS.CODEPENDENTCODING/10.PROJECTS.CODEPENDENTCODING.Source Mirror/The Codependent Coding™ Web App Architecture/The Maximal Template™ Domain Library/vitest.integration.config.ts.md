---
title: 'The Hipster Stack™ Technology Stack\template\vitest.integration.config.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\vitest.integration.config.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.vitest.integration.config.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\vitest.integration.config.ts'
source_file: 'vitest.integration.config.ts'
source_sha256: 'aaa3718e92462b4e174c7d6453244fc571009cc36b0b4fb78850767a05f38226'
generated: true
---

# `vitest.integration.config.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\vitest.integration.config.ts`
> SHA-256: `aaa3718e92462b4e174c7d6453244fc571009cc36b0b4fb78850767a05f38226`

```ts
import { defineConfig } from "vitest/config"
import { join } from "node:path"

export default defineConfig({
  resolve: {
    tsconfigPaths: true,
    alias: {
      "server-only": join(process.cwd(), "tests/helpers/server-only.ts"),
    },
  },
  test: {
    environment: "node",
    globals: true,
    include: ["tests/integration/**/*.test.ts"],
  },
})

```