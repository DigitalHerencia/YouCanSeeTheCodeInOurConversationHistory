---
pm-task: true
projectId: "aujyaujimsy9s0iz"
parentId:
id: "uzlbws3jmsy9z60c"
title: "maximal-template.authenticated-tenant-reads.work-package"
type: "task"
status: "todo"
priority: "medium"
start: "2026-08-18"
due: ""
progress: 0
assignees: []
tags: []
subtaskIds: []
dependencies: []
createdAt: "2026-08-18T06:22:02.796Z"
updatedAt: "2026-08-18T06:22:02.796Z"
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

Project: [[New Project|New Project]]