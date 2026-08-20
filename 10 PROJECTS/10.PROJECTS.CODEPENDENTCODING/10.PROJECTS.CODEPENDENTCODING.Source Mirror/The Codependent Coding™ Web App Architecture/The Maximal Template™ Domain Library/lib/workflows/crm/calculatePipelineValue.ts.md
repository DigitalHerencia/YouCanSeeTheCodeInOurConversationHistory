---
title: 'The Maximal Template™ Domain Library\lib\workflows\crm\calculatePipelineValue.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\workflows\crm\calculatePipelineValue.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.workflows.crm.calculatepipelinevalue.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\workflows\crm\calculatePipelineValue.ts'
source_file: 'calculatePipelineValue.ts'
source_sha256: '5b1b6e384f5a6b4ba7a439b3ec5799f746bb6c54dd8e63d81434cf4b4b373352'
generated: true
---

# `calculatePipelineValue.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\workflows\crm\calculatePipelineValue.ts`
> SHA-256: `5b1b6e384f5a6b4ba7a439b3ec5799f746bb6c54dd8e63d81434cf4b4b373352`

```ts
import { Prisma } from "../../../generated/prisma/client";

export function calculatePipelineValue(
  deals: Array<{ value: string; probability: number; stage: string }>,
) {
  return deals
    .reduce(
      (total, deal) =>
        deal.stage === "LOST"
          ? total
          : total.add(
              new Prisma.Decimal(deal.value).mul(deal.probability).div(100),
            ),
      new Prisma.Decimal(0),
    )
    .toString();
}

```