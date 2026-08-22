---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\toolsets\scaffolding.toolset.jsonc'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\toolsets\scaffolding.toolset.jsonc'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.toolsets.scaffolding.toolset.jsonc'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\toolsets\scaffolding.toolset.jsonc'
source_file: 'scaffolding.toolset.jsonc'
source_sha256: 'cbe3a8882f29c20feafb44e1110472f1dfe72d5997423cb2a8a40436535ec249'
generated: true
---

# `scaffolding.toolset.jsonc`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\toolsets\scaffolding.toolset.jsonc`
> SHA-256: `cbe3a8882f29c20feafb44e1110472f1dfe72d5997423cb2a8a40436535ec249`

```jsonc
// Auto-generated toolset for scaffolding DevCycle
{
  "name": "scaffolding.toolset",
  "description": "Generate stack-aligned project structure",
  "contextFiles": [
    "../instructions/scaffolding.instructions.md",
    "../prompts/scaffolding.prompt.md",
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