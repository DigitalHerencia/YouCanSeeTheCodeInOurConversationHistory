---
title: 'The Hipster Stack™ Technology Stack\template\.agents\contracts\quality-gates.yaml'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\.agents\contracts\quality-gates.yaml'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.agents.contracts.quality-gates.yaml'
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
source_path: 'The Hipster Stack™ Technology Stack\template\.agents\contracts\quality-gates.yaml'
source_file: 'quality-gates.yaml'
source_sha256: '6467ee4b0934a3018d9d467d50d96d23222da7dfb939fbd199c1ccd36112592d'
generated: true
---

# `quality-gates.yaml`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\.agents\contracts\quality-gates.yaml`
> SHA-256: `6467ee4b0934a3018d9d467d50d96d23222da7dfb939fbd199c1ccd36112592d`

```yaml
id: white-label-application.quality-gates
version: 1
authority: executable-command-contract
credential_free:
  fast: pnpm validate:fast
  complete: pnpm validate
  ci: pnpm validate:ci
focused:
  governance: pnpm governance:validate
  architecture: pnpm architecture:validate
  database_and_webhook_security: pnpm test:database-security
credentialed:
  release: pnpm validate:release
rules:
  unrun_is_not_passed: true
  production_actions_require_owner_gate: true

```