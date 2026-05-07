---
title: Deep Research Map
type: map
scope: vault
project:
domain: vault
artifact: index
kind: map
namespace: devnotes.deep-research.map
status: active
authority: reference
parent:
depends_on:
  - "[[obsidian.contracts.naming-standard]]"
supersedes: []
tags:
  - maps/vault
  - research
  - status/active
---

# Deep Research Map

## Files

~~~dataview
LIST
FROM "30 DEEP RESEARCH"
SORT file.name ASC
~~~

## Recently Modified

~~~dataview
TABLE file.mtime AS Modified
FROM "30 DEEP RESEARCH"
SORT file.mtime DESC
LIMIT 20
~~~
