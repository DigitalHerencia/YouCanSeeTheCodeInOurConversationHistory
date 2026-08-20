---
title: 'The Hipster Stack™ Technology Stack\template\app\api\cloudinary\webhooks\route.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\api\cloudinary\webhooks\route.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.api.cloudinary.webhooks.route.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\api\cloudinary\webhooks\route.ts'
source_file: 'route.ts'
source_sha256: '2017ca8267fad1bc72ec5268a03a149ac334435e9da8314ad8a67360b58605c1'
generated: true
---

# `route.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\api\cloudinary\webhooks\route.ts`
> SHA-256: `2017ca8267fad1bc72ec5268a03a149ac334435e9da8314ad8a67360b58605c1`

```ts
import { NextResponse } from "next/server"

import { getOptionalEnv } from "@/lib/env"
import { verifyCloudinaryNotification } from "@/lib/integrations/cloudinary/signatures"
import { reconcileCloudinaryWebhook } from "@/lib/webhooks/cloudinaryWebhookWorkflow"
import { cloudinaryNotificationSchema } from "@/schemas/capabilitySchemas"

export async function POST(request: Request) {
  const apiSecret = getOptionalEnv("CLOUDINARY_API_SECRET")
  const signature = request.headers.get("x-cld-signature")
  const timestamp = request.headers.get("x-cld-timestamp")
  if (!apiSecret) return NextResponse.json({ error: "Webhook is not configured." }, { status: 503 })
  if (!signature || !timestamp)
    return NextResponse.json({ error: "Invalid webhook request." }, { status: 400 })
  const rawBody = await request.text()
  const algorithm =
    getOptionalEnv("CLOUDINARY_SIGNATURE_ALGORITHM") === "sha256" ? "sha256" : "sha1"
  if (!verifyCloudinaryNotification({ rawBody, timestamp, signature, apiSecret, algorithm })) {
    return NextResponse.json({ error: "Invalid webhook request." }, { status: 400 })
  }
  let payload: unknown
  try {
    payload = JSON.parse(rawBody) as unknown
  } catch {
    return NextResponse.json({ error: "Malformed webhook payload." }, { status: 400 })
  }
  const parsed = cloudinaryNotificationSchema.safeParse(payload)
  if (!parsed.success)
    return NextResponse.json({ error: "Malformed webhook payload." }, { status: 400 })
  const result = await reconcileCloudinaryWebhook(parsed.data, { providerEventId: signature })
  return NextResponse.json(result, { status: result.ok ? 200 : 500 })
}

```