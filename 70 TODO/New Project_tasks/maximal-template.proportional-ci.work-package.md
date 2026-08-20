---
pm-task: true
projectId: "aujyaujimsy9s0iz"
parentId:
id: "joiutcubmsy9z1lh"
title: "maximal-template.proportional-ci.work-package"
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
createdAt: "2026-08-18T06:21:57.076Z"
updatedAt: "2026-08-18T06:21:57.076Z"
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

Project: [[New Project|New Project]]