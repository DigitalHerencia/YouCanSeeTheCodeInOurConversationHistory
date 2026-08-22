---
title: 'The Maximal Template™ Domain Library\lib\db\transactions\tenant-context.tx.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\transactions\tenant-context.tx.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.transactions.tenant-context.tx.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\transactions\tenant-context.tx.ts'
source_file: 'tenant-context.tx.ts'
source_sha256: '014149b9f7dd1c8f2916028dfbfd750fc84e978f67902db7513a3071d397c70a'
generated: true
---

# `tenant-context.tx.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\transactions\tenant-context.tx.ts`
> SHA-256: `014149b9f7dd1c8f2916028dfbfd750fc84e978f67902db7513a3071d397c70a`

```ts
import type { Prisma } from "../../../generated/prisma/client";
import type {
  AccessContext,
  AppRole,
  AuthenticatedIdentity,
} from "../../../types/access";

export class TenantContextError extends Error {
  constructor(message: string) {
    super(message);
    this.name = "TenantContextError";
  }
}

export async function setClerkIdentityTx(
  tx: Prisma.TransactionClient,
  identity: AuthenticatedIdentity,
): Promise<void> {
  await tx.$queryRaw`
    SELECT set_config(
      'app.clerk_user_id',
      ${identity.clerkUserId},
      true
    )
  `;
}

export async function setOrganizationContextTx(
  tx: Prisma.TransactionClient,
  organizationId: string,
): Promise<void> {
  await tx.$queryRaw`
    SELECT set_config(
      'app.organization_id',
      ${organizationId},
      true
    )
  `;
}

/**
 * Resolve application tenancy from the authenticated Clerk user.
 * Clerk does not provide or own organization context.
 *
 * The template chooses the oldest active membership as its deterministic default.
 * Generated applications can replace this selection policy without changing Clerk.
 */
export async function resolveAccessContextTx(
  tx: Prisma.TransactionClient,
  identity: AuthenticatedIdentity,
): Promise<AccessContext> {
  await setClerkIdentityTx(tx, identity);

  const user = await tx.user.findUnique({
    where: { clerkUserId: identity.clerkUserId },
    select: { id: true },
  });

  if (!user) {
    throw new TenantContextError(
      "The authenticated Clerk user is not provisioned in the application database.",
    );
  }

  const membership = await tx.membership.findFirst({
    where: {
      userId: user.id,
      status: "ACTIVE",
    },
    orderBy: [{ createdAt: "asc" }, { id: "asc" }],
    select: {
      id: true,
      organizationId: true,
      role: true,
    },
  });

  if (!membership) {
    throw new TenantContextError(
      "The authenticated user does not have an active application membership.",
    );
  }

  await setOrganizationContextTx(tx, membership.organizationId);

  return {
    clerkUserId: identity.clerkUserId,
    organizationId: membership.organizationId,
    membershipId: membership.id,
    userId: user.id,
    role: membership.role as AppRole,
  };
}

```