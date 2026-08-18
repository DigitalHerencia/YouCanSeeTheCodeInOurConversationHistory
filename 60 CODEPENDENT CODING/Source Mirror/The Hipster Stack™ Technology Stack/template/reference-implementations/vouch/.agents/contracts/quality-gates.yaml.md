---
title: 'The Hipster Stack™ Technology Stack\template\reference-implementations\vouch\.agents\contracts\quality-gates.yaml'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\reference-implementations\vouch\.agents\contracts\quality-gates.yaml'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.reference-implementations.vouch.agents.contracts.quality-gates.yaml'
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
source_path: 'The Hipster Stack™ Technology Stack\template\reference-implementations\vouch\.agents\contracts\quality-gates.yaml'
source_file: 'quality-gates.yaml'
source_sha256: '0dd8aafc9ca3808d4ca9eb23cd38a0f4466ec1ca4d8a399e35af38d3ca443134'
generated: true
---

# `quality-gates.yaml`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\reference-implementations\vouch\.agents\contracts\quality-gates.yaml`
> SHA-256: `0dd8aafc9ca3808d4ca9eb23cd38a0f4466ec1ca4d8a399e35af38d3ca443134`

```yaml
id: vouch.quality-gates
reference_scope: vouch-only
source_date: "2026-05-16"
authority: source-of-truth
checks:
  contract_validation: pnpm validate:contracts
  typecheck: pnpm typecheck
  unit_tests: pnpm test
  full_validation: pnpm validate
visual_review:
  server_required: approval_required
  screenshot_catalog:
    - landing
    - pricing
    - faq
    - terms
    - privacy
    - sign-in
    - sign-up
    - dashboard
    - create-vouch
    - confirm-create
    - vouch-detail
    - checkout-success

```