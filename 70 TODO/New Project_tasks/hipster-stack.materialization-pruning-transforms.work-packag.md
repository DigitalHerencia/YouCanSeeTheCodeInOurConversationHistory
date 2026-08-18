---
pm-task: true
projectId: "aujyaujimsy9s0iz"
parentId:
id: "f7eq3dkzmsy9yzhf"
title: "hipster-stack.materialization-pruning-transforms.work-package"
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
createdAt: "2026-08-18T06:21:54.339Z"
updatedAt: "2026-08-18T06:21:54.339Z"
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

Project: [[New Project|New Project]]