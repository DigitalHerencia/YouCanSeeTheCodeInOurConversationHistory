---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\flight-map-canvas\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\flight-map-canvas\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.flight-map-canvas.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\flight-map-canvas\plugin.json'
source_file: 'plugin.json'
source_sha256: '439e4b25ac0d0eae864d5e360e7ae8e4ebf2f980ac8796809dcce5cf036f036d'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\flight-map-canvas\plugin.json`
> SHA-256: `439e4b25ac0d0eae864d5e360e7ae8e4ebf2f980ac8796809dcce5cf036f036d`

```json
{
  "name": "flight-map-canvas",
  "description": "A GitHub Copilot canvas that generates a view where Google Maps can be explored using 3D controls, as if a flight simulator. Agents can send the flight anywhere and report what they are working on.",
  "version": "1.0.0",
  "author": {
    "name": "John Haugabook",
    "url": "https://github.com/jhauga"
  },
  "keywords": [
    "copilot-canvas",
    "flight-simulator",
    "geography",
    "google-maps",
    "interactive-canvas",
    "session-breaks",
    "threejs"
  ],
  "extensions": {
    "com.github.copilot": {
      "logo": "assets/preview.png"
    },
    "com.github.awesome-copilot": {
      "extensions": [
        "./extensions/flight-map-canvas"
      ]
    }
  },
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json"
}

```