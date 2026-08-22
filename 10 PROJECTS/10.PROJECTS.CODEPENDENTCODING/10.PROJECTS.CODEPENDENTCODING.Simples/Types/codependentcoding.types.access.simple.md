---
title: Maximal Template — types/access.ts
type: simple
scope: file
project: Codependent Coding
domain: authorization
artifact: types/access.ts
kind: simple
namespace: codependentcoding.types.access.simple
status: review
authority: working-note
parent: "[[codependentcoding.simples.database.map]]"
depends_on:
  - "[[10.PROJECTS.CODEPENDENTCODING.WebApp-Architecture.Template-Demo]]"
supersedes: []
tags:
  - codependent-coding/simples
  - simples/type
  - authz/access-context
  - status/review
created: 2026-08-18
updated: 2026-08-19
simple_type: type
layer: shared-contract
source_path: types/access.ts
public_source_path: types/access.ts
hardened_source_path: types/access.ts
source_mirror: "[[access.ts|source mirror — types/access.ts]]"
canonicalization_status: review
owner_approval: pending
public_implementation_status: observed
hardened_implementation_status: proposed
generation_status: derived
providers:
  - Clerk
ontologies: []
uses: []
requires: []
permits: []
conditional: []
prohibits:
  - Clerk organization ownership implied by identity contract
substitutes: []
variants: []
tests: []
validation:
  - TypeScript typecheck
---

# `types/access.ts`

## Codependent Coding Knowledge

### Canonical Definition

This file defines the shared compile-time contracts for authenticated external identity and resolved application access context. It makes the identity/tenancy separation visible in the type system.

### Responsibility

- Define application roles and permissions used by authorization code.
- Define the minimal Clerk-derived identity shape.
- Define the richer application-owned `AccessContext` produced after local membership resolution.

### Contract & Invariants

- `AuthenticatedIdentity` contains a Clerk user identity only.
- `AccessContext` adds local `userId`, `organizationId`, `membershipId`, and application role.
- Provider identity is not the application tenant model.

### Boundaries / Anti-Patterns

- Do not add Clerk organization IDs merely to make tenancy convenient.
- Do not treat a TypeScript type as proof that runtime authorization occurred.
- Do not collapse provider identity and application authorization into one giant session blob.

## Simple Properties

### Relationships

- Used by [[codependentcoding.database.tenant.simple]].
- Used by [[codependentcoding.transactions.tenant-context.simple]].
- Consumed by authorization/fetcher/action Simples throughout the template.

### Generation Disposition

**Invariant/derived shared contract.** Backend access contracts are not user-configurable.

## Implementation

### Public Demo Golden Prototype

```ts
export type AppRole =
  | "OWNER"
  | "ADMIN"
  | "MANAGER"
  | "MEMBER"
  | "BILLING"
  | "SUPPORT"
  | "CLIENT"
  | "VIEWER";

export type Permission =
  | "organization:read"
  | "organization:write"
  | "crm:read"
  | "crm:write"
  | "projects:read"
  | "projects:write"
  | "support:read"
  | "support:write"
  | "marketing:read"
  | "marketing:write"
  | "invoicing:read"
  | "invoicing:write"
  | "social:read"
  | "social:write"
  | "ai:read"
  | "ai:write"
  | "portal:read"
  | "portal:write"
  | "portal:billing"
  | "admin:audit"
  | "admin:records"
  | "admin:users"
  | "admin:bulk";

/** Clerk establishes user identity only. Application tenancy is resolved locally. */
export interface AuthenticatedIdentity {
  clerkUserId: string;
}

export interface AccessContext extends AuthenticatedIdentity {
  userId: string;
  organizationId: string;
  membershipId: string;
  role: AppRole;
}
```

### Hardened Golden Prototype

No edition-specific code change is currently justified.

```ts
export type AppRole =
  | "OWNER"
  | "ADMIN"
  | "MANAGER"
  | "MEMBER"
  | "BILLING"
  | "SUPPORT"
  | "CLIENT"
  | "VIEWER";

export type Permission =
  | "organization:read"
  | "organization:write"
  | "crm:read"
  | "crm:write"
  | "projects:read"
  | "projects:write"
  | "support:read"
  | "support:write"
  | "marketing:read"
  | "marketing:write"
  | "invoicing:read"
  | "invoicing:write"
  | "social:read"
  | "social:write"
  | "ai:read"
  | "ai:write"
  | "portal:read"
  | "portal:write"
  | "portal:billing"
  | "admin:audit"
  | "admin:records"
  | "admin:users"
  | "admin:bulk";

export interface AuthenticatedIdentity {
  clerkUserId: string;
}

export interface AccessContext extends AuthenticatedIdentity {
  userId: string;
  organizationId: string;
  membershipId: string;
  role: AppRole;
}
```

### Hardening Delta

None currently identified in this file. Runtime enforcement belongs to auth/authz/database boundaries.

## Validation & Evidence

- [x] Current source mirrored.
- [x] Identity/application-tenancy separation explicit.
- [ ] Role/permission catalog reconciled against the final authorization Simple family.
- [ ] Owner approves canonical contract.

## Links

- [[codependentcoding.simples.database.map]]
- [[codependentcoding.database.tenant.simple]]
- [[codependentcoding.transactions.tenant-context.simple]]
- [[access.ts|source mirror]]

## Backlinks

```dataview
TABLE simple_type AS "Type", layer AS "Layer"
FROM [[]]
SORT file.name ASC
```
