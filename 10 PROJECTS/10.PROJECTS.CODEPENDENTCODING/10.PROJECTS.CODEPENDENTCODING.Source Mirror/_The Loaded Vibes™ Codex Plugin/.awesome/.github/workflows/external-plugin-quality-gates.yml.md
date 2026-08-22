---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\external-plugin-quality-gates.yml'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\external-plugin-quality-gates.yml'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.github.workflows.external-plugin-quality-gates.yml'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\external-plugin-quality-gates.yml'
source_file: 'external-plugin-quality-gates.yml'
source_sha256: '0f8ae396f6254f3698b162dbdc7d7833b562c3a8aa77cbf5a8ecd75f2ae5702b'
generated: true
---

# `external-plugin-quality-gates.yml`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\external-plugin-quality-gates.yml`
> SHA-256: `0f8ae396f6254f3698b162dbdc7d7833b562c3a8aa77cbf5a8ecd75f2ae5702b`

```yaml
name: External Plugin Quality Gates

on:
  workflow_call:
    inputs:
      plugin-json:
        description: Canonical plugin payload JSON from intake parsing
        required: true
        type: string
    outputs:
      quality-result:
        description: JSON result for quality checks
        value: ${{ jobs.quality.outputs.quality-result }}

permissions:
  contents: read

jobs:
  quality:
    runs-on: ubuntu-latest
    outputs:
      quality-result: ${{ steps.quality.outputs.quality-result }}
    steps:
      - name: Checkout main branch
        uses: actions/checkout@34e114876b0b11c390a56381ad16ebd13914f8d5 # v4.3.1
        with:
          ref: main
          persist-credentials: false
          submodules: false

      - name: Setup Node.js
        uses: actions/setup-node@49933ea5288caeca8642d1e84afbd3f7d6820020 # v4.4.0
        with:
          node-version: 22

      - name: Install GitHub Copilot CLI
        run: npm install -g @github/copilot

      - name: Install node packages
        run: npm ci

      - name: Run external plugin quality gates
        id: quality
        env:
          PLUGIN_JSON: ${{ inputs.plugin-json }}
        run: |
          result=$(node ./eng/external-plugin-quality-gates.mjs --plugin-json "$PLUGIN_JSON")
          {
            echo 'quality-result<<EOF'
            echo "$result"
            echo 'EOF'
          } >> "$GITHUB_OUTPUT"

```