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
- [[devnotes.unified-system.authority.map|Unified system authority]]

![[_obsidian/Bases/Now.base#Active Work]]

![[_obsidian/Bases/Workspaces.base#Workspace Knowledge]]

![[_obsidian/Bases/Handoffs.base#Active Handoffs]]

![[_obsidian/Bases/Evidence.base#Evidence]]

![[_obsidian/Bases/Inbox.base#Inbox]]

## Vault System

- [[obsidian.system.map]]
- [[obsidian.contracts.naming-standard]]
- [[obsidian.contracts.property-schema]]
- [[obsidian.contracts.note-types]]

## Knowledge Systems

- [[codependentcoding.manifest.map]] — canonical flat Codependent Coding™ knowledge-system corpus in `60 CODEPENDENT CODING`.
- [[10.PROJECTS.CODEPENDENTCODING.WebApp-Architecture.Master.Source-Document]] — active Codependent Coding™ WebApp Architecture in `10 PROJECTS/10.PROJECTS.CODEPENDENTCODING`.
- [[codependentcoding.simples.dashboard]] — active Simples™ operating view in the Codependent Coding project workspace.
- [[devnotes.tech-stack.map]] — reusable technical knowledge and integration references where still active.

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
FROM "90 OBSIDIAN/Templates"
SORT file.name ASC
```

## Unprocessed Captures

```dataview
TABLE WITHOUT ID
  file.link AS Capture,
  file.mtime AS Modified
FROM "00 ZETTELKASTEN"
WHERE type = "capture" OR !type
SORT file.mtime DESC
```

## Operating Rule

Capture unfinished material in `00 ZETTELKASTEN`. Place durable material in its correct destination using the established naming, property, and note-type contracts. Keep source-of-truth notes clearly identified and discoverable. For Codependent Coding, preserve the distinction between the flat knowledge corpus in `60 CODEPENDENT CODING` and active project-owned material in `10 PROJECTS/10.PROJECTS.CODEPENDENTCODING`.
