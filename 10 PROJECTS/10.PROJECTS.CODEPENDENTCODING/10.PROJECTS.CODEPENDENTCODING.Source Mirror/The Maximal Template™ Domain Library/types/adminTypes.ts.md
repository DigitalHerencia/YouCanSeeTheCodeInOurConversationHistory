---
title: 'The Maximal Template™ Domain Library\types\adminTypes.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\types\adminTypes.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.types.admintypes.ts'
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
source_path: 'The Maximal Template™ Domain Library\types\adminTypes.ts'
source_file: 'adminTypes.ts'
source_sha256: '7acdc21bd75bca74e52dcd798fde63424ec8ec3048c9585efd3d6fea79c14990'
generated: true
---

# `adminTypes.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\types\adminTypes.ts`
> SHA-256: `7acdc21bd75bca74e52dcd798fde63424ec8ec3048c9585efd3d6fea79c14990`

```ts
export interface AdminMembershipDTO {
  id: string;
  role: string;
  status: string;
  user: { id: string; displayName: string | null; email: string | null };
  createdAt: string;
}
export interface AdminRecordSummaryDTO {
  resource: string;
  count: number;
}
export interface AuditEventDTO {
  id: string;
  action: string;
  resourceType: string;
  resourceId: string | null;
  metadata: unknown;
  actor: {
    id: string;
    displayName: string | null;
    email: string | null;
  } | null;
  createdAt: string;
}

```