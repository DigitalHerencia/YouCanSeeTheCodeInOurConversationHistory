---
title: "<% tp.file.title %>"
namespace: "<% tp.user.makeNamespace(tp.user.inferSystem(tp.file.folder(true)), tp.user.inferRole(tp.file.folder(true)), tp.file.title, 'data-model') %>"
role: "<% tp.user.inferRole(tp.file.folder(true)) %>"
system: "<% tp.user.inferSystem(tp.file.folder(true)) %>"
workspace: "<% tp.user.inferWorkspace(tp.file.folder(true)) %>"
type: "data-model"
status: "draft"
authority: "project-specific"
created: "<% tp.date.now('YYYY-MM-DD') %>"
updated: "<% tp.date.now('YYYY-MM-DD') %>"
tags: []
---

# Data / Domain Model

## Domain Scope
## Authoritative State Owners
## Entities
## Value Objects
## Relationships
## Cardinality
## Ownership / Tenancy
## Lifecycles
## Invariants
## Constraints
## PostgreSQL Mapping
## Prisma Mapping
## Selects / Projections
## DTO Boundaries
## Transaction / Concurrency Semantics
## Migration Consequences
## Validation
