---
title: "Define Responsibility-Oriented Agents and the Universal Workflow"
type: work-package
scope: project
project: "Loaded Vibes Codex Plugin"
domain: "agents"
artifact: "custom-agents-universal-workflow"
kind: work-package
namespace: loaded-vibes.custom-agents-universal-workflow.work-package
status: active
authority: working-note
parent: "[[loaded-vibes.execution.tasks.map]]"
depends_on:
  - "[[loaded-vibes.governance-slices.work-package]]"
supersedes: []
tags:
  - projects/loaded-vibes
  - work-package
  - work/backlog
  - priority/p1
created: 2026-08-16
updated: 2026-08-16
priority: P1
task_status: backlog
phase: "Agents"
---

# Define Responsibility-Oriented Agents and the Universal Workflow

**Priority:** P1  
**Phase:** Agents  
**Task status:** Backlog

## Outcome

Replace the old 18-DevCycle organization simulation with a small set of agents that all follow one architecture-aware execution workflow.

## Why This Exists

The newest direction calls for context/architecture inspection, planning, execution, architecture/security review, verification, and Git/GitHub delivery responsibilities.

## Execution Checklist

- [ ] Define context/architecture inspector role.
- [ ] Define bounded planner role.
- [ ] Define implementation/execution role.
- [ ] Define architecture/security reviewer role.
- [ ] Define verification/conformance role.
- [ ] Define Git/GitHub delivery role only where distinct responsibility justifies it.
- [ ] Write one universal workflow: inspect → map context → plan smallest complete change → implement → validate → evidence/handoff.
- [ ] Define handoff format between roles without requiring ritualized DevCycles.
- [ ] Define human gates for production deploy, destructive data changes, security-control weakening, credentials, and other consequential operations.

## Acceptance Criteria

- [ ] Agent count remains small and responsibility-based.
- [ ] All roles share one coherent workflow and architecture source.
- [ ] No agent is a generic persona duplicating another role.

## Dependencies

- [[loaded-vibes.governance-slices.work-package]]

## Source Basis

- `Loaded Vibes™ Codex Plugin — Current State Workup.md`
- `codex-delivery-instructions.md`
- `codependentcoding.webapp-architecture.master.source-document.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
