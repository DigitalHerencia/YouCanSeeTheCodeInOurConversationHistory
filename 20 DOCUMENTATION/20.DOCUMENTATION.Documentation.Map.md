---
title: Documentation Map
type: map
scope: vault
project:
domain: vault
artifact: index
kind: map
namespace: devnotes.documentation.map
status: active
authority: reference
parent: "[[devnotes.home]]"
depends_on:
  - "[[obsidian.contracts.naming-standard]]"
supersedes: []
tags:
  - maps/vault
  - documentation
  - status/active
created:
updated: 2026-08-11
---

# Documentation Map

## Files

~~~dataview
LIST
FROM "20 DOCUMENTATION"
SORT file.name ASC
~~~

## Recently Modified

~~~dataview
TABLE file.mtime AS Modified
FROM "20 DOCUMENTATION"
SORT file.mtime DESC
LIMIT 20
~~~
