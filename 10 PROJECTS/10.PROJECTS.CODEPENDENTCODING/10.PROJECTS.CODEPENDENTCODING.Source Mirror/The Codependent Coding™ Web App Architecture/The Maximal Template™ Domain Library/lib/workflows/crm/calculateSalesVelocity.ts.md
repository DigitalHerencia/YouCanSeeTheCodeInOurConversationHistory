---
title: 'The Maximal Template™ Domain Library\lib\workflows\crm\calculateSalesVelocity.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\workflows\crm\calculateSalesVelocity.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.workflows.crm.calculatesalesvelocity.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\workflows\crm\calculateSalesVelocity.ts'
source_file: 'calculateSalesVelocity.ts'
source_sha256: '4413d876a90a6fa5fc99680f329a60256e63b4347e14540fb7efd4abd5486880'
generated: true
---

# `calculateSalesVelocity.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\workflows\crm\calculateSalesVelocity.ts`
> SHA-256: `4413d876a90a6fa5fc99680f329a60256e63b4347e14540fb7efd4abd5486880`

```ts
import { Prisma } from "../../../generated/prisma/client";

export function calculateSalesVelocity(
  wonDeals: Array<{ value: string; closedAt: Date }>,
  periodStart: Date,
  periodEnd: Date,
) {
  const days = Math.max(
    1,
    (periodEnd.getTime() - periodStart.getTime()) / 86_400_000,
  );
  const value = wonDeals
    .filter(
      (deal) => deal.closedAt >= periodStart && deal.closedAt <= periodEnd,
    )
    .reduce((sum, deal) => sum.add(deal.value), new Prisma.Decimal(0));
  return value.div(days).toDecimalPlaces(4).toString();
}

```