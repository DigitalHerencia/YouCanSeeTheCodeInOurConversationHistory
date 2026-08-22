---
title: 'The Maximal Template™ Domain Library\lib\fetchers\marketingFetchers.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\fetchers\marketingFetchers.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.fetchers.marketingfetchers.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\fetchers\marketingFetchers.ts'
source_file: 'marketingFetchers.ts'
source_sha256: 'c00e6096adfbd358a1e58cfbf05a22673f8051abcf896cd54f9f8cf8f1877fbf'
generated: true
---

# `marketingFetchers.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\fetchers\marketingFetchers.ts`
> SHA-256: `c00e6096adfbd358a1e58cfbf05a22673f8051abcf896cd54f9f8cf8f1877fbf`

```ts
import "server-only";

import { assertPermission } from "../authz/permissions";
import { toAudienceDTO, toCampaignDTO } from "../db/dto/marketing.dto";
import {
  audienceSelect,
  campaignSelect,
} from "../db/selects/marketing.selects";
import { withTemplateReadTransaction } from "../db/tenant";

export async function getCampaigns(limit = 50) {
  return withTemplateReadTransaction(async (tx, access) => {
    assertPermission(access, "marketing:read");

    const rows = await tx.campaign.findMany({
      where: {
        organizationId: access.organizationId,
      },
      orderBy: {
        updatedAt: "desc",
      },
      take: Math.min(Math.max(limit, 1), 100),
      select: campaignSelect,
    });

    return rows.map(toCampaignDTO);
  });
}

export async function getAudiences(limit = 100) {
  return withTemplateReadTransaction(async (tx, access) => {
    assertPermission(access, "marketing:read");
    const rows = await tx.audience.findMany({
      where: { organizationId: access.organizationId },
      orderBy: { updatedAt: "desc" },
      take: Math.min(Math.max(limit, 1), 200),
      select: audienceSelect,
    });
    return rows.map(toAudienceDTO);
  });
}

```