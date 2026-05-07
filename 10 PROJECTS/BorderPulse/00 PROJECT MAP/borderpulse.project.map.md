---
title: BorderPulse Project Map
type: map
scope: project
project: BorderPulse
domain: project
artifact: map
kind: map
namespace: borderpulse.project.map
status: active
authority: source-of-truth
parent: "[[devnotes.projects.map]]"
depends_on:
  - "[[obsidian.contracts.naming-standard]]"
  - "[[obsidian.contracts.property-schema]]"
supersedes: []
tags:
  - projects/borderpulse
  - maps/project
  - status/active
---

# BorderPulse Project Map

## Product

~~~dataview
LIST
FROM "10 PROJECTS/BorderPulse/10 PRODUCT"
SORT file.name ASC
~~~

## Contracts

~~~dataview
TABLE domain, artifact, kind, status, authority
FROM "10 PROJECTS/BorderPulse/20 CONTRACTS"
SORT domain ASC, artifact ASC
~~~

## Architecture

~~~dataview
LIST
FROM "10 PROJECTS/BorderPulse/30 ARCHITECTURE"
SORT file.name ASC
~~~

## Features

~~~dataview
LIST
FROM "10 PROJECTS/BorderPulse/40 FEATURES"
SORT file.name ASC
~~~

## Agent Ops

~~~dataview
LIST
FROM "10 PROJECTS/BorderPulse/50 AGENT OPS"
SORT file.name ASC
~~~

## Execution

~~~dataview
LIST
FROM "10 PROJECTS/BorderPulse/60 EXECUTION"
SORT file.name ASC
~~~

## Research

~~~dataview
LIST
FROM "10 PROJECTS/BorderPulse/70 RESEARCH"
SORT file.name ASC
~~~

## Legal

~~~dataview
LIST
FROM "10 PROJECTS/BorderPulse/80 LEGAL"
SORT file.name ASC
~~~

## Archive

~~~dataview
LIST
FROM "10 PROJECTS/BorderPulse/90 ARCHIVE"
SORT file.name ASC
~~~
