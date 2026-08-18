---
pm-task: true
projectId: "aujyaujimsy9s0iz"
parentId:
id: "b27x67i6msy9z5vp"
title: "maximal-template.atomic-ai-rate-limit.work-package"
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
createdAt: "2026-08-18T06:22:02.629Z"
updatedAt: "2026-08-18T06:22:02.629Z"
---

# Make AI Rate Limiting Atomic and Return Correct Errors

**Priority:** P1  
**Phase:** Hardening  
**Task status:** Backlog

## Outcome

Prevent concurrent requests from bypassing the AI generation limit and normalize HTTP/application error semantics.

## Why This Exists

The audited endpoint performs count-then-create and maps provider/runtime/rate-limit failures to HTTP 400.

## Execution Checklist

- [ ] Replace count-then-create with an atomic reservation/limiter mechanism.
- [ ] Define the tenant/user dimension used for limiting.
- [ ] Return `429` for rate-limit exhaustion.
- [ ] Distinguish validation/input, authentication/authorization, provider, and internal failures.
- [ ] Ensure failed provider calls release or account for reservations according to the chosen policy.
- [ ] Add concurrency tests that exceed the limit simultaneously.
- [ ] Add tests for error-status mapping.

## Acceptance Criteria

- [ ] Concurrent requests cannot exceed the configured limit.
- [ ] Rate limits produce 429 semantics.
- [ ] Provider/internal failures are not mislabeled as bad input.
- [ ] Tests cover concurrency and error mapping.

## Dependencies

- None recorded.

## Source Basis

- `The Maximal Template™ Backlog.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.

Project: [[New Project|New Project]]