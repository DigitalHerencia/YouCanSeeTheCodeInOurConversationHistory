---
title: Obsidian System Map
type: map
scope: vault
project:
domain: obsidian
artifact: system
kind: map
namespace: obsidian.system.map
status: active
authority: reference
parent: "[[devnotes.home]]"
depends_on:
  - "[[obsidian.contracts.naming-standard]]"
  - "[[obsidian.contracts.property-schema]]"
  - "[[obsidian.contracts.note-types]]"
supersedes: []
tags:
  - maps/vault
  - obsidian
  - status/active
created: 2026-08-04
updated: 2026-08-04
role: devnotes
system: devnotes
workspace:
---

# Obsidian System Map

## Governing Contracts

- [[obsidian.contracts.naming-standard]]
- [[obsidian.contracts.property-schema]]
- [[obsidian.contracts.note-types]]

## Templates

```dataview
TABLE WITHOUT ID
  file.link AS Template,
  type AS Type,
  kind AS Kind
FROM "_obsidian/Templates"
SORT file.name ASC
```

## Obsidian System Files

```dataview
TABLE WITHOUT ID
  file.link AS Note,
  type AS Type,
  status AS Status,
  authority AS Authority
FROM "_obsidian"
WHERE file.path != this.file.path
SORT file.name ASC
```

## Recently Modified

```dataview
TABLE WITHOUT ID
  file.link AS Note,
  file.mtime AS Modified
FROM "_obsidian"
WHERE file.path != this.file.path
SORT file.mtime DESC
LIMIT 20
```
