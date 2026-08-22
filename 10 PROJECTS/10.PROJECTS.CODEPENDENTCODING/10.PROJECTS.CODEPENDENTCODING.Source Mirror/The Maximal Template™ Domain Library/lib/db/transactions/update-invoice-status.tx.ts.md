---
title: 'The Maximal Template™ Domain Library\lib\db\transactions\update-invoice-status.tx.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\transactions\update-invoice-status.tx.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.transactions.update-invoice-status.tx.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\transactions\update-invoice-status.tx.ts'
source_file: 'update-invoice-status.tx.ts'
source_sha256: 'bf0afd0f57fded96fffad317d6a8521ea83460915997259d561646c9377a0a46'
generated: true
---

# `update-invoice-status.tx.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\transactions\update-invoice-status.tx.ts`
> SHA-256: `bf0afd0f57fded96fffad317d6a8521ea83460915997259d561646c9377a0a46`

```ts
import type { InvoiceStatus, Prisma } from "../../../generated/prisma/client";

import { invoiceSelect } from "../selects/invoicing.selects";
import { ConcurrencyConflictError } from "./errors";

export async function updateInvoiceStatusTx(
  tx: Prisma.TransactionClient,
  input: {
    organizationId: string;
    invoiceId: string;
    status: InvoiceStatus;
    expectedVersion: number;
  },
) {
  const result = await tx.invoice.updateMany({
    where: {
      id: input.invoiceId,
      organizationId: input.organizationId,
      version: input.expectedVersion,
    },
    data: {
      status: input.status,
      paidAt: input.status === "PAID" ? new Date() : null,
      version: {
        increment: 1,
      },
    },
  });

  if (result.count !== 1) {
    throw new ConcurrencyConflictError("Invoice");
  }

  return tx.invoice.findFirstOrThrow({
    where: {
      id: input.invoiceId,
      organizationId: input.organizationId,
    },
    select: invoiceSelect,
  });
}

```