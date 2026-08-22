---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\build-website.yml'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\build-website.yml'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.github.workflows.build-website.yml'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\build-website.yml'
source_file: 'build-website.yml'
source_sha256: '643f96d1c4f8c393117280caf46156a621058bf357dfe00d3a92c973a54fdc41'
generated: true
---

# `build-website.yml`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\build-website.yml`
> SHA-256: `643f96d1c4f8c393117280caf46156a621058bf357dfe00d3a92c973a54fdc41`

```yaml
name: Build Website

on:
  pull_request:
    branches: [main]
    paths:
      - "website/**"
      - "agents/**"
      - "skills/**"
      - "plugins/**"
      - "instructions/**"
      - "hooks/**"
      - "workflows/**"
      - "extensions/**"
      - "cookbook/**"
      - "eng/**"
      - ".all-contributorsrc"
      - "package.json"
      - "package-lock.json"

permissions:
  contents: read

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@34e114876b0b11c390a56381ad16ebd13914f8d5 # v4.3.1
        with:
          fetch-depth: 0 # Full history needed for git-based last updated dates

      - name: Setup Node.js
        uses: actions/setup-node@49933ea5288caeca8642d1e84afbd3f7d6820020 # v4.4.0
        with:
          node-version: "22"
          cache: "npm"

      - name: Install root dependencies
        run: npm ci

      - name: Install website dependencies
        run: npm ci
        working-directory: ./website

      - name: Build Astro site
        run: npm run website:build

```