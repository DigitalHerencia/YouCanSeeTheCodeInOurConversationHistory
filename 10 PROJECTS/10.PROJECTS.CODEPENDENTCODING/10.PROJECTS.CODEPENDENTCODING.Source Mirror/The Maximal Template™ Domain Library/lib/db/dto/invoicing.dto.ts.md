---
title: 'The Maximal Template™ Domain Library\lib\db\dto\invoicing.dto.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\dto\invoicing.dto.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.dto.invoicing.dto.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\dto\invoicing.dto.ts'
source_file: 'invoicing.dto.ts'
source_sha256: '065c542928d6a4997cce96952430c5c61176ae18688b7d3d76b493d91fc35b22'
generated: true
---

# `invoicing.dto.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\dto\invoicing.dto.ts`
> SHA-256: `065c542928d6a4997cce96952430c5c61176ae18688b7d3d76b493d91fc35b22`

```ts
import type { ExpenseDTO, InvoiceDTO } from "../../../types/invoicingTypes";
import type {
  ExpenseRecord,
  InvoiceRecord,
} from "../selects/invoicing.selects";

export function toExpenseDTO(record: ExpenseRecord): ExpenseDTO {
  return {
    id: record.id,
    vendor: record.vendor,
    description: record.description,
    amount: record.amount.toString(),
    currency: record.currency,
    incurredAt: record.incurredAt.toISOString(),
    status: record.status,
    submitter: record.submittedBy?.user.displayName ?? null,
  };
}

export function toInvoiceDTO(record: InvoiceRecord): InvoiceDTO {
  return {
    id: record.id,
    number: record.number,
    customerName: record.customerName,
    customerEmail: record.customerEmail,
    currency: record.currency,
    subtotal: record.subtotal.toString(),
    taxTotal: record.taxTotal.toString(),
    total: record.total.toString(),
    status: record.status,
    issuedAt: record.issuedAt?.toISOString() ?? null,
    dueAt: record.dueAt?.toISOString() ?? null,
    paidAt: record.paidAt?.toISOString() ?? null,
    version: record.version,
    lines: record.lines.map((line) => ({
      id: line.id,
      position: line.position,
      description: line.description,
      quantity: line.quantity.toString(),
      unitPrice: line.unitPrice.toString(),
      taxRate: line.taxRate.toString(),
      lineSubtotal: line.lineSubtotal.toString(),
      lineTax: line.lineTax.toString(),
      lineTotal: line.lineTotal.toString(),
    })),
    createdAt: record.createdAt.toISOString(),
    updatedAt: record.updatedAt.toISOString(),
  };
}

```