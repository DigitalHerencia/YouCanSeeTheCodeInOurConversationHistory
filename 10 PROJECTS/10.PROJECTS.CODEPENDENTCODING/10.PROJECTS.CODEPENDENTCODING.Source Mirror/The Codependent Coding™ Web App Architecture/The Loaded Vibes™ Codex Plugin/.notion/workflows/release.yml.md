---
title: 'The Loaded Vibes™ Codex Plugin\.notion\workflows\release.yml'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\workflows\release.yml'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.workflows.release.yml'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\workflows\release.yml'
source_file: 'release.yml'
source_sha256: '2cefa4f4a00508260f12a0eee99ff0d6987c33688ebc8fa1a4a49137d89536c2'
generated: true
---

# `release.yml`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\workflows\release.yml`
> SHA-256: `2cefa4f4a00508260f12a0eee99ff0d6987c33688ebc8fa1a4a49137d89536c2`

```yaml
name: Release
on:
  workflow_call: {}
  release:
    types: [created]
jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Setup Node
        uses: actions/setup-node@v4
        with:
          node-version: 20
      - name: Publish
        run: echo "Release publish stub"

```