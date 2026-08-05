---
title: Tech Stack Map
type: map
scope: vault
project:
domain: vault
artifact: index
kind: map
namespace: devnotes.tech-stack.map
status: active
authority: reference
parent:
depends_on:
  - "[[obsidian.contracts.naming-standard]]"
supersedes: []
tags:
  - maps/vault
  - tech-stack
  - status/active
---

# Tech Stack Map

## Files

~~~dataview
LIST
FROM "40 TECH STACK"
SORT file.name ASC
~~~

## Recently Modified

~~~dataview
TABLE file.mtime AS Modified
FROM "40 TECH STACK"
SORT file.mtime DESC
LIMIT 20
~~~
