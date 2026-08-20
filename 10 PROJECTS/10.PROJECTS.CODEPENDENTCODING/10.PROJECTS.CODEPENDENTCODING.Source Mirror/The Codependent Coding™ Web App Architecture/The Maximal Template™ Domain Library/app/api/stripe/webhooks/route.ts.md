---
title: 'The Hipster Stack™ Technology Stack\template\app\api\stripe\webhooks\route.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\api\stripe\webhooks\route.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.api.stripe.webhooks.route.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\api\stripe\webhooks\route.ts'
source_file: 'route.ts'
source_sha256: '3b682b6acd21a30a6f530eecdb76a088d29117dd6368902c4221aad7c9125d74'
generated: true
---

# `route.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\api\stripe\webhooks\route.ts`
> SHA-256: `3b682b6acd21a30a6f530eecdb76a088d29117dd6368902c4221aad7c9125d74`

```ts
import { NextResponse } from "next/server"

import { getOptionalEnv } from "@/lib/env"
import { constructStripeWebhookEvent } from "@/lib/integrations/stripe/billing"
import { mapVerifiedStripeWebhook } from "@/lib/integrations/stripe/webhooks"
import { reconcileStripeWebhook } from "@/lib/webhooks/stripeWebhookWorkflow"

type HandlerDependencies = {
  verify: (payload: string, signature: string, secret: string) => unknown
  reconcile: typeof reconcileStripeWebhook
}

export function createStripeWebhookPostHandler(dependencies: HandlerDependencies) {
  return async function stripeWebhookPost(request: Request) {
    const secret = getOptionalEnv("STRIPE_WEBHOOK_SECRET")
    const signature = request.headers.get("stripe-signature")
    if (!secret) return NextResponse.json({ error: "Webhook is not configured." }, { status: 503 })
    if (!signature) return NextResponse.json({ error: "Invalid webhook request." }, { status: 400 })

    let verified: unknown
    try {
      verified = dependencies.verify(await request.text(), signature, secret)
    } catch {
      return NextResponse.json({ error: "Invalid webhook request." }, { status: 400 })
    }

    const mapped = mapVerifiedStripeWebhook(verified)
    if (!mapped.ok) {
      return NextResponse.json({ error: "Malformed webhook payload." }, { status: 400 })
    }
    const result = await dependencies.reconcile(mapped.event)
    return NextResponse.json(result, { status: result.ok ? 200 : 500 })
  }
}

export const POST = createStripeWebhookPostHandler({
  verify: constructStripeWebhookEvent,
  reconcile: reconcileStripeWebhook,
})

```