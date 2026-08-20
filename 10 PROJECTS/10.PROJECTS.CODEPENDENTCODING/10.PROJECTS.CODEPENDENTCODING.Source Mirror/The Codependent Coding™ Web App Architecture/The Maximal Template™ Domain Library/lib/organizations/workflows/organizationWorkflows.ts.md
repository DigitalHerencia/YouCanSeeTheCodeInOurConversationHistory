---
title: 'The Hipster Stack™ Technology Stack\template\lib\organizations\workflows\organizationWorkflows.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\organizations\workflows\organizationWorkflows.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.organizations.workflows.organizationworkflows.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\organizations\workflows\organizationWorkflows.ts'
source_file: 'organizationWorkflows.ts'
source_sha256: 'ebff9d341df7a7283c0bd1e37bda2463ebf9797d92573ced4535e124df4b256b'
generated: true
---

# `organizationWorkflows.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\organizations\workflows\organizationWorkflows.ts`
> SHA-256: `ebff9d341df7a7283c0bd1e37bda2463ebf9797d92573ced4535e124df4b256b`

```ts
import "server-only"

import { requireCurrentUserContext, requireTenantContext } from "@/lib/auth/session"
import { assertCanManageMembership, assertCapability } from "@/lib/authz/assertions"
import { revalidateOrganizationSurfaces } from "@/lib/cache/revalidate"
import { canCreateInvitation } from "@/lib/authz/policies"
import { withTenantContext } from "@/lib/db/withTenantContext"
import {
  changeMembershipTx,
  createOrganizationInvitationTx,
  createOrganizationTx,
  updateOrganizationTx,
} from "@/lib/db/transactions/organizationTransactions"
import {
  createOrganizationSchema,
  inviteOrganizationMemberSchema,
  updateMembershipSchema,
  updateOrganizationSchema,
} from "@/schemas/organizationSchemas"

const invitationLifetimeMs = 7 * 24 * 60 * 60 * 1000

export async function createOrganizationWorkflow(input: unknown) {
  const parsed = createOrganizationSchema.parse(input)
  const context = await requireCurrentUserContext()
  const organizationId = crypto.randomUUID()

  return withTenantContext(organizationId, (tx) =>
    createOrganizationTx(tx, {
      ...parsed,
      organizationId,
      actorUserId: context.localUser.id,
    })
  )
}

export async function updateOrganizationWorkflow(input: unknown) {
  const parsed = updateOrganizationSchema.parse(input)
  const context = await requireTenantContext()
  assertCapability(context, "organization.manage")
  const organization = await withTenantContext(context.organization.id, (tx) =>
    updateOrganizationTx(tx, {
      ...parsed,
      organizationId: context.organization.id,
      actorUserId: context.localUser.id,
    })
  )
  revalidateOrganizationSurfaces()
  return organization
}

export async function inviteOrganizationMemberWorkflow(input: unknown) {
  const parsed = inviteOrganizationMemberSchema.parse(input)
  const context = await requireTenantContext()
  if (!canCreateInvitation(context, parsed.role)) throw new Error("Invitation denied.")

  return withTenantContext(context.organization.id, (tx) =>
    createOrganizationInvitationTx(tx, {
      ...parsed,
      organizationId: context.organization.id,
      actorUserId: context.localUser.id,
      expiresAt: new Date(Date.now() + invitationLifetimeMs),
    })
  )
}

export async function updateMembershipWorkflow(input: unknown) {
  const parsed = updateMembershipSchema.parse(input)
  const context = await requireTenantContext()
  const membership = await withTenantContext(
    context.organization.id,
    (tx) =>
      changeMembershipTx(
        tx,
        {
          ...parsed,
          organizationId: context.organization.id,
          actorUserId: context.localUser.id,
        },
        ({ target, ownerCount }) =>
          assertCanManageMembership(context, target, ownerCount, parsed.role)
      ),
    { isolationLevel: "Serializable" }
  )
  revalidateOrganizationSurfaces()
  return membership
}

```