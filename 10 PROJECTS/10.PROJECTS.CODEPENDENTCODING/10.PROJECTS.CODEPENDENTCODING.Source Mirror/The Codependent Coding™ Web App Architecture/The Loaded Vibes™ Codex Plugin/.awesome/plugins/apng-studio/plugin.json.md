---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\apng-studio\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\apng-studio\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.apng-studio.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\apng-studio\plugin.json'
source_file: 'plugin.json'
source_sha256: '2774c2523f61eefa8a0fc823dbeb714855774903f810c25765d43fca8dd0ce4e'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\apng-studio\plugin.json`
> SHA-256: `2774c2523f61eefa8a0fc823dbeb714855774903f810c25765d43fca8dd0ce4e`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "apng-studio",
  "description": "Interactive GitHub Copilot app canvas extension for building Animated PNG (APNG) files from frames. Draw or upload frames, tune per-frame timing and compositing, preview live, send the result to your phone by QR, and export an animated .png.",
  "version": "1.0.2",
  "author": {
    "name": "Andrea Griffiths",
    "url": "https://github.com/AndreaGriffiths11"
  },
  "keywords": [
    "animated-png",
    "apng",
    "copilot-canvas",
    "frame-animation",
    "image-export",
    "interactive-canvas"
  ],
  "extensions": {
    "com.github.copilot": {
      "logo": "assets/preview.png"
    },
    "com.github.awesome-copilot": {
      "extensions": [
        "./extensions/apng-studio"
      ]
    }
  }
}

```