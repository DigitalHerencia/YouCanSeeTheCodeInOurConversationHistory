---
title: 'The Hipster Stack™ Technology Stack\context\specs\HS-302-rename-generator-identifiers.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\context\specs\HS-302-rename-generator-identifiers.md'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.context.specs.hs-302-rename-generator-identifiers.md'
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
source_path: 'The Hipster Stack™ Technology Stack\context\specs\HS-302-rename-generator-identifiers.md'
source_file: 'HS-302-rename-generator-identifiers.md'
source_sha256: '56942ae616a1c5c8e9d9d51d551c3c655b2b4b8f80da44ab8e006b73231d07f1'
generated: true
---

# `HS-302-rename-generator-identifiers.md`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\context\specs\HS-302-rename-generator-identifiers.md`
> SHA-256: `56942ae616a1c5c8e9d9d51d551c3c655b2b4b8f80da44ab8e006b73231d07f1`

```markdown
---
id: HS-302
title: Rename active generator identifiers to Hipster Stack
status: active
type: implementation-spec
order: 302
depends_on: [HS-301]
issue: 136
---

# HS-302 — Rename active generator identifiers

## Outcome

Rename active product/runtime identifiers to Hipster Stack without rewriting history or renaming the GitHub repository.

## Required inputs

Read this spec, Issue #136, `context/docs/{product,configuration,generator-cli,web}.md`, `.agents/contracts/product.yaml`, root/workspace package metadata, CLI entry files, shared configuration code, active web copy, and directly affected tests. Use repository search rather than broad file-by-file reading.

## Target vocabulary

- product: Hipster Stack™
- canonical CLI: `hipster-stack`
- portable config: `hipsterstack.json`
- workspace namespace: `@hipster-stack/*`
- Loaded Vibes™ only when referring to downstream adaptive tooling

## Rules

Preserve historical closed issues/PRs/specs. Do not rename the GitHub repository. Keep an old command/package alias only if repository evidence demonstrates a real compatibility obligation; otherwise remove stale aliases instead of carrying ambiguity forward.

## Non-goals

No UI redesign, generator architecture rewrite, template restructuring, npm publication, deployment, or provider changes.

## Verification

Run only focused typecheck/build and directly affected CLI/configurator tests plus an active-reference search.

```