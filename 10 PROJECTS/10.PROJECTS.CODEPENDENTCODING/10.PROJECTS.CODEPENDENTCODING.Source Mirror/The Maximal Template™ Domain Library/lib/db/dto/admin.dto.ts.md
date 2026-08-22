---
title: 'The Maximal Template™ Domain Library\lib\db\dto\admin.dto.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\dto\admin.dto.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.dto.admin.dto.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\dto\admin.dto.ts'
source_file: 'admin.dto.ts'
source_sha256: 'c6f7620e92fdbc334573f55f84a7334ef2f8e937aabd5f10cb6717cb3dd3fca0'
generated: true
---

# `admin.dto.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\dto\admin.dto.ts`
> SHA-256: `c6f7620e92fdbc334573f55f84a7334ef2f8e937aabd5f10cb6717cb3dd3fca0`

```ts
import type {
  AdminMembershipDTO,
  AuditEventDTO,
} from "../../../types/adminTypes";
import type {
  AdminMembershipRecord,
  AuditEventRecord,
} from "../selects/admin.selects";

export function toAuditEventDTO(record: AuditEventRecord): AuditEventDTO {
  return {
    id: record.id,
    action: record.action,
    resourceType: record.resourceType,
    resourceId: record.resourceId,
    metadata: record.metadata,
    actor: record.actor
      ? {
          id: record.actor.id,
          displayName: record.actor.displayName,
          email: record.actor.email,
        }
      : null,
    createdAt: record.createdAt.toISOString(),
  };
}

export function toAdminMembershipDTO(
  record: AdminMembershipRecord,
): AdminMembershipDTO {
  return {
    id: record.id,
    role: record.role,
    status: record.status,
    user: record.user,
    createdAt: record.createdAt.toISOString(),
  };
}

```