---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\tool-guardian\hooks.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\tool-guardian\hooks.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.hooks.tool-guardian.hooks.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\tool-guardian\hooks.json'
source_file: 'hooks.json'
source_sha256: '44a0487683ba1652335648d9fb86f5ce6c5e264b44f4a21003b227176d54d973'
generated: true
---

# `hooks.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\hooks\tool-guardian\hooks.json`
> SHA-256: `44a0487683ba1652335648d9fb86f5ce6c5e264b44f4a21003b227176d54d973`

```json
{
  "version": 1,
  "hooks": {
    "preToolUse": [
      {
        "type": "command",
        "bash": "hooks/tool-guardian/guard-tool.sh",
        "cwd": ".",
        "env": {
          "GUARD_MODE": "block"
        },
        "timeoutSec": 10
      }
    ]
  }
}

```