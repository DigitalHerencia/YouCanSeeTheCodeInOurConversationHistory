---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\session-auto-commit\auto-commit.sh'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\session-auto-commit\auto-commit.sh'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.hooks.session-auto-commit.auto-commit.sh'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\hooks\session-auto-commit\auto-commit.sh'
source_file: 'auto-commit.sh'
source_sha256: '1b7c653ac3a0812161c0b856b3ef6562971a692d2b54930e507e1a315f4fecbf'
generated: true
---

# `auto-commit.sh`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\hooks\session-auto-commit\auto-commit.sh`
> SHA-256: `1b7c653ac3a0812161c0b856b3ef6562971a692d2b54930e507e1a315f4fecbf`

```bash
#!/bin/bash

# Session Auto-Commit Hook
# Automatically commits and pushes changes when a Copilot session ends

set -euo pipefail

# Check if SKIP_AUTO_COMMIT is set
if [[ "${SKIP_AUTO_COMMIT:-}" == "true" ]]; then
  echo "⏭️  Auto-commit skipped (SKIP_AUTO_COMMIT=true)"
  exit 0
fi

# Check if we're in a git repository
if ! git rev-parse --is-inside-work-tree &>/dev/null; then
  echo "⚠️  Not in a git repository"
  exit 0
fi

# Check for uncommitted changes
if [[ -z "$(git status --porcelain)" ]]; then
  echo "✨ No changes to commit"
  exit 0
fi

echo "📦 Auto-committing changes from Copilot session..."

# Stage all changes
git add -A

# Create timestamped commit
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
git commit -m "auto-commit: $TIMESTAMP" --no-verify 2>/dev/null || {
  echo "⚠️  Commit failed"
  exit 0
}

# Attempt to push
if git push 2>/dev/null; then
  echo "✅ Changes committed and pushed successfully"
else
  echo "⚠️  Push failed - changes committed locally"
fi

exit 0

```