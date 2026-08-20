---
pm-task: true
projectId: "aujyaujimsy9s0iz"
parentId:
id: "xx3zimpwmsy9yvga"
title: "loaded-vibes.plugin-smoke-tests.work-package"
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
createdAt: "2026-08-18T06:21:49.114Z"
updatedAt: "2026-08-18T06:21:49.114Z"
---

# Build Loaded Vibes Smoke and Conformance Tests

**Priority:** P1  
**Phase:** Validation  
**Task status:** Backlog

## Outcome

Prove the plugin and generated application have the minimum usable operational shape without turning smoke tests into a giant generic suite.

## Why This Exists

The master calls for install/config parse, architecture validator, type/build/focused checks, expected files, representative route, and generator-debris checks.

## Execution Checklist

- [ ] Test plugin package installs/loads in the supported Codex environment.
- [ ] Test expected configuration parses.
- [ ] Run architecture validator against a known-good Ordinary Object fixture.
- [ ] Run validator against known-bad fixtures to prove failure detection.
- [ ] Verify required root/application files exist.
- [ ] Run focused typecheck/build or equivalent when part of the fixture contract.
- [ ] Verify representative route/build materializes.
- [ ] Verify no generator-only debris exists.
- [ ] Verify plugin instructions do not override repository-local controlling instructions.
- [ ] Record commands and evidence.

## Acceptance Criteria

- [ ] Plugin smoke suite is repeatable.
- [ ] Known-good and known-bad fixtures behave as expected.
- [ ] Completion claims are based on executed output.

## Dependencies

- [[loaded-vibes.architecture-validators.work-package]]

## Source Basis

- `codependentcoding.webapp-architecture.master.source-document.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.

Project: [[New Project|New Project]]