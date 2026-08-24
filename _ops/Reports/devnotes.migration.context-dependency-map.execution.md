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

| Target subsystem | Existing dependencies | Integration boundary | Implemented evidence |
|---|---|---|---|
| Role roots and governance | `AGENTS.md`, `README.md`, numbered roots | Overlay role roots; preserve legacy paths | eight role roots, role Canon, role workbench embeds, root authority map |
| Unified metadata | current Obsidian contracts and `DevNotes.base` | Dual-schema compatibility; no mass conversion | `.system/` registries/schema and `DevNotes/Canon/devnotes.metadata.legacy-compatibility.contract.md` |
| Templates and routing | `90 OBSIDIAN/Templates`, Templater folder mapping | New assets under `_obsidian`; preserve legacy templates | 20 target templates, Templater helpers/mappings, 11 contextual QuickAdd routes |
| Hearth | experimental dashboard and legacy template launchers | Add unified dashboard; retain existing dashboard | active Unified Workbench with Now, Workspaces, Handoffs, Evidence, Inbox, Roles, Codependent Coding, Recent Knowledge, System Health, and Knowledge Index |
| Meta Bind | no reusable controls; exclusion list | Add version-supported reusable input templates | five reusable templates plus rendered status/priority/health/progress controls |
| Note Toolbar | existing editing toolbars; no mappings | Add unified navigation toolbar and role-root mappings | eight version-supported role toolbars with package-defined labels and folder mappings |
| Callouts | intended vocabulary plus invalid conflict markers | Restore approved semantic vocabulary as valid JSON | ten semantic callouts parse and render in Callout Studio 2.11.0 |
| CSS | `codex-vercel` enabled; unified snippet disabled | Keep current snippet and enable unified projection | durable/runtime `devnotes-unified.css` projections are byte-identical and enabled |
| Code Space | plugin 2.3.0; no data file | One local-only trusted-repository mount | `_mounts/TheHipsterStack` junction to one nested Git checkout; surrounding drive/tree excluded |
| ChatGPT roles | historical configs/evaluations and handoff contract | Add unified registry/map; retain provenance | unified role map/configs; Prömpter grammar and Chief of Staff traffic ownership |
| Codependent Coding | flat canon, active project, Simples, Source Mirror | Link through role lenses and workspace views; no doctrine copies | Chief of Staff workspace home, seven receiving-role lenses, Base, Canvas, canonical links |
| Legacy migration | path-sensitive Dataview, Bases, embeds, wikilinks | Inventory first; no ambiguous bulk moves | classified inventory with target/disposition/confidence/path-sensitive evidence; zero moves/deletions |
