---
title: "Finish The Constituter as the Schema-Backed Configuration Workbench"
type: work-package
scope: project
project: "The Hipster Stack and The Constituter"
domain: "constituter"
artifact: "constituter-configuration-workbench"
kind: work-package
namespace: hipster-stack.constituter-configuration-workbench.work-package
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
phase: "Constituter"
---

# Finish The Constituter as the Schema-Backed Configuration Workbench

**Priority:** P0  
**Phase:** Constituter  
**Task status:** Backlog

## Outcome

Make the web workbench a dense, dependency-aware editor for the same Application Definition used by the CLI, including both presentation and logic configuration.

## Why This Exists

The master specifies a two-panel developer workbench and the user has clarified that workflows provide the configurable unit for business logic.

## Execution Checklist

- [ ] Left panel: render schema-backed controls in the canonical hierarchy: Ontology → routes → features → presentation and logic.
- [ ] Presentation branch: configure blocks, primitive variants, semantic tokens, typography/radius/density and supported theme dimensions.
- [ ] Logic branch: configure workflow capabilities; display required operations/helpers without exposing arbitrary source-file toggles as primary controls.
- [ ] Show disabled, auto-enabled, derived, required, and locked states with explanations.
- [ ] Right panel: display resolved configuration, providers, resources, routes, features, workflows, artifact consequences, conflicts/warnings, and portable config.
- [ ] Use the shared resolver for every change.
- [ ] Support inspect/copy/download/share-portable-config where implemented.
- [ ] Avoid accounts/hosted factory state for the MVP unless a later explicit requirement adds it.
- [ ] Verify responsive behavior without turning the dense workbench into generic cards.

## Acceptance Criteria

- [ ] No web-only configuration rules exist.
- [ ] Presentation and behavioral configuration both produce real generator effects.
- [ ] Derived/locked choices explain why they exist.
- [ ] Portable output round-trips through the shared schema.

## Dependencies

- [[hipster-stack.generation-plan-provenance.work-package]]

## Source Basis

- `codependentcoding.webapp-architecture.master.source-document.md`
- `Codependent Coding™ Website Design & Content Specification.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
