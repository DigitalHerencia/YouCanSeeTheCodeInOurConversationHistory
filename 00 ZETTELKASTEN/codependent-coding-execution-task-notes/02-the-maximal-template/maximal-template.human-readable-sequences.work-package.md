---
title: "Make Human-Readable Sequence Numbers Concurrency Safe"
type: work-package
scope: project
project: "The Maximal Template"
domain: "hardening"
artifact: "human-readable-sequences"
kind: work-package
namespace: maximal-template.human-readable-sequences.work-package
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

# Make Human-Readable Sequence Numbers Concurrency Safe

**Priority:** P1  
**Phase:** Hardening  
**Task status:** Backlog

## Outcome

Replace `MAX(number)+1` allocation for tickets/invoices with a concurrency-safe tenant-scoped sequence mechanism.

## Why This Exists

Concurrent creates can currently compute the same next value.

## Execution Checklist

- [ ] Inventory every human-readable sequential identifier.
- [ ] Choose a database-safe tenant counter/allocator or bounded collision-retry strategy.
- [ ] Keep sequence allocation in the same atomic persistence boundary as record creation.
- [ ] Preserve user-facing formatting/prefix semantics.
- [ ] Add concurrent creation tests for support tickets and invoices.
- [ ] Verify rollback/failure does not corrupt allocator state beyond the chosen semantics.

## Acceptance Criteria

- [ ] Parallel creates cannot persist duplicate sequence numbers.
- [ ] Allocation is tenant-safe and transactional.
- [ ] Tests prove behavior under concurrency.

## Dependencies

- None recorded.

## Source Basis

- `The Maximal Template™ Backlog.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
