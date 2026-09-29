---
title: Codependent Coding System Map
type: map
scope: domain
project: CodependentCoding
domain: architecture
artifact: system-map
kind: map
namespace: codependentcoding.docs.system-map.map
status: active
authority: source-of-truth
parent: "[[codependentcoding.manifest.map]]"
depends_on:
  - "[[codependentcoding.docs.knowledge-system-definition.source-document]]"
supersedes: []
tags:
  - codependentcoding/architecture
  - codependentcoding/map
  - status/active
created: 2026-08-08
updated: 2026-08-08
source_repository: DigitalHerencia/CodependentCoding
source_path: docs/00-system-map.md
source_commit: 773a3469b80d8f8aafccecd749c60ebdb8a930ae
source_blob: c9f0988d29f792d554ce75a35fc8bd79af556d24
source_format: markdown
---
# System Map

## Canonical hierarchy

```mermaid
flowchart TD
  K["Knowledge System: doctrine and proof"] --> A["WebApp Architecture: form and boundaries"]
  A --> T["TechStack: concrete substrate"]
  K --> G["Governance and specifications"]
  A --> P["Patterns and lifecycles"]
  T --> R["Runtime and tooling"]
  G --> V["Validation and agent execution"]
  P --> V
  R --> V
```

## Runtime ownership

| Fact or decision | Canonical owner | Reconciled into |
|---|---|---|
| Authentication, sessions, external identity | Clerk | local `User` through verified webhooks |
| Tenant membership, RBAC, domain and entitlement state | PostgreSQL application model | fetchers/workflows and DTOs |
| Payment object and settlement state | Stripe | bounded provider mirrors through verified webhooks/retrieval |
| Product transition legality | Domain policy and application workflow | atomic database transition |
| Tenant containment | Application authorization plus PostgreSQL RLS | transaction-scoped runtime role |
| Routes and HTTP outcomes | Next.js `app/` | feature entrypoints and responses |
| Page experience | `features/` | pure presentation components |
| Durable engineering intent | Canonical Markdown and accepted decisions | machine contracts and implementation |
| Conformance | Tests, validators, builds, review, runtime evidence | handoff and conformance reports |

## Application flow

```mermaid
flowchart TD
  B[Browser or provider] --> N[Next.js boundary]
  N --> F[Feature or transport adapter]
  F --> O[Fetcher or workflow]
  O --> Z[Authz, schema, lifecycle]
  Z --> D[Restricted data layer]
  O --> I[Integration adapter]
  D --> P[(PostgreSQL)]
  I --> X[External provider]
```

The data layer never calls upward into React or routing. Integration adapters never decide product authorization. UI visibility never replaces authoritative policy. External state becomes product state only through reconciliation.

## Repository part-whole model

- The knowledge system contains doctrine, models, architecture, patterns, contracts, governance, proof, and provenance.
- Loaded Vibes™ is one architectural definition inside the knowledge system.
- Hipster Stack™ is the implementation substrate of Loaded Vibes™.
- A generated template instantiates the architecture but is not the architecture.
- A product application specializes a generated template but cannot silently redefine the knowledge system.
- Vouch, Vibes, and Control Plus are evidence-bearing implementations with project-specific and legacy behavior.
