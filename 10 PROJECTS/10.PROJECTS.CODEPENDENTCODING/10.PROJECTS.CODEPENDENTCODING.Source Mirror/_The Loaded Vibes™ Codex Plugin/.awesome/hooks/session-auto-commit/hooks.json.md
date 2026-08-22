---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\session-auto-commit\hooks.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\session-auto-commit\hooks.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.hooks.session-auto-commit.hooks.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\session-auto-commit\hooks.json'
source_file: 'hooks.json'
source_sha256: 'fc311c2becc1e2bf4869a9d7d5e65f3a1cb988703ab6af75e47683f12017541e'
generated: true
---

# `hooks.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\hooks\session-auto-commit\hooks.json`
> SHA-256: `fc311c2becc1e2bf4869a9d7d5e65f3a1cb988703ab6af75e47683f12017541e`

```json
{
  "version": 1,
  "hooks": {
    "sessionEnd": [
      {
        "type": "command",
        "bash": ".github/hooks/session-auto-commit/auto-commit.sh",
        "timeoutSec": 30
      }
    ]
  }
}

```