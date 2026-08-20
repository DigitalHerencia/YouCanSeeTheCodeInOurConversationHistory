---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\nodejs-javascript-vitest.instructions.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\nodejs-javascript-vitest.instructions.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.instructions.nodejs-javascript-vitest.instructions.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\nodejs-javascript-vitest.instructions.md'
source_file: 'nodejs-javascript-vitest.instructions.md'
source_sha256: '013f3c0727d7f62d3f8a954c9d0ffec1f4dd2849a28b515b81ebc1685394bd49'
generated: true
---

# `nodejs-javascript-vitest.instructions.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\instructions\nodejs-javascript-vitest.instructions.md`
> SHA-256: `013f3c0727d7f62d3f8a954c9d0ffec1f4dd2849a28b515b81ebc1685394bd49`

```markdown
---
description: "Guidelines for writing Node.js and JavaScript code with Vitest testing"
applyTo: '**/*.js, **/*.mjs, **/*.cjs'
---

# Code Generation Guidelines

## Coding standards
- Use JavaScript with ES2022 features and Node.js (20+) ESM modules
- Use Node.js built-in modules and avoid external dependencies where possible
- Ask the user if you require any additional dependencies before adding them
- Always use async/await for asynchronous code, and use 'node:util' promisify function to avoid callbacks
- Keep the code simple and maintainable
- Use descriptive variable and function names
- Do not add comments unless absolutely necessary, the code should be self-explanatory
- Never use `null`, always use `undefined` for optional values
- Prefer functions over classes

## Testing
- Use Vitest for testing
- Write tests for all new features and bug fixes
- Ensure tests cover edge cases and error handling
- NEVER change the original code to make it easier to test, instead, write tests that cover the original code as it is

## Documentation
- When adding new features or making significant changes, update the README.md file where necessary

## User interactions
- Ask questions if you are unsure about the implementation details, design choices, or need clarification on the requirements
- Always answer in the same language as the question, but use english for the generated content like code, comments or docs

```