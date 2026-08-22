---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\secrets-scanner\hooks.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\secrets-scanner\hooks.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.hooks.secrets-scanner.hooks.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\secrets-scanner\hooks.json'
source_file: 'hooks.json'
source_sha256: '4fb9c772c4f0f054cfffdf21edef3e5e401408f24a8939c3dc915eb56407d427'
generated: true
---

# `hooks.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\hooks\secrets-scanner\hooks.json`
> SHA-256: `4fb9c772c4f0f054cfffdf21edef3e5e401408f24a8939c3dc915eb56407d427`

```json
{
  "version": 1,
  "hooks": {
    "sessionEnd": [
      {
        "type": "command",
        "bash": ".github/hooks/secrets-scanner/scan-secrets.sh",
        "cwd": ".",
        "env": {
          "SCAN_MODE": "warn",
          "SCAN_SCOPE": "diff"
        },
        "timeoutSec": 30
      }
    ]
  }
}

```