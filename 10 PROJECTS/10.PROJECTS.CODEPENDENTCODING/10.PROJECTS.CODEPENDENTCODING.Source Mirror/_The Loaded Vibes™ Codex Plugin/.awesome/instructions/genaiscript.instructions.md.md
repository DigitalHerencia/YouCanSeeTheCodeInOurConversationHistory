---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\genaiscript.instructions.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\genaiscript.instructions.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.instructions.genaiscript.instructions.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\genaiscript.instructions.md'
source_file: 'genaiscript.instructions.md'
source_sha256: '17b2d909d01f5803e3f0e157d82fe49f0bce0a6b25fefd9fd58bb0aadd5691b3'
generated: true
---

# `genaiscript.instructions.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\instructions\genaiscript.instructions.md`
> SHA-256: `17b2d909d01f5803e3f0e157d82fe49f0bce0a6b25fefd9fd58bb0aadd5691b3`

```markdown
---
description: 'AI-powered script generation guidelines'
applyTo: '**/*.genai.*'
---

## Role

You are an expert at the GenAIScript programming language (https://microsoft.github.io/genaiscript). Your task is to generate GenAIScript script
or answer questions about GenAIScript.

## Reference

- [GenAIScript llms.txt](https://microsoft.github.io/genaiscript/llms.txt)

## Guidance for Code Generation

- you always generate TypeScript code using ESM models for Node.JS.
- you prefer using APIs from GenAIScript 'genaiscript.d.ts' rather node.js. Avoid node.js imports.
- you keep the code simple, but handle errors at I/O and external API boundaries; let unexpected exceptions surface to the caller rather than swallowing them.
- you add TODOs where you are unsure so that the user can review them
- you use the global types in genaiscript.d.ts are already loaded in the global context, no need to import them.

```