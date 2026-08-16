---
title: "Complete Resource-Level ABAC Enforcement in Actual Actions"
type: work-package
scope: project
project: "The Maximal Template"
domain: "hardening"
artifact: "action-level-abac"
kind: work-package
namespace: maximal-template.action-level-abac.work-package
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
  - priority/p0
created: 2026-08-16
updated: 2026-08-16
priority: P0
task_status: backlog
phase: "Hardening"
---

# Complete Resource-Level ABAC Enforcement in Actual Actions

**Priority:** P0  
**Phase:** Hardening  
**Task status:** Backlog

## Outcome

Apply ownership/assignment/resource policies consistently to mutation paths where broad RBAC permission alone is insufficient.

## Why This Exists

The backlog identifies CRM contact mutation as a good reference while project task, support ticket, and CRM deal mutations currently rely only on broad permissions.

## Execution Checklist

- [ ] Inventory every mutation action and classify whether resource-level ABAC is required.
- [ ] Use `updateContact()` / `archiveContact()` style resource loading and policy checks as a reference where applicable.
- [ ] Apply ownership/assignment/resource-attribute checks to project, support, CRM, portal, admin, invoicing, and other applicable actions.
- [ ] Ensure authorization happens before mutation and after tenant-scoped resource resolution.
- [ ] Avoid duplicating policy logic inside actions; keep policy ownership in `lib/authz`.
- [ ] Add tests that call real actions rather than policy helpers only.
- [ ] Add negative tests for owner/assignee/role mismatches.

## Acceptance Criteria

- [ ] Every resource-sensitive mutation path enforces the intended ABAC policy.
- [ ] Actual action tests prove enforcement.
- [ ] Actions coordinate authz but do not redefine policy.

## Dependencies

- None recorded.

## Source Basis

- `The Maximal Template™ Backlog.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
