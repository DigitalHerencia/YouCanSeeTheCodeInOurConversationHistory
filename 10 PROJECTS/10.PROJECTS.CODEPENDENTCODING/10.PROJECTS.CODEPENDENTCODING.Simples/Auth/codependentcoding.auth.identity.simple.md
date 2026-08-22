---
title: Maximal Template — lib/auth/identity.ts
type: simple
scope: file
project: Codependent Coding
domain: authentication
artifact: lib/auth/identity.ts
kind: simple
namespace: codependentcoding.auth.identity.simple
status: review
authority: working-note
parent: "[[10.PROJECTS.CODEPENDENTCODING.WebApp-Architecture.Master.Source-Document]]"
depends_on:
  - "[[10.PROJECTS.CODEPENDENTCODING.WebApp-Architecture.Template-Demo]]"
supersedes: []
tags:
  - codependent-coding/simples
  - simples/auth
  - authentication/clerk
  - status/review
created: 2026-08-18
updated: 2026-08-19
simple_type: auth
layer: authentication
source_path: lib/auth/identity.ts
public_source_path: lib/auth/identity.ts
hardened_source_path: lib/auth/identity.ts
source_mirror: "[[identity.ts|source mirror — lib/auth/identity.ts]]"
canonicalization_status: review
owner_approval: pending
public_implementation_status: observed
hardened_implementation_status: proposed
generation_status: invariant
providers:
  - Clerk
ontologies: []
uses: []
requires:
  - Clerk server auth
permits: []
conditional: []
prohibits:
  - application tenancy encoded in provider identity
substitutes: []
variants: []
tests:
  - unauthenticated identity returns null
  - requireIdentity fails closed
validation:
  - TypeScript typecheck
---

# `lib/auth/identity.ts`

## Codependent Coding Knowledge

### Canonical Definition

This file owns the application-facing authentication boundary over Clerk server auth. It converts Clerk's current request identity into the minimal `AuthenticatedIdentity` contract and fails closed when authentication is required but absent.

### Responsibility

- Ask Clerk whether the request is authenticated.
- Return the verified Clerk user ID as the minimal external identity.
- Provide a strict `requireIdentity()` boundary for protected server operations.

### Contract & Invariants

- Authentication establishes identity only.
- `AuthenticatedIdentity` contains `clerkUserId`; application organization/membership context is resolved elsewhere.
- `getIdentity()` may return `null`.
- `requireIdentity()` throws when identity is absent.

### Boundaries / Anti-Patterns

- No RBAC/ABAC decisions.
- No Clerk Organization as product tenancy.
- No database reads or membership resolution here.
- No client-side authentication authority.

## Simple Properties

### Relationships

- Produces [[codependentcoding.types.access.simple|AuthenticatedIdentity]].
- Hardened [[codependentcoding.database.tenant.simple]] uses this boundary before resolving application tenancy.

### Generation Disposition

**Invariant authentication foundation.** Clerk is the supported identity provider in the current architecture; the generated backend does not expose identity semantics as arbitrary composition toggles.

## Implementation

### Public Demo Golden Prototype

```ts
import "server-only";

import { auth } from "@clerk/nextjs/server";

import type { AuthenticatedIdentity } from "../../types/access";

export class AuthenticationRequiredError extends Error {
  constructor() {
    super("Authentication is required.");
    this.name = "AuthenticationRequiredError";
  }
}

export async function getIdentity(): Promise<AuthenticatedIdentity | null> {
  const { isAuthenticated, userId } = await auth();

  if (!isAuthenticated || !userId) {
    return null;
  }

  return { clerkUserId: userId };
}

export async function requireIdentity(): Promise<AuthenticatedIdentity> {
  const identity = await getIdentity();

  if (!identity) {
    throw new AuthenticationRequiredError();
  }

  return identity;
}
```

### Hardened Golden Prototype

No edition-specific source change is currently supported by the supplied material. The public showroom bypasses this boundary only for explicit seeded **read-only** demo infrastructure; protected operations still use it.

```ts
import "server-only";

import { auth } from "@clerk/nextjs/server";

import type { AuthenticatedIdentity } from "../../types/access";

export class AuthenticationRequiredError extends Error {
  constructor() {
    super("Authentication is required.");
    this.name = "AuthenticationRequiredError";
  }
}

export async function getIdentity(): Promise<AuthenticatedIdentity | null> {
  const { isAuthenticated, userId } = await auth();
  return isAuthenticated && userId ? { clerkUserId: userId } : null;
}

export async function requireIdentity(): Promise<AuthenticatedIdentity> {
  const identity = await getIdentity();
  if (!identity) throw new AuthenticationRequiredError();
  return identity;
}
```

### Hardening Delta

None in responsibility. Hardened generated reads use this identity instead of the showroom's seeded identity adapter.

## Validation & Evidence

- [x] Current source mirrored.
- [x] Identity/tenancy separation explicit.
- [ ] Protected read/write integration tests call this boundary.
- [ ] Owner approves canonical contract.

## Links

- [[codependentcoding.database.tenant.simple]]
- [[codependentcoding.types.access.simple]]
- [[identity.ts|source mirror]]

## Backlinks

```dataview
TABLE simple_type AS "Type", layer AS "Layer"
FROM [[]]
SORT file.name ASC
```
