---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-usage-metrics\get-org-metrics.sh'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-usage-metrics\get-org-metrics.sh'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.copilot-usage-metrics.get-org-metrics.sh'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-usage-metrics\get-org-metrics.sh'
source_file: 'get-org-metrics.sh'
source_sha256: '0451eb2c0ee72eccb95753f87b3c24118bc040f4196fe73883d1cdbadc1a81b4'
generated: true
---

# `get-org-metrics.sh`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-usage-metrics\get-org-metrics.sh`
> SHA-256: `0451eb2c0ee72eccb95753f87b3c24118bc040f4196fe73883d1cdbadc1a81b4`

```bash
#!/usr/bin/env bash
# Fetch aggregated Copilot usage metrics for an organization
# Usage: get-org-metrics.sh <org> [day]
#   org  - GitHub organization name
#   day  - (optional) specific day in YYYY-MM-DD format

set -euo pipefail

ORG="${1:?Usage: get-org-metrics.sh <org> [day]}"
DAY="${2:-}"

if [ -n "$DAY" ]; then
  gh api \
    -H "Accept: application/vnd.github+json" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    "/orgs/$ORG/copilot/usage/day?day=$DAY"
else
  gh api \
    -H "Accept: application/vnd.github+json" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    "/orgs/$ORG/copilot/usage"
fi

```