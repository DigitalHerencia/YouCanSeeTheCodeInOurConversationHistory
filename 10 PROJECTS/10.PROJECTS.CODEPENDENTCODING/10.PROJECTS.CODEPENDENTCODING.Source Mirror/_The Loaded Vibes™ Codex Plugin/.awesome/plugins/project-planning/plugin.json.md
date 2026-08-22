---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\project-planning\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\project-planning\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.project-planning.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\project-planning\plugin.json'
source_file: 'plugin.json'
source_sha256: 'bd3b651f8226e4eeac80e5e4701df9f70fcb9bf1d50c5d177ba1dddb94717226'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\project-planning\plugin.json`
> SHA-256: `bd3b651f8226e4eeac80e5e4701df9f70fcb9bf1d50c5d177ba1dddb94717226`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "project-planning",
  "description": "Tools and guidance for software project planning, feature breakdown, epic management, implementation planning, and task organization for development teams.",
  "version": "1.0.0",
  "author": {
    "name": "Awesome Copilot Community"
  },
  "repository": "https://github.com/github/awesome-copilot",
  "license": "MIT",
  "keywords": [
    "planning",
    "project-management",
    "epic",
    "feature",
    "implementation",
    "task",
    "architecture",
    "technical-spike"
  ],
  "extensions": {
    "com.github.awesome-copilot": {
      "agents": [
        "./agents/implementation-plan.md",
        "./agents/plan.md",
        "./agents/planner.md",
        "./agents/prd.md",
        "./agents/research-technical-spike.md",
        "./agents/task-planner.md",
        "./agents/task-researcher.md"
      ],
      "skills": [
        "./skills/breakdown-epic-arch/",
        "./skills/breakdown-epic-pm/",
        "./skills/breakdown-feature-implementation/",
        "./skills/breakdown-feature-prd/",
        "./skills/create-github-issues-feature-from-implementation-plan/",
        "./skills/create-implementation-plan/",
        "./skills/create-technical-spike/",
        "./skills/update-implementation-plan/"
      ]
    }
  }
}

```