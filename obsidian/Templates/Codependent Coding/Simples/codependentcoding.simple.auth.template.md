---
title: "codependentcoding.simple.action.template"
type: simple
scope: file
project: Codependent Coding
domain: authentication
artifact: "codependentcoding.simple.action.template"
kind: simple
namespace: "codependentcoding.simples.auth.codependentcoding.simple.action.template"
status: draft
authority: working-note
parent: "[[codependentcoding.webapp-architecture.master.source-document]]"
depends_on: ["[[The Maximal Template™ Demo Doctrine]]"]
supersedes: []
tags: [codependent-coding/simples, simples/auth, security/authentication, status/draft]
created: 2026-08-27
updated: 2026-08-27
simple_type: auth
layer: authentication
provider: Clerk
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
role: devnotes
system: devnotes
workspace:
---

# codependentcoding.simple.action.template

## Codependent Coding Knowledge
### Canonical Definition
Authentication establishes verified identity/session state. Clerk is the authentication implementation; it does not own application tenancy or authorization policy.

### Responsibility
- Session/identity verification.
- App-facing current-user/current-identity helpers.
- Adapt provider identity into application-owned identity context where required.

### Contract & Invariants
- Authentication answers who the actor is.
- Authorization remains a separate authz responsibility.
- Organization/membership/business-role truth remains application-owned unless explicitly changed later.

### Boundaries / Anti-Patterns
- Do not treat Clerk metadata as the application policy engine.
- Do not move RBAC/ABAC into auth helpers.

## Simple Properties
### Relationships
- Link downstream authz, membership/organization, routes/features, and provider boundaries as real relationships.

### Generation Disposition
Invariant/derived backend foundation when required by the generated application.

## Implementation
### Public Demo Golden Prototype
```ts
// Demo-safe authentication capability exposure.
```
### Hardened Golden Prototype
```ts
// Production identity/session helper.
```
### Hardening Delta
-

## Validation & Evidence
- [ ] Identity/session ownership is clear.
- [ ] Authz remains separate.
- [ ] Provider/application truth boundary is explicit.

## Links
- [[10.PROJECTS.CODEPENDENTCODING.WebApp-Architecture.Master.Source-Document]]
- [[10.PROJECTS.CODEPENDENTCODING.WebApp-Architecture.Template-Demo]]

## Backlinks
```dataview
TABLE simple_type AS "Type", layer AS "Layer" FROM [[]] SORT file.name ASC
```

## Tags
Canonical tags live in frontmatter.