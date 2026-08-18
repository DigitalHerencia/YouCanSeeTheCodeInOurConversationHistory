---
title: 'The Hipster Stack™ Technology Stack\template\reference-implementations\vouch\.agents\contracts\routes.yaml'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\reference-implementations\vouch\.agents\contracts\routes.yaml'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.reference-implementations.vouch.agents.contracts.routes.yaml'
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
source_path: 'The Hipster Stack™ Technology Stack\template\reference-implementations\vouch\.agents\contracts\routes.yaml'
source_file: 'routes.yaml'
source_sha256: '61b1869f051ee12f17fff108b6bb4fce4f2c812b95f0538bb7d181b9cbe54d96'
generated: true
---

# `routes.yaml`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\reference-implementations\vouch\.agents\contracts\routes.yaml`
> SHA-256: `61b1869f051ee12f17fff108b6bb4fce4f2c812b95f0538bb7d181b9cbe54d96`

```yaml
id: vouch.routes
reference_scope: vouch-only
source_date: "2026-05-16"
authority: source-of-truth
public:
  - /
  - /pricing
  - /faq
  - /legal/terms
  - /legal/privacy
  - /checkout/success
auth:
  - /sign-in
  - /sign-up
tenant:
  - /dashboard
  - /vouches/new
  - /vouches/new/confirm
  - /vouches/[vouchId]
api:
  - /api/clerk/webhooks
  - /api/stripe/webhooks
external_provider_surfaces:
  - stripe_connect
  - stripe_checkout
  - stripe_payment_method_management
  - clerk_account

```