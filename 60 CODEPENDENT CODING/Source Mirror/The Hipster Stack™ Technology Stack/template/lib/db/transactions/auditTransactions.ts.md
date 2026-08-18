---
title: 'The Hipster Stack™ Technology Stack\template\lib\db\transactions\auditTransactions.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\db\transactions\auditTransactions.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.db.transactions.audittransactions.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\db\transactions\auditTransactions.ts'
source_file: 'auditTransactions.ts'
source_sha256: '399c54d1068d1ff530d5e268a6a534123b937570a94f5178b214d9a4afec0fba'
generated: true
---

# `auditTransactions.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\db\transactions\auditTransactions.ts`
> SHA-256: `399c54d1068d1ff530d5e268a6a534123b937570a94f5178b214d9a4afec0fba`

```ts
import "server-only"

import type { Prisma } from "@/prisma/generated/prisma/client"

import type { BoundedAuditEvent } from "@/types/auditTypes"

export function recordAuditEventTx(tx: Prisma.TransactionClient, event: BoundedAuditEvent) {
  return tx.auditEvent.create({
    data: {
      ...event,
      actorType: "user",
    },
  })
}

```