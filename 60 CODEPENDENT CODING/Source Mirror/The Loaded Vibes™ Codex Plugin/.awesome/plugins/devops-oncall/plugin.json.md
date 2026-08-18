---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\devops-oncall\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\devops-oncall\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.devops-oncall.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\devops-oncall\plugin.json'
source_file: 'plugin.json'
source_sha256: 'ba5dcfdcf24541e8ba214f098dfc00ee2e02dc0fc653f7f47d1b5dee36f20508'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\devops-oncall\plugin.json`
> SHA-256: `ba5dcfdcf24541e8ba214f098dfc00ee2e02dc0fc653f7f47d1b5dee36f20508`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "devops-oncall",
  "description": "A focused set of prompts, instructions, and a chat mode to help triage incidents and respond quickly with DevOps tools and Azure resources.",
  "version": "1.0.0",
  "author": {
    "name": "Awesome Copilot Community"
  },
  "repository": "https://github.com/github/awesome-copilot",
  "license": "MIT",
  "keywords": [
    "devops",
    "incident-response",
    "oncall",
    "azure"
  ],
  "extensions": {
    "com.github.awesome-copilot": {
      "agents": [
        "./agents/azure-principal-architect.md"
      ],
      "skills": [
        "./skills/azure-resource-health-diagnose/",
        "./skills/multi-stage-dockerfile/"
      ]
    }
  }
}

```