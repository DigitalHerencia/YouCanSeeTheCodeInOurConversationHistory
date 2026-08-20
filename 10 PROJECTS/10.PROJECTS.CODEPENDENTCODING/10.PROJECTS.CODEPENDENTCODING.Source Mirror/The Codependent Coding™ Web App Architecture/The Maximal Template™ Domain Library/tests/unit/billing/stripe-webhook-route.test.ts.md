---
title: 'The Hipster Stack™ Technology Stack\template\tests\unit\billing\stripe-webhook-route.test.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\tests\unit\billing\stripe-webhook-route.test.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.tests.unit.billing.stripe-webhook-route.test.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\tests\unit\billing\stripe-webhook-route.test.ts'
source_file: 'stripe-webhook-route.test.ts'
source_sha256: 'ad330fd1d3229885ae5cb8a196d0234348b1d0fc002bec7784626f7b11ba8d6f'
generated: true
---

# `stripe-webhook-route.test.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\tests\unit\billing\stripe-webhook-route.test.ts`
> SHA-256: `ad330fd1d3229885ae5cb8a196d0234348b1d0fc002bec7784626f7b11ba8d6f`

```ts
import { afterEach, beforeEach, describe, expect, it, vi } from "vitest"

import { createStripeWebhookPostHandler } from "@/app/api/stripe/webhooks/route"

function request(withSignature = true) {
  return new Request("http://localhost/api/stripe/webhooks", {
    method: "POST",
    headers: withSignature ? { "stripe-signature": "signed" } : {},
    body: "raw-body",
  })
}

describe("Stripe webhook route", () => {
  beforeEach(() => {
    process.env.STRIPE_WEBHOOK_SECRET = "whsec_test_only"
  })
  afterEach(() => {
    delete process.env.STRIPE_WEBHOOK_SECRET
    vi.restoreAllMocks()
  })

  it("fails safely when raw-body signature verification fails", async () => {
    const reconcile = vi.fn()
    const handler = createStripeWebhookPostHandler({
      verify: vi.fn(() => {
        throw new Error("invalid")
      }),
      reconcile,
    })
    expect((await handler(request())).status).toBe(400)
    expect(reconcile).not.toHaveBeenCalled()
  })

  it("fails safely for a malformed verified envelope", async () => {
    const reconcile = vi.fn()
    const handler = createStripeWebhookPostHandler({
      verify: vi.fn(() => ({ id: "", type: "", data: {} })),
      reconcile,
    })
    expect((await handler(request())).status).toBe(400)
    expect(reconcile).not.toHaveBeenCalled()
  })
})

```