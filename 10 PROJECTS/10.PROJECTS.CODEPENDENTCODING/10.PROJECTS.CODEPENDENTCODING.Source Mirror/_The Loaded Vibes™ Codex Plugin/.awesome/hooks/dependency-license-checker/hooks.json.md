---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\dependency-license-checker\hooks.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\dependency-license-checker\hooks.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.hooks.dependency-license-checker.hooks.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\dependency-license-checker\hooks.json'
source_file: 'hooks.json'
source_sha256: '4f33bd1674f57d1c598dec063f609519ea65821385fa8c6d1531245bb7844944'
generated: true
---

# `hooks.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\hooks\dependency-license-checker\hooks.json`
> SHA-256: `4f33bd1674f57d1c598dec063f609519ea65821385fa8c6d1531245bb7844944`

```json
{
  "version": 1,
  "hooks": {
    "sessionEnd": [
      {
        "type": "command",
        "bash": ".github/hooks/dependency-license-checker/check-licenses.sh",
        "cwd": ".",
        "env": {
          "LICENSE_MODE": "warn"
        },
        "timeoutSec": 60
      }
    ]
  }
}

```