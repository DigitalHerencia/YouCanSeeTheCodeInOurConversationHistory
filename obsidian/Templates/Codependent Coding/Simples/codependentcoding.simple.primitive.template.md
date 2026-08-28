---
title: "codependentcoding.simple.prisma-lifecycle.template"
type: simple
scope: file
project: Codependent Coding
domain: presentation
artifact: "codependentcoding.simple.prisma-lifecycle.template"
kind: simple
namespace: "codependentcoding.simples.primitive.codependentcoding.simple.prisma.lifecycle.template"
status: draft
authority: working-note
parent: "[[codependentcoding.webapp-architecture.master.source-document]]"
depends_on:
  - "[[The Maximal Template™ Demo Doctrine]]"
supersedes: []
tags:
  - codependent-coding/simples
  - simples/primitive
  - presentation/primitive
  - status/draft
created: 2026-08-27
updated: 2026-08-27
simple_type: primitive
layer: ui-primitive
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
tokens: []
tests: []
validation: []
role: devnotes
system: devnotes
workspace:
---

# codependentcoding.simple.prisma-lifecycle.template

## Codependent Coding Knowledge

### Canonical Definition
A primitive is the lowest-level reusable UI component. It owns primitive-level presentation and interaction behavior, never domain or server responsibility.

### Responsibility
- Stable reusable UI contract.
- Supported variants/sizes/states.
- Semantic design-token consumption.
- Accessibility appropriate to the primitive.

### Contract & Invariants
- No domain logic, persisted data access, authz, provider mechanics, or workflows.
- Blocks normally compose primitives; React Hook Form features may compose them directly as the explicit form exception.

### Boundaries / Anti-Patterns
- Do not smuggle business state into primitive APIs.
- Do not create provider/domain-specific primitives.

## Simple Properties

### Relationships
- **uses:** semantic tokens and lower-level presentation helpers where justified.
- **variants:** real supported source variants.
- **tokens:** semantic token dependencies.

### Generation Disposition
Primitive variants/tokens may be presentation-configurable only where deterministic source transforms exist.

## Implementation

### Public Demo Golden Prototype
```tsx
// Public/demo primitive.
```

### Hardened Golden Prototype
```tsx
// Hardened primitive.
```

### Hardening Delta
- Usually none; security/application hardening belongs above the primitive boundary.

## Validation & Evidence
- [ ] Primitive API is narrow and reusable.
- [ ] Accessibility behavior verified.
- [ ] Variants/tokens correspond to real implementation.
- [ ] No architecture ownership leakage.

## Links
- [[10.PROJECTS.CODEPENDENTCODING.WebApp-Architecture.Master.Source-Document]]
- [[10.PROJECTS.CODEPENDENTCODING.WebApp-Architecture.Template-Demo]]

## Backlinks
```dataview
TABLE simple_type AS "Type", layer AS "Layer"
FROM [[]]
SORT file.name ASC
```

## Tags
Canonical tags live in frontmatter.