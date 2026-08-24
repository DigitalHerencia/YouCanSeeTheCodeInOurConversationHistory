---
title: "<% tp.file.title %>"
type: simple
scope: file
project: Codependent Coding
domain: database
artifact: "<% tp.file.title %>"
kind: simple
namespace: "codependentcoding.simples.database.<% tp.file.title.toLowerCase().replace(/[^a-z0-9]+/g, '.').replace(/^\.+|\.+$/g, '') %>"
status: draft
authority: working-note
parent: "[[codependentcoding.webapp-architecture.master.source-document]]"
depends_on: ["[[The Maximal Template™ Demo Doctrine]]"]
supersedes: []
tags: [codependent-coding/simples, simples/database, database/runtime, status/draft]
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
simple_type: database
layer: database-runtime
source_path:
public_source_path:
hardened_source_path:
canonicalization_status: unreconciled
public_implementation_status: not-started
hardened_implementation_status: not-started
generation_status: not-ready
provider: Neon/Postgres
orm: Prisma
uses: []
requires: []
permits: []
conditional: []
prohibits: []
tests: []
validation: []
role: devnotes
system: devnotes
workspace:
---

# <% tp.file.title %>

## Codependent Coding Knowledge
### Canonical Definition
A database-runtime Simple owns Neon/Postgres + Prisma runtime infrastructure under `lib/db`. Prisma schema/migrations/seed remain in Prisma's root lifecycle rather than being hidden inside application abstractions.

### Responsibility
- Database client/runtime wiring.
- Production runtime role/connection semantics where owned by the file.
- Make the Prisma/Neon responsibility boundary obvious.

### Contract & Invariants
- Persisted reads remain fetcher-owned.
- Ordinary CRUD writes remain action-owned.
- Atomic multi-write invariants remain transaction-owned.
- Production tenant containment/RLS must execute under the intended non-bypass role where applicable.

### Boundaries / Anti-Patterns
- No random `integrations/neon` or `integrations/prisma` when database responsibility is stronger.
- No application domain logic in the DB runtime file.

## Simple Properties
### Relationships
- Link fetchers/actions/transactions/selects and configuration that depend on this runtime boundary.

### Generation Disposition
Invariant/derived foundation; backend DB architecture is not end-user configurable.

## Implementation
### Public Demo Golden Prototype
```ts
// Demo database runtime/client boundary.
```
### Hardened Golden Prototype
```ts
// Production runtime role/client/tenant containment boundary.
```
### Hardening Delta
- Runtime role, pool/direct connection semantics, tenant context, RLS behavior, env validation.

## Validation & Evidence
- [ ] Runtime role assumptions verified.
- [ ] RLS/tenant context semantics verified where applicable.
- [ ] DB client is server-only.
- [ ] No application responsibility leaked into runtime infrastructure.

## Links
- [[10.PROJECTS.CODEPENDENTCODING.WebApp-Architecture.Master.Source-Document]]
- [[10.PROJECTS.CODEPENDENTCODING.WebApp-Architecture.Template-Demo]]

## Backlinks
```dataview
TABLE simple_type AS "Type", provider AS "Provider" FROM [[]] SORT file.name ASC
```

## Tags
Canonical tags live in frontmatter.