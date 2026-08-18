---
title: 'The Hipster Stack™ Technology Stack\template\reference-implementations\vouch\.agents\contracts\integrations.yaml'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\reference-implementations\vouch\.agents\contracts\integrations.yaml'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.reference-implementations.vouch.agents.contracts.integrations.yaml'
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
source_path: 'The Hipster Stack™ Technology Stack\template\reference-implementations\vouch\.agents\contracts\integrations.yaml'
source_file: 'integrations.yaml'
source_sha256: 'c9eb10404aa37e75501ee01779a59e7ab463248510d3b8adda43a5f62ddb27db'
generated: true
---

# `integrations.yaml`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\reference-implementations\vouch\.agents\contracts\integrations.yaml`
> SHA-256: `c9eb10404aa37e75501ee01779a59e7ab463248510d3b8adda43a5f62ddb27db`

```yaml
id: vouch.integrations
reference_scope: vouch-only
source_date: "2026-05-16"
authority: source-of-truth
providers:
  stripe:
    owns:
      - payment_method_collection
      - payment_authorization
      - hosted_checkout
      - identity_collection
      - connect_onboarding
      - payout_account_management
      - payment_truth
    vouch_stores_only:
      - safe_provider_references
      - statuses
      - timestamps
      - readiness_flags
      - audit_safe_metadata
  clerk:
    owns:
      - authentication_truth
rules:
  browser_return_is_not_payment_truth: true
  no_raw_card_bank_identity_storage: true
  webhook_reconciliation_required: true

```