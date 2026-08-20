---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\flowstudio-power-automate\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\flowstudio-power-automate\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.flowstudio-power-automate.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\flowstudio-power-automate\plugin.json'
source_file: 'plugin.json'
source_sha256: '5028c0d1c1f9b0ea4ea6faa0ebfedcd3c18f4afd4ee339fd41253abd2bf56272'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\flowstudio-power-automate\plugin.json`
> SHA-256: `5028c0d1c1f9b0ea4ea6faa0ebfedcd3c18f4afd4ee339fd41253abd2bf56272`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "flowstudio-power-automate",
  "description": "Give your AI agent full visibility into Power Automate cloud flows via the FlowStudio MCP server. Connect, debug, build, monitor health, and govern flows at scale — action-level inputs and outputs, not just status codes.",
  "version": "2.0.0",
  "author": {
    "name": "Awesome Copilot Community"
  },
  "repository": "https://github.com/github/awesome-copilot",
  "license": "MIT",
  "keywords": [
    "power-automate",
    "power-platform",
    "flowstudio",
    "mcp",
    "model-context-protocol",
    "cloud-flows",
    "workflow-automation",
    "monitoring",
    "governance"
  ],
  "extensions": {
    "com.github.awesome-copilot": {
      "skills": [
        "./skills/flowstudio-power-automate-build/",
        "./skills/flowstudio-power-automate-debug/",
        "./skills/flowstudio-power-automate-governance/",
        "./skills/flowstudio-power-automate-mcp/",
        "./skills/flowstudio-power-automate-monitoring/"
      ]
    }
  }
}

```