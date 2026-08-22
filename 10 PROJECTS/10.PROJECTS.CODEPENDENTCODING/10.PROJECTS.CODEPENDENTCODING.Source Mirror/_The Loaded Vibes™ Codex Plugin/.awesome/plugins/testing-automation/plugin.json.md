---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\testing-automation\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\testing-automation\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.testing-automation.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\testing-automation\plugin.json'
source_file: 'plugin.json'
source_sha256: '2af2fd44c1813828be90476dc8af24e8fd79e50d03cb7bf444e7dae45cbe3fa3'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\testing-automation\plugin.json`
> SHA-256: `2af2fd44c1813828be90476dc8af24e8fd79e50d03cb7bf444e7dae45cbe3fa3`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "testing-automation",
  "description": "Comprehensive collection for writing tests, test automation, and test-driven development including unit tests, integration tests, and end-to-end testing strategies.",
  "version": "1.0.0",
  "author": {
    "name": "Awesome Copilot Community"
  },
  "repository": "https://github.com/github/awesome-copilot",
  "license": "MIT",
  "keywords": [
    "testing",
    "tdd",
    "automation",
    "unit-tests",
    "integration",
    "playwright",
    "jest",
    "nunit"
  ],
  "extensions": {
    "com.github.awesome-copilot": {
      "agents": [
        "./agents/playwright-tester.md",
        "./agents/tdd-green.md",
        "./agents/tdd-red.md",
        "./agents/tdd-refactor.md"
      ],
      "skills": [
        "./skills/ai-prompt-engineering-safety-review/",
        "./skills/csharp-nunit/",
        "./skills/java-junit/",
        "./skills/playwright-explore-website/",
        "./skills/playwright-generate-test/"
      ]
    }
  }
}

```