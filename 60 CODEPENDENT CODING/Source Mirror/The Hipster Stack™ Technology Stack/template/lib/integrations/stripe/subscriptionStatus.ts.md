---
title: 'The Hipster Stack™ Technology Stack\template\lib\integrations\stripe\subscriptionStatus.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\integrations\stripe\subscriptionStatus.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.integrations.stripe.subscriptionstatus.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\integrations\stripe\subscriptionStatus.ts'
source_file: 'subscriptionStatus.ts'
source_sha256: 'fe98c04e870515aa288bf45e98a8a872edd71c836b692cb788ef17522a162bef'
generated: true
---

# `subscriptionStatus.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\integrations\stripe\subscriptionStatus.ts`
> SHA-256: `fe98c04e870515aa288bf45e98a8a872edd71c836b692cb788ef17522a162bef`

```ts
import "server-only"

import type { BillingSubscriptionStatus } from "@/types/billingTypes"

export function mapStripeSubscriptionStatus(value: string): BillingSubscriptionStatus {
  switch (value) {
    case "trialing":
    case "active":
    case "incomplete":
    case "incomplete_expired":
    case "past_due":
    case "canceled":
    case "unpaid":
    case "paused":
      return value
    default:
      throw new Error("Unsupported Stripe subscription status.")
  }
}

```