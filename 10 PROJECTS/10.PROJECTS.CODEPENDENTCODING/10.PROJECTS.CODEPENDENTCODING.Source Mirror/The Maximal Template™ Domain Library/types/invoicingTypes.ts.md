---
title: 'The Maximal Template™ Domain Library\types\invoicingTypes.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\types\invoicingTypes.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.types.invoicingtypes.ts'
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
source_path: 'The Maximal Template™ Domain Library\types\invoicingTypes.ts'
source_file: 'invoicingTypes.ts'
source_sha256: 'c4ee98c549dd15272f16c4ee980f32011b4406398eb57ff076d230859f47e175'
generated: true
---

# `invoicingTypes.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\types\invoicingTypes.ts`
> SHA-256: `c4ee98c549dd15272f16c4ee980f32011b4406398eb57ff076d230859f47e175`

```ts
export interface InvoiceLineDTO {
  id: string;
  position: number;
  description: string;
  quantity: string;
  unitPrice: string;
  taxRate: string;
  lineSubtotal: string;
  lineTax: string;
  lineTotal: string;
}
export interface InvoiceDTO {
  id: string;
  number: number;
  customerName: string;
  customerEmail: string | null;
  currency: string;
  subtotal: string;
  taxTotal: string;
  total: string;
  status: string;
  issuedAt: string | null;
  dueAt: string | null;
  paidAt: string | null;
  version: number;
  lines: InvoiceLineDTO[];
  createdAt: string;
  updatedAt: string;
}
export interface ExpenseDTO {
  id: string;
  vendor: string;
  description: string | null;
  amount: string;
  currency: string;
  incurredAt: string;
  status: string;
  submitter: string | null;
}

```