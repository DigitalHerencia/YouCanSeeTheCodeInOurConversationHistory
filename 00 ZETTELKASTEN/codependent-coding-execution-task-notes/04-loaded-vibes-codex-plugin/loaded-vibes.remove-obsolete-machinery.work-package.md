---
title: "Remove Obsolete DevCycle, Notion, and Declared-Toolset Machinery from the Shipping Plugin"
type: work-package
scope: project
project: "Loaded Vibes Codex Plugin"
domain: "cleanup"
artifact: "remove-obsolete-machinery"
kind: work-package
namespace: loaded-vibes.remove-obsolete-machinery.work-package
status: active
authority: working-note
parent: "[[loaded-vibes.execution.tasks.map]]"
depends_on:
  - "[[loaded-vibes.plugin-package-architecture.work-package]]"
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
phase: "Cleanup"
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
