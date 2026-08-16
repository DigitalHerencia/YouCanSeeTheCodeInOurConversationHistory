---
title: "Build Architecture-Specific Implementation Skills"
type: work-package
scope: project
project: "Loaded Vibes Codex Plugin"
domain: "skills"
artifact: "implementation-skills"
kind: work-package
namespace: loaded-vibes.implementation-skills.work-package
status: active
authority: working-note
parent: "[[loaded-vibes.execution.tasks.map]]"
depends_on:
  - "[[loaded-vibes.context-classification-skills.work-package]]"
supersedes: []
tags:
  - projects/loaded-vibes
  - work-package
  - work/backlog
  - priority/p0
created: 2026-08-16
updated: 2026-08-16
priority: P0
task_status: backlog
phase: "Skills"
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
