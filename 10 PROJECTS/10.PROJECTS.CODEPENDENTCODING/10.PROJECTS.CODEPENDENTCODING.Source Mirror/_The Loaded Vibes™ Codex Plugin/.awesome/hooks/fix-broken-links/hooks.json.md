---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\fix-broken-links\hooks.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\fix-broken-links\hooks.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.hooks.fix-broken-links.hooks.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\fix-broken-links\hooks.json'
source_file: 'hooks.json'
source_sha256: '19e6e48db6f0ca075766bfb8293a677af35fab6c3762c3a2be7495c1dd7df8a9'
generated: true
---

# `hooks.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\hooks\fix-broken-links\hooks.json`
> SHA-256: `19e6e48db6f0ca075766bfb8293a677af35fab6c3762c3a2be7495c1dd7df8a9`

```json
{
  "version": 1,
  "hooks": {
    "postToolUse": [
      {
        "type": "command",
        "bash": ".github/hooks/fix-broken-links/link-fix.sh",
        "powershell": ".github/hooks/fix-broken-links/link-fix.ps1",
        "cwd": ".",
        "timeoutSec": 120
      }
    ]
  }
}

```