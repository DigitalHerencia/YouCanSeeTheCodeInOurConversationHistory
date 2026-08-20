---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\where-was-i\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\where-was-i\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.where-was-i.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\where-was-i\plugin.json'
source_file: 'plugin.json'
source_sha256: 'c7581629ca8ca1a82453490ecceda91aa09c50b112c48e8b9b990f50ff184f54'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\where-was-i\plugin.json`
> SHA-256: `c7581629ca8ca1a82453490ecceda91aa09c50b112c48e8b9b990f50ff184f54`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "where-was-i",
  "description": "Reconstruct your dev context (branch, commits, uncommitted work, PR clues) and trigger a resume prompt to continue quickly.",
  "version": "1.0.2",
  "author": {
    "name": "Aaron Powell",
    "url": "https://github.com/aaronpowell"
  },
  "keywords": [
    "branch-state",
    "developer-context",
    "git-history",
    "interrupt-recovery",
    "pull-request-context",
    "resume-work"
  ],
  "extensions": {
    "com.github.copilot": {
      "logo": "assets/preview.png"
    },
    "com.github.awesome-copilot": {
      "extensions": [
        "./extensions/where-was-i"
      ]
    }
  }
}

```