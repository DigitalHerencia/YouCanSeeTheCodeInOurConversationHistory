---
title: Maximal Template — lib/db/tenant.ts
type: simple
scope: file
project: Codependent Coding
domain: database
artifact: lib/db/tenant.ts
kind: simple
namespace: codependentcoding.database.tenant.simple
status: review
authority: working-note
parent: "[[codependentcoding.simples.database.map]]"
depends_on:
  - "[[10.PROJECTS.CODEPENDENTCODING.WebApp-Architecture.Template-Demo]]"
  - "[[10.PROJECTS.CODEPENDENTCODING.WebApp-Architecture.Template-Backlog]]"
supersedes: []
tags:
  - codependent-coding/simples
  - simples/database
  - database/tenant-context
  - security/rls
  - status/review
created: 2026-08-18
updated: 2026-08-19
simple_type: database
layer: tenant-transaction-boundary
source_path: lib/db/tenant.ts
public_source_path: lib/db/tenant.ts
hardened_source_path: lib/db/tenant.ts
source_mirror: "[[tenant.ts|source mirror — lib/db/tenant.ts]]"
canonicalization_status: review
owner_approval: pending
public_implementation_status: observed
hardened_implementation_status: proposed
generation_status: blocked-by-hardening
providers:
  - Clerk
  - Prisma
  - PostgreSQL
ontologies: []
uses:
  - "[[codependentcoding.database.client.simple]]"
  - "[[codependentcoding.transactions.tenant-context.simple]]"
  - "[[codependentcoding.types.access.simple]]"
requires:
  - authenticated identity or explicit showroom demo identity
permits:
  - public seeded read boundary in showroom only
conditional:
  - withTemplateReadTransaction is public-showroom-only
prohibits:
  - demo identity in hardened ordinary fetchers
substitutes: []
variants:
  - public-showroom
  - hardened-template
tests:
  - authenticated fetcher uses authenticated tenant
  - cross-tenant read rejected
validation:
  - tenant context resolved before scoped work
---

# `lib/db/tenant.ts`

## Codependent Coding Knowledge

### Canonical Definition

This file owns the transaction boundary that turns an identity into an application `AccessContext` before tenant-scoped database work executes. The public showroom also uses it to expose a deliberately separate seeded read-only demonstration boundary.

### Responsibility

- Start the Prisma transaction used for tenant-scoped work.
- Resolve application-owned tenant context through [[codependentcoding.transactions.tenant-context.simple]].
- Pass both the transaction client and resolved `AccessContext` to the caller.
- In the showroom only, provide a deterministic seed identity for public read-only fetchers.

### Contract

- Clerk establishes identity; this boundary does not delegate application tenancy to Clerk Organizations.
- Application `User` + active `Membership` determine the application `Organization` context.
- The public demo identity is not authentication and must never authorize protected mutation behavior.

### Invariants

- `withTenantTransaction()` requires an explicit `AuthenticatedIdentity`.
- `withTemplateReadTransaction()` is read-demo infrastructure only.
- Mutations must never use the seeded demo identity.
- Hardened ordinary fetchers resolve real authenticated identity.

### Boundaries & Separations

**Owns**
- Tenant-scoped transaction lifetime.
- Demo read transaction adapter in the showroom edition.

**Does not own**
- Clerk session verification itself.
- RBAC/ABAC policy.
- The membership-selection rules implemented by tenant-context resolution.
- Persisted fetcher/action responsibility.

### Anti-Patterns

- Reusing `TEMPLATE_DEMO_IDENTITY` in generated/private applications.
- Calling `withTemplateReadTransaction()` from mutations.
- Treating the seeded workspace as the current user's workspace.

### Canonicalization Decisions

- **Observed showroom rule:** public fetchers intentionally use the seed identity so signed-out visitors can explore real seeded data.
- **Hardening rule from backlog:** generated/private fetchers resolve actual Clerk identity; the demo fallback disappears from ordinary production fetchers.
- **Owner approval:** pending.

## Simple Properties

### Relationships

- Uses [[codependentcoding.database.client.simple]].
- Uses [[codependentcoding.transactions.tenant-context.simple]].
- Uses [[codependentcoding.types.access.simple]].
- Hardened fetchers additionally require the Clerk identity helper (`lib/auth/identity.ts`).

### Generation Disposition

**Invariant backend architecture with edition-specific transform.** The generator may remove/replace the showroom demo-read helper while retaining the tenant transaction boundary.

## Implementation

### Public Demo Golden Prototype

```ts
import "server-only";

import type { Prisma } from "../../generated/prisma/client";
import type { AccessContext, AuthenticatedIdentity } from "../../types/access";

import { prisma } from "./client";
import { resolveAccessContextTx } from "./transactions/tenant-context.tx";

/** Seed identity used only by public, read-only template fetchers. */
const TEMPLATE_DEMO_IDENTITY: AuthenticatedIdentity = {
  clerkUserId: "user_seed_owner",
};

export async function withTenantTransaction<T>(
  identity: AuthenticatedIdentity,
  work: (tx: Prisma.TransactionClient, access: AccessContext) => Promise<T>,
): Promise<T> {
  return prisma.$transaction(
    async (tx) => {
      const access = await resolveAccessContextTx(tx, identity);
      return work(tx, access);
    },
    {
      maxWait: 5_000,
      timeout: 15_000,
    },
  );
}

/**
 * Public template reads run against the seeded demonstration workspace.
 * This does not authenticate the visitor and must never be used by mutations.
 */
export async function withTemplateReadTransaction<T>(
  work: (tx: Prisma.TransactionClient, access: AccessContext) => Promise<T>,
): Promise<T> {
  return withTenantTransaction(TEMPLATE_DEMO_IDENTITY, work);
}
```

### Hardened Golden Prototype

This is a proposed hardening transform based directly on the existing `requireIdentity()` helper and the hardening backlog. It is not owner-approved canon yet.

```ts
import "server-only";

import type { Prisma } from "../../generated/prisma/client";
import type { AccessContext, AuthenticatedIdentity } from "../../types/access";

import { requireIdentity } from "../auth/identity";
import { prisma } from "./client";
import { resolveAccessContextTx } from "./transactions/tenant-context.tx";

export async function withTenantTransaction<T>(
  identity: AuthenticatedIdentity,
  work: (tx: Prisma.TransactionClient, access: AccessContext) => Promise<T>,
): Promise<T> {
  return prisma.$transaction(
    async (tx) => {
      const access = await resolveAccessContextTx(tx, identity);
      return work(tx, access);
    },
    {
      maxWait: 5_000,
      timeout: 15_000,
    },
  );
}

export async function withAuthenticatedTenantTransaction<T>(
  work: (tx: Prisma.TransactionClient, access: AccessContext) => Promise<T>,
): Promise<T> {
  const identity = await requireIdentity();
  return withTenantTransaction(identity, work);
}
```

### Hardening Delta

- Remove `TEMPLATE_DEMO_IDENTITY` from the generated/private ordinary-read path.
- Ordinary production fetchers call the authenticated tenant boundary.
- If demo data remains in a generated application at all, it belongs behind an explicit separate demo-only boundary rather than masquerading as the normal tenant resolver.
- Verify the same path under the restricted runtime DB role.

## Validation & Evidence

- [x] Showroom source mirrored.
- [x] Demo-only identity boundary is explicit in current source.
- [x] Hardened transform derived from existing `requireIdentity()` + backlog requirement.
- [ ] Hardened fetcher call sites transformed and tested.
- [ ] Cross-tenant read rejected under restricted runtime role.
- [ ] Owner approves canonical transform.

## Links

- [[codependentcoding.simples.database.map]]
- [[codependentcoding.database.client.simple]]
- [[codependentcoding.transactions.tenant-context.simple]]
- [[codependentcoding.types.access.simple]]
- [[identity.ts|existing Clerk identity helper]]
- [[tenant.ts|source mirror]]

## Backlinks

```dataview
TABLE simple_type AS "Type", layer AS "Layer"
FROM [[]]
SORT file.name ASC
```
