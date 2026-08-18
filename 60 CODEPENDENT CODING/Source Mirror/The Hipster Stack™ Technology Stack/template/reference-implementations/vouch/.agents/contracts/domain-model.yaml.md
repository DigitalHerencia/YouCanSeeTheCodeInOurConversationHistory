---
title: 'The Hipster Stack™ Technology Stack\template\reference-implementations\vouch\.agents\contracts\domain-model.yaml'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\reference-implementations\vouch\.agents\contracts\domain-model.yaml'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.reference-implementations.vouch.agents.contracts.domain-model.yaml'
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
source_path: 'The Hipster Stack™ Technology Stack\template\reference-implementations\vouch\.agents\contracts\domain-model.yaml'
source_file: 'domain-model.yaml'
source_sha256: 'ded74acdda7ffe17aef921f0a892f1663202797fa7c3a4481aecbe42e7ebce17'
generated: true
---

# `domain-model.yaml`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\reference-implementations\vouch\.agents\contracts\domain-model.yaml`
> SHA-256: `ded74acdda7ffe17aef921f0a892f1663202797fa7c3a4481aecbe42e7ebce17`

```yaml
id: vouch.domain-model
reference_scope: vouch-only
source_date: "2026-05-16"
authority: source-of-truth
lifecycle_states:
  - draft
  - committed
  - sent
  - accepted
  - authorized
  - confirmable
  - completed
  - expired
roles:
  - merchant
  - customer
rules:
  immutable_after_commit: true
  sent_vouches_are_immutable: true
  bilateral_confirmation_required_for_release: true
  provider_states_separate_from_lifecycle: true
forbidden_surfaces:
  - marketplace
  - messaging
  - disputes
  - evidence
  - reviews
  - manual_settlement

```