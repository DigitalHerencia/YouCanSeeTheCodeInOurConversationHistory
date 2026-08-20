---
title: 'The Hipster Stack™ Technology Stack\context\docs\release.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\context\docs\release.md'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.context.docs.release.md'
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
source_path: 'The Hipster Stack™ Technology Stack\context\docs\release.md'
source_file: 'release.md'
source_sha256: 'ebbb0ae647f9adc2e01901bc4f49ec161c5a73f5df803571c17f17642658c70d'
generated: true
---

# `release.md`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\context\docs\release.md`
> SHA-256: `ebbb0ae647f9adc2e01901bc4f49ec161c5a73f5df803571c17f17642658c70d`

```markdown
---
title: Hipster Stack Release Contract
artifact: release
status: active
product: Hipster Stack
authority: source-of-truth
---

# Hipster Stack Release Contract

## Release outcome

A release is ready when the package and website describe and ship the same product:

- one repository-owned maximal template;
- one shared configuration contract;
- deterministic generation from that template;
- the canonical `hipster-stack` CLI surface;
- the stateless `/configure` handoff;
- end-user docs that match the released behavior;
- no external application-template dependency.

## Package contents

The package should include only the compiled CLI/core assets and template/configuration material required for local generation.

Packaging references the single `template/` source.

## Naming

`hipster-stack` is the canonical command and package metadata target. `hipsterstack.json` is the canonical portable configuration filename. This repository change does not claim npm publication or name reservation; publication remains a separate owner-authorized release action.

No obsolete Loaded Vibes command/package compatibility aliases are retained because no verified published compatibility obligation exists.

## Provider setup

Hipster Stack may generate provider-ready boundaries and `.env.example` documentation. It does not own:

- user provider accounts;
- production credentials;
- live webhook destinations;
- commercial configuration;
- production database migration approval;
- Vercel project/domain promotion.

## Verification

Do not add new tests or validation systems for this migration.

Use existing relevant checks required to establish the changed release behavior. Broader package checks are appropriate only for the release Issue that changes packaging or publishing behavior.

Never claim unrun evidence.

```