---
title: 'The Maximal Template™ Domain Library\types\crmTypes.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\types\crmTypes.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.types.crmtypes.ts'
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
source_path: 'The Maximal Template™ Domain Library\types\crmTypes.ts'
source_file: 'crmTypes.ts'
source_sha256: '7b364d40806fdbace8703370580d84eb7ee8bdbb4f0f6a2adb22ae0406bc9041'
generated: true
---

# `crmTypes.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\types\crmTypes.ts`
> SHA-256: `7b364d40806fdbace8703370580d84eb7ee8bdbb4f0f6a2adb22ae0406bc9041`

```ts
export type ContactStatus = "LEAD" | "ACTIVE" | "INACTIVE" | "ARCHIVED";
export type EditableContactStatus = Exclude<ContactStatus, "ARCHIVED">;

export type ContactSort = "name-asc" | "name-desc" | "updated-desc";

export interface ContactListCriteria {
  query: string;
  status?: EditableContactStatus;
  sort: ContactSort;
  limit: number;
}

export interface ContactFormValues {
  firstName: string;
  lastName: string;
  email: string;
  phone: string;
  title: string;
  status: EditableContactStatus;
}

export interface CrmContactDTO {
  id: string;
  firstName: string;
  lastName: string;
  email: string | null;
  phone: string | null;
  title: string | null;
  status: ContactStatus;
  account: { id: string; name: string } | null;
  owner: { membershipId: string; displayName: string | null } | null;
  createdAt: string;
  updatedAt: string;
}

export interface CrmDealSummaryDTO {
  id: string;
  name: string;
  stage: string;
  value: string;
  currency: string;
  probability: number;
  expectedCloseDate: string | null;
  version: number;
  account: { id: string; name: string };
  owner: { id: string; displayName: string | null } | null;
}

export interface CrmDealDTO extends CrmDealSummaryDTO {
  primaryContact: {
    id: string;
    firstName: string;
    lastName: string;
    email: string | null;
  } | null;
  closedAt: string | null;
  createdAt: string;
  updatedAt: string;
}

export interface CrmAccountDTO {
  id: string;
  name: string;
  website: string | null;
  industry: string | null;
  status: string;
  notes: string | null;
  contactCount: number;
  dealCount: number;
  createdAt: string;
  updatedAt: string;
}

```