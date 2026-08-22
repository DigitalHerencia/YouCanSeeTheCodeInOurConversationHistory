---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\context-matic\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\context-matic\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.context-matic.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\context-matic\plugin.json'
source_file: 'plugin.json'
source_sha256: 'c27adddba4fa0c48c42566bfa46eba2e1f01ca260c8e397aa7137103fa9521ed'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\context-matic\plugin.json`
> SHA-256: `c27adddba4fa0c48c42566bfa46eba2e1f01ca260c8e397aa7137103fa9521ed`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "context-matic",
  "description": "Coding agents hallucinate APIs. ContextMatic gives them curated, versioned API and SDK docs. Ask your agent to \"integrate the payments API\" and it guesses — falling back on outdated training data and generic patterns that don't match your actual SDK. ContextMatic solves this by giving the agent deterministic, version-aware, SDK-native context at the exact moment it's needed.",
  "version": "0.1.0",
  "keywords": [
    "api-context",
    "api-integration",
    "mcp",
    "sdk",
    "apimatic",
    "third-party-apis",
    "sdks"
  ],
  "author": {
    "name": "APIMatic",
    "email": "developer@apimatic.io"
  },
  "homepage": "https://www.apimatic.io",
  "repository": "https://github.com/github/awesome-copilot",
  "license": "MIT",
  "extensions": {
    "com.github.awesome-copilot": {
      "skills": [
        "./skills/integrate-context-matic/",
        "./skills/onboard-context-matic/"
      ]
    }
  }
}

```