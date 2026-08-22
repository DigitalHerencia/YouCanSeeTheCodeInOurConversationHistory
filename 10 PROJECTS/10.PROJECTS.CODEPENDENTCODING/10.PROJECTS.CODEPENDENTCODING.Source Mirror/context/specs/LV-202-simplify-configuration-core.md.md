---
title: 'The Hipster Stack™ Technology Stack\context\specs\LV-202-simplify-configuration-core.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\context\specs\LV-202-simplify-configuration-core.md'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.context.specs.lv-202-simplify-configuration-core.md'
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
source_path: 'The Hipster Stack™ Technology Stack\context\specs\LV-202-simplify-configuration-core.md'
source_file: 'LV-202-simplify-configuration-core.md'
source_sha256: '2cfbde2b0987dd003aca52245ba48c0edc39c855b89032b1c19046c433ee7a91'
generated: true
---

# `LV-202-simplify-configuration-core.md`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\context\specs\LV-202-simplify-configuration-core.md`
> SHA-256: `2cfbde2b0987dd003aca52245ba48c0edc39c855b89032b1c19046c433ee7a91`

````markdown
---
id: LV-202
title: Simplify configuration and absorb recipe ownership
status: completed
type: implementation-spec
order: 2
depends_on: [LV-201]
issue_title: 'Simplify Loaded Vibes configuration around one template'
---

# LV-202 — Simplify configuration and absorb recipe ownership

## Outcome

Make the configuration model describe technical differences over one template rather than a separate recipe architecture.

## Starting state

The repository currently contains `packages/recipes` and preset/capability language built during the previous roadmap. Some of that data is useful. The separate package and product-first taxonomy are not the target architecture.

## Read

- `context/docs/product.md`
- `context/docs/configuration.md`
- `context/docs/architecture.md`
- `.agents/contracts/product.yaml`
- `.agents/contracts/architecture.yaml`

## Scope

- identify useful defaults currently owned by `packages/recipes`;
- move useful preset/default data into the appropriate schema/core boundary;
- remove `packages/recipes` once no consumer depends on it;
- center configuration on real project settings, optional owned surfaces/integrations, identity, and bounded design;
- preserve one schema/normalization path for CLI, web, and `loadedvibes.json`;
- retain preset names only as optional convenience defaults if they still save time;
- remove or hide any configurable option that does not correspond to real generator behavior.

## Non-goals

- do not add imaginary capabilities to make the configurator look richer;
- do not add arbitrary framework/provider selection;
- do not redesign the master template;
- do not create new tests or validators.

## Likely affected areas

```text
packages/recipes/**
packages/schema/**
packages/core/** config/resolution
packages/cli/** prompt metadata
apps/web/** configuration metadata
loadedvibes.json serialization
```

## Acceptance

- `packages/recipes` is no longer required as a package;
- CLI and web resolve the same normalized configuration;
- every visible selectable option maps to real retained/removed/transformed output or an actual project lifecycle choice;
- fixed Hipster Stack decisions are not presented as choices;
- existing useful defaults survive in a simpler ownership location.

## Verification

Use existing type/build or focused generator checks only where needed to prove the changed shared configuration still resolves. Do not add new tests.

````