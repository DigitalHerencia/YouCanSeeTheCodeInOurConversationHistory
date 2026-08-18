---
title: 'The Hipster Stack™ Technology Stack\template\tests\unit\connect\connect-policy.test.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\tests\unit\connect\connect-policy.test.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.tests.unit.connect.connect-policy.test.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\tests\unit\connect\connect-policy.test.ts'
source_file: 'connect-policy.test.ts'
source_sha256: '903e872d38b1b2195ef90cdfd73b2baa82fd786bd35c7cd0870d063325d60747'
generated: true
---

# `connect-policy.test.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\tests\unit\connect\connect-policy.test.ts`
> SHA-256: `903e872d38b1b2195ef90cdfd73b2baa82fd786bd35c7cd0870d063325d60747`

```ts
import { afterEach, describe, expect, it } from "vitest"

import { deriveConnectPaymentTerms } from "@/lib/connect/policy"

const originalCurrency = process.env.STRIPE_CONNECT_CURRENCY
const originalFee = process.env.STRIPE_CONNECT_PLATFORM_FEE_BPS

afterEach(() => {
  if (originalCurrency === undefined) delete process.env.STRIPE_CONNECT_CURRENCY
  else process.env.STRIPE_CONNECT_CURRENCY = originalCurrency
  if (originalFee === undefined) delete process.env.STRIPE_CONNECT_PLATFORM_FEE_BPS
  else process.env.STRIPE_CONNECT_PLATFORM_FEE_BPS = originalFee
})

describe("Connect money policy", () => {
  it("derives currency and integer fee from server configuration", () => {
    process.env.STRIPE_CONNECT_CURRENCY = "USD"
    process.env.STRIPE_CONNECT_PLATFORM_FEE_BPS = "750"
    expect(deriveConnectPaymentTerms({ reference: "order_1", amountMinor: 10_01 })).toEqual({
      reference: "order_1",
      amountMinor: 10_01,
      currency: "usd",
      platformFeeMinor: 75,
    })
  })

  it("rejects fractional, invalid, and client-like money values", () => {
    process.env.STRIPE_CONNECT_CURRENCY = "usd"
    process.env.STRIPE_CONNECT_PLATFORM_FEE_BPS = "100"
    expect(() => deriveConnectPaymentTerms({ reference: "order", amountMinor: 1.5 })).toThrow(
      /integer minor-unit/
    )
    process.env.STRIPE_CONNECT_PLATFORM_FEE_BPS = "10000"
    expect(() => deriveConnectPaymentTerms({ reference: "order", amountMinor: 100 })).toThrow(
      /supported range/
    )
  })
})

```