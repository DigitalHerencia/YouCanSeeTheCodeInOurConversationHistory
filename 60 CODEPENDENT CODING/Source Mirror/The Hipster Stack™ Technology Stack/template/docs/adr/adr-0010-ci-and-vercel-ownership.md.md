---
title: 'The Hipster Stack™ Technology Stack\template\docs\adr\adr-0010-ci-and-vercel-ownership.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\docs\adr\adr-0010-ci-and-vercel-ownership.md'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.docs.adr.adr-0010-ci-and-vercel-ownership.md'
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
source_path: 'The Hipster Stack™ Technology Stack\template\docs\adr\adr-0010-ci-and-vercel-ownership.md'
source_file: 'adr-0010-ci-and-vercel-ownership.md'
source_sha256: '2cc9de6293ad539734189521c86bd829b7a236a429fca2401991b3a8e6fa60b5'
generated: true
---

# `adr-0010-ci-and-vercel-ownership.md`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\docs\adr\adr-0010-ci-and-vercel-ownership.md`
> SHA-256: `2cc9de6293ad539734189521c86bd829b7a236a429fca2401991b3a8e6fa60b5`

```markdown
---
title: "ADR-0010: CI and Vercel Ownership"
status: "Accepted"
date: "2026-08-03"
authors: "Repository maintainers"
tags: ["architecture", "ci", "vercel"]
supersedes: ""
superseded_by: ""
---

# ADR-0010: CI and Vercel Ownership

## Status

Accepted

## Context

Repository validation and deployment-platform checks have different authority and credential exposure.

## Decision

GitHub Actions owns credential-free frozen install, generation, static analysis, tests, build, and repository security checks. Vercel owns deployment compilation and environment-specific preview/production evidence. Production deployment and migrations remain explicit owner gates.

## Consequences

### Positive

- **POS-001**: Pull requests receive deterministic repository-owned evidence.
- **POS-002**: Deployment-specific behavior remains visible without exposing production credentials to generic CI.

### Negative

- **NEG-001**: Some evidence exists only after preview deployment or owner action.
- **NEG-002**: CI workflow implementation is incomplete until its queued issue lands.

## Alternatives Considered

### Vercel-only validation

- **ALT-001**: **Description**: Treat a successful deployment as the sole quality gate.
- **ALT-002**: **Rejection Reason**: It weakens reproducibility and couples basic validation to external deployment state.

## Implementation Notes

- **IMP-001**: CI uses the repository-pinned Node and pnpm versions.
- **IMP-002**: Unrun provider journeys are reported as unverified, never passed.

## References

- **REF-001**: Quality-gates contract and deployment documentation.

```