---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\awesome-copilot\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\awesome-copilot\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.awesome-copilot.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\awesome-copilot\plugin.json'
source_file: 'plugin.json'
source_sha256: 'e2c2a78f5124b00bcdab174ad06a60f2ae3f9aea25d95a9ca214800cf2d4b791'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\awesome-copilot\plugin.json`
> SHA-256: `e2c2a78f5124b00bcdab174ad06a60f2ae3f9aea25d95a9ca214800cf2d4b791`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "awesome-copilot",
  "description": "Meta prompts that help you discover and generate curated GitHub Copilot agents, instructions, prompts, and skills.",
  "version": "1.1.0",
  "author": {
    "name": "Awesome Copilot Community"
  },
  "repository": "https://github.com/github/awesome-copilot",
  "license": "MIT",
  "keywords": [
    "github-copilot",
    "discovery",
    "meta",
    "prompt-engineering",
    "agents"
  ],
  "extensions": {
    "com.github.awesome-copilot": {
      "agents": [
        "./agents/meta-agentic-project-scaffold.md"
      ],
      "mcpServers": "./.mcp.json",
      "skills": [
        "./skills/suggest-awesome-github-copilot-agents/",
        "./skills/suggest-awesome-github-copilot-instructions/",
        "./skills/suggest-awesome-github-copilot-skills/"
      ]
    }
  }
}

```