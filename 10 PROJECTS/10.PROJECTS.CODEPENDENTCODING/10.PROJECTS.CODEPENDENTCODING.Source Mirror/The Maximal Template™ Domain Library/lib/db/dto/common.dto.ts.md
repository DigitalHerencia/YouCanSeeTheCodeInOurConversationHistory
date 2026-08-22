---
title: 'The Maximal Template™ Domain Library\lib\db\dto\common.dto.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\dto\common.dto.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.dto.common.dto.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\dto\common.dto.ts'
source_file: 'common.dto.ts'
source_sha256: 'c9533310dd279eede15038e3da49cade3abe49e52e2e48819165701f2c98dfa9'
generated: true
---

# `common.dto.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\dto\common.dto.ts`
> SHA-256: `c9533310dd279eede15038e3da49cade3abe49e52e2e48819165701f2c98dfa9`

```ts
import type { OrganizationDTO } from "../../../types/commonTypes";
import type { OrganizationOverviewRecord } from "../selects/common.selects";

export function toOrganizationDTO(
  record: OrganizationOverviewRecord,
): OrganizationDTO {
  return {
    id: record.id,
    slug: record.slug,
    name: record.name,
    imageUrl: record.imageUrl,
    timezone: record.settings?.timezone ?? "UTC",
    locale: record.settings?.locale ?? "en-US",
    defaultCurrency: record.settings?.defaultCurrency ?? "USD",
    memberCount: record._count.memberships,
  };
}

```