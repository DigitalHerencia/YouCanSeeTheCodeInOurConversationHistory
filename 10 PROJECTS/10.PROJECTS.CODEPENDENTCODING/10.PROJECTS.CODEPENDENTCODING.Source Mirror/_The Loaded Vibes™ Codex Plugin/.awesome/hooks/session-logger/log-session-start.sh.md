---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\session-logger\log-session-start.sh'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\session-logger\log-session-start.sh'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.hooks.session-logger.log-session-start.sh'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\session-logger\log-session-start.sh'
source_file: 'log-session-start.sh'
source_sha256: 'f33c3bc7c0e10907765e1afdc9f876380cd89d327a820855a7f65014e4c92da8'
generated: true
---

# `log-session-start.sh`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\hooks\session-logger\log-session-start.sh`
> SHA-256: `f33c3bc7c0e10907765e1afdc9f876380cd89d327a820855a7f65014e4c92da8`

```bash
#!/bin/bash

# Log session start event

set -euo pipefail

# Skip if logging disabled
if [[ "${SKIP_LOGGING:-}" == "true" ]]; then
  exit 0
fi

# Read input from Copilot
INPUT=$(cat)

# Create logs directory if it doesn't exist
mkdir -p logs/copilot

# Extract timestamp and session info
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
CWD=$(pwd)

# Log session start (use jq for proper JSON encoding)
jq -Rn --arg timestamp "$TIMESTAMP" --arg cwd "$CWD" '{"timestamp":$timestamp,"event":"sessionStart","cwd":$cwd}' >> logs/copilot/session.log

echo "📝 Session logged"
exit 0

```