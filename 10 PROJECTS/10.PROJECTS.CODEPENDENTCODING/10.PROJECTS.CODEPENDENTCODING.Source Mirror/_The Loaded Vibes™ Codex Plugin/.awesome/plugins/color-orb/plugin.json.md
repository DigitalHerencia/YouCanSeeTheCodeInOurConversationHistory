---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\color-orb\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\color-orb\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.color-orb.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\color-orb\plugin.json'
source_file: 'plugin.json'
source_sha256: '50efb761130eaa8c3a1f913997ad936ab854caf662d6c85a98424c9232fb5274'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\color-orb\plugin.json`
> SHA-256: `50efb761130eaa8c3a1f913997ad936ab854caf662d6c85a98424c9232fb5274`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "color-orb",
  "description": "A visual orb that users can ask the agent to recolor while showing a live activity log in the canvas.",
  "version": "1.0.2",
  "author": {
    "name": "Aaron Powell",
    "url": "https://github.com/aaronpowell"
  },
  "keywords": [
    "agent-actions",
    "color-picker",
    "interactive-demo",
    "realtime-updates",
    "sse-events",
    "visual-feedback"
  ],
  "extensions": {
    "com.github.copilot": {
      "logo": "assets/preview.png"
    },
    "com.github.awesome-copilot": {
      "extensions": [
        "./extensions/color-orb"
      ]
    }
  }
}

```