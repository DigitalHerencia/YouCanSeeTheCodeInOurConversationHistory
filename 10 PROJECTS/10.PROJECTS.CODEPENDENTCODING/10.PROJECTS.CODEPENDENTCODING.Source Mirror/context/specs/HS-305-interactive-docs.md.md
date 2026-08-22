---
title: 'The Hipster Stack™ Technology Stack\context\specs\HS-305-interactive-docs.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\context\specs\HS-305-interactive-docs.md'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.context.specs.hs-305-interactive-docs.md'
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
source_path: 'The Hipster Stack™ Technology Stack\context\specs\HS-305-interactive-docs.md'
source_file: 'HS-305-interactive-docs.md'
source_sha256: 'ff41c833c29badde61d4380e8541b6fc00ad5c2b0f030ffee15a7c82beb3ee44'
generated: true
---

# `HS-305-interactive-docs.md`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\context\specs\HS-305-interactive-docs.md`
> SHA-256: `ff41c833c29badde61d4380e8541b6fc00ad5c2b0f030ffee15a7c82beb3ee44`

```markdown
---
id: HS-305
title: Rebuild Simples catalog and detail experience
status: active
type: implementation-spec
order: 305
depends_on: [HS-302, HS-303, HS-304]
issue: 139
---

# HS-305 — Simples catalog and detail experience

## Outcome

Rebuild the existing `/libraries/*` catalog/detail surface as Simples™ using the approved Libraries/config mockups while keeping canonical Docs separate and configuration semantics shared.

## Required inputs

Read this spec, Issue #139, `context/docs/{web,documentation,configuration}.md`, `context/mockups/{libraries,config}.png`, the existing Libraries feature/data, canonical docs links used by those views, and only shared Constituter/configuration code needed to prevent semantic duplication.

## Required behavior

- `/libraries` remains the Simples™ browse destination and follows `libraries.png`.
- `/libraries/[slug]` detail pages follow `config.png` for focused status/example/relationship presentation.
- Preserve the owner-approved Simples copy and `Digital Herencia Desert BG.png` bottom treatment already landed before Codex execution.
- Simples may link to canonical Docs and the Constituter when useful, but `docs/` remains the technical source of truth.
- Reuse shared configuration semantics; do not create a second capability/dependency engine.
- Keep current route paths. The branded term `Simples™` does not imply independently composable packages.
- Use the locked HS-303 palette/type/wordmark system and mockup geometry.

## Cleanup

Remove only superseded Libraries-era labels, dead presentation helpers, and obsolete styles after their final caller disappears. Do not delete the `/libraries/*` route family or redirect it into Docs.

## Non-goals

No docs framework/CMS, fake controls, unsupported provider/configuration claims, backend state, route migration, or broad content rewrite.

## Verification

Web typecheck/build and route smoke for `/libraries`, one representative detail page, one Constituter handoff, one Docs link, and one narrow layout.

```