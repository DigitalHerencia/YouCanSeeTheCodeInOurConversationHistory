---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\react18-upgrade\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\react18-upgrade\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.react18-upgrade.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\react18-upgrade\plugin.json'
source_file: 'plugin.json'
source_sha256: '79de2114804e9e2cc587801fa16edc5f234053e57d59a6f7b88d68f2280cf2de'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\react18-upgrade\plugin.json`
> SHA-256: `79de2114804e9e2cc587801fa16edc5f234053e57d59a6f7b88d68f2280cf2de`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "react18-upgrade",
  "description": "Enterprise React 18 migration toolkit with specialized agents and skills for upgrading React 16/17 class-component codebases to React 18.3.1. Includes auditor, dependency surgeon, class component migration specialist, automatic batching fixer, and test guardian.",
  "version": "1.0.0",
  "keywords": [
    "react18",
    "react",
    "migration",
    "upgrade",
    "class-components",
    "lifecycle",
    "batching"
  ],
  "author": {
    "name": "Awesome Copilot Community"
  },
  "repository": "https://github.com/github/awesome-copilot",
  "license": "MIT",
  "extensions": {
    "com.github.awesome-copilot": {
      "agents": [
        "./agents/react18-auditor.md",
        "./agents/react18-batching-fixer.md",
        "./agents/react18-class-surgeon.md",
        "./agents/react18-commander.md",
        "./agents/react18-dep-surgeon.md",
        "./agents/react18-test-guardian.md"
      ],
      "skills": [
        "./skills/react-audit-grep-patterns/",
        "./skills/react18-batching-patterns/",
        "./skills/react18-dep-compatibility/",
        "./skills/react18-enzyme-to-rtl/",
        "./skills/react18-legacy-context/",
        "./skills/react18-lifecycle-patterns/",
        "./skills/react18-string-refs/"
      ]
    }
  }
}

```