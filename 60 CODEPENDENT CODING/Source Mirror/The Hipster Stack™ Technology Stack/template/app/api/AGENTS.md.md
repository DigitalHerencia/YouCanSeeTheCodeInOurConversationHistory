---
title: 'The Hipster Stack™ Technology Stack\template\app\api\AGENTS.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\api\AGENTS.md'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.api.agents.md'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\api\AGENTS.md'
source_file: 'AGENTS.md'
source_sha256: '96dc18d8bd5e6f6e63109ef4ed9c4d7b05c47ac02785e0f2549f3516f6c02c9e'
generated: true
---

# `AGENTS.md`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\api\AGENTS.md`
> SHA-256: `96dc18d8bd5e6f6e63109ef4ed9c4d7b05c47ac02785e0f2549f3516f6c02c9e`

```markdown
# Route handlers and webhooks

Webhook handlers follow `verify -> parse -> claim idempotently -> reconcile -> acknowledge`. Signature verification uses the raw body. Provider events are notifications of external truth, not trusted application commands.

```