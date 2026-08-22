---
title: 'The Loaded Vibes™ Codex Plugin\.notion\workflows\ci-tests.yml'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\workflows\ci-tests.yml'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.workflows.ci-tests.yml'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\workflows\ci-tests.yml'
source_file: 'ci-tests.yml'
source_sha256: '4ba39b28f7e7d2a49e13e8e01bb8f6b508074b6bb14dccb10c265df8bc86373b'
generated: true
---

# `ci-tests.yml`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\workflows\ci-tests.yml`
> SHA-256: `4ba39b28f7e7d2a49e13e8e01bb8f6b508074b6bb14dccb10c265df8bc86373b`

```yaml
name: CI - Tests
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Setup Node
        uses: actions/setup-node@v4
        with:
          node-version: 20
      - name: Install
        run: pnpm install --frozen-lockfile
      - name: Lint
        run: pnpm run lint
      - name: Unit tests
        run: pnpm run test

```