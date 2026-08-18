---
title: 'The Hipster Stack™ Technology Stack\template\tests\unit\webhooks\clerk-webhook-route.test.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\tests\unit\webhooks\clerk-webhook-route.test.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.tests.unit.webhooks.clerk-webhook-route.test.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\tests\unit\webhooks\clerk-webhook-route.test.ts'
source_file: 'clerk-webhook-route.test.ts'
source_sha256: 'f4f2ddf042462c3f319d7a592a366ce467afe6eaf6d8098bd7cd9d0ac9f5fa4d'
generated: true
---

# `clerk-webhook-route.test.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\tests\unit\webhooks\clerk-webhook-route.test.ts`
> SHA-256: `f4f2ddf042462c3f319d7a592a366ce467afe6eaf6d8098bd7cd9d0ac9f5fa4d`

```ts
import { NextRequest } from "next/server"
import { afterEach, beforeEach, describe, expect, it, vi } from "vitest"

import { createClerkWebhookPostHandler } from "@/app/api/clerk/webhooks/route"

function webhookRequest(withId = true) {
  return new NextRequest("http://localhost/api/clerk/webhooks", {
    method: "POST",
    headers: withId ? { "svix-id": "event_1" } : {},
    body: "{}",
  })
}

describe("Clerk webhook route", () => {
  beforeEach(() => {
    process.env.CLERK_WEBHOOK_SIGNING_SECRET = "whsec_test_only"
  })

  afterEach(() => {
    delete process.env.CLERK_WEBHOOK_SIGNING_SECRET
    vi.restoreAllMocks()
  })

  it("fails safely when signature verification fails", async () => {
    const reconcile = vi.fn()
    const handler = createClerkWebhookPostHandler({
      verify: vi.fn().mockRejectedValue(new Error("invalid signature")),
      reconcile,
    })

    const response = await handler(webhookRequest())

    expect(response.status).toBe(400)
    expect(reconcile).not.toHaveBeenCalled()
  })

  it("fails safely when the verified payload is malformed", async () => {
    const reconcile = vi.fn()
    const handler = createClerkWebhookPostHandler({
      verify: vi.fn().mockResolvedValue({
        type: "user.created",
        data: { id: "", updated_at: Date.now() },
      }),
      reconcile,
    })

    const response = await handler(webhookRequest())

    expect(response.status).toBe(400)
    expect(reconcile).not.toHaveBeenCalled()
  })

  it("requires the provider event identifier before processing", async () => {
    const verify = vi.fn()
    const reconcile = vi.fn()
    const handler = createClerkWebhookPostHandler({ verify, reconcile })

    const response = await handler(webhookRequest(false))

    expect(response.status).toBe(400)
    expect(verify).not.toHaveBeenCalled()
    expect(reconcile).not.toHaveBeenCalled()
  })
})

```