---
title: "Implement Safe One-Template Materialization, Pruning, and Transforms"
type: work-package
scope: project
project: "The Hipster Stack and The Constituter"
domain: "generator"
artifact: "materialization-pruning-transforms"
kind: work-package
namespace: hipster-stack.materialization-pruning-transforms.work-package
status: active
authority: working-note
parent: "[[hipster-stack.execution.tasks.map]]"
depends_on:
  - "[[hipster-stack.generation-plan-provenance.work-package]]"
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
phase: "Generator"
---

# Implement Safe One-Template Materialization, Pruning, and Transforms

**Priority:** P0  
**Phase:** Generator  
**Task status:** Backlog

## Outcome

Materialize one repository-owned Maximal Template, then retain/remove/transform artifacts strictly according to the Generation Plan.

## Why This Exists

The architecture rejects multiple template sources and normal generation that fetches a template from GitHub.

## Execution Checklist

- [ ] Perform safe destination checks and refuse unsafe overwrite conditions.
- [ ] Copy/materialize the canonical local Maximal Template source.
- [ ] Retain required shared foundation and selected capabilities.
- [ ] Remove unselected optional routes/features/workflows/integrations/artifacts using ownership metadata.
- [ ] Transform supported identity/theme/domain-vocabulary/config files deterministically.
- [ ] Preserve shared dependencies still required by any retained capability.
- [ ] Remove generator-only metadata from generated output.
- [ ] Write portable config/provenance into the output only where intentionally part of the contract.
- [ ] Optionally install dependencies and initialize Git according to explicit user/config choice.
- [ ] Verify transforms leave parseable/runnable code.

## Acceptance Criteria

- [ ] Generation uses one local maximal template.
- [ ] Output contains no unowned/pruned capability debris.
- [ ] Shared dependencies survive correctly.
- [ ] Unsafe destinations are blocked.
- [ ] Generator-only machinery does not leak into the Ordinary Object.

## Dependencies

- [[hipster-stack.generation-plan-provenance.work-package]]

## Source Basis

- `codependentcoding.webapp-architecture.master.source-document.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
