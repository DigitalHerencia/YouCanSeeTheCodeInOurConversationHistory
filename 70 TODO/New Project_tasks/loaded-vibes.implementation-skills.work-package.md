---
pm-task: true
projectId: "aujyaujimsy9s0iz"
parentId:
id: "1ktqb588msy9yvm0"
title: "loaded-vibes.implementation-skills.work-package"
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
createdAt: "2026-08-18T06:21:49.320Z"
updatedAt: "2026-08-18T06:21:49.320Z"
---

# Build Architecture-Specific Implementation Skills

**Priority:** P0  
**Phase:** Skills  
**Task status:** Backlog

## Outcome

Provide narrow repeatable implementation skills for the operations Codex most often needs to add or change inside an Ordinary Object.

## Why This Exists

The plugin should prevent agents from rediscovering file shapes or inventing service layers when implementing common architecture responsibilities.

## Execution Checklist

- [ ] Fetcher skill: scoped read, auth/authz, select, DTO, cache semantics, read-only invariant.
- [ ] Action skill: authn/authz, schema, CRUD mutation boundary, transaction/cache use, stable result.
- [ ] Workflow skill: constitute reusable application logic from existing server operations/helpers without absorbing their ownership.
- [ ] Transaction skill: atomic DB-only invariants with no provider/network I/O.
- [ ] Webhook skill: raw request verification, event interpretation, retry/idempotency, persistence, provider response.
- [ ] Form-feature skill: React Hook Form plus UI-primitives direct-import exception.
- [ ] Feature/orchestration skill: server-first feature, blocks, client island only when needed.
- [ ] Provider integration skill: SDK/mechanics isolated under canonical provider boundary.
- [ ] Select/DTO/schema helper skills where repetition justifies them.
- [ ] Each skill should inspect an existing reference implementation before creating a new shape.

## Acceptance Criteria

- [ ] Common operations can be implemented without inventing architecture.
- [ ] Skills reflect the corrected workflow constitution model.
- [ ] Each skill states preconditions, owning files, forbidden behavior, and validation.

## Dependencies

- [[loaded-vibes.context-classification-skills.work-package]]

## Source Basis

- `codependentcoding.webapp-architecture.master.source-document.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.

Project: [[New Project|New Project]]