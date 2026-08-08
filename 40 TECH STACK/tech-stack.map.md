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
created: 2026-05-07
updated: 2026-08-08
---

# Tech Stack Map

## Canonical engineering system

- [[codependentcoding.knowledge-system.map]] — canonical map for the Codependent Coding™ Knowledge System, which governs the Loaded Vibes™ WebApp Architecture implemented with the Hipster Stack™.
- [[codependentcoding.knowledge-system.definition.source-document]] — source-of-truth identity, hierarchy, authority, and change rules.
- [[hipsterstack.engineering-system.definition.source-document]] — integrated technical architecture and implementation-system definition.
- [[hipsterstack.patterns.catalog.map]] — canonical implementation-pattern navigation.

### Machine-readable contracts

- `codependentcoding.contracts.product.contract.yaml`
- `codependentcoding.contracts.architecture.contract.yaml`
- `codependentcoding.contracts.ontology.contract.yaml`
- `codependentcoding.contracts.validation.contract.yaml`
- `codependentcoding.contracts.execution.contract.yaml`

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
