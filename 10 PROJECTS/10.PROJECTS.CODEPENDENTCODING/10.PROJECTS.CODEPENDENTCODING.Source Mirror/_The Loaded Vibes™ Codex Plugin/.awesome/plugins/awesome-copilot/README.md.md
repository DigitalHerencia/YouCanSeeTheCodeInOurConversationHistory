---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\awesome-copilot\README.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\awesome-copilot\README.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.awesome-copilot.readme.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\awesome-copilot\README.md'
source_file: 'README.md'
source_sha256: '22a9446590cc27527618a0f5794658f683e45962b3c88fd41a5aa32324ae7e6c'
generated: true
---

# `README.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\awesome-copilot\README.md`
> SHA-256: `22a9446590cc27527618a0f5794658f683e45962b3c88fd41a5aa32324ae7e6c`

````markdown
# Awesome Copilot Plugin

Meta prompts that help you discover and generate curated GitHub Copilot agents, collections, instructions, prompts, and skills.

## Installation

```bash
# Using Copilot CLI
copilot plugin install awesome-copilot@awesome-copilot
```

## Prerequisites

- [Docker](https://www.docker.com/) must be installed and available on your `PATH`.
- The plugin starts its bundled MCP server by running `docker run ... ghcr.io/microsoft/mcp-dotnet-samples/awesome-copilot:latest`.

## What's Included

### Commands (Slash Commands)

| Command | Description |
|---------|-------------|
| `/awesome-copilot:suggest-awesome-github-copilot-collections` | Suggest relevant GitHub Copilot collections from the awesome-copilot repository based on current repository context and chat history, providing automatic download and installation of collection assets, and identifying outdated collection assets that need updates. |
| `/awesome-copilot:suggest-awesome-github-copilot-instructions` | Suggest relevant GitHub Copilot instruction files from the awesome-copilot repository based on current repository context and chat history, avoiding duplicates with existing instructions in this repository, and identifying outdated instructions that need updates. |
| `/awesome-copilot:suggest-awesome-github-copilot-agents` | Suggest relevant GitHub Copilot Custom Agents files from the awesome-copilot repository based on current repository context and chat history, avoiding duplicates with existing custom agents in this repository, and identifying outdated agents that need updates. |
| `/awesome-copilot:suggest-awesome-github-copilot-skills` | Suggest relevant GitHub Copilot skills from the awesome-copilot repository based on current repository context and chat history, avoiding duplicates with existing skills in this repository, and identifying outdated skills that need updates. |

### Agents

| Agent | Description |
|-------|-------------|
| `meta-agentic-project-scaffold` | Meta agentic project creation assistant to help users create and manage project workflows effectively. |

### MCP server

This plugin includes the `awesome-copilot` MCP server configured in [`./.mcp.json`](./.mcp.json). If Docker is unavailable, MCP startup will fail.

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT

````