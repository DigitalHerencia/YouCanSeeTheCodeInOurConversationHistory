---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-usage-metrics\get-enterprise-user-metrics.sh'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-usage-metrics\get-enterprise-user-metrics.sh'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.copilot-usage-metrics.get-enterprise-user-metrics.sh'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-usage-metrics\get-enterprise-user-metrics.sh'
source_file: 'get-enterprise-user-metrics.sh'
source_sha256: 'ee0d40cc9cb88d4f0fe2d4d23889bdeb57e49352de2eab56ce3dc1daad60f61b'
generated: true
---

# `get-enterprise-user-metrics.sh`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-usage-metrics\get-enterprise-user-metrics.sh`
> SHA-256: `ee0d40cc9cb88d4f0fe2d4d23889bdeb57e49352de2eab56ce3dc1daad60f61b`

```bash
#!/usr/bin/env bash
# Fetch per-user Copilot usage metrics for an enterprise
# Usage: get-enterprise-user-metrics.sh <enterprise> [day]
#   enterprise - GitHub enterprise slug
#   day        - (optional) specific day in YYYY-MM-DD format

set -euo pipefail

ENTERPRISE="${1:?Usage: get-enterprise-user-metrics.sh <enterprise> [day]}"
DAY="${2:-}"

if [ -n "$DAY" ]; then
  gh api \
    -H "Accept: application/vnd.github+json" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    "/enterprises/$ENTERPRISE/copilot/usage/users/day?day=$DAY"
else
  gh api \
    -H "Accept: application/vnd.github+json" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    "/enterprises/$ENTERPRISE/copilot/usage/users"
fi

```