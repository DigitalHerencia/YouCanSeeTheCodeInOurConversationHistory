---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\reviewing-oracle-to-postgres-migration\references\postgres-materialized-view-refresh.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\reviewing-oracle-to-postgres-migration\references\postgres-materialized-view-refresh.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.reviewing-oracle-to-postgres-migration.references.postgres-materialized-view-refresh.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\reviewing-oracle-to-postgres-migration\references\postgres-materialized-view-refresh.md'
source_file: 'postgres-materialized-view-refresh.md'
source_sha256: '66fa39928878d4f121cc33a097b5853247fa30bfff801af380d578b1e147d526'
generated: true
---

# `postgres-materialized-view-refresh.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\reviewing-oracle-to-postgres-migration\references\postgres-materialized-view-refresh.md`
> SHA-256: `66fa39928878d4f121cc33a097b5853247fa30bfff801af380d578b1e147d526`

````markdown
# PostgreSQL Materialized View Refresh Guide

Purpose: Ensure migrated applications keep materialized views current after base-table changes.

## Problem

PostgreSQL materialized views are static snapshots. Updates to source tables do **not** automatically refresh dependent materialized views.

## Migration risk

- Oracle-era assumptions that derived data updates immediately may no longer hold.
- Read paths can return stale rows unless refresh timing is explicitly managed.
- Integration tests may pass once and then fail intermittently if refresh sequencing is not deterministic.

## Required review item

For every migrated path that writes to tables feeding a materialized view, verify the application workflow includes an explicit refresh strategy.

## Refresh patterns

- Immediate refresh in the write workflow when freshness is required:
  ```sql
  REFRESH MATERIALIZED VIEW my_view;
  ```
- Concurrent refresh (when supported and indexed) to reduce read blocking:
  ```sql
  REFRESH MATERIALIZED VIEW CONCURRENTLY my_view;
  ```
- Scheduled/batch refresh when stale windows are acceptable.

## Integration-test expectations

- [ ] Tests that modify source tables assert materialized-view contents only after the intended refresh action.
- [ ] Tests assert stale behavior before refresh when applicable.
- [ ] Tests document whether freshness is immediate or eventual for each affected feature.

````