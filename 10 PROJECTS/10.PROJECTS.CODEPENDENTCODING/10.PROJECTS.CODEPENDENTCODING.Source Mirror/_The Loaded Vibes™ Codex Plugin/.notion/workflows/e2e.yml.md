---
title: 'The Loaded Vibes™ Codex Plugin\.notion\workflows\e2e.yml'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\workflows\e2e.yml'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.workflows.e2e.yml'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\workflows\e2e.yml'
source_file: 'e2e.yml'
source_sha256: '3a4217944a76dc5202ad4ed56cfffe2ae5977bb92d68bd9ae2f9671044289b07'
generated: true
---

# `e2e.yml`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\workflows\e2e.yml`
> SHA-256: `3a4217944a76dc5202ad4ed56cfffe2ae5977bb92d68bd9ae2f9671044289b07`

```yaml
name: E2E - Playwright
on:
  pull_request:
jobs:
  playwright-e2e:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Setup Node
        uses: actions/setup-node@v4
        with:
          node-version: 20
      - name: Install
        run: pnpm install --frozen-lockfile
      - name: Run Playwright E2E
        run: npx playwright test --project=chromium

```