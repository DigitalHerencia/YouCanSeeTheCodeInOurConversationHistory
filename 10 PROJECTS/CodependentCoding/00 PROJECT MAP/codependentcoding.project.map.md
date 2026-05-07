---
title: CodependentCoding Project Map
type: map
scope: project
project: CodependentCoding
domain: project
artifact: map
kind: map
namespace: codependentcoding.project.map
status: active
authority: source-of-truth
parent: "[[devnotes.projects.map]]"
depends_on:
  - "[[obsidian.contracts.naming-standard]]"
  - "[[obsidian.contracts.property-schema]]"
supersedes: []
tags:
  - projects/codependentcoding
  - maps/project
  - status/active
---

# CodependentCoding Project Map

## Product

~~~dataview
LIST
FROM "10 PROJECTS/CodependentCoding/10 PRODUCT"
SORT file.name ASC
~~~

## Contracts

~~~dataview
TABLE domain, artifact, kind, status, authority
FROM "10 PROJECTS/CodependentCoding/20 CONTRACTS"
SORT domain ASC, artifact ASC
~~~

## Architecture

~~~dataview
LIST
FROM "10 PROJECTS/CodependentCoding/30 ARCHITECTURE"
SORT file.name ASC
~~~

## Features

~~~dataview
LIST
FROM "10 PROJECTS/CodependentCoding/40 FEATURES"
SORT file.name ASC
~~~

## Agent Ops

~~~dataview
LIST
FROM "10 PROJECTS/CodependentCoding/50 AGENT OPS"
SORT file.name ASC
~~~

## Execution

~~~dataview
LIST
FROM "10 PROJECTS/CodependentCoding/60 EXECUTION"
SORT file.name ASC
~~~

## Research

~~~dataview
LIST
FROM "10 PROJECTS/CodependentCoding/70 RESEARCH"
SORT file.name ASC
~~~

## Legal

~~~dataview
LIST
FROM "10 PROJECTS/CodependentCoding/80 LEGAL"
SORT file.name ASC
~~~

## Archive

~~~dataview
LIST
FROM "10 PROJECTS/CodependentCoding/90 ARCHIVE"
SORT file.name ASC
~~~
