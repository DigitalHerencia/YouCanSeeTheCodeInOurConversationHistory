---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\planning-oracle-to-postgres-migration-integration-testing\SKILL.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\planning-oracle-to-postgres-migration-integration-testing\SKILL.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.planning-oracle-to-postgres-migration-integration-testing.skill.md'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-loaded-vibes-codex-plugin
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\planning-oracle-to-postgres-migration-integration-testing\SKILL.md'
source_file: 'SKILL.md'
source_sha256: '9462c7d627ab958a8c55b7b972b3e187dea779c000350453b6ad04d2260c7696'
generated: true
---

# `SKILL.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\planning-oracle-to-postgres-migration-integration-testing\SKILL.md`
> SHA-256: `9462c7d627ab958a8c55b7b972b3e187dea779c000350453b6ad04d2260c7696`

````markdown
---
name: planning-oracle-to-postgres-migration-integration-testing
description: 'Creates an integration testing plan for .NET data access artifacts during Oracle-to-PostgreSQL database migrations. Analyzes a single project to identify repositories, DAOs, and service layers that interact with the database, then produces a structured testing plan. Use when planning integration test coverage for a migrated project, identifying which data access methods need tests, or preparing for Oracle-to-PostgreSQL migration validation.'
---

# Planning Integration Testing for Oracle-to-PostgreSQL Migration

Analyze a single target project to identify data access artifacts that require integration testing, then produce a structured, actionable testing plan.

## Workflow

```
Progress:
- [ ] Step 1: Identify data access artifacts
- [ ] Step 2: Classify testing priorities
- [ ] Step 3: Write the testing plan
```

**Step 1: Identify data access artifacts**

Scope to the target project only. Find classes and methods that interact directly with the database — repositories, DAOs, stored procedure callers, service layers performing CRUD operations.

**Step 2: Classify testing priorities**

Rank artifacts by migration risk. Prioritize methods that use Oracle-specific features (refcursors, `TO_CHAR`, implicit type coercion, `NO_DATA_FOUND`) over simple CRUD.

**Step 3: Write the testing plan**

Write a markdown plan covering:
- List of testable artifacts with method signatures
- Recommended test cases per artifact
- Seed data requirements
- Known Oracle→PostgreSQL behavioral differences to validate
- Coverage mapping that ensures every database touchpoint has at least one test case (or a justified set of cases for high-risk methods)

When defining recommended test cases, explicitly include:
- Text parameter behavior for both empty string and `NULL`/missing values.
- Datetime/timezone assertions, including round-trip and comparison behavior.
- Cases where destination columns use `timestamp without time zone` or `timestamp(0)`, with explicit timezone-application expectations.

## Output

Write the plan to: `.github/oracle-to-postgres-migration/Reports/{TARGET_PROJECT} Integration Testing Plan.md`

## Key Constraints

- **Single project scope** — only plan tests for artifacts within the target project.
- **Database interactions only** — skip business logic that does not touch the database.
- **Oracle is the golden source** — tests should capture Oracle's expected behavior for comparison against PostgreSQL.
- **No multi-connection harnessing** — migrated applications are copied and renamed (e.g., `MyApp.Postgres`), so each instance targets one database.

````