---
title: Maximal Template — lib/db/provider.ts
type: simple
scope: file
project: Codependent Coding
domain: database
artifact: lib/db/provider.ts
kind: simple
namespace: codependentcoding.database.provider.simple
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
  - database/provider-transaction
  - integrations/webhooks
  - status/review
created: 2026-08-18
updated: 2026-08-19
simple_type: database
layer: provider-persistence-boundary
source_path: lib/db/provider.ts
public_source_path: lib/db/provider.ts
hardened_source_path: lib/db/provider.ts
source_mirror: "[[10 PROJECTS/10.PROJECTS.CODEPENDENTCODING/10.PROJECTS.CODEPENDENTCODING.Source Mirror/The Codependent Coding™ Web App Architecture/The Maximal Template™ Domain Library/lib/db/provider.ts|source mirror — lib/db/provider.ts]]"
canonicalization_status: review
owner_approval: pending
public_implementation_status: observed
hardened_implementation_status: proposed
generation_status: blocked-by-hardening
providers:
  - Stripe
  - SendGrid
  - Prisma
ontologies: []
uses:
  - "[[codependentcoding.database.client.simple]]"
requires:
  - authenticated provider event before organization-scoped use
permits:
  - provider webhook persistence
conditional:
  - organization context must come from trusted verified provider interpretation
prohibits:
  - provider network calls inside transaction callback
substitutes: []
variants:
  - public-showroom
  - hardened-template
tests:
  - failed webhook retries
  - duplicate processed webhook ignored
validation:
  - organization context set transaction-locally
---

# `lib/db/provider.ts`

## Codependent Coding Knowledge

### Canonical Definition

This file provides database transaction helpers for provider/webhook persistence that is not initiated by an authenticated application user. It gives verified provider event handling a database transaction boundary and, when required, a transaction-local application organization context.

### Responsibility

- Start provider persistence transactions.
- Set `app.organization_id` transaction-locally when a verified provider event has already been mapped to an application organization.
- Pass a Prisma transaction client to the caller.

### Contract

- Provider authentication/signature verification remains provider-integration/HTTP-edge responsibility.
- Provider semantics remain integration-owned.
- Atomic persistence remains database-transaction responsibility.
- This helper does not make an organization ID trustworthy merely because it was passed in.

### Invariants

- Provider network calls stay outside the database transaction callback.
- Organization-scoped provider persistence must use trusted provider-derived/application-mapped organization identity.
- The `set_config(..., true)` value is transaction-local.

### Boundaries & Separations

**Owns**
- Provider persistence transaction wrapper.
- Transaction-local organization context for provider-originated persistence.

**Does not own**
- Webhook signature verification.
- Event parsing/classification.
- Retry/idempotency lifecycle.
- Stripe/SendGrid API mechanics.

### Anti-Patterns

- Calling provider APIs inside `work(tx)`.
- Passing an unverified user-controlled organization ID into this boundary.
- Treating this helper as the webhook itself.

## Simple Properties

### Relationships

- Uses [[codependentcoding.database.client.simple]].
- Current Stripe/SendGrid webhook routes use this Simple.
- Webhook claim/complete/fail semantics live in transaction helpers outside this file.

### Generation Disposition

**Derived backend infrastructure.** Included only when provider/webhook persistence requires it; never a presentation checkbox.

## Implementation

### Public Demo Golden Prototype

```ts
import "server-only";

import type { Prisma } from "../../generated/prisma/client";

import { prisma } from "./client";

export function withProviderTransaction<T>(
  work: (tx: Prisma.TransactionClient) => Promise<T>,
) {
  return prisma.$transaction(work, { maxWait: 5_000, timeout: 15_000 });
}

export function withProviderOrganizationTransaction<T>(
  organizationId: string,
  work: (tx: Prisma.TransactionClient) => Promise<T>,
) {
  return withProviderTransaction(async (tx) => {
    await tx.$executeRaw`SELECT set_config('app.organization_id', ${organizationId}, true)`;
    return work(tx);
  });
}
```

### Hardened Golden Prototype

The core helper can remain the same. Hardening belongs in the credential, provider-truth, and webhook lifecycle boundaries rather than adding another abstraction for its own sake.

```ts
import "server-only";

import type { Prisma } from "../../generated/prisma/client";

import { prisma } from "./client";

export function withProviderTransaction<T>(
  work: (tx: Prisma.TransactionClient) => Promise<T>,
) {
  return prisma.$transaction(work, { maxWait: 5_000, timeout: 15_000 });
}

export function withProviderOrganizationTransaction<T>(
  organizationId: string,
  work: (tx: Prisma.TransactionClient) => Promise<T>,
) {
  return withProviderTransaction(async (tx) => {
    await tx.$executeRaw`SELECT set_config('app.organization_id', ${organizationId}, true)`;
    return work(tx);
  });
}
```

### Hardening Delta

- Run under the restricted runtime role when touching RLS-protected tables.
- The caller must derive `organizationId` only after authenticating/verifying the provider event and mapping provider truth to application state.
- Fix FAILED/stale PROCESSING webhook reclaim semantics in the webhook-event transaction lifecycle; that is not this Simple's responsibility.

## Validation & Evidence

- [x] Current source mirrored.
- [x] Stripe route usage observed.
- [x] Responsibility separated from webhook HTTP/provider mechanics.
- [ ] Webhook retry lifecycle hardened in its own Simple.
- [ ] Provider organization-scoped persistence tested under restricted DB role.
- [ ] Owner approves canonical contract.

## Links

- [[codependentcoding.simples.database.map]]
- [[codependentcoding.database.client.simple]]
- [[10 PROJECTS/10.PROJECTS.CODEPENDENTCODING/10.PROJECTS.CODEPENDENTCODING.Source Mirror/The Codependent Coding™ Web App Architecture/The Maximal Template™ Domain Library/app/api/stripe/webhooks/route.ts|Stripe webhook source mirror]]
- [[10 PROJECTS/10.PROJECTS.CODEPENDENTCODING/10.PROJECTS.CODEPENDENTCODING.Source Mirror/The Codependent Coding™ Web App Architecture/The Maximal Template™ Domain Library/lib/db/provider.ts|source mirror]]

## Backlinks

```dataview
TABLE simple_type AS "Type", layer AS "Layer"
FROM [[]]
SORT file.name ASC
```
