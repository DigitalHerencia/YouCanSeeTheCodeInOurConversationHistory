---
title: 'The Maximal Template™ Domain Library\lib\db\dto\crmDto.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\dto\crmDto.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.dto.crmdto.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\dto\crmDto.ts'
source_file: 'crmDto.ts'
source_sha256: '2f30f8b8c2e98d9ebaba038537f7f51a4fb83ea86ca4536084488f2f1c801149'
generated: true
---

# `crmDto.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\dto\crmDto.ts`
> SHA-256: `2f30f8b8c2e98d9ebaba038537f7f51a4fb83ea86ca4536084488f2f1c801149`

```ts
import type {
  CrmAccountDTO,
  CrmContactDTO,
  CrmDealDTO,
  CrmDealSummaryDTO,
} from "../../../types/crmTypes";
import type {
  CrmAccountRecord,
  CrmContactRecord,
  CrmDealDetailRecord,
  CrmDealSummaryRecord,
} from "../selects/crmSelects";

export function toCrmContactDTO(record: CrmContactRecord): CrmContactDTO {
  return {
    id: record.id,
    firstName: record.firstName,
    lastName: record.lastName,
    email: record.email,
    phone: record.phone,
    title: record.title,
    status: record.status,
    account: record.account,
    owner: record.owner
      ? {
          membershipId: record.owner.id,
          displayName: record.owner.user.displayName,
        }
      : null,
    createdAt: record.createdAt.toISOString(),
    updatedAt: record.updatedAt.toISOString(),
  };
}

export function toCrmAccountDTO(record: CrmAccountRecord): CrmAccountDTO {
  return {
    id: record.id,
    name: record.name,
    website: record.website,
    industry: record.industry,
    status: record.status,
    notes: record.notes,
    contactCount: record._count.contacts,
    dealCount: record._count.deals,
    createdAt: record.createdAt.toISOString(),
    updatedAt: record.updatedAt.toISOString(),
  };
}

export function toCrmDealSummaryDTO(
  record: CrmDealSummaryRecord,
): CrmDealSummaryDTO {
  return {
    id: record.id,
    name: record.name,
    stage: record.stage,
    value: record.value.toString(),
    currency: record.currency,
    probability: record.probability,
    expectedCloseDate: record.expectedCloseDate?.toISOString() ?? null,
    version: record.version,
    account: {
      id: record.account.id,
      name: record.account.name,
    },
    owner: record.owner
      ? {
          id: record.owner.id,
          displayName: record.owner.user.displayName,
        }
      : null,
  };
}

export function toCrmDealDTO(record: CrmDealDetailRecord): CrmDealDTO {
  return {
    ...toCrmDealSummaryDTO(record),
    primaryContact: record.primaryContact
      ? {
          id: record.primaryContact.id,
          firstName: record.primaryContact.firstName,
          lastName: record.primaryContact.lastName,
          email: record.primaryContact.email,
        }
      : null,
    closedAt: record.closedAt?.toISOString() ?? null,
    createdAt: record.createdAt.toISOString(),
    updatedAt: record.updatedAt.toISOString(),
  };
}

```