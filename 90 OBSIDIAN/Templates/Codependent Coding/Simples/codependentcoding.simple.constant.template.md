---
title: "<% tp.file.title %>"
type: simple
scope: file
project: Codependent Coding
domain: constants
artifact: "<% tp.file.title %>"
kind: simple
namespace: "codependentcoding.simples.constant.<% tp.file.title.toLowerCase().replace(/[^a-z0-9]+/g, '.').replace(/^\.+|\.+$/g, '') %>"
status: draft
authority: working-note
parent: "[[codependentcoding.webapp-architecture.master.source-document]]"
depends_on: ["[[The Maximal Template™ Demo Doctrine]]"]
supersedes: []
tags: [codependent-coding/simples, simples/constant, server/constant, status/draft]
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
simple_type: constant
layer: constants
source_path:
public_source_path:
hardened_source_path:
canonicalization_status: unreconciled
public_implementation_status: not-started
hardened_implementation_status: not-started
generation_status: not-ready
uses: []
requires: []
permits: []
conditional: []
prohibits: []
tests: []
validation: []
---

# <% tp.file.title %>

## Codependent Coding Knowledge
### Canonical Definition
A constant Simple owns stable shared values that do not belong to a more precise architectural responsibility.

### Responsibility
- Give stable values an obvious, named owner.
- Keep domain/provider-specific constants with the most precise legitimate owner when that boundary is stronger.

### Contract & Invariants
- No hidden mutable state or runtime side effects.
- No secrets.

### Boundaries / Anti-Patterns
- Do not turn constants into a generic config dumping ground.
- Do not move provider/config values out of their stronger owner merely to centralize them.

## Simple Properties
### Relationships
- Link meaningful consumers when useful; derive inverse use through backlinks.

### Generation Disposition
Derived/invariant according to consumers; constant files are retained only when required.

## Implementation
### Public Demo Golden Prototype
```ts
// Public/demo constants.
```
### Hardened Golden Prototype
```ts
// Hardened/canonical constants.
```
### Hardening Delta
- Usually none; never introduce secret values.

## Validation & Evidence
- [ ] Values are genuinely stable/shared.
- [ ] No stronger owner exists.
- [ ] No secrets or runtime state.

## Links
- [[codependentcoding.webapp-architecture.master.source-document]]

## Backlinks
```dataview
TABLE simple_type AS "Type", layer AS "Layer" FROM [[]] SORT file.name ASC
```

## Tags
Canonical tags live in frontmatter.