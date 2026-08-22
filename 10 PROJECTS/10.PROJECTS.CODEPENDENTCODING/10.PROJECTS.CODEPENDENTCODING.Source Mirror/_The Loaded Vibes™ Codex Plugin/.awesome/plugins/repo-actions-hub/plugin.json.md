---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\repo-actions-hub\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\repo-actions-hub\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.repo-actions-hub.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\repo-actions-hub\plugin.json'
source_file: 'plugin.json'
source_sha256: '3eb1d80ee261759a8afa3d48553777797ba075c822d5d5999d2cb9937e6e0ad6'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\repo-actions-hub\plugin.json`
> SHA-256: `3eb1d80ee261759a8afa3d48553777797ba075c822d5d5999d2cb9937e6e0ad6`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "repo-actions-hub",
  "description": "Browse repository GitHub Actions workflows, inspect recent runs, and trigger manual workflow_dispatch runs from a Copilot canvas.",
  "version": "1.0.2",
  "author": {
    "name": "James Montemagno",
    "url": "https://github.com/jamesmontemagno"
  },
  "keywords": [
    "actions",
    "canvas",
    "copilot-extension",
    "github-actions",
    "recent-runs",
    "workflow-dispatch"
  ],
  "extensions": {
    "com.github.copilot": {
      "logo": "assets/preview.png"
    },
    "com.github.awesome-copilot": {
      "extensions": [
        "./extensions/repo-actions-hub"
      ]
    }
  }
}

```