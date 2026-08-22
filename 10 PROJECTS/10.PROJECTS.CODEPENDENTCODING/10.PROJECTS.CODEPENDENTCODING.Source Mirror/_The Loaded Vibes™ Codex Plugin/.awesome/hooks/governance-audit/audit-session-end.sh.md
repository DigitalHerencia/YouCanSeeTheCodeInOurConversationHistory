---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\governance-audit\audit-session-end.sh'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\governance-audit\audit-session-end.sh'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.hooks.governance-audit.audit-session-end.sh'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\governance-audit\audit-session-end.sh'
source_file: 'audit-session-end.sh'
source_sha256: '693d9c302b59755ee7044ab653ed93d15927ee07868b11b8daba9cfd108819a5'
generated: true
---

# `audit-session-end.sh`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\hooks\governance-audit\audit-session-end.sh`
> SHA-256: `693d9c302b59755ee7044ab653ed93d15927ee07868b11b8daba9cfd108819a5`

```bash
#!/bin/bash

# Governance Audit: Log session end with summary statistics

set -euo pipefail

if [[ "${SKIP_GOVERNANCE_AUDIT:-}" == "true" ]]; then
  exit 0
fi

INPUT=$(cat)

mkdir -p logs/copilot/governance

TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
LOG_FILE="logs/copilot/governance/audit.log"

# Count events from this session (filter by session start timestamp)
TOTAL=0
THREATS=0
SESSION_START=""
if [[ -f "$LOG_FILE" ]]; then
  # Find the last session_start event to scope stats to current session
  SESSION_START=$(grep '"session_start"' "$LOG_FILE" 2>/dev/null | tail -1 | jq -r '.timestamp' 2>/dev/null || echo "")
  if [[ -n "$SESSION_START" ]]; then
    # Count events after session start
    TOTAL=$(awk -v start="$SESSION_START" -F'"timestamp":"' '{split($2,a,"\""); if(a[1]>=start) count++} END{print count+0}' "$LOG_FILE" 2>/dev/null || echo 0)
    THREATS=$(awk -v start="$SESSION_START" -F'"timestamp":"' '{split($2,a,"\""); if(a[1]>=start && /threat_detected/) count++} END{print count+0}' "$LOG_FILE" 2>/dev/null || echo 0)
  else
    TOTAL=$(wc -l < "$LOG_FILE" 2>/dev/null || echo 0)
    THREATS=$(grep -c '"threat_detected"' "$LOG_FILE" 2>/dev/null || echo 0)
  fi
fi

jq -Rn \
  --arg timestamp "$TIMESTAMP" \
  --argjson total "$TOTAL" \
  --argjson threats "$THREATS" \
  '{"timestamp":$timestamp,"event":"session_end","total_events":$total,"threats_detected":$threats}' \
  >> "$LOG_FILE"

if [[ "$THREATS" -gt 0 ]]; then
  echo "⚠️ Session ended: $THREATS threat(s) detected in $TOTAL events"
else
  echo "✅ Session ended: $TOTAL events, no threats"
fi

exit 0

```