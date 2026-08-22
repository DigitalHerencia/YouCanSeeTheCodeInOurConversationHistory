---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\pr-artifact-explorer\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\pr-artifact-explorer\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.pr-artifact-explorer.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\pr-artifact-explorer\plugin.json'
source_file: 'plugin.json'
source_sha256: 'd138cfb077119c6335db168a9b0103d383c582b78951675caa8b3bcf86922040'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\pr-artifact-explorer\plugin.json`
> SHA-256: `d138cfb077119c6335db168a9b0103d383c582b78951675caa8b3bcf86922040`

```json
{
  "name": "pr-artifact-explorer",
  "description": "Navigate pull requests and securely explore GitHub Actions artifacts, including test results, static sites, terminal recordings, and source files.",
  "version": "1.0.0",
  "author": {
    "name": "David Pine",
    "url": "https://github.com/IEvangelist"
  },
  "keywords": [
    "actions-artifacts",
    "artifact-browser",
    "canvas",
    "copilot-extension",
    "github-actions",
    "pull-requests",
    "test-results"
  ],
  "extensions": {
    "com.github.copilot": {
      "logo": "assets/preview.png"
    },
    "com.github.awesome-copilot": {
      "extensions": [
        "./extensions/pr-artifact-explorer"
      ]
    }
  },
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json"
}

```