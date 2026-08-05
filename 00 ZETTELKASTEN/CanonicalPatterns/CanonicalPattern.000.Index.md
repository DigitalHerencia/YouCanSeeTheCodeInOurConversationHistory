---
title: Canonical SaaS Patterns
status: canonical-draft
tags: [architecture, saas, nextjs, prisma, clerk, stripe, neon]
---

# Canonical SaaS Patterns

These patterns define the default engineering grammar for an opinionated, server-first SaaS application built with TypeScript, Next.js App Router, React Server Components, Clerk, Prisma, Neon PostgreSQL, Stripe, Zod, Vitest, and Playwright.

They are not abstract enterprise theater. Each pattern assigns one responsibility to one layer and makes that boundary testable.

## Core dependency direction

```text
app routes / route handlers
          ↓
features / page orchestration
          ↓
server actions / transport adapters
          ↓
application workflows and commands
          ↓
domain policies and invariants
          ↓
queries / commands / transaction helpers
          ↓
Prisma / PostgreSQL / external providers
```

Presentation code does not reach downward into persistence. Persistence code does not reach upward into React or Next.js navigation.

## Canonical request paths

### Protected read

```text
Route or feature
  → fetcher
    → validate input
    → require actor
    → derive authorized scope
    → scoped query
    → explicit select
    → DTO mapper
    → DTO
  → component
```

### User mutation

```text
Form or client intent
  → Server Action
    → validate transport input
    → require actor
    → application workflow
      → authorize
      → enforce domain invariants
      → query / transaction / provider operation
      → audit / outbox
    → cache invalidation
    → typed ActionResult
```

### Provider webhook

```text
Provider request
  → Route Handler
    → verify signature from raw body
    → persist webhook inbox record
    → atomically claim processing lease
    → idempotent event handler
      → retrieve provider truth when required
      → transactionally reconcile local state
      → enqueue outbox work
    → finalize inbox record
  → HTTP acknowledgement
```

## Pattern catalog

1. **Canonical Pattern 001: The Golden Fetcher**
   - Protected server-side reads
   - Tenant and ownership scoping
   - Selects, DTO mappers, and pagination

2. **Canonical Pattern 002: The Golden Server Action**
   - Thin Next.js mutation adapters
   - Typed mutation results
   - Cache invalidation at the framework boundary

3. **Canonical Pattern 003: The Golden Application Workflow**
   - Use-case sequencing
   - Provider/database consistency
   - Recovery and idempotency

4. **Canonical Pattern 004: The Golden Transaction Helper**
   - Atomic PostgreSQL mutations
   - Serializable retries
   - Optimistic conflict detection

5. **Canonical Pattern 005: The Golden Auth/Authz Boundary**
   - Authentication
   - Tenant membership
   - Capability RBAC
   - Resource policy
   - Readiness and RLS separation

6. **Canonical Pattern 006: The Golden Webhook Processor**
   - Signature verification
   - Durable inbox
   - Processing leases
   - Idempotent reconciliation
   - Outbox-driven secondary effects

## Ownership table

| Layer | Owns | Must not own |
|---|---|---|
| Route | URL, params, metadata, HTTP/404/redirect decisions | Prisma, Stripe, domain rules |
| Feature | Page composition and view-state branching | Protected persistence |
| Fetcher | Authorized read use case and DTO result | Writes, redirects, provider mutation |
| Server Action | Next.js mutation transport and result adaptation | Entire business workflow |
| Workflow | Use-case sequence and cross-boundary coordination | JSX, navigation, raw form parsing |
| Domain policy | Pure decisions, transitions, invariants | Next.js, Prisma, Clerk, Stripe |
| Query | Persistence read mechanics | Session lookup, navigation, UI |
| Command | Persistence write mechanics | Provider orchestration, JSX |
| Transaction helper | Atomic database invariants | Network calls, email, cache invalidation |
| Integration adapter | Provider-specific API mechanics | Product authorization and UI |
| Webhook processor | Provider event reconciliation | Browser/user-session authorization |
| Outbox worker | Retryable secondary effects | Primary transaction truth |
| Component | Rendering and interaction | Protected reads, persistence, secrets |

## Enforcement strategy

Every important convention should have at least one mechanical enforcement mechanism:

```text
Architectural rule
  → ESLint restricted import
  → dependency graph rule
  → type boundary
  → unit or integration test
  → CI gate
```

## Implementation order

```text
Actor/authz
  → query/select/mapper/fetcher
  → command/transaction
  → workflow
  → Server Action
  → webhook inbox/outbox
  → cache strategy
  → RLS
```

RLS comes after tenant ownership is correctly modeled. Caching comes after invalidation ownership is explicit. Stripe comes after local idempotency and recovery records exist.
