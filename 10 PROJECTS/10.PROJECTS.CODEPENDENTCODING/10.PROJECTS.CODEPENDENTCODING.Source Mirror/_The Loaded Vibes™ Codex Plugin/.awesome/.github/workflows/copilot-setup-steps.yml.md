---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\copilot-setup-steps.yml'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\copilot-setup-steps.yml'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.github.workflows.copilot-setup-steps.yml'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\copilot-setup-steps.yml'
source_file: 'copilot-setup-steps.yml'
source_sha256: '08eca48591212b0a0c303ad5e87b00622abbe8724db6e6a9e74f87440256977a'
generated: true
---

# `copilot-setup-steps.yml`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\copilot-setup-steps.yml`
> SHA-256: `08eca48591212b0a0c303ad5e87b00622abbe8724db6e6a9e74f87440256977a`

```yaml
name: "Copilot Setup Steps"

# This workflow configures the environment for GitHub Copilot Agent with gh-aw MCP server
on:
  workflow_dispatch:
  push:
    paths:
      - .github/workflows/copilot-setup-steps.yml

jobs:
  # The job MUST be called 'copilot-setup-steps' to be recognized by GitHub Copilot Agent
  copilot-setup-steps:
    runs-on: ubuntu-latest

    # Set minimal permissions for setup steps
    # Copilot Agent receives its own token with appropriate permissions
    permissions:
      contents: read

    steps:
      - name: Checkout repository
        uses: actions/checkout@de0fac2e4500dabe0009e67214ff5f5447ce83dd # v6.0.2
      - name: Install gh-aw extension
        uses: github/gh-aw-actions/setup-cli@c863074b673419603d146aab585e2986ef08deec # v0.84.3
        with:
          version: v0.84.3

```