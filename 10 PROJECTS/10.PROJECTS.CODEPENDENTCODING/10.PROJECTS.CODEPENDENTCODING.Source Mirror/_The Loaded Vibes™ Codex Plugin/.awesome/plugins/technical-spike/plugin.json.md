---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\technical-spike\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\technical-spike\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.technical-spike.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\technical-spike\plugin.json'
source_file: 'plugin.json'
source_sha256: 'f947d8f76473186edda959f8bcf37102c23c4d02674955431566dbdecc3c62db'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\technical-spike\plugin.json`
> SHA-256: `f947d8f76473186edda959f8bcf37102c23c4d02674955431566dbdecc3c62db`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "technical-spike",
  "description": "Tools for creation, management and research of technical spikes to reduce unknowns and assumptions before proceeding to specification and implementation of solutions.",
  "version": "1.0.0",
  "author": {
    "name": "Awesome Copilot Community"
  },
  "repository": "https://github.com/github/awesome-copilot",
  "license": "MIT",
  "keywords": [
    "technical-spike",
    "assumption-testing",
    "validation",
    "research"
  ],
  "extensions": {
    "com.github.awesome-copilot": {
      "agents": [
        "./agents/research-technical-spike.md"
      ],
      "skills": [
        "./skills/create-technical-spike/"
      ]
    }
  }
}

```