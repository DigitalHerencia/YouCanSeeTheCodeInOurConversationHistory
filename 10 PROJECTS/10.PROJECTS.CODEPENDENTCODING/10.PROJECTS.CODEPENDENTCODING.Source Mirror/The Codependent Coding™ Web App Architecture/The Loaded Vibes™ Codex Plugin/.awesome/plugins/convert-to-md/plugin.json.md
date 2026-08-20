---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\convert-to-md\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\convert-to-md\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.convert-to-md.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\convert-to-md\plugin.json'
source_file: 'plugin.json'
source_sha256: '5ef43f4a215447204e9a5a6f3d62883276add716ee3bad8a9f0fafab0be6eb7c'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\convert-to-md\plugin.json`
> SHA-256: `5ef43f4a215447204e9a5a6f3d62883276add716ee3bad8a9f0fafab0be6eb7c`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "convert-to-md",
  "description": "A collection of Copilot skills that convert common document formats into Markdown so their contents can be accurately analyzed, summarized, searched, or extracted from. Just tell Copilot what you need — the right skill is invoked automatically and the conversion happens behind the scenes.",
  "version": "1.0.1",
  "keywords": [
    "skills",
    "configuration",
    "copilot",
    "convert-word-to-md",
    "convert-excel-to-md",
    "convert-pdf-to-md"
  ],
  "author": {
    "name": "Willie Yao",
    "url": "https://github.com/1YaoWei0"
  },
  "repository": "https://github.com/github/awesome-copilot",
  "license": "MIT",
  "extensions": {
    "com.github.awesome-copilot": {
      "skills": [
        "./skills/convert-excel-to-md/",
        "./skills/convert-pdf-to-md/",
        "./skills/convert-word-to-md/"
      ]
    }
  }
}

```