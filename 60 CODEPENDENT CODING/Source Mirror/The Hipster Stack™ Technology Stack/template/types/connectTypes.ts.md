---
title: 'The Hipster Stack™ Technology Stack\template\types\connectTypes.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\types\connectTypes.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.types.connecttypes.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\types\connectTypes.ts'
source_file: 'connectTypes.ts'
source_sha256: 'd26aa3e3d8c07b6f3484dd40f37172c31bec60d1ec2f228178bccbd9b82b4973'
generated: true
---

# `connectTypes.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\types\connectTypes.ts`
> SHA-256: `d26aa3e3d8c07b6f3484dd40f37172c31bec60d1ec2f228178bccbd9b82b4973`

```ts
export type ConnectAccountSnapshot = {
  accountId: string
  country: string
  detailsSubmitted: boolean
  chargesEnabled: boolean
  payoutsEnabled: boolean
  requirementsDueCount: number
  disabledReason: string | null
}

export type ConnectReadinessDTO = {
  status: "pending" | "restricted" | "ready"
  detailsSubmitted: boolean
  chargesEnabled: boolean
  payoutsEnabled: boolean
  requirementsDueCount: number
  disabledReason: string | null
  providerUpdatedAt: string
} | null

export type ConnectPaymentStatus =
  | "requires_payment_method"
  | "requires_confirmation"
  | "requires_action"
  | "processing"
  | "requires_capture"
  | "succeeded"
  | "canceled"

export type ConnectPaymentSnapshot = {
  connectPaymentId: string
  paymentIntentId: string
  connectedAccountId: string
  status: ConnectPaymentStatus
  amountMinor: number
  currency: string
  platformFeeMinor: number
  amountCapturableMinor: number
  amountReceivedMinor: number
  latestChargeId: string | null
}

export type ConnectRefundStatus =
  | "pending"
  | "requires_action"
  | "succeeded"
  | "failed"
  | "canceled"

export type ConnectRefundSnapshot = {
  refundId: string
  paymentIntentId: string
  amountMinor: number
  status: ConnectRefundStatus
}

export type ConnectWebhookTrigger =
  | {
      provider: "stripe_connect"
      providerEventId: string
      eventType: string
      disposition: "account"
      accountId: string
      safeMetadata: Record<string, string | null>
    }
  | {
      provider: "stripe_connect"
      providerEventId: string
      eventType: string
      disposition: "checkout"
      checkoutSessionId: string
      safeMetadata: Record<string, string | null>
    }
  | {
      provider: "stripe_connect"
      providerEventId: string
      eventType: string
      disposition: "payment"
      paymentIntentId: string
      safeMetadata: Record<string, string | null>
    }
  | {
      provider: "stripe_connect"
      providerEventId: string
      eventType: string
      disposition: "refund"
      refundId: string
      paymentIntentId: string
      safeMetadata: Record<string, string | null>
    }
  | {
      provider: "stripe_connect"
      providerEventId: string
      eventType: string
      disposition: "ignore"
      safeMetadata: Record<string, string | null>
    }

```