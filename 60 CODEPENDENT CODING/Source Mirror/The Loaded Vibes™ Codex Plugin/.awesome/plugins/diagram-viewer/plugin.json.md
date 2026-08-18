---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\diagram-viewer\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\diagram-viewer\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.diagram-viewer.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\diagram-viewer\plugin.json'
source_file: 'plugin.json'
source_sha256: 'fc42d1c0a0018ee6941df109213d56e72105ec1018abc9627935bc1f55400a7b'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\diagram-viewer\plugin.json`
> SHA-256: `fc42d1c0a0018ee6941df109213d56e72105ec1018abc9627935bc1f55400a7b`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "diagram-viewer",
  "description": "Render diagrams, click nodes to drill down, and view agent-generated explanations directly in the canvas.",
  "version": "1.0.2",
  "author": {
    "name": "Aaron Powell",
    "url": "https://github.com/aaronpowell"
  },
  "keywords": [
    "architecture-mapping",
    "canvas-navigation",
    "exploratory-analysis",
    "interactive-diagrams",
    "node-drilldown",
    "relationship-visualization"
  ],
  "extensions": {
    "com.github.copilot": {
      "logo": "assets/preview.png"
    },
    "com.github.awesome-copilot": {
      "extensions": [
        "./extensions/diagram-viewer"
      ]
    }
  }
}

```