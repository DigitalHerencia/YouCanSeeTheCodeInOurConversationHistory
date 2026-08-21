---
title: "<% tp.file.title %>"
type: simple
scope: file
project: Codependent Coding
domain: authorization
artifact: "<% tp.file.title %>"
kind: simple
namespace: "codependentcoding.simples.authz.<% tp.file.title.toLowerCase().replace(/[^a-z0-9]+/g, '.').replace(/^\.+|\.+$/g, '') %>"
status: draft
authority: working-note
parent: "[[codependentcoding.webapp-architecture.master.source-document]]"
depends_on: ["[[The Maximal Template™ Demo Doctrine]]"]
supersedes: []
tags: [codependent-coding/simples, simples/authz, security/authorization, status/draft]
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
simple_type: authz
layer: authorization
policy_kind:
resource:
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
tests: []
validation: []
---

# <% tp.file.title %>

## Codependent Coding Knowledge
### Canonical Definition
Authorization decides what an authenticated actor may do to a resource in a tenant/context. It owns application RBAC, ABAC, capability, ownership, and resource-policy decisions.

### Responsibility
- Evaluate role/capability/resource/context rules.
- Preserve organization/tenant boundaries.
- Provide reusable policy helpers to protected operations.

### Contract & Invariants
- Default-deny protected behavior where required.
- Authn and authz remain separate.
- Application authz does not replace PostgreSQL RLS; RLS remains containment/defense in depth where applicable.

### Boundaries / Anti-Patterns
- No Clerk-provider metadata as sole business policy truth.
- No authorization performed only after a broad cross-tenant query when query scoping is feasible.

## Simple Properties
### Relationships
- Record resource, role/capability inputs, protected operations, tenant context, and RLS relationship.

### Generation Disposition
Invariant/derived backend security behavior; never exposed as an arbitrary user toggle.

## Implementation
### Public Demo Golden Prototype
```ts
// Demo policy representation; public visibility must not imply mutation permission.
```
### Hardened Golden Prototype
```ts
// Production RBAC/ABAC/resource policy.
```
### Hardening Delta
- 

## Validation & Evidence
- [ ] Policy inputs and decision are explicit.
- [ ] Tenant/resource integrity tested.
- [ ] Application authz and RLS responsibilities remain distinct.
- [ ] Public demo cannot weaken protected operations.

## Links
- [[10.PROJECTS.CODEPENDENTCODING.WebApp-Architecture.Master.Source-Document]]
- [[10.PROJECTS.CODEPENDENTCODING.WebApp-Architecture.Template-Demo]]

## Backlinks
```dataview
TABLE simple_type AS "Type", layer AS "Layer" FROM [[]] SORT file.name ASC
```

## Tags
Canonical tags live in frontmatter.