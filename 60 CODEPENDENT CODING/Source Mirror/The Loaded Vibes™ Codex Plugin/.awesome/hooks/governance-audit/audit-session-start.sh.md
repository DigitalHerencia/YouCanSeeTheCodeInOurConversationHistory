---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\governance-audit\audit-session-start.sh'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\governance-audit\audit-session-start.sh'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.hooks.governance-audit.audit-session-start.sh'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\governance-audit\audit-session-start.sh'
source_file: 'audit-session-start.sh'
source_sha256: 'bb943018e32f390e6b465e54701a85a888441f51521c50ed43bdd404590f9bb2'
generated: true
---

# `audit-session-start.sh`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\hooks\governance-audit\audit-session-start.sh`
> SHA-256: `bb943018e32f390e6b465e54701a85a888441f51521c50ed43bdd404590f9bb2`

```bash
#!/bin/bash

# Governance Audit: Log session start with governance context

set -euo pipefail

if [[ "${SKIP_GOVERNANCE_AUDIT:-}" == "true" ]]; then
  exit 0
fi

INPUT=$(cat)

mkdir -p logs/copilot/governance

TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
CWD=$(pwd)
LEVEL="${GOVERNANCE_LEVEL:-standard}"

jq -Rn \
  --arg timestamp "$TIMESTAMP" \
  --arg cwd "$CWD" \
  --arg level "$LEVEL" \
  '{"timestamp":$timestamp,"event":"session_start","governance_level":$level,"cwd":$cwd}' \
  >> logs/copilot/governance/audit.log

echo "🛡️ Governance audit active (level: $LEVEL)"
exit 0

```