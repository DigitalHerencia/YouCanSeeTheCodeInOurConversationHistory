---
title: "Repair Webhook Idempotency, Retry, and Lease Semantics"
type: work-package
scope: project
project: "The Maximal Template"
domain: "hardening"
artifact: "webhook-idempotency-retry"
kind: work-package
namespace: maximal-template.webhook-idempotency-retry.work-package
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
  - priority/p1
created: 2026-08-16
updated: 2026-08-16
priority: P1
task_status: backlog
phase: "Hardening"
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
