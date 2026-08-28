---
title: CtrlPlus Project Map
type: map
scope: project
project: CtrlPlus
domain: project
artifact: map
kind: map
namespace: ctrlplus.project.map
status: active
authority: source-of-truth
parent: "[[devnotes.projects.map]]"
depends_on:
  - "[[obsidian.contracts.naming-standard]]"
  - "[[obsidian.contracts.property-schema]]"
supersedes: []
tags:
  - projects/ctrlplus
  - maps/project
  - status/active
created:
updated: 2026-08-11
---

# CtrlPlus Project Map

## Product

~~~dataview
LIST
FROM "10 PROJECTS/CtrlPlus/10 PRODUCT"
SORT file.name ASC
~~~

## Contracts

~~~dataview
TABLE domain, artifact, kind, status, authority
FROM "10 PROJECTS/CtrlPlus/20 CONTRACTS"
SORT domain ASC, artifact ASC
~~~

## Architecture

~~~dataview
LIST
FROM "10 PROJECTS/CtrlPlus/30 ARCHITECTURE"
SORT file.name ASC
~~~

## Features

~~~dataview
LIST
FROM "10 PROJECTS/CtrlPlus/40 FEATURES"
SORT file.name ASC
~~~

## Agent Ops

~~~dataview
LIST
FROM "10 PROJECTS/CtrlPlus/50 AGENT OPS"
SORT file.name ASC
~~~

## Execution

~~~dataview
LIST
FROM "10 PROJECTS/CtrlPlus/60 EXECUTION"
SORT file.name ASC
~~~

## Research

~~~dataview
LIST
FROM "10 PROJECTS/CtrlPlus/70 RESEARCH"
SORT file.name ASC
~~~

## Legal

~~~dataview
LIST
FROM "10 PROJECTS/CtrlPlus/80 LEGAL"
SORT file.name ASC
~~~

## Archive

~~~dataview
LIST
FROM "10 PROJECTS/CtrlPlus/90 ARCHIVE"
SORT file.name ASC
~~~
