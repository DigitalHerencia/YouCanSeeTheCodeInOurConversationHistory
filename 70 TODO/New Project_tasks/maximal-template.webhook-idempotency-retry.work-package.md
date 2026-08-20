---
pm-task: true
projectId: "aujyaujimsy9s0iz"
parentId:
id: "xf75yqoomsy9z14m"
title: "maximal-template.webhook-idempotency-retry.work-package"
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
createdAt: "2026-08-18T06:21:56.470Z"
updatedAt: "2026-08-18T06:21:56.470Z"
---

# Repair Webhook Idempotency, Retry, and Lease Semantics

**Priority:** P1  
**Phase:** Hardening  
**Task status:** Backlog

## Outcome

Make failed or stale webhook events safely retryable while still suppressing duplicate processed events and concurrent double-processing.

## Why This Exists

The backlog shows the current `ON CONFLICT DO NOTHING` claim pattern can permanently suppress a retry after a first failure.

## Execution Checklist

- [ ] Define canonical event states: PROCESSING, PROCESSED, FAILED, plus timestamps/attempts/lease as needed.
- [ ] Treat PROCESSED as duplicate/ignore.
- [ ] Treat active PROCESSING as already in flight.
- [ ] Allow FAILED events to be reclaimed.
- [ ] Allow stale PROCESSING events to be reclaimed safely.
- [ ] Make claim/reclaim atomic.
- [ ] Apply the lifecycle consistently to Stripe, Clerk, SendGrid, and any other implemented webhook providers.
- [ ] Keep provider HTTP verification and acknowledgement at the route boundary.
- [ ] Add replay, duplicate, failure, stale-lease, and concurrency tests.
- [ ] Ensure provider/network calls remain outside database transaction helpers.

## Acceptance Criteria

- [ ] A failed event can succeed on provider retry.
- [ ] A processed event does not execute twice.
- [ ] Concurrent deliveries cannot double-process the same event.
- [ ] Lifecycle behavior is consistent across implemented providers.

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