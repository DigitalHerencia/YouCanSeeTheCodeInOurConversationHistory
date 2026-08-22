---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\session-logger\log-prompt.sh'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\session-logger\log-prompt.sh'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.hooks.session-logger.log-prompt.sh'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\session-logger\log-prompt.sh'
source_file: 'log-prompt.sh'
source_sha256: '4c8228c7441ed64b11e4f2ec1fbc1c1c2512966749e847511610fc6c92fae18b'
generated: true
---

# `log-prompt.sh`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\hooks\session-logger\log-prompt.sh`
> SHA-256: `4c8228c7441ed64b11e4f2ec1fbc1c1c2512966749e847511610fc6c92fae18b`

```bash
#!/bin/bash

# Log user prompt submission

set -euo pipefail

# Skip if logging disabled
if [[ "${SKIP_LOGGING:-}" == "true" ]]; then
  exit 0
fi

# Read input from Copilot (contains prompt info)
INPUT=$(cat)

# Create logs directory if it doesn't exist
mkdir -p logs/copilot

# Extract timestamp
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Log prompt (you can parse INPUT for more details)
echo "{\"timestamp\":\"$TIMESTAMP\",\"event\":\"userPromptSubmitted\",\"level\":\"${LOG_LEVEL:-INFO}\"}" >> logs/copilot/prompts.log

exit 0

```