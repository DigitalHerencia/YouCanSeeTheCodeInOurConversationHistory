---
title: "Build Tests Around Real Security and Lifecycle Boundaries"
type: work-package
scope: project
project: "The Maximal Template"
domain: "hardening"
artifact: "security-boundary-tests"
kind: work-package
namespace: maximal-template.security-boundary-tests.work-package
status: active
authority: working-note
parent: "[[maximal-template.execution.tasks.map]]"
depends_on:
  - "[[maximal-template.authenticated-tenant-reads.work-package]]"
  - "[[maximal-template.runtime-rls-role.work-package]]"
  - "[[maximal-template.action-level-abac.work-package]]"
  - "[[maximal-template.cross-resource-tenant-integrity.work-package]]"
  - "[[maximal-template.webhook-idempotency-retry.work-package]]"
  - "[[maximal-template.human-readable-sequences.work-package]]"
  - "[[maximal-template.atomic-ai-rate-limit.work-package]]"
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

# Build Tests Around Real Security and Lifecycle Boundaries

**Priority:** P0  
**Phase:** Hardening  
**Task status:** Backlog

## Outcome

Create a focused test suite that proves the security, tenancy, webhook, concurrency, and onboarding claims through actual application paths.

## Why This Exists

The backlog notes existing tests focus on helper behavior and the repository lacked a test script, allowing real action paths to bypass otherwise-correct helpers.

## Execution Checklist

- [ ] Add/normalize the repository test command and test runner configuration.
- [ ] Test authenticated fetchers under authenticated tenant context.
- [ ] Test cross-tenant reads and mutations.
- [ ] Test actual actions for RBAC/ABAC ownership/assignment enforcement.
- [ ] Test RLS using the restricted runtime role.
- [ ] Test failed webhook retries, processed duplicates, and stale processing reclaim.
- [ ] Test concurrent invoice/ticket sequence allocation.
- [ ] Test AI rate-limit concurrency.
- [ ] Test representative Clerk identity/onboarding/membership lifecycle.
- [ ] Keep the suite proportional: target architectural claims rather than broad vanity coverage.

## Acceptance Criteria

- [ ] Each major hardening claim has at least one executed boundary-level test.
- [ ] Tests use production-like runtime roles/paths where the claim depends on them.
- [ ] The suite is runnable through a documented repository command.

## Dependencies

- [[maximal-template.authenticated-tenant-reads.work-package]]
- [[maximal-template.runtime-rls-role.work-package]]
- [[maximal-template.action-level-abac.work-package]]
- [[maximal-template.cross-resource-tenant-integrity.work-package]]
- [[maximal-template.webhook-idempotency-retry.work-package]]
- [[maximal-template.human-readable-sequences.work-package]]
- [[maximal-template.atomic-ai-rate-limit.work-package]]

## Source Basis

- `The Maximal Template™ Backlog.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
