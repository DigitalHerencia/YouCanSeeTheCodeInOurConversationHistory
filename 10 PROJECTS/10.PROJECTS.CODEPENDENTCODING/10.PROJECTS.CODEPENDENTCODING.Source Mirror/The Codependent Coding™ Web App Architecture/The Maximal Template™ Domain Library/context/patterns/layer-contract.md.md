---
title: 'The Hipster Stack™ Technology Stack\template\context\patterns\layer-contract.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\context\patterns\layer-contract.md'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.context.patterns.layer-contract.md'
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
source_path: 'The Hipster Stack™ Technology Stack\template\context\patterns\layer-contract.md'
source_file: 'layer-contract.md'
source_sha256: '5d7a30daa3e4b38f6b11b67232a2df35d0c9ec006c620d3729a296fa00392fff'
generated: true
---

# `layer-contract.md`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\context\patterns\layer-contract.md`
> SHA-256: `5d7a30daa3e4b38f6b11b67232a2df35d0c9ec006c620d3729a296fa00392fff`

```markdown
# Layer contract

Every layer has a narrow input, stable output, and explicit side-effect budget. Values crossing client or HTTP boundaries are serializable. Mappers have no I/O; fetchers do not write; provider adapters do not authorize; transaction helpers do not perform network calls.

```