---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\doublecheck\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\doublecheck\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.doublecheck.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\doublecheck\plugin.json'
source_file: 'plugin.json'
source_sha256: '93c486a39ea99783f626ce4d92f3abfec39c173679f4162742b074cdc246b030'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\doublecheck\plugin.json`
> SHA-256: `93c486a39ea99783f626ce4d92f3abfec39c173679f4162742b074cdc246b030`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "doublecheck",
  "description": "Three-layer verification pipeline for AI output. Extracts claims, finds sources, and flags hallucination risks so humans can verify before acting.",
  "version": "1.0.0",
  "author": {
    "name": "Awesome Copilot Community"
  },
  "repository": "https://github.com/github/awesome-copilot",
  "license": "MIT",
  "keywords": [
    "verification",
    "hallucination",
    "fact-check",
    "source-citation",
    "trust",
    "safety"
  ],
  "extensions": {
    "com.github.awesome-copilot": {
      "agents": [
        "./agents/doublecheck.md"
      ],
      "skills": [
        "./skills/doublecheck/"
      ]
    }
  }
}

```