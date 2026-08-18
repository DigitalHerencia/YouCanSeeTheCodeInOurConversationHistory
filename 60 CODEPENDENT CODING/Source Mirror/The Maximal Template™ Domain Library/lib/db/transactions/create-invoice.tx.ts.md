---
title: 'The Maximal Template™ Domain Library\lib\db\transactions\create-invoice.tx.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\transactions\create-invoice.tx.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.transactions.create-invoice.tx.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\transactions\create-invoice.tx.ts'
source_file: 'create-invoice.tx.ts'
source_sha256: 'fe9176c54989e95b815a280f1f823ee8b1da1a1ade52388260ca5f399e103a2c'
generated: true
---

# `create-invoice.tx.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\transactions\create-invoice.tx.ts`
> SHA-256: `fe9176c54989e95b815a280f1f823ee8b1da1a1ade52388260ca5f399e103a2c`

```ts
import { Prisma } from "../../../generated/prisma/client";

import { invoiceSelect } from "../selects/invoicing.selects";
import { InvariantViolationError } from "./errors";
import { calculateInvoiceTotals } from "../../workflows/invoicing/calculateInvoiceTotals";

export async function createInvoiceTx(
  tx: Prisma.TransactionClient,
  input: {
    organizationId: string;
    createdByMembershipId: string;
    customerName: string;
    customerEmail?: string | null;
    currency: string;
    issuedAt?: Date | null;
    dueAt?: Date | null;
    lines: Array<{
      description: string;
      quantity: string;
      unitPrice: string;
      taxRate: string;
    }>;
  },
) {
  if (input.lines.length === 0) {
    throw new InvariantViolationError(
      "An invoice must contain at least one line.",
    );
  }

  const latest = await tx.invoice.aggregate({
    where: {
      organizationId: input.organizationId,
    },
    _max: {
      number: true,
    },
  });

  const number = (latest._max.number ?? 0) + 1;

  const calculated = calculateInvoiceTotals(input.lines);
  const lines = input.lines.map((line, index) => {
    const totals = calculated.lines[index]!;
    return {
      organizationId: input.organizationId,
      position: index + 1,
      description: line.description,
      quantity: totals.quantity,
      unitPrice: totals.unitPrice,
      taxRate: totals.taxRate,
      lineSubtotal: totals.lineSubtotal,
      lineTax: totals.lineTax,
      lineTotal: totals.lineTotal,
    };
  });

  return tx.invoice.create({
    data: {
      organizationId: input.organizationId,
      createdByMembershipId: input.createdByMembershipId,
      number,
      customerName: input.customerName,
      customerEmail: input.customerEmail ?? null,
      currency: input.currency,
      issuedAt: input.issuedAt ?? null,
      dueAt: input.dueAt ?? null,
      subtotal: calculated.subtotal,
      taxTotal: calculated.taxTotal,
      total: calculated.total,
      lines: {
        create: lines,
      },
    },
    select: invoiceSelect,
  });
}

```