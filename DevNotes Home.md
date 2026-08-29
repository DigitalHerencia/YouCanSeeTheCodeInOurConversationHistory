---
title: DevNotes Home
role: DevNotes
system: DevNotes
workspace:
type: dashboard
status: Active
authority: Source of Truth
created: 2026-08-28
updated: 2026-08-28
tags:
  - devnotes
  - dashboard
  - home
---

# DevNotes Home

> [!truth] Unified operating shell
> Role owns primary responsibility. Project/workspace and system are facets. Properties hold useful mutable state. Tags classify. Live systems remain authority for volatile facts.

## System

- [[Role Manifest Specification|Role Manifest]]
- [[Role Registry|Role Domains]]
- [[Authority and Ownership]]
- [[Unified System Blueprint]]
- [[Metadata and Knowledge Graph Contract]]
- [[Information Architecture and Naming]]
- [[Obsidian System Map]]

## Current work

![[obsidian/Bases/Now.base#Active Work]]

![[obsidian/Bases/Workspaces.base#Workspace Knowledge]]

![[obsidian/Bases/Handoffs.base#Active Handoffs]]

![[obsidian/Bases/Evidence.base#Evidence]]

![[obsidian/Bases/Inbox.base#Inbox]]

## Project management

TaskNotes is the task lifecycle authority inside Obsidian for task/Kanban/calendar/agenda views. Chief of Staff owns the global semantics of work state, sequencing, priority, milestones, blockers, scheduling, and handoffs.

## Knowledge system

DevNotes owns taxonomy, metadata, Properties stewardship, information architecture, retrieval, wikilinks/backlinks, typed relationships, provenance, and graph health.

The canonical traceability path is:

**source → claim → decision → specification → artifact → validation → evidence**

## Authority views

### Source of Truth

```dataview
TABLE WITHOUT ID
  file.link AS Note,
  type AS Type,
  role AS Role,
  status AS Status
FROM ""
WHERE authority = "Source of Truth"
  AND !startswith(file.path, "ZETTLECASTEN/")
  AND !startswith(file.path, "CIGARETTES, REGRETS, & NEURAL NETS/")
SORT file.name ASC
```

### Recently modified

```dataview
TABLE WITHOUT ID
  file.link AS Note,
  file.folder AS Folder,
  file.mtime AS Modified
FROM ""
WHERE file.path != this.file.path
SORT file.mtime DESC
LIMIT 25
```

## Creation and state

- Templater creates deterministic artifact shapes.
- QuickAdd exposes friendly creation flows.
- Meta Bind changes mutable state.
- Note Toolbar performs context-sensitive actions.
- Bases retrieves and projects.
- Hearth composes the operating interface.
- Code Space exposes live implementation when configured.

Routine workflow should not require manual YAML editing.

## Protected areas

`ZETTLECASTEN/` and `CIGARETTES, REGRETS, & NEURAL NETS/` are outside governance cleanup and migration. They are not modified unless explicitly requested.
