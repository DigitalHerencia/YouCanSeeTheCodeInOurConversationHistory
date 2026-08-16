---
title: "Complete Deterministic Dependency, Conflict, and Derivation Resolution"
type: work-package
scope: project
project: "The Hipster Stack and The Constituter"
domain: "core"
artifact: "resolver-conflict-engine"
kind: work-package
namespace: hipster-stack.resolver-conflict-engine.work-package
status: active
authority: working-note
parent: "[[hipster-stack.execution.tasks.map]]"
depends_on:
  - "[[hipster-stack.application-definition-schema.work-package]]"
  - "[[hipster-stack.simple-catalog-implementation-truth.work-package]]"
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
phase: "Core"
---

# Complete Deterministic Dependency, Conflict, and Derivation Resolution

**Priority:** P0  
**Phase:** Core  
**Task status:** Backlog

## Outcome

Make configuration normalization deterministic and dependency-closed across presets, user overrides, required capabilities, conflicts, and derived values.

## Why This Exists

The generator’s central promise depends on one resolver that prevents knowingly broken configurations.

## Execution Checklist

- [ ] Define resolution ordering: defaults → preset → user overrides → requirements/conflicts → derivation/locking.
- [ ] Implement dependency graph traversal with cycle detection.
- [ ] Implement conflicts and mutually exclusive selections.
- [ ] Implement required/locked derived values with provenance.
- [ ] Recompute affected routes/features/providers/resources/artifacts after changes.
- [ ] Produce useful explanations for automatic changes.
- [ ] Ensure stable deterministic output for semantically identical input.
- [ ] Add property-based/table tests for dependency/conflict edge cases.

## Acceptance Criteria

- [ ] The same input always produces the same resolved definition.
- [ ] Invalid combinations are rejected or normalized explicitly.
- [ ] Derived/required changes are explainable.
- [ ] Dependency closure is complete before materialization.

## Dependencies

- [[hipster-stack.application-definition-schema.work-package]]
- [[hipster-stack.simple-catalog-implementation-truth.work-package]]

## Source Basis

- `codependentcoding.webapp-architecture.master.source-document.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
