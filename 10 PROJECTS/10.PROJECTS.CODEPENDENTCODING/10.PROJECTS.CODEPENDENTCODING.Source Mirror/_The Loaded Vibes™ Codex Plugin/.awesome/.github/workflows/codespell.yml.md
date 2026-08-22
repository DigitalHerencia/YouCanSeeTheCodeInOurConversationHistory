---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\codespell.yml'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\codespell.yml'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.github.workflows.codespell.yml'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\codespell.yml'
source_file: 'codespell.yml'
source_sha256: '074000b1e1c91d54eaf6930a4614dc766d8d8f77aa530bcf5a3c55df70113700'
generated: true
---

# `codespell.yml`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\codespell.yml`
> SHA-256: `074000b1e1c91d54eaf6930a4614dc766d8d8f77aa530bcf5a3c55df70113700`

```yaml
name: Check Spelling

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

permissions:
  contents: read

jobs:
  codespell:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@34e114876b0b11c390a56381ad16ebd13914f8d5 # v4.3.1

      - name: Check spelling with codespell
        uses: codespell-project/actions-codespell@406322ec52dd7b488e48c1c4b82e2a8b3a1bf630 # v2.1
        with:
          check_filenames: true
          check_hidden: false

```