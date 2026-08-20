---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\toolsets\debug.toolset.jsonc'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\toolsets\debug.toolset.jsonc'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.toolsets.debug.toolset.jsonc'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\toolsets\debug.toolset.jsonc'
source_file: 'debug.toolset.jsonc'
source_sha256: 'ea323fe834b5a377698e69b66fda72d5454bdc96a7d340848821353c5051baa3'
generated: true
---

# `debug.toolset.jsonc`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\toolsets\debug.toolset.jsonc`
> SHA-256: `ea323fe834b5a377698e69b66fda72d5454bdc96a7d340848821353c5051baa3`

```jsonc
// Auto-generated toolset for debug DevCycle
{
  "name": "debug.toolset",
  "description": "Diagnose and fix defects",
  "contextFiles": [
    "../instructions/debug.instructions.md",
    "../prompts/debug.prompt.md",
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
    "updateRepo"
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