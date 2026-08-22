---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\session-logger\hooks.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\session-logger\hooks.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.hooks.session-logger.hooks.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\session-logger\hooks.json'
source_file: 'hooks.json'
source_sha256: 'e5a07facc561d18b883c479ab95e3e9c75a299abaed1d048b17847eea05596ff'
generated: true
---

# `hooks.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\hooks\session-logger\hooks.json`
> SHA-256: `e5a07facc561d18b883c479ab95e3e9c75a299abaed1d048b17847eea05596ff`

```json
{
  "version": 1,
  "hooks": {
    "sessionStart": [
      {
        "type": "command",
        "bash": ".github/hooks/session-logger/log-session-start.sh",
        "cwd": ".",
        "timeoutSec": 5
      }
    ],
    "sessionEnd": [
      {
        "type": "command",
        "bash": ".github/hooks/session-logger/log-session-end.sh",
        "cwd": ".",
        "timeoutSec": 5
      }
    ],
    "userPromptSubmitted": [
      {
        "type": "command",
        "bash": ".github/hooks/session-logger/log-prompt.sh",
        "cwd": ".",
        "env": {
          "LOG_LEVEL": "INFO"
        },
        "timeoutSec": 5
      }
    ]
  }
}

```