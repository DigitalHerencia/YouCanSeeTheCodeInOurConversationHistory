---
title: 'The Hipster Stack™ Technology Stack\template\tests\unit\connect\connect-webhook-mapping.test.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\tests\unit\connect\connect-webhook-mapping.test.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.tests.unit.connect.connect-webhook-mapping.test.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\tests\unit\connect\connect-webhook-mapping.test.ts'
source_file: 'connect-webhook-mapping.test.ts'
source_sha256: '33ccfe4a681b0bc47d0179efee2f2414f696f547673425735e6a7712b646e012'
generated: true
---

# `connect-webhook-mapping.test.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\tests\unit\connect\connect-webhook-mapping.test.ts`
> SHA-256: `33ccfe4a681b0bc47d0179efee2f2414f696f547673425735e6a7712b646e012`

```ts
import { describe, expect, it } from "vitest"

import { mapVerifiedConnectWebhook } from "@/lib/integrations/stripe/connectWebhooks"

describe("Connect webhook mapping", () => {
  it("maps readiness, capture, and refund triggers without trusting object state", () => {
    expect(
      mapVerifiedConnectWebhook({
        id: "evt_account",
        type: "account.updated",
        data: { object: { id: "acct_1", charges_enabled: true } },
      })
    ).toEqual({
      ok: true,
      event: expect.objectContaining({
        provider: "stripe_connect",
        disposition: "account",
        accountId: "acct_1",
      }),
    })
    expect(
      mapVerifiedConnectWebhook({
        id: "evt_capture",
        type: "payment_intent.amount_capturable_updated",
        data: { object: { id: "pi_1", amount_capturable: 999 } },
      })
    ).toEqual({
      ok: true,
      event: expect.objectContaining({ disposition: "payment", paymentIntentId: "pi_1" }),
    })
    expect(
      mapVerifiedConnectWebhook({
        id: "evt_refund",
        type: "refund.updated",
        data: { object: { id: "re_1", payment_intent: "pi_1" } },
      })
    ).toEqual({
      ok: true,
      event: expect.objectContaining({
        disposition: "refund",
        refundId: "re_1",
        paymentIntentId: "pi_1",
      }),
    })
  })

  it("rejects malformed supported events and safely ignores unsupported ones", () => {
    expect(
      mapVerifiedConnectWebhook({
        id: "evt_bad",
        type: "refund.updated",
        data: { object: { id: "re_1" } },
      })
    ).toEqual({ ok: false, reason: "malformed_payload" })
    expect(
      mapVerifiedConnectWebhook({
        id: "evt_other",
        type: "balance.available",
        data: { object: { id: "ba_1" } },
      })
    ).toEqual({
      ok: true,
      event: expect.objectContaining({ disposition: "ignore" }),
    })
  })
})

```