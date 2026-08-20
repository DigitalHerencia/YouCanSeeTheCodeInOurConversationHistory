---
title: Maximal Template — lib/db/client.ts
type: simple
scope: file
project: Codependent Coding
domain: database
artifact: lib/db/client.ts
kind: simple
namespace: codependentcoding.database.client.simple
status: review
authority: working-note
parent: "[[codependentcoding.simples.database.map]]"
depends_on:
  - "[[The Maximal Template™ Demo Doctrine]]"
  - "[[The Maximal Template™ Backlog]]"
supersedes: []
tags:
  - codependent-coding/simples
  - simples/database
  - database/prisma
  - database/neon
  - status/review
created: 2026-08-18
updated: 2026-08-18
simple_type: database
layer: database-runtime
source_path: lib/db/client.ts
public_source_path: lib/db/client.ts
hardened_source_path: lib/db/client.ts
source_mirror: "[[60 CODEPENDENT CODING/Source Mirror/The Maximal Template™ Domain Library/lib/db/client.ts|source mirror — lib/db/client.ts]]"
canonicalization_status: review
owner_approval: pending
public_implementation_status: observed
hardened_implementation_status: proposed
generation_status: blocked-by-hardening
providers:
  - Neon
  - Prisma
ontologies: []
uses: []
requires:
  - runtime DATABASE_URL
permits: []
conditional: []
prohibits:
  - runtime BYPASSRLS credential in hardened template
substitutes: []
variants:
  - public-showroom
  - hardened-template
tests:
  - restricted runtime role proves RLS
validation:
  - Prisma client initialization
  - DATABASE_URL presence
---

# `lib/db/client.ts`

## Codependent Coding Knowledge

### Canonical Definition

The database client is the server-only Prisma runtime boundary backed by the Neon adapter. It owns client construction and connection wiring; it does not own queries, domain logic, tenant selection, authorization, migrations, or provider behavior.

### Responsibility

- Construct one server-only Prisma client.
- Connect Prisma runtime access through the Neon adapter.
- Fail immediately when the runtime database URL is unavailable.
- Reuse the client during local development to avoid unnecessary client recreation.

### Contract

- Runtime database access enters through this client.
- Persisted reads remain fetcher-owned.
- CRUD writes remain action-owned.
- Atomic multi-write invariants remain transaction-owned.
- Prisma schema/migrations/seed remain root `prisma/` lifecycle concerns.

### Invariants

- `server-only` prevents client-bundle use.
- The runtime URL is distinct in responsibility from the privileged migration/direct URL.
- In the hardened template, the runtime credential must be a PostgreSQL role that cannot bypass RLS.

### Boundaries & Separations

**Owns**
- Prisma client construction.
- Neon adapter construction.
- Runtime connection selection.

**Does not own**
- Tenant context.
- Auth/authz.
- RLS policy definitions.
- Migrations or seed lifecycle.
- Business queries or mutations.

### Side Effects

- Establishes DB connections through Prisma/Neon when operations execute.
- Throws at module load if `DATABASE_URL` is absent.

### Anti-Patterns

- Importing this file into Client Components.
- Using owner/admin migration credentials for hardened runtime traffic.
- Executing random raw SQL throughout the application instead of the classified database/server-operation boundaries.

### Canonicalization Decisions

- **Observed source:** the same client shape can serve showroom and hardened template.
- **Hardening difference:** credential semantics, not a gratuitous second database abstraction.
- **Owner approval:** pending.

## Simple Properties

### Relationships

- Parent library: [[codependentcoding.simples.database.map]]
- Used by [[codependentcoding.database.tenant.simple]] and [[codependentcoding.database.provider.simple]].
- Migration credential lifecycle is separated into [[codependentcoding.config.prisma.simple]].

### Generation Disposition

**Invariant.** Backend database runtime wiring is derived/fixed architecture, not a Constituter checkbox.

## Implementation

### Public Demo Golden Prototype

**Observed source:** `lib/db/client.ts`

```ts
import "server-only";

import { PrismaNeon } from "@prisma/adapter-neon";

import { PrismaClient } from "../../generated/prisma/client";

const connectionString = process.env.DATABASE_URL;

if (!connectionString) {
  throw new Error("DATABASE_URL is required.");
}

const adapter = new PrismaNeon({
  connectionString,
});

const globalForPrisma = globalThis as unknown as {
  prisma?: PrismaClient;
};

export const prisma =
  globalForPrisma.prisma ??
  new PrismaClient({
    adapter,
  });

if (process.env.NODE_ENV !== "production") {
  globalForPrisma.prisma = prisma;
}
```

### Hardened Golden Prototype

The code shape does not need a ceremonial rewrite. The hardening contract is that `DATABASE_URL` points to the restricted runtime role.

```ts
import "server-only";

import { PrismaNeon } from "@prisma/adapter-neon";

import { PrismaClient } from "../../generated/prisma/client";

const connectionString = process.env.DATABASE_URL;

if (!connectionString) {
  throw new Error("DATABASE_URL is required.");
}

const adapter = new PrismaNeon({
  connectionString,
});

const globalForPrisma = globalThis as unknown as {
  prisma?: PrismaClient;
};

export const prisma =
  globalForPrisma.prisma ??
  new PrismaClient({ adapter });

if (process.env.NODE_ENV !== "production") {
  globalForPrisma.prisma = prisma;
}
```

### Hardening Delta

- `DATABASE_URL` must use a dedicated application/runtime role without `BYPASSRLS`.
- Owner/admin credentials remain reserved for migrations and administrative lifecycle through [[codependentcoding.config.prisma.simple]].
- Two-tenant positive/negative tests must run through this exact runtime connection before `RLS SCOPED` is a runtime attestation.

## Validation & Evidence

- [x] Current source mirrored.
- [x] Public/hardened source relationship identified.
- [ ] Runtime role independently verified as non-bypass.
- [ ] Cross-tenant RLS test passes through this client.
- [ ] Owner approves canonical contract.

## Links

- [[codependentcoding.simples.database.map]]
- [[codependentcoding.database.tenant.simple]]
- [[codependentcoding.database.provider.simple]]
- [[codependentcoding.config.prisma.simple]]
- [[The Maximal Template™ Backlog]]
- [[60 CODEPENDENT CODING/Source Mirror/The Maximal Template™ Domain Library/lib/db/client.ts|source mirror]]

## Backlinks

```dataview
TABLE simple_type AS "Type", layer AS "Layer"
FROM [[]]
SORT file.name ASC
```
