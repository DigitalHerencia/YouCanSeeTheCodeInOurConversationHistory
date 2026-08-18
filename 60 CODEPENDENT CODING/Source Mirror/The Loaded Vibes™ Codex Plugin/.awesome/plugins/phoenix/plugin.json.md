---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\phoenix\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\phoenix\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.phoenix.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\phoenix\plugin.json'
source_file: 'plugin.json'
source_sha256: 'cc753891e46d8542f7c1fbc0d9c04ecf7f0bfcac36e2cf69fe7bd2a53eac4c4d'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\phoenix\plugin.json`
> SHA-256: `cc753891e46d8542f7c1fbc0d9c04ecf7f0bfcac36e2cf69fe7bd2a53eac4c4d`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "phoenix",
  "description": "Phoenix AI observability skills for LLM application debugging, evaluation, and tracing. Includes CLI debugging tools, LLM evaluation workflows, and OpenInference tracing instrumentation.",
  "version": "1.0.0",
  "author": {
    "name": "Arize AI"
  },
  "repository": "https://github.com/github/awesome-copilot",
  "license": "MIT",
  "keywords": [
    "phoenix",
    "arize",
    "llm",
    "observability",
    "tracing",
    "evaluation",
    "openinference",
    "instrumentation"
  ],
  "extensions": {
    "com.github.awesome-copilot": {
      "skills": [
        "./skills/phoenix-cli/",
        "./skills/phoenix-evals/",
        "./skills/phoenix-tracing/"
      ]
    }
  }
}

```