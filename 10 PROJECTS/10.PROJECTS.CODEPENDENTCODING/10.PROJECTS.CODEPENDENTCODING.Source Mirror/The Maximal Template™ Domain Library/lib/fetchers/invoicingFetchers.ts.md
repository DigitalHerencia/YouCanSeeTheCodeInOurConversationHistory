---
title: 'The Maximal Template™ Domain Library\lib\fetchers\invoicingFetchers.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\fetchers\invoicingFetchers.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.fetchers.invoicingfetchers.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\fetchers\invoicingFetchers.ts'
source_file: 'invoicingFetchers.ts'
source_sha256: 'bb41fdbbd08b0fff5d5aaaa75afbff10b76e3cec0cdccf62b98b3ebf47917d0d'
generated: true
---

# `invoicingFetchers.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\fetchers\invoicingFetchers.ts`
> SHA-256: `bb41fdbbd08b0fff5d5aaaa75afbff10b76e3cec0cdccf62b98b3ebf47917d0d`

```ts
import "server-only";

import { assertPermission } from "../authz/permissions";
import { toExpenseDTO, toInvoiceDTO } from "../db/dto/invoicing.dto";
import { expenseSelect, invoiceSelect } from "../db/selects/invoicing.selects";
import { withTemplateReadTransaction } from "../db/tenant";

export async function getInvoices(limit = 50) {
  return withTemplateReadTransaction(async (tx, access) => {
    assertPermission(access, "invoicing:read");

    const rows = await tx.invoice.findMany({
      where: {
        organizationId: access.organizationId,
      },
      orderBy: {
        createdAt: "desc",
      },
      take: Math.min(Math.max(limit, 1), 100),
      select: invoiceSelect,
    });

    return rows.map(toInvoiceDTO);
  });
}

export async function getInvoice(invoiceId: string) {
  return withTemplateReadTransaction(async (tx, access) => {
    assertPermission(access, "invoicing:read");

    const record = await tx.invoice.findFirst({
      where: {
        id: invoiceId,
        organizationId: access.organizationId,
      },
      select: invoiceSelect,
    });

    return record ? toInvoiceDTO(record) : null;
  });
}

export async function getExpenses(limit = 100) {
  return withTemplateReadTransaction(async (tx, access) => {
    assertPermission(access, "invoicing:read");
    const rows = await tx.expense.findMany({
      where: { organizationId: access.organizationId },
      orderBy: { incurredAt: "desc" },
      take: Math.min(Math.max(limit, 1), 200),
      select: expenseSelect,
    });
    return rows.map(toExpenseDTO);
  });
}

```