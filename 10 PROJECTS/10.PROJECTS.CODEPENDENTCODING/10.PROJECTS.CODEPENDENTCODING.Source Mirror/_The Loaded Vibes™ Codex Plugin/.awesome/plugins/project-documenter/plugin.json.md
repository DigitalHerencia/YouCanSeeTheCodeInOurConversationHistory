---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\project-documenter\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\project-documenter\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.project-documenter.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\project-documenter\plugin.json'
source_file: 'plugin.json'
source_sha256: 'f1347d7fe51fad4da85036f1e79243cbacb1af4d14d3e9de12f6bbe0baa30786'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\project-documenter\plugin.json`
> SHA-256: `f1347d7fe51fad4da85036f1e79243cbacb1af4d14d3e9de12f6bbe0baa30786`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "project-documenter",
  "description": "Generate professional project documentation with draw.io architecture diagrams and Word (.docx) output with embedded images. Automatically discovers any project's technology stack and produces Markdown, diagrams, PNG exports, and a formatted Word document.",
  "version": "1.0.0",
  "author": {
    "name": "Awesome Copilot Community"
  },
  "repository": "https://github.com/github/awesome-copilot",
  "license": "MIT",
  "keywords": [
    "documentation",
    "architecture-diagrams",
    "drawio",
    "word-document",
    "docx",
    "png-images",
    "c4-model",
    "project-summary",
    "auto-discovery"
  ],
  "extensions": {
    "com.github.awesome-copilot": {
      "agents": [
        "./agents/project-documenter.md"
      ],
      "skills": [
        "./skills/drawio/",
        "./skills/md-to-docx/"
      ]
    }
  }
}

```