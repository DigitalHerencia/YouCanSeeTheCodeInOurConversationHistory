---
pm-task: true
projectId: "aujyaujimsy9s0iz"
parentId:
id: "xf4tsdmbmsy9z4r1"
title: "maximal-template.cross-resource-tenant-integrity.work-package"
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
createdAt: "2026-08-18T06:22:01.165Z"
updatedAt: "2026-08-18T06:22:01.165Z"
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

Project: [[New Project|New Project]]