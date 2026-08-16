---
title: "Add Proportional CI for the Hardened Template"
type: work-package
scope: project
project: "The Maximal Template"
domain: "hardening"
artifact: "proportional-ci"
kind: work-package
namespace: maximal-template.proportional-ci.work-package
status: active
authority: working-note
parent: "[[maximal-template.execution.tasks.map]]"
depends_on:
  - "[[maximal-template.security-boundary-tests.work-package]]"
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

# Add Proportional CI for the Hardened Template

**Priority:** P1  
**Phase:** Hardening  
**Task status:** Backlog

## Outcome

Wire native CI that enforces the template’s actual contract using fresh, observable checks.

## Why This Exists

The backlog reports `.github/workflows` contained only a README, so no native workflow currently enforced the claimed checks.

## Execution Checklist

- [ ] Add format check.
- [ ] Add lint.
- [ ] Add typecheck.
- [ ] Add Prisma/schema validation.
- [ ] Run architecture/contracts validation.
- [ ] Run focused security/lifecycle tests.
- [ ] Run build when part of release acceptance.
- [ ] Keep secrets/provider-dependent jobs gated or mocked appropriately.
- [ ] Observe at least one real workflow run before calling CI green.
- [ ] Document which checks are required versus optional/heavy.

## Acceptance Criteria

- [ ] A real GitHub Actions workflow executes the required checks.
- [ ] Green status is based on observed runs, not configuration inspection.
- [ ] CI scope matches the template’s claims without unnecessary ceremony.

## Dependencies

- [[maximal-template.security-boundary-tests.work-package]]

## Source Basis

- `The Maximal Template™ Backlog.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
