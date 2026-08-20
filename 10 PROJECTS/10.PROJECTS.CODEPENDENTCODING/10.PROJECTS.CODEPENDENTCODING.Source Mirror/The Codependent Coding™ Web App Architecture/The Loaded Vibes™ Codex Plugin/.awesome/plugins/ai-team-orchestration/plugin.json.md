---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\ai-team-orchestration\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\ai-team-orchestration\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.ai-team-orchestration.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\ai-team-orchestration\plugin.json'
source_file: 'plugin.json'
source_sha256: '8b8983ad11d147356aad340ec38e9811420c5d1636aae2b32c701555007f2943'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\ai-team-orchestration\plugin.json`
> SHA-256: `8b8983ad11d147356aad340ec38e9811420c5d1636aae2b32c701555007f2943`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "ai-team-orchestration",
  "description": "Run a lightweight, role-separated AI development team with flexible tools, developer-selected models, proportionate planning, and optional QA.",
  "version": "2.0.0",
  "keywords": [
    "ai-team",
    "multi-agent",
    "sprint-planning",
    "brainstorm",
    "project-management",
    "orchestration",
    "developer-workflow"
  ],
  "author": {
    "name": "Denis Evdokimov"
  },
  "repository": "https://github.com/github/awesome-copilot",
  "license": "MIT",
  "extensions": {
    "com.github.awesome-copilot": {
      "agents": [
        "./agents/ai-team-dev.md",
        "./agents/ai-team-producer.md",
        "./agents/ai-team-qa.md"
      ],
      "skills": [
        "./skills/ai-team-orchestration/"
      ]
    }
  }
}

```