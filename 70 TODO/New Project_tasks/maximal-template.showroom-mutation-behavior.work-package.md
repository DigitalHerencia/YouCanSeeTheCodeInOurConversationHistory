---
pm-task: true
projectId: "aujyaujimsy9s0iz"
parentId:
id: "v7ojfxp7msy9z2nb"
title: "maximal-template.showroom-mutation-behavior.work-package"
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
createdAt: "2026-08-18T06:21:58.439Z"
updatedAt: "2026-08-18T06:21:58.439Z"
---

# Define Explicit Public Showroom Mutation Behavior

**Priority:** P0  
**Phase:** Showroom  
**Task status:** Backlog

## Outcome

Keep mutation surfaces explorable while ensuring signed-out visitors see intentional demo behavior rather than production auth errors.

## Why This Exists

The demo is intentionally public, but visible forms currently invoke production-authenticated actions. The backlog requires a deliberate read-only/simulated showroom policy.

## Execution Checklist

- [ ] Inventory every visible create, edit, archive, delete, approve, status, publish, upload, billing, and provider-triggering control.
- [ ] Classify each control as read-only preview, local simulation, safe demo mutation, or authenticated-only demonstration.
- [ ] Implement one explicit showroom mutation adapter/pattern instead of ad hoc per-form hacks.
- [ ] Keep React Hook Form surfaces fully inspectable.
- [ ] Prevent protected production mutations from executing under signed-out demo context.
- [ ] Return clear non-persisting preview feedback rather than raw auth exceptions.
- [ ] Ensure demo behavior cannot be confused with a successful persisted production operation.
- [ ] Document how the hardened/generated edition replaces the showroom behavior.

## Acceptance Criteria

- [ ] Signed-out visitors can exercise visible forms without encountering accidental auth failures.
- [ ] No showroom simulation mutates protected production data unintentionally.
- [ ] UI feedback clearly states when behavior is preview/non-persisting.
- [ ] The production mutation path remains separable for hardening.

## Dependencies

- None recorded.

## Source Basis

- `The Maximal Template™ Backlog.md`
- `The Maximal Template™ Demo Doctrine.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.

Project: [[New Project|New Project]]