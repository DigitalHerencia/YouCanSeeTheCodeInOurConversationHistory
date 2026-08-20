---
title: 'The Hipster Stack™ Technology Stack\template\lib\billing\billingState.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\billing\billingState.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.billing.billingstate.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\billing\billingState.ts'
source_file: 'billingState.ts'
source_sha256: 'a6b5e809f237b451d269afe094a9b9dec2c46efe44e83ac4c8401b3143ff8661'
generated: true
---

# `billingState.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\billing\billingState.ts`
> SHA-256: `a6b5e809f237b451d269afe094a9b9dec2c46efe44e83ac4c8401b3143ff8661`

```ts
import type { BillingDrift, StripeSubscriptionSnapshot } from "@/types/billingTypes"

export type LocalBillingSnapshot = {
  status: string
  stripePriceId: string
  cancelAtPeriodEnd: boolean
  currentPeriodEnd: Date | null
  entitlementActive: boolean
} | null

export function compareBillingState(
  local: LocalBillingSnapshot,
  provider: StripeSubscriptionSnapshot | null
): BillingDrift {
  if (!local && !provider) return { hasDrift: false, fields: [] }
  if (!local || !provider) return { hasDrift: true, fields: ["subscription_missing"] }

  const fields: BillingDrift["fields"][number][] = []
  if (local.status !== provider.status) fields.push("status")
  if (local.stripePriceId !== provider.item.priceId) fields.push("price")
  if (local.cancelAtPeriodEnd !== provider.cancelAtPeriodEnd) fields.push("cancel_at_period_end")
  if (local.currentPeriodEnd?.getTime() !== provider.item.currentPeriodEnd?.getTime()) {
    fields.push("current_period_end")
  }
  const providerEntitled = provider.status === "active" || provider.status === "trialing"
  if (local.entitlementActive !== providerEntitled) fields.push("entitlement")
  return { hasDrift: fields.length > 0, fields }
}

```