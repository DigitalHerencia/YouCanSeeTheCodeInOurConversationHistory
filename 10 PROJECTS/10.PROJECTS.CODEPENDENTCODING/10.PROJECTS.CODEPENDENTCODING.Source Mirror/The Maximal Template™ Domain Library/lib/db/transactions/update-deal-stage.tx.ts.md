---
title: 'The Maximal Template™ Domain Library\lib\db\transactions\update-deal-stage.tx.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\transactions\update-deal-stage.tx.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.transactions.update-deal-stage.tx.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\transactions\update-deal-stage.tx.ts'
source_file: 'update-deal-stage.tx.ts'
source_sha256: '1173371b932b07820ea3ff1b643477249d087f71366212c362981be22a0f4f84'
generated: true
---

# `update-deal-stage.tx.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\transactions\update-deal-stage.tx.ts`
> SHA-256: `1173371b932b07820ea3ff1b643477249d087f71366212c362981be22a0f4f84`

```ts
import type { CrmDealStage, Prisma } from "../../../generated/prisma/client";

import { crmDealDetailSelect } from "../selects/crmSelects";
import { ConcurrencyConflictError } from "./errors";
import { advanceDealStage } from "../../workflows/crm/advanceDealStage";

export async function updateDealStageTx(
  tx: Prisma.TransactionClient,
  input: {
    organizationId: string;
    dealId: string;
    stage: CrmDealStage;
    expectedVersion: number;
  },
) {
  const current = await tx.crmDeal.findFirstOrThrow({
    where: { id: input.dealId, organizationId: input.organizationId },
    select: { stage: true },
  });
  const transition = advanceDealStage(current.stage, input.stage);

  const result = await tx.crmDeal.updateMany({
    where: {
      id: input.dealId,
      organizationId: input.organizationId,
      version: input.expectedVersion,
    },
    data: {
      stage: input.stage,
      closedAt: transition.terminal ? new Date() : null,
      version: {
        increment: 1,
      },
    },
  });

  if (result.count !== 1) {
    throw new ConcurrencyConflictError("CRM deal");
  }

  return tx.crmDeal.findFirstOrThrow({
    where: {
      id: input.dealId,
      organizationId: input.organizationId,
    },
    select: crmDealDetailSelect,
  });
}

```