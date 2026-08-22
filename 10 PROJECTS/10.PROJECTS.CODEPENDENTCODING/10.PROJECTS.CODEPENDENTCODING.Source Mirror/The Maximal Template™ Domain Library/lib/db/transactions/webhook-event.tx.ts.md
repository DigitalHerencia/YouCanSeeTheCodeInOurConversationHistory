---
title: 'The Maximal Template™ Domain Library\lib\db\transactions\webhook-event.tx.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\transactions\webhook-event.tx.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.transactions.webhook-event.tx.ts'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-maximal-template-domain-library
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Maximal Template™ Domain Library\lib\db\transactions\webhook-event.tx.ts'
source_file: 'webhook-event.tx.ts'
source_sha256: 'abd96566ba1158a8ed19046b5e5757026b1f500b151f06da37394cd2ce9ebf28'
generated: true
---

# `webhook-event.tx.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\transactions\webhook-event.tx.ts`
> SHA-256: `abd96566ba1158a8ed19046b5e5757026b1f500b151f06da37394cd2ce9ebf28`

```ts
import { createHash } from "node:crypto";

import type { Prisma } from "../../../generated/prisma/client";

export function hashWebhookPayload(payload: string) {
  return createHash("sha256").update(payload).digest("hex");
}

export async function claimWebhookEventTx(
  tx: Prisma.TransactionClient,
  input: {
    provider: string;
    eventId: string;
    type: string;
    payload: string;
    organizationId?: string | null;
  },
) {
  const inserted = await tx.$queryRaw<Array<{ id: string }>>`
    INSERT INTO "WebhookEvent" ("id", "organizationId", "provider", "eventId", "type", "status", "payloadHash", "receivedAt")
    VALUES (gen_random_uuid(), ${input.organizationId ?? null}::uuid, ${input.provider}, ${input.eventId}, ${input.type}, 'PROCESSING', ${hashWebhookPayload(input.payload)}, now())
    ON CONFLICT ("provider", "eventId") DO NOTHING
    RETURNING "id"
  `;
  return inserted[0]?.id ?? null;
}

export function completeWebhookEventTx(
  tx: Prisma.TransactionClient,
  webhookEventId: string,
) {
  return tx.webhookEvent.update({
    where: { id: webhookEventId },
    data: { status: "PROCESSED", processedAt: new Date(), errorCode: null },
  });
}

export function failWebhookEventTx(
  tx: Prisma.TransactionClient,
  webhookEventId: string,
  errorCode: string,
) {
  return tx.webhookEvent.update({
    where: { id: webhookEventId },
    data: {
      status: "FAILED",
      processedAt: new Date(),
      errorCode: errorCode.slice(0, 255),
    },
  });
}

```