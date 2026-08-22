---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\rug-agentic-workflow\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\rug-agentic-workflow\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.rug-agentic-workflow.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\rug-agentic-workflow\plugin.json'
source_file: 'plugin.json'
source_sha256: '4bff1b16460fd028a87b051aa33b49bcc15e506da15fa9cc141fe253fb97fa5d'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\rug-agentic-workflow\plugin.json`
> SHA-256: `4bff1b16460fd028a87b051aa33b49bcc15e506da15fa9cc141fe253fb97fa5d`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "rug-agentic-workflow",
  "description": "Three-agent workflow for orchestrated software delivery with an orchestrator plus implementation and QA subagents.",
  "version": "1.0.0",
  "author": {
    "name": "Awesome Copilot Community"
  },
  "repository": "https://github.com/github/awesome-copilot",
  "license": "MIT",
  "keywords": [
    "agentic-workflow",
    "orchestration",
    "subagents",
    "software-engineering",
    "qa"
  ],
  "extensions": {
    "com.github.awesome-copilot": {
      "agents": [
        "./agents/qa-subagent.md",
        "./agents/rug-orchestrator.md",
        "./agents/swe-subagent.md"
      ]
    }
  }
}

```