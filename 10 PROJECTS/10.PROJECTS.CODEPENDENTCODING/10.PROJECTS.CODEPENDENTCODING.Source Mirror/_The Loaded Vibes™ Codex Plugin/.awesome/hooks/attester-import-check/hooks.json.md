---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\attester-import-check\hooks.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\attester-import-check\hooks.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.hooks.attester-import-check.hooks.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\attester-import-check\hooks.json'
source_file: 'hooks.json'
source_sha256: '392ffd8631db9965ec408c345502519ebec71c7f45d811236ad8cb666b09a2fc'
generated: true
---

# `hooks.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\hooks\attester-import-check\hooks.json`
> SHA-256: `392ffd8631db9965ec408c345502519ebec71c7f45d811236ad8cb666b09a2fc`

```json
{
  "version": 1,
  "hooks": {
    "preToolUse": [
      {
        "type": "command",
        "bash": "hooks/attester-import-check/check-imports.py",
        "cwd": ".",
        "env": {
          "ATTESTER_MODE": "block"
        },
        "timeoutSec": 30
      }
    ]
  }
}

```