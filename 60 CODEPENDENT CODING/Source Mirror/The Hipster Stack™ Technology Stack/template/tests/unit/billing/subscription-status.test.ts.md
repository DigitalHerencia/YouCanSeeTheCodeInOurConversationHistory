---
title: 'The Hipster Stack™ Technology Stack\template\tests\unit\billing\subscription-status.test.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\tests\unit\billing\subscription-status.test.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.tests.unit.billing.subscription-status.test.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\tests\unit\billing\subscription-status.test.ts'
source_file: 'subscription-status.test.ts'
source_sha256: 'dedd6a63feb7ca1dc914adbd8f2dee4adf886c38951195e4d0dd9cdb1e7f6d50'
generated: true
---

# `subscription-status.test.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\tests\unit\billing\subscription-status.test.ts`
> SHA-256: `dedd6a63feb7ca1dc914adbd8f2dee4adf886c38951195e4d0dd9cdb1e7f6d50`

```ts
import { describe, expect, it } from "vitest"

import { statusGrantsCoreEntitlement } from "@/lib/billing/entitlements"
import { mapStripeSubscriptionStatus } from "@/lib/integrations/stripe/subscriptionStatus"

describe("Stripe subscription status mapping", () => {
  it.each([
    "trialing",
    "active",
    "incomplete",
    "incomplete_expired",
    "past_due",
    "canceled",
    "unpaid",
    "paused",
  ] as const)("maps supported status %s explicitly", (status) => {
    expect(mapStripeSubscriptionStatus(status)).toBe(status)
  })

  it("rejects an unknown provider status", () => {
    expect(() => mapStripeSubscriptionStatus("mystery")).toThrow(
      "Unsupported Stripe subscription status."
    )
  })

  it("grants the simple-plan entitlement only for active or trialing", () => {
    expect(statusGrantsCoreEntitlement("active")).toBe(true)
    expect(statusGrantsCoreEntitlement("trialing")).toBe(true)
    expect(statusGrantsCoreEntitlement("past_due")).toBe(false)
    expect(statusGrantsCoreEntitlement("canceled")).toBe(false)
  })
})

```