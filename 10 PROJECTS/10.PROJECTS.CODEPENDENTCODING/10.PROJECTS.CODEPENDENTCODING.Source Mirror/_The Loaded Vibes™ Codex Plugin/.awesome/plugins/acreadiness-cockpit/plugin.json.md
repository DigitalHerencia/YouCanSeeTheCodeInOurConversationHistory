---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\acreadiness-cockpit\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\acreadiness-cockpit\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.acreadiness-cockpit.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\acreadiness-cockpit\plugin.json'
source_file: 'plugin.json'
source_sha256: '06f53280361c3faf90235e61317dc397687aa40b78c784720bb032212d3c8e50'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\acreadiness-cockpit\plugin.json`
> SHA-256: `06f53280361c3faf90235e61317dc397687aa40b78c784720bb032212d3c8e50`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "acreadiness-cockpit",
  "description": "Drive Microsoft AgentRC from Copilot chat: assess AI readiness, generate Copilot instructions (flat or nested with applyTo globs for monorepos), and manage policies. Produces a self-contained static HTML dashboard at reports/index.html.",
  "version": "1.0.0",
  "keywords": [
    "agentrc",
    "ai-readiness",
    "copilot-instructions",
    "readiness-report",
    "monorepo",
    "policy",
    "dashboard"
  ],
  "author": {
    "name": "mvanderbend-msoft"
  },
  "repository": "https://github.com/github/awesome-copilot",
  "license": "MIT",
  "extensions": {
    "com.github.awesome-copilot": {
      "agents": [
        "./agents/ai-readiness-reporter.md"
      ],
      "skills": [
        "./skills/acreadiness-assess/",
        "./skills/acreadiness-generate-instructions/",
        "./skills/acreadiness-policy/"
      ]
    }
  }
}

```