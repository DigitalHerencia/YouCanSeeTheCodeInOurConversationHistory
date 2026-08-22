---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-usage-metrics\get-org-user-metrics.sh'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-usage-metrics\get-org-user-metrics.sh'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.copilot-usage-metrics.get-org-user-metrics.sh'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-usage-metrics\get-org-user-metrics.sh'
source_file: 'get-org-user-metrics.sh'
source_sha256: 'c494e54ac3fe012201e7cf87e9c4f6f19f39d2b51693548bb15db29f96053d84'
generated: true
---

# `get-org-user-metrics.sh`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-usage-metrics\get-org-user-metrics.sh`
> SHA-256: `c494e54ac3fe012201e7cf87e9c4f6f19f39d2b51693548bb15db29f96053d84`

```bash
#!/usr/bin/env bash
# Fetch per-user Copilot usage metrics for an organization
# Usage: get-org-user-metrics.sh <org> [day]
#   org  - GitHub organization name
#   day  - (optional) specific day in YYYY-MM-DD format

set -euo pipefail

ORG="${1:?Usage: get-org-user-metrics.sh <org> [day]}"
DAY="${2:-}"

if [ -n "$DAY" ]; then
  gh api \
    -H "Accept: application/vnd.github+json" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    "/orgs/$ORG/copilot/usage/users/day?day=$DAY"
else
  gh api \
    -H "Accept: application/vnd.github+json" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    "/orgs/$ORG/copilot/usage/users"
fi

```