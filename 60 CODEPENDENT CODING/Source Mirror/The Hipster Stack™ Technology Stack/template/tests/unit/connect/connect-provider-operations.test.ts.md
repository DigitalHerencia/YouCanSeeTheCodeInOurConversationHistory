---
title: 'The Hipster Stack™ Technology Stack\template\tests\unit\connect\connect-provider-operations.test.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\tests\unit\connect\connect-provider-operations.test.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.tests.unit.connect.connect-provider-operations.test.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\tests\unit\connect\connect-provider-operations.test.ts'
source_file: 'connect-provider-operations.test.ts'
source_sha256: 'd69b025d816f1787ac8f4cb94ddc4d0e8a6db4381a19cdc2be8da221b2f69440'
generated: true
---

# `connect-provider-operations.test.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\tests\unit\connect\connect-provider-operations.test.ts`
> SHA-256: `d69b025d816f1787ac8f4cb94ddc4d0e8a6db4381a19cdc2be8da221b2f69440`

```ts
import { beforeEach, describe, expect, it, vi } from "vitest"

const stripe = vi.hoisted(() => ({
  paymentIntents: {
    retrieve: vi.fn(),
    capture: vi.fn(),
    cancel: vi.fn(),
  },
  refunds: { create: vi.fn(), retrieve: vi.fn() },
}))

vi.mock("@/lib/integrations/stripe/client", () => ({ getStripe: () => stripe }))

import { stripeConnectProvider } from "@/lib/integrations/stripe/connect"

function payment(status: "requires_capture" | "succeeded") {
  return {
    id: "pi_1",
    status,
    amount: 1000,
    currency: "usd",
    application_fee_amount: 100,
    amount_capturable: status === "requires_capture" ? 1000 : 0,
    amount_received: status === "succeeded" ? 1000 : 0,
    latest_charge: "ch_1",
    transfer_data: { destination: "acct_1" },
    metadata: { connect_payment_id: "payment_1" },
  }
}

beforeEach(() => vi.clearAllMocks())

describe("Connect settlement operations", () => {
  it("retrieves current scoped state before idempotent capture", async () => {
    stripe.paymentIntents.retrieve.mockResolvedValue(payment("requires_capture"))
    stripe.paymentIntents.capture.mockResolvedValue(payment("succeeded"))
    await expect(
      stripeConnectProvider.capturePaymentIntent("pi_1", "acct_1", "capture:payment_1")
    ).resolves.toEqual(
      expect.objectContaining({ status: "succeeded", connectedAccountId: "acct_1" })
    )
    expect(stripe.paymentIntents.retrieve).toHaveBeenCalledWith("pi_1")
    expect(stripe.paymentIntents.capture).toHaveBeenCalledWith(
      "pi_1",
      {},
      { idempotencyKey: "capture:payment_1" }
    )
    expect(stripe.paymentIntents.retrieve.mock.invocationCallOrder[0]).toBeLessThan(
      stripe.paymentIntents.capture.mock.invocationCallOrder[0] ?? 0
    )
  })

  it("rejects account-scope mismatch before capture", async () => {
    stripe.paymentIntents.retrieve.mockResolvedValue(payment("requires_capture"))
    await expect(
      stripeConnectProvider.capturePaymentIntent("pi_1", "acct_other", "capture:payment_1")
    ).rejects.toThrow(/scope mismatch/)
    expect(stripe.paymentIntents.capture).not.toHaveBeenCalled()
  })

  it("fully refunds the charge while reversing transfer and application fee", async () => {
    stripe.paymentIntents.retrieve.mockResolvedValue(payment("succeeded"))
    stripe.refunds.create.mockResolvedValue({
      id: "re_1",
      payment_intent: "pi_1",
      amount: 1000,
      status: "succeeded",
    })
    await expect(
      stripeConnectProvider.createFullRefund({
        chargeId: "ch_1",
        paymentIntentId: "pi_1",
        connectedAccountId: "acct_1",
        idempotencyKey: "refund:payment_1:full",
      })
    ).resolves.toEqual(expect.objectContaining({ refundId: "re_1", status: "succeeded" }))
    expect(stripe.refunds.create).toHaveBeenCalledWith(
      expect.objectContaining({
        charge: "ch_1",
        reverse_transfer: true,
        refund_application_fee: true,
      }),
      { idempotencyKey: "refund:payment_1:full" }
    )
  })
})

```