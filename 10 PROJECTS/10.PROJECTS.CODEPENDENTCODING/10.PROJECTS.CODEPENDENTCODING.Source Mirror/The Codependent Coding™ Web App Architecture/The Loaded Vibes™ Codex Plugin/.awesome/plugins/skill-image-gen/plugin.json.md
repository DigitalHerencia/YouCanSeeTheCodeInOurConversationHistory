---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\skill-image-gen\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\skill-image-gen\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.skill-image-gen.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\skill-image-gen\plugin.json'
source_file: 'plugin.json'
source_sha256: 'd39a6ef5e9c2c9e1f6df59f24ee2a3279dec242cfe22cccc1fb09152988ff741'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\skill-image-gen\plugin.json`
> SHA-256: `d39a6ef5e9c2c9e1f6df59f24ee2a3279dec242cfe22cccc1fb09152988ff741`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "skill-image-gen",
  "description": "Generate images using AI directly from your coding workflow. Supports OpenAI (gpt-image-2) and Google Gemini. BYO API key — the skill guides you through setup on first use.",
  "version": "1.0.0",
  "keywords": [
    "image-generation",
    "openai",
    "gemini",
    "ai",
    "art",
    "sprites",
    "textures",
    "icons"
  ],
  "author": {
    "name": "adamd9",
    "url": "https://github.com/adamd9"
  },
  "homepage": "https://github.com/adamd9/skill-image-gen",
  "repository": "https://github.com/github/awesome-copilot",
  "license": "MIT",
  "extensions": {
    "com.github.awesome-copilot": {
      "skills": [
        "./skills/generate-image/"
      ]
    }
  }
}

```