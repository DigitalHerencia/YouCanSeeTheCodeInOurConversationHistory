---
title: 'The Maximal Template™ Domain Library\lib\workflows\invoicing\calculateTaxes.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\workflows\invoicing\calculateTaxes.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.workflows.invoicing.calculatetaxes.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\workflows\invoicing\calculateTaxes.ts'
source_file: 'calculateTaxes.ts'
source_sha256: '036e4defd3f27d532be930f3f38d56459bf4cd54f7b8e58bc2aa5de2416e0720'
generated: true
---

# `calculateTaxes.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\workflows\invoicing\calculateTaxes.ts`
> SHA-256: `036e4defd3f27d532be930f3f38d56459bf4cd54f7b8e58bc2aa5de2416e0720`

```ts
import { Prisma } from "../../../generated/prisma/client";

export function calculateTaxes(
  subtotal: string | Prisma.Decimal,
  taxRate: string | Prisma.Decimal,
) {
  const amount = new Prisma.Decimal(subtotal);
  const rate = new Prisma.Decimal(taxRate);
  if (amount.isNegative() || rate.isNegative() || rate.greaterThan(1))
    throw new Error("Invoice tax inputs are invalid.");
  return amount.mul(rate).toDecimalPlaces(4);
}

```