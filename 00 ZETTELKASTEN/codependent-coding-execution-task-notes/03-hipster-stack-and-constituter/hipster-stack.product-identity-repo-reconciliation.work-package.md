---
title: "Reconcile Hipster Stack Product Identity, Repository Roles, and Public Naming"
type: work-package
scope: project
project: "The Hipster Stack and The Constituter"
domain: "foundation"
artifact: "product-identity-repo-reconciliation"
kind: work-package
namespace: hipster-stack.product-identity-repo-reconciliation.work-package
status: active
authority: working-note
parent: "[[hipster-stack.execution.tasks.map]]"
depends_on:
  []
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
phase: "Foundation"
---

# Reconcile Hipster Stack Product Identity, Repository Roles, and Public Naming

**Priority:** P0  
**Phase:** Foundation  
**Task status:** Backlog

## Outcome

Make the live repository, docs, CLI vocabulary, and DevNotes project definitions agree that Hipster Stack owns technology/generation/CLI/Constituter while Loaded Vibes owns the Codex plugin.

## Why This Exists

Older Loaded Vibes material still assigns generator responsibilities to Loaded Vibes, while the new master explicitly assigns them to Hipster Stack.

## Execution Checklist

- [ ] Audit live repository prose and package names for superseded Loaded Vibes generator identity.
- [ ] Update canonical product-role statements to the new topology.
- [ ] Verify the current `DigitalHerencia/TheHipsterStack` repository is the generation source.
- [ ] Complete or explicitly track the public CLI rename to `hipster-stack`.
- [ ] Complete or explicitly track config-file rename to `hipsterstack.json`.
- [ ] Ensure redirects/legacy names are documented as migration history rather than active doctrine.
- [ ] Update README/docs/project maps without claiming runtime identifiers changed before they actually do.

## Acceptance Criteria

- [ ] One active product topology exists across repo and DevNotes.
- [ ] Target CLI/config names are either shipped and verified or explicitly transitional.
- [ ] Loaded Vibes is no longer described as the generator in active docs.

## Dependencies

- None recorded.

## Source Basis

- `codependentcoding.webapp-architecture.master.source-document.md`
- `loadedvibes.project.source-document.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
