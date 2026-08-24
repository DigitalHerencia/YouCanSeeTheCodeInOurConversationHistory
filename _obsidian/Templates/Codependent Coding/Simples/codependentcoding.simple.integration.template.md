---
title: "<% tp.file.title %>"
type: simple
scope: file
project: Codependent Coding
domain: integration
artifact: "<% tp.file.title %>"
kind: simple
namespace: "codependentcoding.simples.integration.<% tp.file.title.toLowerCase().replace(/[^a-z0-9]+/g, '.').replace(/^\.+|\.+$/g, '') %>"
status: draft
authority: working-note
parent: "[[codependentcoding.webapp-architecture.master.source-document]]"
depends_on: ["[[The Maximal Template™ Demo Doctrine]]"]
supersedes: []
tags: [codependent-coding/simples, simples/integration, integration/provider, status/draft]
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
simple_type: integration
layer: provider-boundary
provider:
source_path:
public_source_path:
hardened_source_path:
canonicalization_status: unreconciled
public_implementation_status: not-started
hardened_implementation_status: not-started
generation_status: not-ready
uses: []
requires: []
permits: []
conditional: []
prohibits: []
workflows: []
webhooks: []
tests: []
validation: []
role: devnotes
system: devnotes
workspace:
---

# <% tp.file.title %>

## Codependent Coding Knowledge
### Canonical Definition
An integration owns provider-specific external-service mechanics. Classification follows what the provider does in this architecture; Clerk → auth, Neon → db, and Prisma → db + root prisma are explicit stronger-responsibility exceptions.

### Responsibility
- Provider client/configuration/adapters/mechanics.
- Translate provider-specific behavior at a stable boundary.
- Preserve provider truth vs application interpretation.

### Contract & Invariants
- Provider SDK imports stay inside the provider boundary where practical.
- Provider network calls never occur inside database transactions.
- Provider truth is not automatically the application domain model.

### Boundaries / Anti-Patterns
- No provider mechanics spread across features/actions/routes.
- No application authorization/domain ownership absorbed by the integration.

## Simple Properties
### Relationships
- Link workflows/actions/webhooks that invoke this provider behavior.
- Record provider-specific requirements and conflicts.

### Generation Disposition
Derived or selectable provider capability only when a real supported implementation exists; dependency closure retains required provider files automatically.

## Implementation
### Public Demo Golden Prototype
```ts
// Demo/provider stub or safe showcase operation.
```
### Hardened Golden Prototype
```ts
// Production provider integration.
```
### Hardening Delta
- Credentials, retries, failure semantics, reconciliation, rate limits, and provider truth handling.

## Validation & Evidence
- [ ] Provider mechanics are contained.
- [ ] Failure/retry behavior documented where consequential.
- [ ] No network calls inside DB transactions.
- [ ] Secret/config boundary verified.

## Links
- [[10.PROJECTS.CODEPENDENTCODING.WebApp-Architecture.Master.Source-Document]]
- [[10.PROJECTS.CODEPENDENTCODING.WebApp-Architecture.Template-Demo]]

## Backlinks
```dataview
TABLE simple_type AS "Type", provider AS "Provider" FROM [[]] SORT file.name ASC
```

## Tags
Canonical tags live in frontmatter.