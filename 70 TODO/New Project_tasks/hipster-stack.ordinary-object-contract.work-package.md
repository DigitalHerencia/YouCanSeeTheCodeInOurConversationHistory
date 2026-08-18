---
pm-task: true
projectId: "aujyaujimsy9s0iz"
parentId:
id: "s4smjs77msy9yyzd"
title: "hipster-stack.ordinary-object-contract.work-package"
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
createdAt: "2026-08-18T06:21:53.689Z"
updatedAt: "2026-08-18T06:21:53.689Z"
---

# Validate the Ordinary Object Generated-Project Contract

**Priority:** P0  
**Phase:** Generator  
**Task status:** Backlog

## Outcome

Prove generated projects are standalone, white-label, architecture-conformant, dependency-complete, and understandable without generator internals.

## Why This Exists

The generated Ordinary Object is the payoff of the entire Hipster Stack system.

## Execution Checklist

- [ ] Verify expected application directory structure and selected-domain pruning.
- [ ] Verify application-local docs/AGENTS/config are sufficient without generator source.
- [ ] Verify no ownership catalog, pruning rules, Constituter state, or CLI implementation is copied.
- [ ] Verify env examples contain names/shape only and no secrets.
- [ ] Verify selected providers/routes/features/workflows exist and unselected optional ones do not.
- [ ] Verify install/typecheck/build/architecture validation according to release contract.
- [ ] Verify portable provenance/config is truthful and optional by design.
- [ ] Verify Git initialization produces a clean understandable starting state when requested.

## Acceptance Criteria

- [ ] A generated project runs without the generator repository.
- [ ] Output contains only supported selected capabilities and shared dependencies.
- [ ] No generator-only debris is present.
- [ ] Architecture and build checks pass with fresh evidence.

## Dependencies

- [[hipster-stack.materialization-pruning-transforms.work-packag]]

## Source Basis

- `codependentcoding.webapp-architecture.master.source-document.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.

Project: [[New Project|New Project]]