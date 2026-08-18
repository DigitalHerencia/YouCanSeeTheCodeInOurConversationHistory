---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\toolsets\documentation.toolset.jsonc'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\toolsets\documentation.toolset.jsonc'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.toolsets.documentation.toolset.jsonc'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\toolsets\documentation.toolset.jsonc'
source_file: 'documentation.toolset.jsonc'
source_sha256: '9285da400874031fc9610aac39205135cf56e5290a4b565bffc39b759d46013d'
generated: true
---

# `documentation.toolset.jsonc`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\toolsets\documentation.toolset.jsonc`
> SHA-256: `9285da400874031fc9610aac39205135cf56e5290a4b565bffc39b759d46013d`

```jsonc
// Auto-generated toolset for documentation DevCycle
{
  "name": "documentation.toolset",
  "description": "Update docs and templates",
  "contextFiles": [
    "../instructions/documentation.instructions.md",
    "../prompts/documentation.prompt.md",
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