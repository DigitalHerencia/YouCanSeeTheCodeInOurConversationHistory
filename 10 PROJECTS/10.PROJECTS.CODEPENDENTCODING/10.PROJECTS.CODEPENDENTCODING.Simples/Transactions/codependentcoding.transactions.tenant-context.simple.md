---
title: Maximal Template — lib/db/transactions/tenant-context.tx.ts
type: simple
scope: file
project: Codependent Coding
domain: database
artifact: lib/db/transactions/tenant-context.tx.ts
kind: simple
namespace: codependentcoding.transactions.tenant-context.simple
status: review
authority: working-note
parent: "[[codependentcoding.simples.database.map]]"
depends_on:
  - "[[The Maximal Template™ Demo Doctrine]]"
supersedes: []
tags:
  - codependent-coding/simples
  - simples/transaction
  - database/tenant-context
  - security/rls
  - status/review
created: 2026-08-18
updated: 2026-08-18
simple_type: transaction
layer: tenant-context-resolution
source_path: lib/db/transactions/tenant-context.tx.ts
public_source_path: lib/db/transactions/tenant-context.tx.ts
hardened_source_path: lib/db/transactions/tenant-context.tx.ts
source_mirror: "[[60 CODEPENDENT CODING/Source Mirror/The Maximal Template™ Domain Library/lib/db/transactions/tenant-context.tx.ts|source mirror — tenant-context.tx.ts]]"
canonicalization_status: review
owner_approval: pending
public_implementation_status: observed
hardened_implementation_status: proposed
generation_status: blocked-by-hardening
providers:
  - Clerk
  - PostgreSQL
ontologies: []
uses:
  - "[[codependentcoding.types.access.simple]]"
  - "[[codependentcoding.prisma.application-owned-tenancy.simple]]"
requires:
  - application User synchronized from Clerk identity
  - active application Membership
permits:
  - deterministic default membership selection
conditional:
  - selection policy may be replaced by generated application without changing Clerk
prohibits:
  - Clerk-owned application tenancy
substitutes: []
variants:
  - public-showroom
  - hardened-template
tests:
  - authenticated tenant resolution
  - no-membership failure
  - cross-tenant RLS containment
validation:
  - app.clerk_user_id set transaction-locally
  - app.organization_id set transaction-locally
---

# `lib/db/transactions/tenant-context.tx.ts`

## Codependent Coding Knowledge

### Canonical Definition

This transaction helper resolves application tenancy from an authenticated Clerk user while keeping the organization/membership model application-owned. It sets the transaction-local PostgreSQL session variables used by the RLS policies.

### Responsibility

1. Set `app.clerk_user_id` for the current transaction.
2. Resolve the local application `User` from that verified external identity.
3. Resolve an active local `Membership` using the template's deterministic selection policy.
4. Set `app.organization_id` for the transaction.
5. Return the normalized `AccessContext`.

### Contract

Clerk answers **who the user is**. The application database answers **which organization/membership context the user is operating in**.

### Invariants

- A Clerk user absent from the application DB fails closed.
- A user without an active local membership fails closed.
- Organization context is application-owned.
- Transaction-local settings use `set_config(..., true)`.
- The oldest active membership is a template default selection policy, not universal doctrine.

### Boundaries & Separations

**Owns**
- Transaction-local identity/organization DB context.
- Local application membership resolution.

**Does not own**
- Clerk session verification.
- Authorization policy beyond establishing access context.
- Fetcher/action responsibility.
- Organization selection UI.

### Anti-Patterns

- Reading Clerk Organization as the tenant source of truth.
- Returning a context when no active local membership exists.
- Setting session context outside the transaction lifetime and assuming it persists safely.

## Simple Properties

### Relationships

- Uses [[codependentcoding.types.access.simple]].
- Supported by [[codependentcoding.prisma.application-owned-tenancy.simple]].
- Called by [[codependentcoding.database.tenant.simple]].

### Generation Disposition

**Invariant foundation with a replaceable membership-selection policy.** The Constituter does not expose tenant isolation as a checkbox.

## Implementation

### Public Demo Golden Prototype

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

### Hardened Golden Prototype

The current code already expresses the application-owned tenant resolution needed by the hardened architecture. The hardening dependency is the RLS/runtime role beneath it, not a second tenant-service abstraction.

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
    SELECT set_config('app.clerk_user_id', ${identity.clerkUserId}, true)
  `;
}

export async function setOrganizationContextTx(
  tx: Prisma.TransactionClient,
  organizationId: string,
): Promise<void> {
  await tx.$queryRaw`
    SELECT set_config('app.organization_id', ${organizationId}, true)
  `;
}

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
    where: { userId: user.id, status: "ACTIVE" },
    orderBy: [{ createdAt: "asc" }, { id: "asc" }],
    select: { id: true, organizationId: true, role: true },
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

### Hardening Delta

- No architectural rewrite required.
- Verify the bootstrap membership policy in [[codependentcoding.prisma.application-owned-tenancy.simple]] under the actual restricted runtime role.
- Decide later whether “oldest active membership” remains the generated default or is replaced by an explicit active-organization selection mechanism.

## Validation & Evidence

- [x] Application-owned tenancy is explicit in source comments and behavior.
- [x] Local User/Membership/Organization context is returned as `AccessContext`.
- [x] Later tenancy migration supplies bootstrap membership policy.
- [ ] Restricted-role transaction test proves bootstrap + organization RLS behavior.
- [ ] Owner approves selection policy as canonical template default.

## Links

- [[codependentcoding.simples.database.map]]
- [[codependentcoding.database.tenant.simple]]
- [[codependentcoding.types.access.simple]]
- [[codependentcoding.prisma.application-owned-tenancy.simple]]
- [[60 CODEPENDENT CODING/Source Mirror/The Maximal Template™ Domain Library/lib/db/transactions/tenant-context.tx.ts|source mirror]]

## Backlinks

```dataview
TABLE simple_type AS "Type", layer AS "Layer"
FROM [[]]
SORT file.name ASC
```
