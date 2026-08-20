---
title: 'The Maximal Template™ Domain Library\lib\db\transactions\idempotency.tx.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\transactions\idempotency.tx.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.transactions.idempotency.tx.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\transactions\idempotency.tx.ts'
source_file: 'idempotency.tx.ts'
source_sha256: '037defe5c76023a252fc306106b9d6f3b036fd51f3d012ca1e6863ea3fba4cbe'
generated: true
---

# `idempotency.tx.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\transactions\idempotency.tx.ts`
> SHA-256: `037defe5c76023a252fc306106b9d6f3b036fd51f3d012ca1e6863ea3fba4cbe`

```ts
import type { Prisma } from "../../../generated/prisma/client";

export async function claimIdempotencyTx(
  tx: Prisma.TransactionClient,
  input: {
    organizationId?: string | null;
    scope: string;
    key: string;
  },
) {
  return tx.idempotencyRecord.upsert({
    where: {
      scope_key: {
        scope: input.scope,
        key: input.key,
      },
    },
    update: {},
    create: {
      organizationId: input.organizationId ?? null,
      scope: input.scope,
      key: input.key,
      state: "STARTED",
    },
    select: {
      id: true,
      organizationId: true,
      scope: true,
      key: true,
      state: true,
      result: true,
      errorCode: true,
      completedAt: true,
    },
  });
}

export async function completeIdempotencyTx(
  tx: Prisma.TransactionClient,
  input: {
    id: string;
    result?: Prisma.InputJsonValue;
  },
): Promise<void> {
  await tx.idempotencyRecord.update({
    where: {
      id: input.id,
    },
    data: {
      state: "COMPLETED",
      result: input.result,
      completedAt: new Date(),
      errorCode: null,
    },
  });
}

```