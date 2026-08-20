---
title: 'The Hipster Stack™ Technology Stack\template\lib\webhooks\clerkWebhookWorkflow.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\webhooks\clerkWebhookWorkflow.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.webhooks.clerkwebhookworkflow.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\webhooks\clerkWebhookWorkflow.ts'
source_file: 'clerkWebhookWorkflow.ts'
source_sha256: '56bced285b135b50321c8fc009a915856465be9a600c99db170fa1f4707ec29c'
generated: true
---

# `clerkWebhookWorkflow.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\webhooks\clerkWebhookWorkflow.ts`
> SHA-256: `56bced285b135b50321c8fc009a915856465be9a600c99db170fa1f4707ec29c`

```ts
import "server-only"

import { getPrisma } from "@/lib/db/prisma"
import {
  claimProviderWebhookEvent,
  finalizeIgnoredWebhookTx,
  markWebhookFailed,
  processClerkUserWebhookTx,
} from "@/lib/db/transactions/webhookTransactions"
import type { PrismaClient } from "@/prisma/generated/prisma/client"
import type { NormalizedClerkEvent, WebhookProcessingResult } from "@/types/webhookTypes"

const DEFAULT_STALE_AFTER_MS = 5 * 60 * 1000

type WorkflowOptions = {
  prisma?: PrismaClient
  now?: Date
  staleAfterMs?: number
}

export async function reconcileClerkWebhook(
  event: NormalizedClerkEvent,
  options: WorkflowOptions = {}
): Promise<WebhookProcessingResult> {
  const prisma = options.prisma ?? getPrisma()
  const now = options.now ?? new Date()
  const claim = await claimProviderWebhookEvent(
    prisma,
    event,
    now,
    options.staleAfterMs ?? DEFAULT_STALE_AFTER_MS
  )

  if (claim.kind === "terminal") return { ok: true, status: "duplicate" }
  if (claim.kind === "processing") return { ok: true, status: "processing" }

  try {
    const finalStatus = await prisma.$transaction(async (tx) => {
      if (event.disposition === "ignore") {
        await finalizeIgnoredWebhookTx(tx, claim, now)
        return "ignored" as const
      } else {
        return processClerkUserWebhookTx(tx, event, claim, now)
      }
    })
    return { ok: true, status: finalStatus }
  } catch {
    await markWebhookFailed(prisma, claim)
    return { ok: false, status: "failed" }
  }
}

```