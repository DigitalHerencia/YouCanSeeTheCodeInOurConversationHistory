---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-usage-metrics\get-enterprise-metrics.sh'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-usage-metrics\get-enterprise-metrics.sh'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.copilot-usage-metrics.get-enterprise-metrics.sh'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-usage-metrics\get-enterprise-metrics.sh'
source_file: 'get-enterprise-metrics.sh'
source_sha256: '7e3a6eb96330b76b60bc397c75335a2481e0456a09f85c41e4df42b23e9bbac8'
generated: true
---

# `get-enterprise-metrics.sh`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-usage-metrics\get-enterprise-metrics.sh`
> SHA-256: `7e3a6eb96330b76b60bc397c75335a2481e0456a09f85c41e4df42b23e9bbac8`

```bash
#!/usr/bin/env bash
# Fetch aggregated Copilot usage metrics for an enterprise
# Usage: get-enterprise-metrics.sh <enterprise> [day]
#   enterprise - GitHub enterprise slug
#   day        - (optional) specific day in YYYY-MM-DD format

set -euo pipefail

ENTERPRISE="${1:?Usage: get-enterprise-metrics.sh <enterprise> [day]}"
DAY="${2:-}"

if [ -n "$DAY" ]; then
  gh api \
    -H "Accept: application/vnd.github+json" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    "/enterprises/$ENTERPRISE/copilot/usage/day?day=$DAY"
else
  gh api \
    -H "Accept: application/vnd.github+json" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    "/enterprises/$ENTERPRISE/copilot/usage"
fi

```