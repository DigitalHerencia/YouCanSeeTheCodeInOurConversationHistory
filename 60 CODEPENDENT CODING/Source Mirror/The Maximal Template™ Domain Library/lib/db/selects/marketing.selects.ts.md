---
title: 'The Maximal Template™ Domain Library\lib\db\selects\marketing.selects.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\selects\marketing.selects.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.selects.marketing.selects.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\selects\marketing.selects.ts'
source_file: 'marketing.selects.ts'
source_sha256: '10bac257b459818aebb6ac5a23ccd0dbd6e6bb24bf65b31360eb84627b24dca3'
generated: true
---

# `marketing.selects.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\selects\marketing.selects.ts`
> SHA-256: `10bac257b459818aebb6ac5a23ccd0dbd6e6bb24bf65b31360eb84627b24dca3`

```ts
import type { Prisma } from "../../../generated/prisma/client";

export const campaignSelect = {
  id: true,
  name: true,
  description: true,
  status: true,
  scheduledAt: true,
  startedAt: true,
  completedAt: true,
  version: true,
  audience: {
    select: {
      id: true,
      name: true,
    },
  },
  _count: {
    select: {
      steps: true,
    },
  },
  createdAt: true,
  updatedAt: true,
} satisfies Prisma.CampaignSelect;

export type CampaignRecord = Prisma.CampaignGetPayload<{
  select: typeof campaignSelect;
}>;

export const audienceSelect = {
  id: true,
  name: true,
  status: true,
  createdAt: true,
  updatedAt: true,
} satisfies Prisma.AudienceSelect;

export type AudienceRecord = Prisma.AudienceGetPayload<{
  select: typeof audienceSelect;
}>;

```