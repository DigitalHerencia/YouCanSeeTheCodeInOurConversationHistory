---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\azure-functions-typescript.instructions.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\azure-functions-typescript.instructions.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.instructions.azure-functions-typescript.instructions.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\azure-functions-typescript.instructions.md'
source_file: 'azure-functions-typescript.instructions.md'
source_sha256: 'eb7a1e987e3a168d03e6227e5b81901e94fab451fb24c97dabe08a8cdd768bba'
generated: true
---

# `azure-functions-typescript.instructions.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\instructions\azure-functions-typescript.instructions.md`
> SHA-256: `eb7a1e987e3a168d03e6227e5b81901e94fab451fb24c97dabe08a8cdd768bba`

```markdown
---
description: 'TypeScript patterns for Azure Functions'
applyTo: '**/*.ts, **/*.js, **/*.json'
---

## Guidance for Code Generation
- Generate modern TypeScript code for Node.js
- Use `async/await` for asynchronous code
- Whenever possible, use Node.js v22 LTS built-in modules instead of external packages
- Always use Node.js async functions, like `node:fs/promises` instead of `fs` to avoid blocking the event loop
- Ask before adding any extra dependencies to the project
- The API is built using Azure Functions using `@azure/functions@4` package.
- Each endpoint should have its own function file, and use the following naming convention: `src/functions/<resource-name>-<http-verb>.ts`
- When making changes to the API, make sure to update the OpenAPI schema (if it exists) and `README.md` file accordingly.

```