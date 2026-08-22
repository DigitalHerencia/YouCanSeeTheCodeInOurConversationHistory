---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\work-hub\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\work-hub\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.work-hub.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\work-hub\plugin.json'
source_file: 'plugin.json'
source_sha256: '909dbb04a404887d0a6334fa52a53737fe97ef5647072bff20ac189b9558d039'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\work-hub\plugin.json`
> SHA-256: `909dbb04a404887d0a6334fa52a53737fe97ef5647072bff20ac189b9558d039`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "work-hub",
  "description": "Generic cross-repo command center canvas for GitHub Copilot with onboarding, focus planning, repo health, work signals, and session cleanup.",
  "version": "1.0.2",
  "author": {
    "name": "James Montemagno",
    "url": "https://github.com/jamesmontemagno"
  },
  "keywords": [
    "cross-repo-dashboard",
    "focus-planning",
    "repo-health",
    "session-cleanup",
    "work-triage",
    "workflow-visibility"
  ],
  "extensions": {
    "com.github.copilot": {
      "logo": "assets/preview.png"
    },
    "com.github.awesome-copilot": {
      "extensions": [
        "./extensions/work-hub"
      ]
    }
  }
}

```