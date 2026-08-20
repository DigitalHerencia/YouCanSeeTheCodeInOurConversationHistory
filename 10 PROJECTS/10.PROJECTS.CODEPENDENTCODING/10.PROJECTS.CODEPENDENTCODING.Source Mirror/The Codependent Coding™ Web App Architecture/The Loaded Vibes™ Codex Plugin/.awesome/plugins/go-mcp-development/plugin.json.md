---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\go-mcp-development\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\go-mcp-development\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.go-mcp-development.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\go-mcp-development\plugin.json'
source_file: 'plugin.json'
source_sha256: '205d14729e793e540d4d18a16a43817b03aefbfea04a45995d2bad9351bd6276'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\go-mcp-development\plugin.json`
> SHA-256: `205d14729e793e540d4d18a16a43817b03aefbfea04a45995d2bad9351bd6276`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "go-mcp-development",
  "description": "Complete toolkit for building Model Context Protocol (MCP) servers in Go using the official github.com/modelcontextprotocol/go-sdk. Includes instructions for best practices, a prompt for generating servers, and an expert chat mode for guidance.",
  "version": "1.0.0",
  "author": {
    "name": "Awesome Copilot Community"
  },
  "repository": "https://github.com/github/awesome-copilot",
  "license": "MIT",
  "keywords": [
    "go",
    "golang",
    "mcp",
    "model-context-protocol",
    "server-development",
    "sdk"
  ],
  "extensions": {
    "com.github.awesome-copilot": {
      "agents": [
        "./agents/go-mcp-expert.md"
      ],
      "skills": [
        "./skills/go-mcp-server-generator/"
      ]
    }
  }
}

```