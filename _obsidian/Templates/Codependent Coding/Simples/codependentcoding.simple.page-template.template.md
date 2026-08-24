---
title: "<% tp.file.title %>"
type: simple
scope: file
project: Codependent Coding
domain: presentation
artifact: "<% tp.file.title %>"
kind: simple
namespace: "codependentcoding.simples.page-template.<% tp.file.title.toLowerCase().replace(/[^a-z0-9]+/g, '.').replace(/^\.+|\.+$/g, '') %>"
status: draft
authority: working-note
parent: "[[codependentcoding.webapp-architecture.master.source-document]]"
depends_on: ["[[The Maximal Template™ Demo Doctrine]]"]
supersedes: []
tags: [codependent-coding/simples, simples/page-template, presentation/template, status/draft]
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
simple_type: page-template
layer: presentation-structure
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
variants: []
ontologies: []
tests: []
validation: []
role: devnotes
system: devnotes
workspace:
---

# <% tp.file.title %>

## Codependent Coding Knowledge
### Canonical Definition
A page template is reusable presentation structure for a recognized page/workspace shape. It does not own route, domain, persisted-data, authorization, or provider behavior.

### Responsibility
- Define reusable page-level presentation composition/slots.
- Compose blocks/shell presentation according to one structural pattern.

### Contract & Invariants
- Pure presentation structure.
- Route ownership stays in `app/`; application orchestration stays in features.
- No generic template invented when a block or shell already expresses the responsibility.

### Boundaries / Anti-Patterns
- No data access or mutation.
- No domain-specific server behavior.
- No duplicate page wrapper existing only for taxonomy symmetry.

## Simple Properties
### Relationships
- Link blocks/shells composed by the template and features/routes that legitimately use it.

### Generation Disposition
Presentation-configurable or derived only when the source template is a real supported variation.

## Implementation
### Public Demo Golden Prototype
```tsx
// Public/demo page template.
```
### Hardened Golden Prototype
```tsx
// Hardened presentation template; normally identical because security stays outside this pure presentation boundary.
```
### Hardening Delta
- Usually none.

## Validation & Evidence
- [ ] Responsibility is structural presentation only.
- [ ] Slots/variants are real and reusable.
- [ ] No server responsibility leaked into the template.

## Links
- [[10.PROJECTS.CODEPENDENTCODING.WebApp-Architecture.Master.Source-Document]]
- [[10.PROJECTS.CODEPENDENTCODING.WebApp-Architecture.Template-Demo]]

## Backlinks
```dataview
TABLE simple_type AS "Type", layer AS "Layer" FROM [[]] SORT file.name ASC
```

## Tags
Canonical tags live in frontmatter.