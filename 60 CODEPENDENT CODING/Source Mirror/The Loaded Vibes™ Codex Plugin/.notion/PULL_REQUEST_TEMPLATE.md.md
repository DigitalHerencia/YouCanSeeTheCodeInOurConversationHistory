---
title: 'The Loaded Vibes™ Codex Plugin\.notion\PULL_REQUEST_TEMPLATE.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\PULL_REQUEST_TEMPLATE.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.pull-request-template.md'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-loaded-vibes-codex-plugin
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\PULL_REQUEST_TEMPLATE.md'
source_file: 'PULL_REQUEST_TEMPLATE.md'
source_sha256: '72384c97451865de2de8ba1b119d421db0fee46ccb02338fb328c588427b759a'
generated: true
---

# `PULL_REQUEST_TEMPLATE.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\PULL_REQUEST_TEMPLATE.md`
> SHA-256: `72384c97451865de2de8ba1b119d421db0fee46ccb02338fb328c588427b759a`

```markdown
## Summary

This PR centralizes Notion identifiers into a runtime registry, removes hard-coded Notion IDs from the shipped extension, and adds safe onboarding and migration tooling.

## Changes

- Sanitized `config/databases.json` (no real Notion IDs shipped).
- Schemas now prefer runtime registry values and provide placeholders for missing IDs.
- Added `scripts/*` migration tools to scan, propose, and apply ID replacements (non-destructive; backups created).
- Added safe onboarding command `notionista.init` (dry-run -> preview -> confirm -> apply) and guard settings (`notionista.allowWrites`, `notionista.autoApplyWrites`).
- ESLint/TS config consolidation and many lint/type fixes.
- CI workflow to run lint/type-check/tests.

## How to test

1. Open the extension folder in VS Code.
2. Run `pnpm install`.
3. Run `pnpm run lint` and `pnpm run check:ts` and `pnpm run test:unit`.

## Migration

See `scripts/docs-replacement-map.json` for proposed doc replacements and `.bak` backups in the repository root for any modified files.

```