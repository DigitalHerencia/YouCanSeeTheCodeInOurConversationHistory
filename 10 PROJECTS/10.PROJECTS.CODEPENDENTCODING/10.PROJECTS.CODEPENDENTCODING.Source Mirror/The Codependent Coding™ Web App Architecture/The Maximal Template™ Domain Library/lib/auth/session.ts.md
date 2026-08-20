---
title: 'The Hipster Stack™ Technology Stack\template\lib\auth\session.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\auth\session.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.auth.session.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\auth\session.ts'
source_file: 'session.ts'
source_sha256: 'cc3719a1b2dd11f39846176602424725c4005ae4915bd926ca4f207c28801d33'
generated: true
---

# `session.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\auth\session.ts`
> SHA-256: `cc3719a1b2dd11f39846176602424725c4005ae4915bd926ca4f207c28801d33`

```ts
import "server-only"

import { auth } from "@clerk/nextjs/server"

import { getPrisma } from "@/lib/db/prisma"
import { withTenantContext } from "@/lib/db/withTenantContext"
import { deriveTenantContext, type TenantMembershipRecord } from "@/lib/authz/tenant"
import type { AuthenticatedUserContext, LocalUserContext } from "@/types/authTypes"
import type { TenantContext } from "@/types/authzTypes"

function mapLocalUser(user: {
  id: string
  clerkUserId: string
  email: string | null
  displayName: string | null
  status: "active" | "disabled"
  isApplicationAdmin: boolean
}): LocalUserContext {
  return {
    id: user.id,
    clerkUserId: user.clerkUserId,
    email: user.email,
    displayName: user.displayName,
    status: user.status,
    isApplicationAdmin: user.isApplicationAdmin,
  }
}

export async function getCurrentUserContext(): Promise<AuthenticatedUserContext | null> {
  const { userId } = await auth()
  if (!userId) return null
  const prisma = getPrisma()

  const existingUser = await prisma.user.findUnique({
    where: { clerkUserId: userId },
    select: {
      id: true,
      clerkUserId: true,
      email: true,
      displayName: true,
      status: true,
      isApplicationAdmin: true,
    },
  })

  if (!existingUser || existingUser.status !== "active") return null

  return { userId, localUser: mapLocalUser(existingUser) }
}

export async function requireApplicationAdminContext(): Promise<AuthenticatedUserContext> {
  const context = await requireCurrentUserContext()
  if (!context?.localUser.isApplicationAdmin) {
    throw new Error("Application administrator access required.")
  }
  return context
}

export async function requireCurrentUserContext(): Promise<AuthenticatedUserContext> {
  const context = await getCurrentUserContext()

  if (!context) {
    throw new Error("Authentication required.")
  }

  return context
}

export async function requireTenantContext(): Promise<TenantContext> {
  const context = await requireCurrentUserContext()
  const prisma = getPrisma()
  const user = await prisma.user.findUnique({
    where: { id: context.localUser.id },
    select: {
      selectedOrganizationId: true,
    },
  })

  if (!user?.selectedOrganizationId) {
    throw new Error("Active organization membership required.")
  }
  const organizationId = user.selectedOrganizationId

  const membership = await withTenantContext<TenantMembershipRecord | null>(organizationId, (tx) =>
    tx.membership.findUnique({
      where: {
        organizationId_userId: {
          organizationId,
          userId: context.localUser.id,
        },
      },
      select: {
        id: true,
        userId: true,
        role: true,
        createdAt: true,
        organization: {
          select: {
            id: true,
            status: true,
          },
        },
      },
    })
  )

  const tenant = membership ? deriveTenantContext(context, [membership], organizationId) : null

  if (!tenant) throw new Error("Active organization membership required.")
  return tenant
}

```