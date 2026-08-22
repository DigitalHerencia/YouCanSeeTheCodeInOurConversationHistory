---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\reviewing-oracle-to-postgres-migration\references\postgres-union-all-planner.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\reviewing-oracle-to-postgres-migration\references\postgres-union-all-planner.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.reviewing-oracle-to-postgres-migration.references.postgres-union-all-planner.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\reviewing-oracle-to-postgres-migration\references\postgres-union-all-planner.md'
source_file: 'postgres-union-all-planner.md'
source_sha256: 'ec06ce585362d904f43b2f29bc46452924736386185dc06942cd4d21d2d350db'
generated: true
---

# `postgres-union-all-planner.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\reviewing-oracle-to-postgres-migration\references\postgres-union-all-planner.md`
> SHA-256: `ec06ce585362d904f43b2f29bc46452924736386185dc06942cd4d21d2d350db`

```markdown
# PostgreSQL UNION ALL Planner Risk Guide

Purpose: Avoid regressions where migrated `UNION ALL` queries run much slower in PostgreSQL than expected.

## Problem

`UNION ALL` keeps duplicate rows and combines branch outputs directly, but PostgreSQL does not always optimize each branch as aggressively as isolated queries. In large datasets this can produce poor plans (for example full scans where index-based plans are expected).

## Why it happens

- Predicate pushdown through `UNION ALL` branches can be limited depending on query shape.
- Cardinality estimates across branches can be skewed.
- Branch-local indexes may not be chosen when the optimizer evaluates the combined query.

## Review checklist

- [ ] Compare `EXPLAIN (ANALYZE, BUFFERS)` plans for the combined `UNION ALL` query and branch-isolated variants.
- [ ] Confirm branch predicates are explicit and not hidden inside non-sargable expressions.
- [ ] Check for unexpected sequential scans on large tables in either branch.
- [ ] Verify indexes exist for each branch's filter and join predicates.

## Mitigation patterns

1. Test each branch independently to verify expected index usage.
2. Push filters down into each branch instead of only filtering in the outer query.
3. If plan quality remains poor, split the query into two separately executed statements and combine results in application code.
4. Consider materializing branch results in temporary/intermediate structures only when measurement confirms benefit.

## Validation note

Treat `UNION ALL` performance behavior as a migration review item even when functional test results match Oracle.

```