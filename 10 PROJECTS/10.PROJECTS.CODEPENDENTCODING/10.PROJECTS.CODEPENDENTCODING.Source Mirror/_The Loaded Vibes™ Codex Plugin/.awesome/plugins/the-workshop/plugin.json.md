---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\the-workshop\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\the-workshop\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.the-workshop.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\the-workshop\plugin.json'
source_file: 'plugin.json'
source_sha256: '921ef4ac4dccbc6ed76e10c37dcff02f91d80c6904a88d066e8f25e3bddf3767'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\the-workshop\plugin.json`
> SHA-256: `921ef4ac4dccbc6ed76e10c37dcff02f91d80c6904a88d066e8f25e3bddf3767`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "the-workshop",
  "description": "Stop being the switchboard between your AI agents — direct a team. The Workshop puts long-running AI agents (desks) in the same room, on the same work, each with its own memory and history, sharing one workspace so you direct the work instead of relaying it.",
  "version": "0.1.0",
  "author": {
    "name": "jennyf19"
  },
  "repository": "https://github.com/jennyf19/the-workshop",
  "license": "MIT",
  "keywords": [
    "multi-agent",
    "coordination",
    "desks",
    "persistent-memory",
    "agent-signals",
    "developer-experience"
  ],
  "extensions": {
    "com.github.awesome-copilot": {
      "agents": [
        "./agents/workshop-ta.md"
      ],
      "skills": [
        "./skills/bench-read/",
        "./skills/desk-journal/",
        "./skills/desk-open/",
        "./skills/signal-write/",
        "./skills/workshop-create/"
      ],
      "extensions": [
        "./extensions/signals-dashboard"
      ]
    }
  }
}

```