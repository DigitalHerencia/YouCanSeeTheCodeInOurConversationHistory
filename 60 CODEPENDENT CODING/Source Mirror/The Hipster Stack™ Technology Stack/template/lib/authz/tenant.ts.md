---
title: 'The Hipster Stack™ Technology Stack\template\lib\authz\tenant.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\authz\tenant.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.authz.tenant.ts'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-hipster-stack-technology-stack
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Hipster Stack™ Technology Stack\template\lib\authz\tenant.ts'
source_file: 'tenant.ts'
source_sha256: '376e4b1b6d7c3642c54305757b2753598378f92178ff20f2bfca4a46a8a6ea63'
generated: true
---

# `tenant.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\authz\tenant.ts`
> SHA-256: `376e4b1b6d7c3642c54305757b2753598378f92178ff20f2bfca4a46a8a6ea63`

```ts
import { capabilitiesForRole } from "@/lib/authz/capabilities"
import type { AuthenticatedUserContext } from "@/types/authTypes"
import type { OrganizationRole, TenantContext } from "@/types/authzTypes"

export type TenantMembershipRecord = {
  id: string
  userId: string
  role: OrganizationRole
  createdAt: Date
  organization: {
    id: string
    status: "active" | "suspended"
  }
}

export function deriveTenantContext(
  context: AuthenticatedUserContext,
  memberships: readonly TenantMembershipRecord[],
  selectedOrganizationId: string | null
): TenantContext | null {
  const available = memberships
    .filter(
      (membership) =>
        membership.userId === context.localUser.id && membership.organization.status === "active"
    )
    .toSorted(
      (left, right) =>
        left.createdAt.getTime() - right.createdAt.getTime() || left.id.localeCompare(right.id)
    )

  const membership =
    available.find((candidate) => candidate.organization.id === selectedOrganizationId) ??
    available[0]

  if (!membership) return null

  return {
    ...context,
    organization: membership.organization,
    membership: {
      id: membership.id,
      role: membership.role,
    },
    capabilities: capabilitiesForRole(membership.role),
  }
}

```