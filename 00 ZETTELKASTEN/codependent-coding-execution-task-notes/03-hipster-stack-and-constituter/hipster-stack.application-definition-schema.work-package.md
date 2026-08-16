---
title: "Finalize the Canonical Application Definition Schema"
type: work-package
scope: project
project: "The Hipster Stack and The Constituter"
domain: "core"
artifact: "application-definition-schema"
kind: work-package
namespace: hipster-stack.application-definition-schema.work-package
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
phase: "Core"
---

# Finalize the Canonical Application Definition Schema

**Priority:** P0  
**Phase:** Core  
**Task status:** Backlog

## Outcome

Define one runtime-validated configuration schema shared by CLI, Constituter, and portable config.

## Why This Exists

The master requires all adapters to share one configuration model and forbids hidden web/CLI defaults.

## Execution Checklist

- [ ] Define application identity and project metadata fields.
- [ ] Define Ontology/preset selection.
- [ ] Define route/page surface selections.
- [ ] Define feature selections and route-feature relationships.
- [ ] Define presentation block/variant/theme selections.
- [ ] Define workflow/logic capability selections.
- [ ] Define provider/integration selections.
- [ ] Define roles/authorization model and other supported structured configuration.
- [ ] Encode provenance states such as DEFAULT, PRESET, USER, DERIVED, REQUIRED, LOCKED.
- [ ] Define runtime validation, versioning, and migration behavior for the config schema.

## Acceptance Criteria

- [ ] CLI, web, and config file parse the same schema.
- [ ] No adapter owns hidden configuration semantics.
- [ ] Schema errors are specific and actionable.
- [ ] Schema versioning is explicit.

## Dependencies

- None recorded.

## Source Basis

- `codependentcoding.webapp-architecture.master.source-document.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
