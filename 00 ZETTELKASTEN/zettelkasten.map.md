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
parent:
depends_on:
  - "[[obsidian.contracts.naming-standard]]"
supersedes: []
tags:
  - maps/vault
  - zettelkasten
  - status/active
---

# Zettelkasten Map

## Files

~~~dataview
LIST
FROM "00 ZETTELKASTEN"
SORT file.name ASC
~~~

## Recently Modified

~~~dataview
TABLE file.mtime AS Modified
FROM "00 ZETTELKASTEN"
SORT file.mtime DESC
LIMIT 20
~~~
