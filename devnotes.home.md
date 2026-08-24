---
title: DevNotes Home
type: map
scope: vault
project:
domain: vault
artifact: home
kind: map
namespace: devnotes.home
status: active
authority: canonical
role: devnotes
system: devnotes
workspace:
parent:
depends_on:
  - "[[obsidian.system.map]]"
supersedes: []
tags:
  - devnotes
  - maps/vault
  - status/active
created: 2026-08-04
updated: 2026-08-23
---
# DevNotes Home

> [!truth] Unified operating shell
> Role owns responsibility. Workspace and system are facets. Properties remain canonical state.

## Unified Workbench

- [[devnotes.roles.registry.map|Role domains]]
- [[codependent-coding.workspace.home|Codependent Coding workspace]]
- [[codependent-coding.project-management.dashboard|Project management]]
- [[devnotes.unified-system.authority.map|Unified system authority]]

![[_obsidian/Bases/TaskNotes/kanban-default.base#Kanban]]

![[_obsidian/Bases/TaskNotes/agenda-default.base#Agenda]]

![[_obsidian/Bases/Now.base#Active Work]]

![[_obsidian/Bases/Workspaces.base#Workspace Knowledge]]

![[_obsidian/Bases/Handoffs.base#Active Handoffs]]

![[_obsidian/Bases/Evidence.base#Evidence]]

![[_obsidian/Bases/Inbox.base#Inbox]]

![[_obsidian/Bases/Recent-Knowledge.base#Recent Knowledge]]

![[_obsidian/Bases/System-Health.base#Operational Health]]

![[_obsidian/Bases/DevNotes-Unified.base#Knowledge Index]]

## Vault System

- [[obsidian.system.map]]
- [[DevNotes-Unified-System.Authoritative-Blueprint]]
- [[Metadata-and-Knowledge-Graph-Contract]]
- [[Knowledge-Model.Authority-and-Ownership]]

## Knowledge Systems

- [[60.CODEPENDENTCODING.Manifest.Map|Codependent Coding manifest]] — canonical doctrine distributed across role Canon folders.
- [[10.PROJECTS.CODEPENDENTCODING.Docs.Authoritative-Knowledge-System-Spec|Codependent Coding authoritative knowledge-system specification]] — active architecture material in role-owned Codependent Coding workspaces.
- [[codependentcoding.simples.dashboard]] — active Simples™ operating view in the Codependent Coding project workspace.
- [[40.ARCHIVE.TECHSTACK.Map|Historical tech-stack map]] — archived migration/provenance reference only.

## Active Source-of-Truth Notes

```dataview
TABLE WITHOUT ID
  file.link AS Note,
  type AS Type,
  project AS Project,
  domain AS Domain,
  status AS Status
FROM ""
WHERE authority = "source-of-truth"
SORT file.name ASC
```

## Recently Modified

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

## Templates

```dataview
TABLE WITHOUT ID
  file.link AS Template,
  type AS Type,
  kind AS Kind
FROM "_obsidian/Templates"
SORT file.name ASC
```

## Unprocessed Captures

```dataview
TABLE WITHOUT ID
  file.link AS Capture,
  file.mtime AS Modified
FROM "DevNotes/Inbox"
WHERE type = "capture" OR !type
SORT file.mtime DESC
```

## Operating Rule

Capture unfinished material in `DevNotes/Inbox`. Create durable notes through QuickAdd so note type and destination are explicit. Use TaskNotes for tasks, Kanban, agenda, and calendar work. Keep canonical authority explicit, link live code through Code Space, and use role folders plus workspace/system properties for retrieval.
