---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\context-engineering\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\context-engineering\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.context-engineering.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\context-engineering\plugin.json'
source_file: 'plugin.json'
source_sha256: '2d7e8389fc15acc069d2ac0226080037b2bfd526f3e7ff99980582b1881500e1'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\context-engineering\plugin.json`
> SHA-256: `2d7e8389fc15acc069d2ac0226080037b2bfd526f3e7ff99980582b1881500e1`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "context-engineering",
  "description": "Tools and techniques for maximizing GitHub Copilot effectiveness through better context management. Includes guidelines for structuring code, an agent for planning multi-file changes, and prompts for context-aware development.",
  "version": "1.0.0",
  "author": {
    "name": "Awesome Copilot Community"
  },
  "repository": "https://github.com/github/awesome-copilot",
  "license": "MIT",
  "keywords": [
    "context",
    "productivity",
    "refactoring",
    "best-practices",
    "architecture"
  ],
  "extensions": {
    "com.github.awesome-copilot": {
      "agents": [
        "./agents/context-architect.md"
      ],
      "skills": [
        "./skills/context-map/",
        "./skills/refactor-plan/",
        "./skills/what-context-needed/"
      ]
    }
  }
}

```