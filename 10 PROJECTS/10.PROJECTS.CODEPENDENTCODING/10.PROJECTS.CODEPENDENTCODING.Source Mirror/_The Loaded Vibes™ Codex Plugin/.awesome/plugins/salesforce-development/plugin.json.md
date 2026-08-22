---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\salesforce-development\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\salesforce-development\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.salesforce-development.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\salesforce-development\plugin.json'
source_file: 'plugin.json'
source_sha256: '5051f64f831a26b75e35e86dc1312d0f5df5d2801a122f3348cdeeb768148687'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\salesforce-development\plugin.json`
> SHA-256: `5051f64f831a26b75e35e86dc1312d0f5df5d2801a122f3348cdeeb768148687`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "salesforce-development",
  "description": "Complete Salesforce agentic development environment covering Apex & Triggers, Flow automation, Lightning Web Components, Aura components, and Visualforce pages.",
  "version": "1.1.0",
  "author": {
    "name": "TemitayoAfolabi"
  },
  "repository": "https://github.com/github/awesome-copilot",
  "license": "MIT",
  "keywords": [
    "salesforce",
    "apex",
    "triggers",
    "lwc",
    "aura",
    "flow",
    "visualforce",
    "crm",
    "salesforce-dx"
  ],
  "extensions": {
    "com.github.awesome-copilot": {
      "agents": [
        "./agents/salesforce-apex-triggers.md",
        "./agents/salesforce-aura-lwc.md",
        "./agents/salesforce-flow.md",
        "./agents/salesforce-visualforce.md"
      ],
      "skills": [
        "./skills/salesforce-apex-quality/",
        "./skills/salesforce-component-standards/",
        "./skills/salesforce-flow-design/"
      ]
    }
  }
}

```