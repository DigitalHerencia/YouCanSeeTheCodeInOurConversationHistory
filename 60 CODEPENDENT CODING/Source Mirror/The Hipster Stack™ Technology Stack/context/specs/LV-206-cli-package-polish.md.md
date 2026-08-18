---
title: 'The Hipster Stack™ Technology Stack\context\specs\LV-206-cli-package-polish.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\context\specs\LV-206-cli-package-polish.md'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.context.specs.lv-206-cli-package-polish.md'
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
source_path: 'The Hipster Stack™ Technology Stack\context\specs\LV-206-cli-package-polish.md'
source_file: 'LV-206-cli-package-polish.md'
source_sha256: '9e6eaed241aafcc0b7b56e4e37a9fc5d2d0d8a54a061f67d4daca8030d3d590a'
generated: true
---

# `LV-206-cli-package-polish.md`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\context\specs\LV-206-cli-package-polish.md`
> SHA-256: `9e6eaed241aafcc0b7b56e4e37a9fc5d2d0d8a54a061f67d4daca8030d3d590a`

```markdown
---
id: LV-206
title: Polish the CLI and package around the final model
status: completed
type: implementation-spec
order: 6
depends_on: [LV-202, LV-203]
issue_title: 'Polish Loaded Vibes CLI and package for the one-template model'
---

# LV-206 — Polish the CLI and package around the final model

## Outcome

Make the CLI and package describe and ship the final one-template product cleanly.

## Starting state

The root package is currently `create-loaded-vibes`, exposes both `create-loaded-vibes` and `loaded-vibes` bins, and publishes `templates`.

## Read

- `context/docs/generator-cli.md`
- `context/docs/release.md`
- `context/docs/repository-transition.md`
- `.agents/contracts/product.yaml`
- `.agents/contracts/transition.yaml`

## Scope

- make `loaded-vibes` the clearly documented canonical command;
- update CLI copy/prompts to the final configuration vocabulary;
- update package contents from legacy `templates` paths to `template/`;
- preserve a compatibility alias only if it still prevents real breakage and is cheap to keep;
- keep `create`, supported `add`, `explain`, `doctor`, and version behavior aligned with the shared core;
- update generated handoff text and README references;
- do not claim an npm package rename/publication has occurred unless it actually has.

## Non-goals

- do not publish to npm unless separately authorized;
- do not add commands merely for completeness;
- do not turn doctor into a validation suite;
- do not add new tests or validators.

## Acceptance

- CLI terminology matches the one-template product;
- package contents include the correct template path required for local generation;
- the canonical command is unambiguous;
- compatibility behavior is intentional and documented;
- local generation remains self-contained.

## Verification

Use existing package/build/smoke checks only because this Issue changes packaging. Do not add new checks.

```