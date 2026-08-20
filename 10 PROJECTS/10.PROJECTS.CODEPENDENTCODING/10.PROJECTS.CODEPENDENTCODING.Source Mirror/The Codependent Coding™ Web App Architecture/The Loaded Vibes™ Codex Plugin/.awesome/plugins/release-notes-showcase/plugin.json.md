---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\release-notes-showcase\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\release-notes-showcase\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.release-notes-showcase.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\release-notes-showcase\plugin.json'
source_file: 'plugin.json'
source_sha256: '87631387daebd23d8a011b2cd2a1a17e9ea208ac5a4284867eed2407fbe30164'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\release-notes-showcase\plugin.json`
> SHA-256: `87631387daebd23d8a011b2cd2a1a17e9ea208ac5a4284867eed2407fbe30164`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "release-notes-showcase",
  "description": "Compose and refine launch-ready release notes with contributor callouts and export-friendly output.",
  "version": "1.0.2",
  "author": {
    "name": "Kayla Cinnamon",
    "url": "https://github.com/cinnamon-msft"
  },
  "keywords": [
    "changelog",
    "contributor-callouts",
    "email-export",
    "launch-summary",
    "product-updates",
    "release-notes"
  ],
  "extensions": {
    "com.github.copilot": {
      "logo": "assets/preview.png"
    },
    "com.github.awesome-copilot": {
      "extensions": [
        "./extensions/release-notes-showcase"
      ]
    }
  }
}

```