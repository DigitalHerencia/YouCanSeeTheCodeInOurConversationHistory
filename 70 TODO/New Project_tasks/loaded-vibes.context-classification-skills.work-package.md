---
pm-task: true
projectId: "aujyaujimsy9s0iz"
parentId:
id: "j7feoidbmsy9yxqr"
title: "loaded-vibes.context-classification-skills.work-package"
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
createdAt: "2026-08-18T06:21:52.083Z"
updatedAt: "2026-08-18T06:21:52.083Z"
---

# Build Context Mapping and Architecture Classification Skills

**Priority:** P0  
**Phase:** Skills  
**Task status:** Backlog

## Outcome

Give Codex repeatable ways to inspect repository reality, load only relevant context, and classify requested changes into owning architecture layers.

## Why This Exists

The old PowerShell scripts and Awesome Copilot context-engineering material show the enduring value of context mapping; the new plugin requires it before implementation.

## Execution Checklist

- [ ] Create a task-context mapping skill that inspects local instructions, relevant source files, dependencies, and existing patterns.
- [ ] Create a file/layer classification skill using the canonical classifier and dependency matrix.
- [ ] Create a “what context is needed” mechanism for bounded additional reads.
- [ ] Modernize useful repository-analysis ideas from the old PowerShell scripts.
- [ ] Support Windows/PowerShell execution paths.
- [ ] Avoid dumping the whole repository into context.
- [ ] Produce evidence of files inspected and assumptions made.
- [ ] Treat repository-local architecture exceptions as explicit inputs, not silent overrides.

## Acceptance Criteria

- [ ] A bounded task produces a bounded context map.
- [ ] Classification output names the owning layer and relevant constraints.
- [ ] Skills do not require the obsolete DevCycle framework.

## Dependencies

- [[loaded-vibes.governance-slices.work-package]]

## Source Basis

- `Loaded Vibes™ Codex Plugin — Current State Workup.md`
- Context Engineering Plugin reference
- `codependentcoding.webapp-architecture.master.source-document.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.

Project: [[New Project|New Project]]