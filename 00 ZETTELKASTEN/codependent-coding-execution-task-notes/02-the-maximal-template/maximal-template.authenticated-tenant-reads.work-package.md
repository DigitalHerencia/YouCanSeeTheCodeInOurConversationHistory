---
title: "Replace Demo-Pinned Reads with Authenticated Tenant Context"
type: work-package
scope: project
project: "The Maximal Template"
domain: "hardening"
artifact: "authenticated-tenant-reads"
kind: work-package
namespace: maximal-template.authenticated-tenant-reads.work-package
status: active
authority: working-note
parent: "[[maximal-template.execution.tasks.map]]"
depends_on:
  []
supersedes: []
tags:
  - projects/maximal-template
  - work-package
  - work/backlog
  - priority/p0
created: 2026-08-16
updated: 2026-08-16
priority: P0
task_status: backlog
phase: "Hardening"
---

# Replace Demo-Pinned Reads with Authenticated Tenant Context

**Priority:** P0  
**Phase:** Hardening  
**Task status:** Backlog

## Outcome

Make production/generated fetchers resolve the real Clerk identity, application membership, and active organization instead of using a seeded demo identity.

## Why This Exists

The backlog identifies `withTemplateReadTransaction()` hardcoding `user_seed_owner`, including for semantically personal reads such as `getMyTasks()`.

## Execution Checklist

- [ ] Define the canonical production read-context helper from Clerk identity → application user → membership → organization.
- [ ] Remove seeded-user fallback from ordinary generated/private fetchers.
- [ ] Keep any public demo read boundary explicitly separate and named.
- [ ] Update all fetchers using demo-pinned context.
- [ ] Verify `getMyTasks()` and equivalent user-relative fetchers use the authenticated principal.
- [ ] Ensure tenant/resource predicates remain explicit even with RLS defense in depth.
- [ ] Add integration tests for authenticated tenant reads and cross-tenant rejection.

## Acceptance Criteria

- [ ] No generated/private fetcher silently uses the demo identity.
- [ ] User-relative reads are actually user-relative.
- [ ] Cross-tenant reads fail under real authenticated context.
- [ ] Any retained demo read path is explicitly isolated.

## Dependencies

- None recorded.

## Source Basis

- `The Maximal Template™ Backlog.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
