---
title: 'The Maximal Template™ Domain Library\lib\db\selects\crmSelects.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\selects\crmSelects.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.selects.crmselects.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\selects\crmSelects.ts'
source_file: 'crmSelects.ts'
source_sha256: '1c61d94dd08718419b07fd5b656159c3a129cf1386d427c34934d137f044ec12'
generated: true
---

# `crmSelects.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\selects\crmSelects.ts`
> SHA-256: `1c61d94dd08718419b07fd5b656159c3a129cf1386d427c34934d137f044ec12`

```ts
import type { Prisma } from "../../../generated/prisma/client";

export const crmDealSummarySelect = {
  id: true,
  name: true,
  stage: true,
  value: true,
  currency: true,
  probability: true,
  expectedCloseDate: true,
  version: true,
  account: {
    select: {
      id: true,
      name: true,
    },
  },
  owner: {
    select: {
      id: true,
      user: {
        select: {
          displayName: true,
        },
      },
    },
  },
} satisfies Prisma.CrmDealSelect;

export const crmDealDetailSelect = {
  ...crmDealSummarySelect,
  closedAt: true,
  createdAt: true,
  updatedAt: true,
  primaryContact: {
    select: {
      id: true,
      firstName: true,
      lastName: true,
      email: true,
    },
  },
} satisfies Prisma.CrmDealSelect;

export type CrmDealSummaryRecord = Prisma.CrmDealGetPayload<{
  select: typeof crmDealSummarySelect;
}>;

export type CrmDealDetailRecord = Prisma.CrmDealGetPayload<{
  select: typeof crmDealDetailSelect;
}>;

export const crmContactSelect = {
  id: true,
  firstName: true,
  lastName: true,
  email: true,
  phone: true,
  title: true,
  status: true,
  createdAt: true,
  updatedAt: true,
  account: { select: { id: true, name: true } },
  owner: {
    select: {
      id: true,
      user: { select: { displayName: true } },
    },
  },
} satisfies Prisma.CrmContactSelect;

export const crmContactAccessSelect = {
  id: true,
  organizationId: true,
  ownerMembershipId: true,
  updatedAt: true,
} satisfies Prisma.CrmContactSelect;

export const crmAccountSelect = {
  id: true,
  name: true,
  website: true,
  industry: true,
  status: true,
  notes: true,
  createdAt: true,
  updatedAt: true,
  _count: { select: { contacts: true, deals: true } },
} satisfies Prisma.CrmAccountSelect;

export type CrmContactRecord = Prisma.CrmContactGetPayload<{
  select: typeof crmContactSelect;
}>;

export type CrmContactAccessRecord = Prisma.CrmContactGetPayload<{
  select: typeof crmContactAccessSelect;
}>;

export type CrmAccountRecord = Prisma.CrmAccountGetPayload<{
  select: typeof crmAccountSelect;
}>;

```