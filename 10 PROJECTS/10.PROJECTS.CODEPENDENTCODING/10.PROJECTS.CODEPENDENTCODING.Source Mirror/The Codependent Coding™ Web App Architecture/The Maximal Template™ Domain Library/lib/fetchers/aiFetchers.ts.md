---
title: 'The Maximal Template™ Domain Library\lib\fetchers\aiFetchers.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\fetchers\aiFetchers.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.fetchers.aifetchers.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\fetchers\aiFetchers.ts'
source_file: 'aiFetchers.ts'
source_sha256: '578dd208f34229387bab0b330d87ac4b63c3d1e9e001e5c970925d27bba72c34'
generated: true
---

# `aiFetchers.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\fetchers\aiFetchers.ts`
> SHA-256: `578dd208f34229387bab0b330d87ac4b63c3d1e9e001e5c970925d27bba72c34`

```ts
import "server-only";

import { Prisma } from "../../generated/prisma/client";

import { assertPermission } from "../authz/permissions";
import { toAiGenerationDTO, toAiUsageSummaryDTO } from "../db/dto/ai.dto";
import { aiGenerationSelect } from "../db/selects/ai.selects";
import { withTemplateReadTransaction } from "../db/tenant";

export async function getMyAiGenerations(limit = 50) {
  return withTemplateReadTransaction(async (tx, access) => {
    assertPermission(access, "ai:read");

    const rows = await tx.aiGeneration.findMany({
      where: {
        organizationId: access.organizationId,
        userId: access.userId,
      },
      orderBy: {
        createdAt: "desc",
      },
      take: Math.min(Math.max(limit, 1), 100),
      select: aiGenerationSelect,
    });

    return rows.map(toAiGenerationDTO);
  });
}

export async function getMyAiUsage() {
  return withTemplateReadTransaction(async (tx, access) => {
    assertPermission(access, "ai:read");

    const aggregate = await tx.aiUsageLedger.aggregate({
      where: {
        organizationId: access.organizationId,
        userId: access.userId,
      },
      _sum: {
        inputTokens: true,
        outputTokens: true,
        cost: true,
      },
      _count: {
        _all: true,
      },
    });

    return toAiUsageSummaryDTO({
      inputTokens: aggregate._sum.inputTokens ?? 0,
      outputTokens: aggregate._sum.outputTokens ?? 0,
      cost: aggregate._sum.cost?.toString() ?? new Prisma.Decimal(0).toString(),
      generationCount: aggregate._count._all,
    });
  });
}

```