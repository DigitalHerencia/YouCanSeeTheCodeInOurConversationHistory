---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\backlog-swipe-triage\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\backlog-swipe-triage\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.backlog-swipe-triage.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\backlog-swipe-triage\plugin.json'
source_file: 'plugin.json'
source_sha256: '01289f3f033647a5c4187a9580781b7a49f0065b64e877eb68ff10a25e8aa530'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\backlog-swipe-triage\plugin.json`
> SHA-256: `01289f3f033647a5c4187a9580781b7a49f0065b64e877eb68ff10a25e8aa530`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "backlog-swipe-triage",
  "description": "Quickly swipe through backlog issues to triage decisions like assign, needs-info, defer, close, or ignore.",
  "version": "1.0.2",
  "author": {
    "name": "James Montemagno",
    "url": "https://github.com/jamesmontemagno"
  },
  "keywords": [
    "agent-assignment",
    "backlog-triage",
    "github-issues",
    "issue-prioritization",
    "swipe-interface",
    "workflow-automation"
  ],
  "extensions": {
    "com.github.copilot": {
      "logo": "assets/preview.png"
    },
    "com.github.awesome-copilot": {
      "extensions": [
        "./extensions/backlog-swipe-triage"
      ]
    }
  }
}

```