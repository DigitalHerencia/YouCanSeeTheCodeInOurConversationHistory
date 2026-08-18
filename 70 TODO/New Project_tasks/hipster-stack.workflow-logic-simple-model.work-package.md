---
pm-task: true
projectId: "aujyaujimsy9s0iz"
parentId:
id: "niymcdeimsy9yy03"
title: "hipster-stack.workflow-logic-simple-model.work-package"
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
createdAt: "2026-08-18T06:21:52.419Z"
updatedAt: "2026-08-18T06:21:52.419Z"
---

# Model Workflows as Configurable Logic Simples with Dependency Closure

**Priority:** P0  
**Phase:** Core  
**Task status:** Backlog

## Outcome

Represent workflows as selectable higher-order application behaviors whose required server operations/helpers are resolved automatically.

## Why This Exists

The corrected workflow model exists specifically to make application logic configurable in the same practical way presentation is configurable through blocks/primitives.

## Execution Checklist

- [ ] Define workflow catalog metadata: identity, domain, purpose, requirements, conflicts, server operations/helpers, resources, auth/authz, integrations, routes/features, and owned artifacts.
- [ ] Define which workflow dependencies are hard-required, optional, derived, or mutually exclusive.
- [ ] Ensure selecting a workflow does not duplicate shared fetchers/actions/policies/helpers.
- [ ] Ensure removing a workflow does not remove shared dependencies still required elsewhere.
- [ ] Model trivial direct-action capabilities separately so the system does not force workflows everywhere.
- [ ] Expose user-facing workflow choices as business/application capabilities, not arbitrary source-file toggles.
- [ ] Update resolver and Generation Plan types to represent behavioral constitution.

## Acceptance Criteria

- [ ] A workflow selection deterministically resolves all required capabilities.
- [ ] Shared dependencies are retained once regardless of how many workflows use them.
- [ ] Removing a workflow cannot break another retained capability.
- [ ] Trivial CRUD remains configurable without ceremonial workflow objects.

## Dependencies

- [[hipster-stack.application-definition-schema.work-package]]

## Source Basis

- Canonical Workflow Constitution Correction
- `codependentcoding.webapp-architecture.master.source-document.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.

Project: [[New Project|New Project]]