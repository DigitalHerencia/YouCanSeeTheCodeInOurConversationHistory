---
title: "Extract the Surviving Genes from Loaded Vibes 1.0"
type: work-package
scope: project
project: "Loaded Vibes Codex Plugin"
domain: "discovery-extraction"
artifact: "prototype-gene-extraction"
kind: work-package
namespace: loaded-vibes.prototype-gene-extraction.work-package
status: active
authority: working-note
parent: "[[loaded-vibes.execution.tasks.map]]"
depends_on:
  []
supersedes: []
tags:
  - projects/loaded-vibes
  - work-package
  - work/backlog
  - priority/p0
created: 2026-08-16
updated: 2026-08-16
priority: P0
task_status: backlog
phase: "Discovery/Extraction"
---

# Extract the Surviving Genes from Loaded Vibes 1.0

**Priority:** P0  
**Phase:** Discovery/Extraction  
**Task status:** Backlog

## Outcome

Turn the existing prototype/research archive into an explicit keep/rewrite/archive matrix instead of attempting a mechanical upgrade.

## Why This Exists

The current-state workup finds about 87 concentrated prototype files plus older Notion and Awesome Copilot research branches. Conceptually useful ideas exist, but runtime assumptions are obsolete.

## Execution Checklist

- [ ] Inventory `LoadedPlugin/` agents, instructions, prompts, toolsets, templates, and scripts.
- [ ] Classify each item as retain concept, rewrite for current Codex primitives, merge into another capability, archive as provenance, or discard from shipping payload.
- [ ] Mine `LoadedBackup/` for unique intent only; do not ship it.
- [ ] Mine `.notion/` for schema, validation, context-ingestion, and agent-boundary ideas only.
- [ ] Mine `.awesome/` for packaging/skill/agent patterns; never vendor the corpus into Loaded Vibes.
- [ ] Identify stale assumptions: GenAIScript, old DevCycles, old paths, npm, Notion-era naming, old architecture boundaries.
- [ ] Preserve names worth keeping, including the Bad Vibes Firewall, only where they map to real current behavior.
- [ ] Produce a short extraction ledger with provenance.

## Acceptance Criteria

- [ ] Every first-generation artifact has a disposition.
- [ ] No obsolete runtime model is carried forward merely because it exists.
- [ ] Surviving concepts have a current target home.

## Dependencies

- None recorded.

## Source Basis

- `Loaded Vibes™ Codex Plugin — Current State Workup.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
