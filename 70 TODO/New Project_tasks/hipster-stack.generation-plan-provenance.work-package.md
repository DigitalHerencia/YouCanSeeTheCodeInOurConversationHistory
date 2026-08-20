---
pm-task: true
projectId: "aujyaujimsy9s0iz"
parentId:
id: "krqyibogmsy9yzbu"
title: "hipster-stack.generation-plan-provenance.work-package"
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
createdAt: "2026-08-18T06:21:54.138Z"
updatedAt: "2026-08-18T06:21:54.138Z"
---

# Make the Generation Plan the Inspectable Resolved Authority

**Priority:** P0  
**Phase:** Core  
**Task status:** Backlog

## Outcome

Produce a normalized Generation Plan containing the exact retained/removed/transformed artifacts, providers, resources, routes, dependencies, and provenance before filesystem writes occur.

## Why This Exists

The master treats the Generation Plan as the resolved authority for preview and materialization.

## Execution Checklist

- [ ] Define Generation Plan schema/types.
- [ ] Include resolved application identity, Ontology, user overrides, derived/locked values, providers, resources, routes, features, workflows, and artifacts.
- [ ] Include retain/remove/transform decisions with owning Simple/capability provenance.
- [ ] Include warnings and destructive-change explanations.
- [ ] Make the plan serializable for Constituter preview and CLI review.
- [ ] Ensure the materializer consumes the plan rather than re-resolving hidden rules.
- [ ] Add `explain`-quality output for why an artifact exists or was removed.

## Acceptance Criteria

- [ ] Plan fully determines materialization.
- [ ] CLI and Constituter display the same plan semantics.
- [ ] Artifact decisions have provenance.
- [ ] Materializer contains no second hidden resolver.

## Dependencies

- [[hipster-stack.resolver-conflict-engine.work-package]]

## Source Basis

- `codependentcoding.webapp-architecture.master.source-document.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.

Project: [[New Project|New Project]]