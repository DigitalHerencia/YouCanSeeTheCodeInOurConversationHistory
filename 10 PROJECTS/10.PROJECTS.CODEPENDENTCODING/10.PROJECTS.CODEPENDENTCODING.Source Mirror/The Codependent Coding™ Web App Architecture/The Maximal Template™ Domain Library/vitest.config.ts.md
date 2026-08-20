---
title: 'The Hipster Stack™ Technology Stack\template\vitest.config.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\vitest.config.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.vitest.config.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\vitest.config.ts'
source_file: 'vitest.config.ts'
source_sha256: '833daa5563a101207ea0f5f53501481db66c71a18dbede112ea6a60261c1fde9'
generated: true
---

# `vitest.config.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\vitest.config.ts`
> SHA-256: `833daa5563a101207ea0f5f53501481db66c71a18dbede112ea6a60261c1fde9`

```ts
import { join } from "node:path"
import { defineConfig } from "vitest/config"

export default defineConfig({
  resolve: {
    tsconfigPaths: true,
    alias: {
      "server-only": join(process.cwd(), "tests/helpers/server-only.ts"),
    },
  },
  test: {
    environment: "jsdom",
    globals: true,
    include: ["tests/unit/**/*.test.{ts,tsx}", "tests/contract/**/*.test.{ts,tsx}"],
    setupFiles: ["./vitest.setup.ts"],
    coverage: {
      provider: "v8",
      reporter: ["text", "json", "html"],
    },
  },
})

```