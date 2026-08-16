---
title: "Close Cross-Resource Tenant and Relationship Integrity Holes"
type: work-package
scope: project
project: "The Maximal Template"
domain: "hardening"
artifact: "cross-resource-tenant-integrity"
kind: work-package
namespace: maximal-template.cross-resource-tenant-integrity.work-package
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

# Close Cross-Resource Tenant and Relationship Integrity Holes

**Priority:** P0  
**Phase:** Hardening  
**Task status:** Backlog

## Outcome

Prevent mutations from persisting foreign IDs that are individually valid but belong to the wrong tenant, project, account, or parent relationship.

## Why This Exists

The backlog identifies unchecked `milestoneId`, `parentTaskId`, `assigneeMembershipId`, `primaryContactId`, and `ownerMembershipId` examples.

## Execution Checklist

- [ ] Inventory every mutation that accepts related-resource IDs.
- [ ] Validate relationship membership within the same transaction when correctness depends on current state.
- [ ] Verify project/milestone/task/assignee relationships.
- [ ] Verify CRM account/contact/owner relationships.
- [ ] Review support, invoicing, portal, social, and other domains for equivalent foreign-ID holes.
- [ ] Add composite keys/constraints where the database can make invalid relationships unrepresentable.
- [ ] Keep application validation even when RLS also contains access.
- [ ] Add cross-tenant and cross-parent negative tests.

## Acceptance Criteria

- [ ] Known foreign-ID holes are closed.
- [ ] Equivalent patterns across domains are audited.
- [ ] Invalid cross-tenant/cross-parent relationships cannot be created through supported actions.
- [ ] Database invariants backstop application checks where appropriate.

## Dependencies

- None recorded.

## Source Basis

- `The Maximal Template™ Backlog.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
