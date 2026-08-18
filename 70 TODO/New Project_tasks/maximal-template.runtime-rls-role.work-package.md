---
pm-task: true
projectId: "aujyaujimsy9s0iz"
parentId:
id: "l6gzkfpimsy9z1au"
title: "maximal-template.runtime-rls-role.work-package"
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
createdAt: "2026-08-18T06:21:56.694Z"
updatedAt: "2026-08-18T06:21:56.694Z"
---

# Make PostgreSQL RLS Enforce Tenant Isolation at Runtime

**Priority:** P0  
**Phase:** Hardening  
**Task status:** Backlog

## Outcome

Use a restricted runtime database role that cannot bypass RLS and prove tenant isolation with the same role used by the application.

## Why This Exists

The audited Neon connection used `neondb_owner` with `BYPASSRLS`, so current RLS claims are not runtime truth.

## Execution Checklist

- [ ] Define owner/admin credentials for migrations/administrative lifecycle only.
- [ ] Create a dedicated application runtime role without `BYPASSRLS`.
- [ ] Wire runtime `DATABASE_URL` to the restricted role and migration/direct connection to owner credentials.
- [ ] Verify RLS is enabled/forced as required on tenant tables.
- [ ] Verify tenant/session context variables are set correctly in the database boundary.
- [ ] Add two-tenant positive and negative integration tests using the runtime role.
- [ ] Verify no application code accidentally falls back to owner credentials.
- [ ] Update env examples and operational docs without exposing secrets.

## Acceptance Criteria

- [ ] Runtime application queries execute under a non-bypass role.
- [ ] Cross-tenant RLS tests fail closed.
- [ ] Owner credentials are limited to administrative lifecycle.
- [ ] RLS badges/claims are only enabled after executed proof.

## Dependencies

- None recorded.

## Source Basis

- `The Maximal Template™ Backlog.md`
- `codependentcoding.webapp-architecture.master.source-document.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.

Project: [[New Project|New Project]]