---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\gesture-review\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\gesture-review\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.gesture-review.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\gesture-review\plugin.json'
source_file: 'plugin.json'
source_sha256: '8b8f5c4c8a57709c128fee6f87a108787bf9863cb84b11e454bf5401f4ab53c3'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\gesture-review\plugin.json`
> SHA-256: `8b8f5c4c8a57709c128fee6f87a108787bf9863cb84b11e454bf5401f4ab53c3`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "gesture-review",
  "description": "Review pull requests with a live camera feed and approve or reject using thumbs-up/thumbs-down gestures.",
  "version": "1.0.2",
  "author": {
    "name": "Aaron Powell",
    "url": "https://github.com/aaronpowell"
  },
  "keywords": [
    "camera-input",
    "gesture-control",
    "github-prs",
    "hands-free",
    "mediapipe",
    "pull-request-review"
  ],
  "extensions": {
    "com.github.copilot": {
      "logo": "assets/preview.png"
    },
    "com.github.awesome-copilot": {
      "extensions": [
        "./extensions/gesture-review"
      ]
    }
  }
}

```