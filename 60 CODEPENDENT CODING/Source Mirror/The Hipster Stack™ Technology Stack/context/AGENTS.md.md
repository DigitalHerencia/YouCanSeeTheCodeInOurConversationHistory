---
title: 'The Hipster Stack™ Technology Stack\context\AGENTS.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\context\AGENTS.md'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.context.agents.md'
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
source_path: 'The Hipster Stack™ Technology Stack\context\AGENTS.md'
source_file: 'AGENTS.md'
source_sha256: 'b35499cf40b186743dc89cc2aa914c659cc8d3787af38a6597492652d30316bc'
generated: true
---

# `AGENTS.md`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\context\AGENTS.md`
> SHA-256: `b35499cf40b186743dc89cc2aa914c659cc8d3787af38a6597492652d30316bc`

```markdown
# Context Governance

Scope: `context/**`.

`context/` is maintainer and Codex context for building Hipster Stack. It is not end-user documentation and it is not generated-application runtime content.

## Directory roles

- `context/README.md` — entrypoint and source map.
- `context/docs/` — durable human-readable product, architecture, design, transition, and release context.
- `context/specs/` — active issue-sized implementation modules used to create GitHub Issues and guide Codex.

## Context rules

- Describe the product that is actually intended, not the history of every prior implementation.
- Keep current-state facts separate from target-state requirements.
- Mark migration structures as transitional rather than silently presenting them as the final architecture.
- Do not copy the full Codependent Coding Knowledge System into Hipster Stack. Reference the canonical DevNotes material and encode only the Hipster Stack-specific consequences.
- Do not use context as a substitute for implementation.
- Do not create process or validation artifacts unrelated to shipping the active roadmap.
- Delete superseded active specs when their historical value is already preserved by Git history and keeping them would confuse current work.
- A spec is not complete merely because files changed. Its user/product outcome must be satisfied.

## Spec rule

Each active `context/specs/HS-*.md` must be usable as the basis of one focused GitHub Issue and should contain:

- outcome;
- starting state;
- scope;
- explicit non-goals;
- likely affected areas;
- acceptance criteria;
- proportional verification guidance;
- dependencies on earlier specs where required.

Do not add separate planning documents that duplicate the spec.

```