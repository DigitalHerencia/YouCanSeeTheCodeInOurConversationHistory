---
title: 'The Hipster Stack™ Technology Stack\template\app\api\clerk\webhooks\route.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\api\clerk\webhooks\route.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.api.clerk.webhooks.route.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\api\clerk\webhooks\route.ts'
source_file: 'route.ts'
source_sha256: '90054bfa752e662a7410cf44f6039f9d8755abd2e6fa644285645f2d52c4ac6f'
generated: true
---

# `route.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\api\clerk\webhooks\route.ts`
> SHA-256: `90054bfa752e662a7410cf44f6039f9d8755abd2e6fa644285645f2d52c4ac6f`

```ts
import { verifyWebhook } from "@clerk/nextjs/webhooks"
import { NextRequest, NextResponse } from "next/server"

import { getOptionalEnv } from "@/lib/env"
import { mapVerifiedClerkWebhook } from "@/lib/integrations/clerk/webhooks"
import { reconcileClerkWebhook } from "@/lib/webhooks/clerkWebhookWorkflow"

type HandlerDependencies = {
  verify: (request: NextRequest, options: { signingSecret: string }) => Promise<unknown>
  reconcile: typeof reconcileClerkWebhook
}

export function createClerkWebhookPostHandler(dependencies: HandlerDependencies) {
  return async function clerkWebhookPost(request: NextRequest) {
    const secret = getOptionalEnv("CLERK_WEBHOOK_SIGNING_SECRET")

    if (!secret) {
      return NextResponse.json({ error: "Webhook is not configured." }, { status: 503 })
    }

    const providerEventId = request.headers.get("svix-id")
    if (!providerEventId || providerEventId.length > 255) {
      return NextResponse.json({ error: "Invalid webhook request." }, { status: 400 })
    }

    let verifiedEvent: unknown
    try {
      verifiedEvent = await dependencies.verify(request, { signingSecret: secret })
    } catch {
      return NextResponse.json({ error: "Invalid webhook request." }, { status: 400 })
    }

    const mapped = mapVerifiedClerkWebhook(verifiedEvent, providerEventId)
    if (!mapped.ok) {
      return NextResponse.json({ error: "Malformed webhook payload." }, { status: 400 })
    }

    const result = await dependencies.reconcile(mapped.event)
    return NextResponse.json(result, { status: result.ok ? 200 : 500 })
  }
}

export const POST = createClerkWebhookPostHandler({
  verify: verifyWebhook,
  reconcile: reconcileClerkWebhook,
})

```