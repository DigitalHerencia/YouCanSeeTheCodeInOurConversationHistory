---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\validate-canvas-extensions.yml'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\validate-canvas-extensions.yml'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.github.workflows.validate-canvas-extensions.yml'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\validate-canvas-extensions.yml'
source_file: 'validate-canvas-extensions.yml'
source_sha256: 'f8984f1d755a869bddf439dcbeb2d98a67b1be65c8aa82add93b6edc342fd66f'
generated: true
---

# `validate-canvas-extensions.yml`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\validate-canvas-extensions.yml`
> SHA-256: `f8984f1d755a869bddf439dcbeb2d98a67b1be65c8aa82add93b6edc342fd66f`

```yaml
name: Validate Canvas Extensions

on:
  pull_request:
    branches: [main]
    types: [opened, synchronize, reopened]
    paths:
      - "extensions/**"

permissions:
  contents: read

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@34e114876b0b11c390a56381ad16ebd13914f8d5 # v4.3.1
        with:
          fetch-depth: 0

      - name: Setup Node.js
        uses: actions/setup-node@49933ea5288caeca8642d1e84afbd3f7d6820020 # v4.4.0
        with:
          node-version: "22"
          cache: "npm"

      - name: Install dependencies
        run: npm ci --ignore-scripts

      - name: Validate changed extensions
        run: |
          set -euo pipefail
          npm run plugin:validate
```