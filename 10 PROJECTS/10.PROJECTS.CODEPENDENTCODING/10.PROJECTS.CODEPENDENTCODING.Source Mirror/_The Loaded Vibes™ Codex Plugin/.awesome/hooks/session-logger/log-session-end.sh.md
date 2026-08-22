---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\session-logger\log-session-end.sh'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\session-logger\log-session-end.sh'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.hooks.session-logger.log-session-end.sh'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\session-logger\log-session-end.sh'
source_file: 'log-session-end.sh'
source_sha256: '761bc877555185860a462921d02cf4f58cfa677621731fd2741bb1e3b4b5e28d'
generated: true
---

# `log-session-end.sh`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\hooks\session-logger\log-session-end.sh`
> SHA-256: `761bc877555185860a462921d02cf4f58cfa677621731fd2741bb1e3b4b5e28d`

```bash
#!/bin/bash

# Log session end event

set -euo pipefail

# Skip if logging disabled
if [[ "${SKIP_LOGGING:-}" == "true" ]]; then
  exit 0
fi

# Read input from Copilot
INPUT=$(cat)

# Create logs directory if it doesn't exist
mkdir -p logs/copilot

# Extract timestamp
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Log session end
echo "{\"timestamp\":\"$TIMESTAMP\",\"event\":\"sessionEnd\"}" >> logs/copilot/session.log

echo "📝 Session end logged"
exit 0

```