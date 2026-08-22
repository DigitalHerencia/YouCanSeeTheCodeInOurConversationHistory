---
title: 'The Maximal Template™ Domain Library\lib\db\selects\invoicing.selects.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\selects\invoicing.selects.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.selects.invoicing.selects.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\selects\invoicing.selects.ts'
source_file: 'invoicing.selects.ts'
source_sha256: 'a6729b0c8393f93de147e326f4a6538b807e697bbf39a72cc96fe1a6a3595895'
generated: true
---

# `invoicing.selects.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\selects\invoicing.selects.ts`
> SHA-256: `a6729b0c8393f93de147e326f4a6538b807e697bbf39a72cc96fe1a6a3595895`

```ts
import type { Prisma } from "../../../generated/prisma/client";

export const invoiceSelect = {
  id: true,
  number: true,
  customerName: true,
  customerEmail: true,
  currency: true,
  subtotal: true,
  taxTotal: true,
  total: true,
  status: true,
  issuedAt: true,
  dueAt: true,
  paidAt: true,
  version: true,
  lines: {
    orderBy: {
      position: "asc",
    },
    select: {
      id: true,
      position: true,
      description: true,
      quantity: true,
      unitPrice: true,
      taxRate: true,
      lineSubtotal: true,
      lineTax: true,
      lineTotal: true,
    },
  },
  createdAt: true,
  updatedAt: true,
} satisfies Prisma.InvoiceSelect;

export type InvoiceRecord = Prisma.InvoiceGetPayload<{
  select: typeof invoiceSelect;
}>;

export const expenseSelect = {
  id: true,
  vendor: true,
  description: true,
  amount: true,
  currency: true,
  incurredAt: true,
  status: true,
  submittedBy: { select: { user: { select: { displayName: true } } } },
} satisfies Prisma.ExpenseSelect;

export type ExpenseRecord = Prisma.ExpenseGetPayload<{
  select: typeof expenseSelect;
}>;

```