---
title: Zettelkasten Map
type: map
scope: vault
project:
domain: vault
artifact: index
kind: map
namespace: devnotes.zettelkasten.map
status: active
authority: reference
parent: "[[devnotes.home]]"
depends_on:
  - "[[obsidian.contracts.naming-standard]]"
supersedes: []
tags:
  - maps/vault
  - zettelkasten
  - status/active
created: 2026-08-04
updated: 2026-08-11
role: devnotes
system: devnotes
workspace:
---

# Zettelkasten Map

## Files

~~~dataview
LIST
FROM "DevNotes/Inbox"
SORT file.name ASC
~~~

## Recently Modified

~~~dataview
TABLE file.mtime AS Modified
FROM "DevNotes/Inbox"
SORT file.mtime DESC
LIMIT 20
~~~
