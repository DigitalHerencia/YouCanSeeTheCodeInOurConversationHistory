---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\toolsets\validation.toolset.jsonc'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\toolsets\validation.toolset.jsonc'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.toolsets.validation.toolset.jsonc'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\toolsets\validation.toolset.jsonc'
source_file: 'validation.toolset.jsonc'
source_sha256: 'd26cc8b9e00acaf8cf12f49623eb8305d75bbfa192f6b9fc8469e640b4870bb6'
generated: true
---

# `validation.toolset.jsonc`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\toolsets\validation.toolset.jsonc`
> SHA-256: `d26cc8b9e00acaf8cf12f49623eb8305d75bbfa192f6b9fc8469e640b4870bb6`

```jsonc
// Auto-generated toolset for validation DevCycle
{
  "name": "validation.toolset",
  "description": "Confirm business logic and UX integrity",
  "contextFiles": [
    "../instructions/validation.instructions.md",
    "../prompts/validation.prompt.md",
    "docs/PRD.md",
    "docs/TECH_REQUIREMENTS.md"
  ],
  "tools": {
    "mcpServers": [
      "filesystem",
      "git",
      "github",
      "postgres",
      "fetch",
      "memory",
      "sequentialthinking"
    ],
    "extensions": [
      "dbaeumer.vscode-eslint",
      "esbenp.prettier-vscode",
      "bradlc.vscode-tailwindcss",
      "github.copilot",
      "github.copilot-chat",
      "prisma.prisma",
      "ms-playwright.playwright",
      "vitest.explorer"
    ],
    "cli": [
      "pnpm",
      "npx",
      "node",
      "git",
      "powershell"
    ]
  },
  "allowedOperations": [
    "readFiles",
    "runCLI",
    "callMCP",
    "updateReports"
  ],
  "deniedOperations": [
    "deleteRepository",
    "exfiltrateSecrets"
  ],
  "security": {
    "allowFileWrite": false,
    "allowNetwork": true,
    "restrictedPaths": [
      "lv_artifacts/src",
      "node_modules",
      ".git"
    ]
  }
}


```