---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\arize-ax\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\arize-ax\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.arize-ax.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\arize-ax\plugin.json'
source_file: 'plugin.json'
source_sha256: 'd129c8e926236fff26debbe9eab7ac5fcfb69b4bfa6a8d452b512d20941a0604'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\arize-ax\plugin.json`
> SHA-256: `d129c8e926236fff26debbe9eab7ac5fcfb69b4bfa6a8d452b512d20941a0604`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "arize-ax",
  "description": "Arize AX platform skills for LLM observability, evaluation, and optimization. Includes trace export, instrumentation, datasets, experiments, evaluators, AI provider integrations, annotations, prompt optimization, and deep linking to the Arize UI.",
  "version": "1.0.0",
  "author": {
    "name": "Arize AI"
  },
  "repository": "https://github.com/github/awesome-copilot",
  "license": "MIT",
  "keywords": [
    "arize",
    "llm",
    "observability",
    "tracing",
    "evaluation",
    "instrumentation",
    "datasets",
    "experiments",
    "prompt-optimization"
  ],
  "extensions": {
    "com.github.awesome-copilot": {
      "skills": [
        "./skills/arize-ai-provider-integration/",
        "./skills/arize-annotation/",
        "./skills/arize-dataset/",
        "./skills/arize-evaluator/",
        "./skills/arize-experiment/",
        "./skills/arize-instrumentation/",
        "./skills/arize-link/",
        "./skills/arize-prompt-optimization/",
        "./skills/arize-trace/"
      ]
    }
  }
}

```