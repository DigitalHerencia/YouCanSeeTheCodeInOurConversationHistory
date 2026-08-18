---
title: 'The Maximal Template™ Domain Library\lib\workflows\invoicing\calculateInvoiceTotals.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\workflows\invoicing\calculateInvoiceTotals.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.workflows.invoicing.calculateinvoicetotals.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\workflows\invoicing\calculateInvoiceTotals.ts'
source_file: 'calculateInvoiceTotals.ts'
source_sha256: '617611792fa9ae4ecf5460bd9514e1bf97deb0378ef83155a7ae97ab949068e3'
generated: true
---

# `calculateInvoiceTotals.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\workflows\invoicing\calculateInvoiceTotals.ts`
> SHA-256: `617611792fa9ae4ecf5460bd9514e1bf97deb0378ef83155a7ae97ab949068e3`

```ts
import { Prisma } from "../../../generated/prisma/client";

import { calculateTaxes } from "./calculateTaxes";

export function calculateInvoiceTotals(
  lines: Array<{ quantity: string; unitPrice: string; taxRate: string }>,
) {
  let subtotal = new Prisma.Decimal(0);
  let taxTotal = new Prisma.Decimal(0);
  const calculatedLines = lines.map((line) => {
    const quantity = new Prisma.Decimal(line.quantity);
    const unitPrice = new Prisma.Decimal(line.unitPrice);
    if (quantity.lessThanOrEqualTo(0) || unitPrice.isNegative())
      throw new Error("Invoice line amounts are invalid.");
    const lineSubtotal = quantity.mul(unitPrice).toDecimalPlaces(4);
    const lineTax = calculateTaxes(lineSubtotal, line.taxRate);
    const lineTotal = lineSubtotal.add(lineTax);
    subtotal = subtotal.add(lineSubtotal);
    taxTotal = taxTotal.add(lineTax);
    return {
      quantity,
      unitPrice,
      taxRate: new Prisma.Decimal(line.taxRate),
      lineSubtotal,
      lineTax,
      lineTotal,
    };
  });
  return {
    lines: calculatedLines,
    subtotal,
    taxTotal,
    total: subtotal.add(taxTotal),
  };
}

```