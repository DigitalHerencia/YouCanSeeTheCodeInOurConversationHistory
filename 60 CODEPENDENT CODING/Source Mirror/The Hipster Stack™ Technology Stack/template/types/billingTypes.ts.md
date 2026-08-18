---
title: 'The Hipster Stack™ Technology Stack\template\types\billingTypes.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\types\billingTypes.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.types.billingtypes.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\types\billingTypes.ts'
source_file: 'billingTypes.ts'
source_sha256: '1add8fe5266be7f22ba9b5961b4f96d37a86223c642c937a7947eb76e20df781'
generated: true
---

# `billingTypes.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\types\billingTypes.ts`
> SHA-256: `1add8fe5266be7f22ba9b5961b4f96d37a86223c642c937a7947eb76e20df781`

```ts
export type BillingSubscriptionStatus =
  | "trialing"
  | "active"
  | "incomplete"
  | "incomplete_expired"
  | "past_due"
  | "canceled"
  | "unpaid"
  | "paused"

export type StripeSubscriptionSnapshot = {
  subscriptionId: string
  customerId: string
  status: BillingSubscriptionStatus
  cancelAtPeriodEnd: boolean
  providerCreatedAt: Date
  item: {
    subscriptionItemId: string
    priceId: string
    quantity: number
    currentPeriodEnd: Date | null
  }
}

export type StripeWebhookTrigger = ClaimableStripeTrigger | IgnoredStripeTrigger

type StripeTriggerBase = {
  provider: "stripe"
  providerEventId: string
  eventType: string
  safeMetadata: Record<string, string | null>
}

export type ClaimableStripeTrigger = StripeTriggerBase & {
  disposition: "process"
  subscriptionId: string
}

export type IgnoredStripeTrigger = StripeTriggerBase & {
  disposition: "ignore"
}

export type BillingDrift = {
  hasDrift: boolean
  fields: readonly (
    | "subscription_missing"
    | "status"
    | "price"
    | "cancel_at_period_end"
    | "current_period_end"
    | "entitlement"
  )[]
}

export type BillingSettingsDTO = {
  customerConfigured: boolean
  entitlementActive: boolean
  subscription: {
    status: BillingSubscriptionStatus
    priceId: string
    cancelAtPeriodEnd: boolean
    currentPeriodEnd: string | null
  } | null
}

```