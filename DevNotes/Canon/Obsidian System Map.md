---
title: Obsidian System Map
role: DevNotes
system: DevNotes
workspace:
type: map
status: Active
authority: Source of Truth
created: 2026-08-28
updated: 2026-08-28
tags:
  - obsidian
  - interface
  - navigation
---

# Obsidian System Map

## Interaction responsibilities

| Surface | Responsibility |
| --- | --- |
| Hearth | Primary operating shell and dashboard layer |
| Bases | Retrieval, facets, projections, lists, tables, cards, and health views |
| Meta Bind | Mutable state controls |
| Note Toolbar | Context-sensitive actions and commands |
| Callout Studio | Semantic visual language |
| Templater | Deterministic artifact creation |
| QuickAdd | Friendly creation commands and macros |
| TaskNotes | Task lifecycle, Kanban, calendar, and agenda |
| Code Space | Live implementation/repository surface |
| Canvas | Spatial ontology/topology/model reasoning |
| Iconic | Semantic role/artifact/action wayfinding |
| Git | Provenance and durable version history |
| Web Clipper | External capture/reference intake |
| Linter | Safe structural cleanup only |
| Obsidian CLI | Environment automation |

**Note Toolbar performs actions. Meta Bind changes state. Templater creates deterministic artifact shapes. QuickAdd exposes those creation flows. Bases retrieves. Hearth composes the operating interface.**

## Active vault support paths

```text
obsidian/Bases/
obsidian/Controls/
obsidian/Templates/
obsidian/Canvases/
obsidian/Reference/
obsidian/Scripts/
obsidian/Workflows/
obsidian/CSS/
```

Do not recreate obsolete `_obsidian/` paths solely because historical notes reference them.

## Governing contracts

- [[Role Manifest Specification]]
- [[Information Architecture and Naming]]
- [[Metadata and Knowledge Graph Contract]]
- [[Authority and Ownership]]

## UX invariants

- No routine YAML editing for status, authority, priority, health, or similar mutable state.
- No giant template menu for ordinary work.
- Role and workspace remain separate navigation axes.
- Dashboards show current work, handoffs, evidence, and health.
- Code is linked live when possible instead of copied into stale notes.
- Automation reduces memory burden rather than creating ceremony.
- The schema should disappear under the interface.
