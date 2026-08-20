---
title: 'The Hipster Stack™ Technology Stack\template\docs\adr\adr-0004-postgresql-rls-roles-and-context.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\docs\adr\adr-0004-postgresql-rls-roles-and-context.md'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.docs.adr.adr-0004-postgresql-rls-roles-and-context.md'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-hipster-stack-technology-stack
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Hipster Stack™ Technology Stack\template\docs\adr\adr-0004-postgresql-rls-roles-and-context.md'
source_file: 'adr-0004-postgresql-rls-roles-and-context.md'
source_sha256: '15d027f361a9f7c2ceef83e3dfbf7e160e9b962b60996465410782e7075ff8a6'
generated: true
---

# `adr-0004-postgresql-rls-roles-and-context.md`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\docs\adr\adr-0004-postgresql-rls-roles-and-context.md`
> SHA-256: `15d027f361a9f7c2ceef83e3dfbf7e160e9b962b60996465410782e7075ff8a6`

```markdown
---
title: "ADR-0004: PostgreSQL RLS Roles and Context"
status: "Accepted"
date: "2026-08-03"
authors: "Repository maintainers"
tags: ["architecture", "database", "security"]
supersedes: ""
superseded_by: ""
---

# ADR-0004: PostgreSQL RLS Roles and Context

## Status

Accepted

## Context

Application authorization alone does not contain accidental cross-tenant database access.

## Decision

Migrations use a direct owner connection. Runtime uses a pooled restricted role that owns no protected table and lacks `BYPASSRLS`. Tenant context is set transaction-locally by one canonical helper, and tenant operations use that transaction-scoped Prisma client.

## Consequences

### Positive

- **POS-001**: PostgreSQL independently contains tenant rows.
- **POS-002**: Direct real-database attack tests can prove isolation.

### Negative

- **NEG-001**: Local and CI database tests need multiple roles and direct connections.
- **NEG-002**: The current schema has no tenant RLS and remains incomplete.

## Alternatives Considered

### Application filters only

- **ALT-001**: **Description**: Depend exclusively on Prisma `where` clauses.
- **ALT-002**: **Rejection Reason**: One missed filter can expose another tenant's rows.

## Implementation Notes

- **IMP-001**: Policies must cover all CRUD operations with `USING` and `WITH CHECK` as applicable.
- **IMP-002**: Production migrations remain an owner-authorized deployment gate.

## References

- **REF-001**: ADR-0002 and ADR-0003.

```