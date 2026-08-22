---
title: 'The Maximal Template™ Domain Library\lib\db\selects\admin.selects.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\selects\admin.selects.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.selects.admin.selects.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\selects\admin.selects.ts'
source_file: 'admin.selects.ts'
source_sha256: 'f1ece49b12c60b641528bd60cfa5e7b03a6da72d87510d8a6776b90a15edac94'
generated: true
---

# `admin.selects.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\selects\admin.selects.ts`
> SHA-256: `f1ece49b12c60b641528bd60cfa5e7b03a6da72d87510d8a6776b90a15edac94`

```ts
import type { Prisma } from "../../../generated/prisma/client";

export const auditEventSelect = {
  id: true,
  action: true,
  resourceType: true,
  resourceId: true,
  metadata: true,
  actor: {
    select: {
      id: true,
      displayName: true,
      email: true,
    },
  },
  createdAt: true,
} satisfies Prisma.AuditEventSelect;

export type AuditEventRecord = Prisma.AuditEventGetPayload<{
  select: typeof auditEventSelect;
}>;

export const adminMembershipSelect = {
  id: true,
  role: true,
  status: true,
  user: { select: { id: true, displayName: true, email: true } },
  createdAt: true,
} satisfies Prisma.MembershipSelect;

export type AdminMembershipRecord = Prisma.MembershipGetPayload<{
  select: typeof adminMembershipSelect;
}>;

```