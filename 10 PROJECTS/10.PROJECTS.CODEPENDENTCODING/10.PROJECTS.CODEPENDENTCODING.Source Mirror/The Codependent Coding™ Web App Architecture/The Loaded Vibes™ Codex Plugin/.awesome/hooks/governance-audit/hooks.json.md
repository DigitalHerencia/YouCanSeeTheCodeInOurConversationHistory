---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\governance-audit\hooks.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\governance-audit\hooks.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.hooks.governance-audit.hooks.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\governance-audit\hooks.json'
source_file: 'hooks.json'
source_sha256: '82112334baf98e77b47f2daff6aaf90a8a1cc8f34aebffe945007aaa56b1edb0'
generated: true
---

# `hooks.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\hooks\governance-audit\hooks.json`
> SHA-256: `82112334baf98e77b47f2daff6aaf90a8a1cc8f34aebffe945007aaa56b1edb0`

```json
{
  "version": 1,
  "hooks": {
    "sessionStart": [
      {
        "type": "command",
        "bash": ".github/hooks/governance-audit/audit-session-start.sh",
        "cwd": ".",
        "timeoutSec": 5
      }
    ],
    "sessionEnd": [
      {
        "type": "command",
        "bash": ".github/hooks/governance-audit/audit-session-end.sh",
        "cwd": ".",
        "timeoutSec": 5
      }
    ],
    "userPromptSubmitted": [
      {
        "type": "command",
        "bash": ".github/hooks/governance-audit/audit-prompt.sh",
        "cwd": ".",
        "env": {
          "GOVERNANCE_LEVEL": "standard",
          "BLOCK_ON_THREAT": "false"
        },
        "timeoutSec": 10
      }
    ]
  }
}

```