---
title: 'The Loaded Vibes™ Codex Plugin\.notion\skills\playwright-e2e\scripts\playwright\runE2E.sh'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\skills\playwright-e2e\scripts\playwright\runE2E.sh'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.skills.playwright-e2e.scripts.playwright.rune2e.sh'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\skills\playwright-e2e\scripts\playwright\runE2E.sh'
source_file: 'runE2E.sh'
source_sha256: 'b4856549907aba772fc1781551f92136c2ffb34f87727ae702f81b8784d1b534'
generated: true
---

# `runE2E.sh`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\skills\playwright-e2e\scripts\playwright\runE2E.sh`
> SHA-256: `b4856549907aba772fc1781551f92136c2ffb34f87727ae702f81b8784d1b534`

```bash
#!/usr/bin/env bash
# simple wrapper to run playwright tests
PLAYWRIGHT_BROWSER=${1:-chromium}
echo "Running Playwright E2E on $PLAYWRIGHT_BROWSER"
npx playwright test --project=$PLAYWRIGHT_BROWSER

```