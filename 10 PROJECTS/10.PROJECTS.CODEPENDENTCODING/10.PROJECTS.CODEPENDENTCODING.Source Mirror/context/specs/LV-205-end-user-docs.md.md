---
title: 'The Hipster Stack™ Technology Stack\context\specs\LV-205-end-user-docs.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\context\specs\LV-205-end-user-docs.md'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.context.specs.lv-205-end-user-docs.md'
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
source_path: 'The Hipster Stack™ Technology Stack\context\specs\LV-205-end-user-docs.md'
source_file: 'LV-205-end-user-docs.md'
source_sha256: '5ddc6f348f4ff3a8ca425094a7552b4f888595620f895dfa32128c43fc3c23f2'
generated: true
---

# `LV-205-end-user-docs.md`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\context\specs\LV-205-end-user-docs.md`
> SHA-256: `5ddc6f348f4ff3a8ca425094a7552b4f888595620f895dfa32128c43fc3c23f2`

```markdown
---
id: LV-205
title: Add canonical end-user documentation
status: completed
type: implementation-spec
order: 5
depends_on: [LV-202, LV-203]
issue_title: 'Add canonical Loaded Vibes end-user docs and /docs'
---

# LV-205 — Add canonical end-user documentation

## Outcome

Create one end-user documentation source at `docs/` and render it from the website at `/docs/*`.

## Starting state

Current durable documentation is primarily README/maintainer context. The target product needs user docs that are separate from `context/`.

## Read

- `context/docs/documentation.md`
- `context/docs/product.md`
- `context/docs/generator-cli.md`

## Scope

- add the initial `docs/` structure described by the documentation contract;
- document the one-template model;
- document configuration categories actually supported after LV-202/LV-203;
- document CLI commands actually supported;
- document generated-project handoff and user-owned provider setup;
- add a small website docs renderer/navigation under `/docs/*`;
- link the README and website to the same canonical docs.

## Non-goals

- do not duplicate all Hipster Stack architecture into end-user docs;
- do not create docs for unsupported providers or commands;
- do not create a documentation CMS;
- do not add tests or validators.

## Acceptance

- `docs/` is the canonical end-user source;
- `/docs/*` renders that source;
- maintainer context remains in `context/`;
- docs match real release behavior and do not promise unimplemented configuration;
- provider setup responsibilities are clear.

## Verification

Use only the existing web/build checks required by the docs renderer changes. No new documentation validation system.

```