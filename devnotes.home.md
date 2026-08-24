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

![[_obsidian/Bases/Recent-Knowledge.base#Recent Knowledge]]

![[_obsidian/Bases/System-Health.base#System Health]]

![[_obsidian/Bases/DevNotes-Unified.base#Knowledge Index]]

## Vault System

- [[obsidian.system.map]]
- [[obsidian.contracts.naming-standard]]
- [[obsidian.contracts.property-schema]]
- [[obsidian.contracts.note-types]]

## Knowledge Systems

- [[60 CODEPENDENT CODING/60.CODEPENDENTCODING.Manifest.Map|Codependent Coding manifest]] — canonical flat Codependent Coding™ knowledge-system corpus in `60 CODEPENDENT CODING`.
- [[10 PROJECTS/10.PROJECTS.CODEPENDENTCODING/10.PROJECTS.CODEPENDENTCODING.WebApp-Architecture/Codependent-Coding-Docs-Knowledge-Authority-Package/10.PROJECTS.CODEPENDENTCODING.Docs.Authoritative-Knowledge-System-Spec|Codependent Coding authoritative knowledge-system specification]] — active Codependent Coding™ WebApp Architecture authority in `10 PROJECTS/10.PROJECTS.CODEPENDENTCODING`.
- [[codependentcoding.simples.dashboard]] — active Simples™ operating view in the Codependent Coding project workspace.
- [[40 ARCHIVE/40.ARCHIVE.TECHSTACK/40.ARCHIVE.TECHSTACK.Map|Historical tech-stack map]] — archived migration/provenance reference only.

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

Capture new unfinished material in `DevNotes/Inbox`; `00 ZETTELKASTEN` remains a legacy compatibility inbox until its contents are classified. Create new notes through the routed QuickAdd/Templater controls under `_obsidian/Templates`. Place durable material in its responsibility-owned role context using the unified metadata contract, while preserving legacy metadata until it is intentionally reconciled. Keep canonical authority explicit and discoverable. For Codependent Coding, preserve the distinction between the shared flat canon in `60 CODEPENDENT CODING` and active project-owned material in `10 PROJECTS/10.PROJECTS.CODEPENDENTCODING`.
