---
title: 'The Maximal Template™ Domain Library\lib\db\dto\marketing.dto.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\dto\marketing.dto.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.dto.marketing.dto.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\dto\marketing.dto.ts'
source_file: 'marketing.dto.ts'
source_sha256: '052937480a453419218cf32f2ac6f2326137536734b5a99b7800566cf9d0b8aa'
generated: true
---

# `marketing.dto.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\dto\marketing.dto.ts`
> SHA-256: `052937480a453419218cf32f2ac6f2326137536734b5a99b7800566cf9d0b8aa`

```ts
import type { AudienceDTO, CampaignDTO } from "../../../types/marketingTypes";
import type {
  AudienceRecord,
  CampaignRecord,
} from "../selects/marketing.selects";

export function toAudienceDTO(record: AudienceRecord): AudienceDTO {
  return {
    id: record.id,
    name: record.name,
    status: record.status,
    createdAt: record.createdAt.toISOString(),
    updatedAt: record.updatedAt.toISOString(),
  };
}

export function toCampaignDTO(record: CampaignRecord): CampaignDTO {
  return {
    id: record.id,
    name: record.name,
    description: record.description,
    status: record.status,
    scheduledAt: record.scheduledAt?.toISOString() ?? null,
    startedAt: record.startedAt?.toISOString() ?? null,
    completedAt: record.completedAt?.toISOString() ?? null,
    version: record.version,
    audience: record.audience
      ? {
          id: record.audience.id,
          name: record.audience.name,
        }
      : null,
    stepCount: record._count.steps,
    createdAt: record.createdAt.toISOString(),
    updatedAt: record.updatedAt.toISOString(),
  };
}

```