---
title: 'The Hipster Stack™ Technology Stack\template\lib\connect\status.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\connect\status.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.connect.status.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\connect\status.ts'
source_file: 'status.ts'
source_sha256: '468da00bf3f0d31b3c69d457a26855795a2fd0c754389705a2e6976a2a78eef0'
generated: true
---

# `status.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\connect\status.ts`
> SHA-256: `468da00bf3f0d31b3c69d457a26855795a2fd0c754389705a2e6976a2a78eef0`

```ts
import type {
  ConnectAccountSnapshot,
  ConnectPaymentStatus,
  ConnectRefundStatus,
} from "@/types/connectTypes"

export function connectAccountStatus(
  snapshot: ConnectAccountSnapshot
): "pending" | "restricted" | "ready" {
  if (snapshot.chargesEnabled && snapshot.payoutsEnabled && snapshot.requirementsDueCount === 0) {
    return "ready"
  }
  if (snapshot.disabledReason || snapshot.detailsSubmitted) return "restricted"
  return "pending"
}

export function mapConnectPaymentStatus(value: string): ConnectPaymentStatus {
  switch (value) {
    case "requires_payment_method":
    case "requires_confirmation":
    case "requires_action":
    case "processing":
    case "requires_capture":
    case "succeeded":
    case "canceled":
      return value
    default:
      throw new Error(`Unsupported Connect PaymentIntent status: ${value}`)
  }
}

export function mapConnectRefundStatus(value: string): ConnectRefundStatus {
  switch (value) {
    case "pending":
    case "requires_action":
    case "succeeded":
    case "failed":
    case "canceled":
      return value
    default:
      throw new Error(`Unsupported Connect refund status: ${value}`)
  }
}

```