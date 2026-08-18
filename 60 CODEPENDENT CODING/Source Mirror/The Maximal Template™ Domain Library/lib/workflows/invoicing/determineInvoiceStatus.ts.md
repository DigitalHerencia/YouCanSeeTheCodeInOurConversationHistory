---
title: 'The Maximal Template™ Domain Library\lib\workflows\invoicing\determineInvoiceStatus.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\workflows\invoicing\determineInvoiceStatus.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.workflows.invoicing.determineinvoicestatus.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\workflows\invoicing\determineInvoiceStatus.ts'
source_file: 'determineInvoiceStatus.ts'
source_sha256: '4d84c331f359af6743e0723ddb23adc699bc1e90cdfbf7fdc625daa1fbfdcd2b'
generated: true
---

# `determineInvoiceStatus.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\workflows\invoicing\determineInvoiceStatus.ts`
> SHA-256: `4d84c331f359af6743e0723ddb23adc699bc1e90cdfbf7fdc625daa1fbfdcd2b`

```ts
export function determineInvoiceStatus({
  status,
  dueAt,
  paidAt,
  now = new Date(),
}: {
  status: "DRAFT" | "OPEN" | "PAID" | "VOID" | "OVERDUE";
  dueAt: Date | null;
  paidAt: Date | null;
  now?: Date;
}) {
  if (status === "VOID") return "VOID" as const;
  if (paidAt || status === "PAID") return "PAID" as const;
  if (dueAt && dueAt < now && status !== "DRAFT") return "OVERDUE" as const;
  return status === "OVERDUE" ? ("OPEN" as const) : status;
}

```