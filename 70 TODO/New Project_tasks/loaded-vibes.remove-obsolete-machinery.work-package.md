---
pm-task: true
projectId: "aujyaujimsy9s0iz"
parentId:
id: "4hf45gppmsy9yw0c"
title: "loaded-vibes.remove-obsolete-machinery.work-package"
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
createdAt: "2026-08-18T06:21:49.836Z"
updatedAt: "2026-08-18T06:21:49.836Z"
---

# Remove Obsolete DevCycle, Notion, and Declared-Toolset Machinery from the Shipping Plugin

**Priority:** P1  
**Phase:** Cleanup  
**Task status:** Backlog

## Outcome

Prevent first-generation framework concepts from leaking into Loaded Vibes 2.0 as duplicate orchestration systems.

## Why This Exists

The current-state workup explicitly says the old system simulated an engineering organization, used declarative tool permissions that were not enforcement, and carried obsolete runtime assumptions.

## Execution Checklist

- [ ] Remove shipping dependency on 18 fixed DevCycles.
- [ ] Remove GenAIScript-era runtime assumptions.
- [ ] Remove Notion as intent/state/orchestration plane.
- [ ] Remove `.loaded-vibes` state assumptions unless a current requirement independently justifies an equivalent.
- [ ] Remove declared permission/toolset files that pretend to enforce runtime capabilities they cannot enforce.
- [ ] Keep only current Codex/plugin permission mechanisms actually supported.
- [ ] Archive old templates/prompts/toolsets as provenance outside the shipping package.
- [ ] Update documentation so no obsolete concept is described as current.

## Acceptance Criteria

- [ ] Shipping plugin has one current workflow model.
- [ ] No obsolete runtime dependency is required.
- [ ] Archived source remains available for provenance without entering runtime context.

## Dependencies

- [[loaded-vibes.plugin-package-architecture.work-package]]

## Source Basis

- `Loaded Vibes™ Codex Plugin — Current State Workup.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.

Project: [[New Project|New Project]]