---
title: 'The Hipster Stack™ Technology Stack\context\specs\HS-304-web-shell-landing.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\context\specs\HS-304-web-shell-landing.md'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.context.specs.hs-304-web-shell-landing.md'
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
source_path: 'The Hipster Stack™ Technology Stack\context\specs\HS-304-web-shell-landing.md'
source_file: 'HS-304-web-shell-landing.md'
source_sha256: '60b57c9c98d613caf97bc9cd2d207c76ce09c9a8b63d760f2d97075363755d9b'
generated: true
---

# `HS-304-web-shell-landing.md`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\context\specs\HS-304-web-shell-landing.md`
> SHA-256: `60b57c9c98d613caf97bc9cd2d207c76ce09c9a8b63d760f2d97075363755d9b`

```markdown
---
id: HS-304
title: Rebuild Product shell and landing from approved mockup
status: active
type: implementation-spec
order: 304
depends_on: [HS-302, HS-303]
issue: 138
---

# HS-304 — Product shell and landing

## Outcome

Complete `context/mockups/landing.png` under the locked Hipster Stack branding using the HS-303 presentation foundation and the owner-approved pre-Codex landing baseline already in the repository.

## Required inputs

Read this spec, Issue #138, `context/docs/web.md`, `landing.png`, and only current shell/Product files plus direct presentation dependencies.

## Architecture guardrail

`app/page.tsx` remains thin and server-first. The Product feature composes pure blocks/components. Do not introduce protected I/O or generator semantics into presentation.

## Locked presentation inputs

Preserve the existing owner-approved decisions unless a concrete mockup/accessibility defect requires a focused correction:

- navigation vocabulary `Product | Simples | Docs | Constituter` while retaining current route paths;
- Product hero copy: `When epistemologies fail, The Stack still governs.` / `The Hipster Stack™` / `Constituted not Composable`;
- `public/Loaded Vibes Crown.png` as the crown motif;
- `public/Digital Herencia Banner.png` as the full-width bottom background treatment;
- black / `#05030b` canvas, white text, `#2f7a8d` signal/glow;
- approved Hipster Stack and Digital Herencia wordmarks/typography from `context/docs/web.md`;
- approved provenance and irreverent microcopy already present in the Product feature.

## Required composition

Preserve the mockup's brand moment, two-column introduction/Constituter preview, compact entry cards, workflow strip, foundation summary, spacing/proportions, and restrained black/teal treatment. Use truthful generator copy and CTA labels. Use BoldKit blocks only where they reduce code without changing the mockup's composition.

## Cleanup

Delete replaced old branding markup/styles/components after their last caller is gone. Do not delete repository-owned source assets merely because a page no longer references all of them.

## Non-goals

No backend state, new configuration choices, generator/schema/template change, or unrelated marketing content.

## Verification

`pnpm --dir apps/web typecheck`, `pnpm --dir apps/web build`, desktop mockup comparison, one narrow-width inspection, and direct CTA/navigation smoke.

```