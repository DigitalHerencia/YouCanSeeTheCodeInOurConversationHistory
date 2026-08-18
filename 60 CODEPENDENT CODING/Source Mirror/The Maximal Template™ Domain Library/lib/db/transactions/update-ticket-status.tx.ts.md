---
title: 'The Maximal Template™ Domain Library\lib\db\transactions\update-ticket-status.tx.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\transactions\update-ticket-status.tx.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.transactions.update-ticket-status.tx.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\transactions\update-ticket-status.tx.ts'
source_file: 'update-ticket-status.tx.ts'
source_sha256: '30e232f6df813b481d4c87e49ec633c56538760d38d34f68134a11e4820de5e0'
generated: true
---

# `update-ticket-status.tx.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\transactions\update-ticket-status.tx.ts`
> SHA-256: `30e232f6df813b481d4c87e49ec633c56538760d38d34f68134a11e4820de5e0`

```ts
import type { Prisma, TicketStatus } from "../../../generated/prisma/client";

import { supportTicketSelect } from "../selects/support.selects";
import { ConcurrencyConflictError } from "./errors";

export async function updateTicketStatusTx(
  tx: Prisma.TransactionClient,
  input: {
    organizationId: string;
    ticketId: string;
    status: TicketStatus;
    expectedVersion: number;
  },
) {
  const now = new Date();

  const result = await tx.supportTicket.updateMany({
    where: {
      id: input.ticketId,
      organizationId: input.organizationId,
      version: input.expectedVersion,
    },
    data: {
      status: input.status,
      resolvedAt:
        input.status === "RESOLVED" || input.status === "CLOSED" ? now : null,
      closedAt: input.status === "CLOSED" ? now : null,
      version: {
        increment: 1,
      },
    },
  });

  if (result.count !== 1) {
    throw new ConcurrencyConflictError("Support ticket");
  }

  return tx.supportTicket.findFirstOrThrow({
    where: {
      id: input.ticketId,
      organizationId: input.organizationId,
    },
    select: supportTicketSelect,
  });
}

```