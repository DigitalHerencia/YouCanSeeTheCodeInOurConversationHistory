---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\typescript-mcp-development\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\typescript-mcp-development\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.typescript-mcp-development.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\typescript-mcp-development\plugin.json'
source_file: 'plugin.json'
source_sha256: '9ae1e446580c3cd521f25f33c1686f0787294f591ace6d6ceec37fb11737efe4'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\typescript-mcp-development\plugin.json`
> SHA-256: `9ae1e446580c3cd521f25f33c1686f0787294f591ace6d6ceec37fb11737efe4`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "typescript-mcp-development",
  "description": "Complete toolkit for building Model Context Protocol (MCP) servers in TypeScript/Node.js using the official SDK. Includes instructions for best practices, a prompt for generating servers, and an expert chat mode for guidance.",
  "version": "1.0.0",
  "author": {
    "name": "Awesome Copilot Community"
  },
  "repository": "https://github.com/github/awesome-copilot",
  "license": "MIT",
  "keywords": [
    "typescript",
    "mcp",
    "model-context-protocol",
    "nodejs",
    "server-development"
  ],
  "extensions": {
    "com.github.awesome-copilot": {
      "agents": [
        "./agents/typescript-mcp-expert.md"
      ],
      "skills": [
        "./skills/typescript-mcp-server-generator/"
      ]
    }
  }
}

```