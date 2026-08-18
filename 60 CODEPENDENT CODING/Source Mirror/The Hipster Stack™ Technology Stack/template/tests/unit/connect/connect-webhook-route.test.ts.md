---
title: 'The Hipster Stack™ Technology Stack\template\tests\unit\connect\connect-webhook-route.test.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\tests\unit\connect\connect-webhook-route.test.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.tests.unit.connect.connect-webhook-route.test.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\tests\unit\connect\connect-webhook-route.test.ts'
source_file: 'connect-webhook-route.test.ts'
source_sha256: '40a157e79c8fe4d4fa01a58587f4fe77daa999918603bdc0016e939585335e5f'
generated: true
---

# `connect-webhook-route.test.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\tests\unit\connect\connect-webhook-route.test.ts`
> SHA-256: `40a157e79c8fe4d4fa01a58587f4fe77daa999918603bdc0016e939585335e5f`

```ts
import { afterEach, describe, expect, it, vi } from "vitest"

import { createConnectWebhookPostHandler } from "@/app/api/stripe/connect/webhooks/route"

const originalSecret = process.env.STRIPE_CONNECT_WEBHOOK_SECRET

afterEach(() => {
  if (originalSecret === undefined) delete process.env.STRIPE_CONNECT_WEBHOOK_SECRET
  else process.env.STRIPE_CONNECT_WEBHOOK_SECRET = originalSecret
})

describe("Connect webhook route", () => {
  it("fails closed without configuration or a valid signature", async () => {
    delete process.env.STRIPE_CONNECT_WEBHOOK_SECRET
    const handler = createConnectWebhookPostHandler({ verify: vi.fn(), reconcile: vi.fn() })
    expect((await handler(new Request("http://localhost", { method: "POST" }))).status).toBe(503)

    process.env.STRIPE_CONNECT_WEBHOOK_SECRET = "whsec_test"
    const invalid = createConnectWebhookPostHandler({
      verify: vi.fn(() => {
        throw new Error("invalid")
      }),
      reconcile: vi.fn(),
    })
    expect(
      (
        await invalid(
          new Request("http://localhost", {
            method: "POST",
            headers: { "stripe-signature": "bad" },
            body: "{}",
          })
        )
      ).status
    ).toBe(400)
  })
})

```