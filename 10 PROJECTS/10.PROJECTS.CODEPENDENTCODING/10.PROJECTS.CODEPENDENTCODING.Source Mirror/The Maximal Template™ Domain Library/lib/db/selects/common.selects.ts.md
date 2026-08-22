---
title: 'The Maximal Template™ Domain Library\lib\db\selects\common.selects.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\selects\common.selects.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.selects.common.selects.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\selects\common.selects.ts'
source_file: 'common.selects.ts'
source_sha256: '5ed7b16a0e5a42318d5fd3fd7248b0ac1ce558d4c91340121cc9ec0758d04d36'
generated: true
---

# `common.selects.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\selects\common.selects.ts`
> SHA-256: `5ed7b16a0e5a42318d5fd3fd7248b0ac1ce558d4c91340121cc9ec0758d04d36`

```ts
import type { Prisma } from "../../../generated/prisma/client";

export const organizationOverviewSelect = {
  id: true,
  slug: true,
  name: true,
  imageUrl: true,
  settings: {
    select: {
      timezone: true,
      locale: true,
      defaultCurrency: true,
    },
  },
  _count: {
    select: {
      memberships: true,
    },
  },
} satisfies Prisma.OrganizationSelect;

export type OrganizationOverviewRecord = Prisma.OrganizationGetPayload<{
  select: typeof organizationOverviewSelect;
}>;

```