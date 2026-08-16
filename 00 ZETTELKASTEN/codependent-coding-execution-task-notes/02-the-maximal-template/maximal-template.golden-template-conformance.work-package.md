---
title: "Declare the Golden Production Template Only After Full Conformance"
type: work-package
scope: project
project: "The Maximal Template"
domain: "hardening"
artifact: "golden-template-conformance"
kind: work-package
namespace: maximal-template.golden-template-conformance.work-package
status: active
authority: working-note
parent: "[[maximal-template.execution.tasks.map]]"
depends_on:
  - "[[maximal-template.hardened-architecture-claims.work-package]]"
supersedes: []
tags:
  - projects/maximal-template
  - work-package
  - work/backlog
  - priority/p0
created: 2026-08-16
updated: 2026-08-16
priority: P0
task_status: backlog
phase: "Hardening"
---

# Declare the Golden Production Template Only After Full Conformance

**Priority:** P0  
**Phase:** Hardening  
**Task status:** Backlog

## Outcome

Establish the hardened Maximal Template as the canonical generation source only after architecture, security, integration, test, and generation assumptions have been verified.

## Why This Exists

The Maximal Template is the single superset source from which Ordinary Objects are constituted; making it canonical before its claims are verified would propagate defects into every generated project.

## Execution Checklist

- [ ] Run the architecture classifier/conformance validator across the template.
- [ ] Verify normal feature → block and form-feature → primitive exceptions.
- [ ] Verify no persisted reads live outside allowed fetcher/transaction boundaries.
- [ ] Verify provider SDK placement.
- [ ] Verify template contains only supported selectable capabilities.
- [ ] Verify Prisma schema/migrations/seed lifecycle.
- [ ] Verify required root configuration and application-local governance assets.
- [ ] Run hardening evidence suite and CI on the candidate commit.
- [ ] Mark unsupported conceptual domain-library entries as non-selectable.
- [ ] Record the golden template version/commit consumed by Hipster Stack generation.

## Acceptance Criteria

- [ ] The exact canonical template commit is identifiable.
- [ ] All generator-selectable capabilities exist and pass required conformance.
- [ ] Unsupported conceptual entries are not selectable.
- [ ] Hipster Stack can consume the template without relying on undocumented exceptions.

## Dependencies

- [[maximal-template.hardened-architecture-claims.work-package]]

## Source Basis

- `codependentcoding.webapp-architecture.master.source-document.md`
- `The Maximal Template™ Backlog.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
