---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\react19-upgrade\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\react19-upgrade\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.react19-upgrade.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\react19-upgrade\plugin.json'
source_file: 'plugin.json'
source_sha256: 'f226f9a56094cc04d322873a845e6e33a0ad9650e67f5bca3f357b78f9a65f47'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\react19-upgrade\plugin.json`
> SHA-256: `f226f9a56094cc04d322873a845e6e33a0ad9650e67f5bca3f357b78f9a65f47`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "react19-upgrade",
  "description": "Enterprise React 19 migration toolkit with specialized agents and skills for upgrading React 18 codebases to React 19. Includes auditor, dependency surgeon, source code migrator, and test guardian. Handles removal of deprecated APIs including ReactDOM.render, forwardRef, defaultProps, legacy context, string refs, and more.",
  "version": "1.0.0",
  "keywords": [
    "react19",
    "react",
    "migration",
    "upgrade",
    "hooks",
    "modern-react"
  ],
  "author": {
    "name": "Awesome Copilot Community"
  },
  "repository": "https://github.com/github/awesome-copilot",
  "license": "MIT",
  "extensions": {
    "com.github.awesome-copilot": {
      "agents": [
        "./agents/react19-auditor.md",
        "./agents/react19-commander.md",
        "./agents/react19-dep-surgeon.md",
        "./agents/react19-migrator.md",
        "./agents/react19-test-guardian.md"
      ],
      "skills": [
        "./skills/react19-concurrent-patterns/",
        "./skills/react19-source-patterns/",
        "./skills/react19-test-patterns/"
      ]
    }
  }
}

```