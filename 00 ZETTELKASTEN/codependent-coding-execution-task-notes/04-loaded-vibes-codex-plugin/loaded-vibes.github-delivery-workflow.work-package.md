---
title: "Package Proportional Git/GitHub Delivery Guidance"
type: work-package
scope: project
project: "Loaded Vibes Codex Plugin"
domain: "delivery"
artifact: "github-delivery-workflow"
kind: work-package
namespace: loaded-vibes.github-delivery-workflow.work-package
status: active
authority: working-note
parent: "[[loaded-vibes.execution.tasks.map]]"
depends_on:
  - "[[loaded-vibes.custom-agents-universal-workflow.work-package]]"
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
phase: "Delivery"
---

# Package Proportional Git/GitHub Delivery Guidance

**Priority:** P1  
**Phase:** Delivery  
**Task status:** Backlog

## Outcome

Teach Loaded Vibes to carry an approved change through issue/branch/PR/check/merge/handoff when requested and authorized, without making every edit a ceremony.

## Why This Exists

The delivery instructions define a professional evidence boundary while explicitly preserving proportionality and human gates.

## Execution Checklist

- [ ] Inspect repo instructions, branch, working tree, linked Issue/PR before writes.
- [ ] Respect approved specification and dependencies.
- [ ] Use short-lived Issue branches according to repository convention.
- [ ] Implement smallest complete scope and preserve unrelated work.
- [ ] Run focused checks first and record unrun checks honestly.
- [ ] Open Issue-linked PR and map acceptance criteria to evidence when the workflow requires it.
- [ ] Address real review/CI failures and rerun affected checks.
- [ ] Merge only when gates are satisfied and write access supports it.
- [ ] Read back GitHub state before claiming Issue/PR/merge/branch actions occurred.
- [ ] Stop at production/destructive/security/credential human gates.

## Acceptance Criteria

- [ ] Delivery guidance matches repository-local conventions and user instruction.
- [ ] No tool action is claimed without read-back evidence.
- [ ] Small changes are not burdened with unnecessary artifacts.

## Dependencies

- [[loaded-vibes.custom-agents-universal-workflow.work-package]]

## Source Basis

- `codex-delivery-instructions.md`
- GitHub Issues skill reference

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
