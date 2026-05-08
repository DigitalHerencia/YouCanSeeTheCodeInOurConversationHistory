---
title: Projects Map
type: map
scope: vault
project:
domain: projects
artifact: index
kind: map
namespace: devnotes.projects.map
status: active
authority: source-of-truth
parent:
depends_on:
  - "[[obsidian.contracts.naming-standard]]"
  - "[[obsidian.contracts.property-schema]]"
supersedes: []
tags:
  - projects
  - maps/vault
  - status/active
---

# Projects Map

## Project Maps

~~~dataview
TABLE project, status, authority
FROM "10 PROJECTS"
WHERE type = "map" AND scope = "project"
SORT project ASC
~~~

## Active Contracts

~~~dataview
TABLE project, domain, artifact, kind, status
FROM "10 PROJECTS"
WHERE type = "contract" AND status = "active"
SORT project ASC, domain ASC, artifact ASC
~~~

## Draft Contracts

~~~dataview
TABLE project, domain, artifact, kind, file.mtime AS Modified
FROM "10 PROJECTS"
WHERE type = "contract" AND status = "draft"
SORT file.mtime DESC
~~~

## Agent Ops

~~~dataview
LIST
FROM "10 PROJECTS"
WHERE contains(file.path, "50 AGENT OPS")
SORT file.mtime DESC
~~~
