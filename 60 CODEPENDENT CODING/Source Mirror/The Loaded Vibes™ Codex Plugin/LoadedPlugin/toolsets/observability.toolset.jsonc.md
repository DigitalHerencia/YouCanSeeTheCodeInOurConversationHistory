---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\toolsets\observability.toolset.jsonc'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\toolsets\observability.toolset.jsonc'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.toolsets.observability.toolset.jsonc'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\toolsets\observability.toolset.jsonc'
source_file: 'observability.toolset.jsonc'
source_sha256: '2f170d6305d00d90c8803bb8c3572181bfc01d8593d7caa64b0b95d68d07a4f1'
generated: true
---

# `observability.toolset.jsonc`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\toolsets\observability.toolset.jsonc`
> SHA-256: `2f170d6305d00d90c8803bb8c3572181bfc01d8593d7caa64b0b95d68d07a4f1`

```jsonc
// Auto-generated toolset for observability DevCycle
{
  "name": "observability.toolset",
  "description": "Implement telemetry and alerting",
  "contextFiles": [
    "../instructions/observability.instructions.md",
    "../prompts/observability.prompt.md",
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
    "writeFiles",
    "runCLI",
    "callMCP",
    "updateReports"
  ],
  "deniedOperations": [
    "deleteRepository",
    "exfiltrateSecrets"
  ],
  "security": {
    "allowFileWrite": true,
    "allowNetwork": true,
    "restrictedPaths": [
      "lv_artifacts/src",
      "node_modules",
      ".git"
    ]
  }
}


```