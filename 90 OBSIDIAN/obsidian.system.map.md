---
title: Obsidian System Map
type: map
scope: vault
project:
domain: vault
artifact: index
kind: map
namespace: obsidian.system.map
status: active
authority: reference
parent:
depends_on:
  - "[[obsidian.contracts.naming-standard]]"
supersedes: []
tags:
  - maps/vault
  - obsidian
  - status/active
---

# Obsidian System Map

## Files

~~~dataview
LIST
FROM "90 OBSIDIAN"
SORT file.name ASC
~~~

## Recently Modified

~~~dataview
TABLE file.mtime AS Modified
FROM "90 OBSIDIAN"
SORT file.mtime DESC
LIMIT 20
~~~
