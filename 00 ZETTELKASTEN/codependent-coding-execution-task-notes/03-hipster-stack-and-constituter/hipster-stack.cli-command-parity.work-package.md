---
title: "Complete Hipster Stack CLI and Adapter Parity"
type: work-package
scope: project
project: "The Hipster Stack and The Constituter"
domain: "cli"
artifact: "cli-command-parity"
kind: work-package
namespace: hipster-stack.cli-command-parity.work-package
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
phase: "CLI"
---

# Complete Hipster Stack CLI and Adapter Parity

**Priority:** P0  
**Phase:** CLI  
**Task status:** Backlog

## Outcome

Provide reliable `create`, `add`, `explain`, and `doctor` workflows that use the same schema/resolver/plan as the Constituter.

## Why This Exists

The master defines CLI as the primary execution adapter and explicitly forbids divergent semantics.

## Execution Checklist

- [ ] Implement/verify `hipster-stack create [directory]`.
- [ ] Support interactive prompts that write the same Application Definition as config-file input.
- [ ] Support `--config hipsterstack.json` or the repository’s finalized equivalent.
- [ ] Implement/verify `hipster-stack add <supported-surface>` using the same ownership/dependency model.
- [ ] Implement `hipster-stack explain` for architecture/config/artifact provenance.
- [ ] Implement `hipster-stack doctor` for environment/repository prerequisites and obvious conformance issues.
- [ ] Provide review step before destructive/materialization actions.
- [ ] Use concise progress and failure output.
- [ ] Verify Windows/PowerShell ergonomics as a first-class supported environment.

## Acceptance Criteria

- [ ] Interactive, file, and web-generated configurations resolve identically.
- [ ] CLI commands do not duplicate resolver logic.
- [ ] Public command/config naming matches verified shipped state.
- [ ] Core workflows work on Windows/PowerShell.

## Dependencies

- [[hipster-stack.generation-plan-provenance.work-package]]

## Source Basis

- `codependentcoding.webapp-architecture.master.source-document.md`
- `The Hipster Stack™ Technologies That Survived a Hostile Procurement Process.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
