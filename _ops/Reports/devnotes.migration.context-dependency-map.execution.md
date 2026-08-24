---
title: DevNotes Unified Migration Context and Dependency Map
namespace: devnotes.devnotes.migration.context-dependency-map.execution
role: devnotes
system: devnotes
workspace: devnotes-unified-migration
type: execution
status: active
authority: implementation-evidence
created: 2026-08-23
updated: 2026-08-23
tags:
  - migration/inventory
  - evidence/implementation
---

# Migration Context and Dependency Map

| Target subsystem | Existing dependencies | Integration boundary |
|---|---|---|
| Role roots and governance | `AGENTS.md`, `README.md`, numbered roots | Overlay role roots; preserve legacy paths |
| Unified metadata | current Obsidian contracts and `DevNotes.base` | Dual-schema compatibility; no mass conversion |
| Templates and routing | `90 OBSIDIAN/Templates`, Templater folder mapping | New assets under `_obsidian`; preserve legacy templates |
| Hearth | experimental dashboard and legacy template launchers | Add unified dashboard; retain existing dashboard |
| Meta Bind | no reusable controls; exclusion list | Add version-supported reusable input templates |
| Note Toolbar | existing editing toolbars; no mappings | Add unified navigation toolbar and role-root mappings |
| Callouts | intended vocabulary plus invalid conflict markers | Restore approved semantic vocabulary as valid JSON |
| CSS | `codex-vercel` enabled; unified snippet disabled | Keep current snippet and enable unified projection |
| Code Space | plugin 2.3.0; no data file | One local-only trusted-repository mount |
| ChatGPT roles | historical configs/evaluations and handoff contract | Add unified registry/map; retain provenance |
| Codependent Coding | flat canon, active project, Simples, Source Mirror | Link through role lenses and workspace views; no doctrine copies |
| Legacy migration | path-sensitive Dataview, Bases, embeds, wikilinks | Inventory first; no ambiguous bulk moves |
