---
title: "Freeze the Completed Showroom and Derive the Hardened Template Baseline"
type: work-package
scope: project
project: "The Maximal Template"
domain: "hardening"
artifact: "freeze-showroom-derive-hardened"
kind: work-package
namespace: maximal-template.freeze-showroom-derive-hardened.work-package
status: active
authority: working-note
parent: "[[maximal-template.execution.tasks.map]]"
depends_on:
  - "[[maximal-template.showroom-verification.work-package]]"
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

# Freeze the Completed Showroom and Derive the Hardened Template Baseline

**Priority:** P0  
**Phase:** Hardening  
**Task status:** Backlog

## Outcome

Create a stable transition point from the public demo edition to the production-oriented generated-template edition.

## Why This Exists

The backlog explicitly separates showroom optimization from security hardening and says the secure edition should be derived only after the public demo is complete.

## Execution Checklist

- [ ] Confirm showroom definition of done and record the verified commit.
- [ ] Tag or otherwise identify the stable showroom baseline according to repository convention.
- [ ] Document intentional showroom-only behaviors that must change in the hardened edition.
- [ ] Create the hardening branch/workstream from the verified baseline.
- [ ] Preserve visual/routes/features/blocks while removing demo shortcuts during later tasks.
- [ ] Ensure no accidental production deployment gate is crossed without explicit approval.

## Acceptance Criteria

- [ ] A verified immutable showroom baseline is identifiable.
- [ ] Every intentional demo shortcut has a corresponding hardening task.
- [ ] Hardening begins from the known showroom state, not a moving target.

## Dependencies

- [[maximal-template.showroom-verification.work-package]]

## Source Basis

- `The Maximal Template™ Backlog.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
