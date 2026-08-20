---
title: 'The Hipster Stack™ Technology Stack\template\docs\adr\adr-0009-presentation-catalog-isolation.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\docs\adr\adr-0009-presentation-catalog-isolation.md'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.docs.adr.adr-0009-presentation-catalog-isolation.md'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-hipster-stack-technology-stack
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Hipster Stack™ Technology Stack\template\docs\adr\adr-0009-presentation-catalog-isolation.md'
source_file: 'adr-0009-presentation-catalog-isolation.md'
source_sha256: '047e48c80c5a7487d34b68cc562bcdd82780c38c4d91a8bfdf8a9436f04511d3'
generated: true
---

# `adr-0009-presentation-catalog-isolation.md`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\docs\adr\adr-0009-presentation-catalog-isolation.md`
> SHA-256: `047e48c80c5a7487d34b68cc562bcdd82780c38c4d91a8bfdf8a9436f04511d3`

```markdown
---
title: "ADR-0009: Presentation Catalog Isolation"
status: "Accepted"
date: "2026-08-03"
authors: "Repository maintainers"
tags: ["architecture", "presentation", "catalog"]
supersedes: ""
superseded_by: ""
---

# ADR-0009: Presentation Catalog Isolation

## Status

Accepted

## Context

Reusable fixtures and presentation recipes are useful development assets but must not silently become public production product routes.

## Decision

Presentation assets follow tokens to primitives to shared/domain components to blocks to feature orchestration to routes. The catalog is isolated from default production routes, contains no protected data/provider access, and includes typed fixtures and registry metadata.

## Consequences

### Positive

- **POS-001**: Reusable visual assets remain testable without expanding product surface.
- **POS-002**: Production routes select intentional product features only.

### Negative

- **NEG-001**: Catalog hosting and discovery need explicit tooling.
- **NEG-002**: Current presentation routes remain exposed until a later implementation issue.

## Alternatives Considered

### Public in-app gallery

- **ALT-001**: **Description**: Keep every presentation example as a compiled public route.
- **ALT-002**: **Rejection Reason**: It expands production surface and blurs examples with product behavior.

## Implementation Notes

- **IMP-001**: This ADR records the target boundary, not current completion.
- **IMP-002**: Catalog isolation must preserve useful fixtures and accessibility contracts.

## References

- **REF-001**: ADR-0001.

```