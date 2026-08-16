---
title: "Build the Verified Simples Catalog from Actual Template Support"
type: work-package
scope: project
project: "The Hipster Stack and The Constituter"
domain: "library"
artifact: "simple-catalog-implementation-truth"
kind: work-package
namespace: hipster-stack.simple-catalog-implementation-truth.work-package
status: active
authority: working-note
parent: "[[hipster-stack.execution.tasks.map]]"
depends_on:
  - "[[hipster-stack.workflow-logic-simple-model.work-package]]"
supersedes: []
tags:
  - projects/hipster-stack
  - work-package
  - work/backlog
  - priority/p0
created: 2026-08-16
updated: 2026-08-16
priority: P0
task_status: backlog
phase: "Library"
---

# Build the Verified Simples Catalog from Actual Template Support

**Priority:** P0  
**Phase:** Library  
**Task status:** Backlog

## Outcome

Create the canonical normalized catalog of selectable Simples using actual Maximal Template implementations as the truth test.

## Why This Exists

The master lists broad Simple categories but explicitly says naming a future capability does not make it selectable.

## Execution Checklist

- [ ] Inventory implemented route/page surfaces.
- [ ] Inventory features and client features.
- [ ] Inventory grouped blocks and UI primitives/variants.
- [ ] Inventory workflows and server operations/helpers.
- [ ] Inventory auth/authz/data/cache/config capabilities.
- [ ] Inventory provider/integration and webhook capabilities.
- [ ] Inventory theme/design-token capabilities.
- [ ] Assign stable Simple IDs and categories.
- [ ] Record dependency, conflict, ownership, transform, and artifact metadata.
- [ ] Mark conceptual/not-yet-implemented entries as unsupported rather than selectable.

## Acceptance Criteria

- [ ] Every selectable Simple maps to working template artifacts.
- [ ] No conceptual library entry is selectable without implementation.
- [ ] Catalog IDs are stable and machine-readable.
- [ ] Ownership/dependency metadata is complete enough for resolution.

## Dependencies

- [[hipster-stack.workflow-logic-simple-model.work-package]]

## Source Basis

- `codependentcoding.webapp-architecture.master.source-document.md`
- `The Maximal Template™ Backlog.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
