---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\toolsets\code-review.toolset.jsonc'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\toolsets\code-review.toolset.jsonc'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.toolsets.code-review.toolset.jsonc'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\toolsets\code-review.toolset.jsonc'
source_file: 'code-review.toolset.jsonc'
source_sha256: '5d938a7cdd8e547c1cfdd2591a02fbb70975b7f63d259abdf5eee1f07bda0229'
generated: true
---

# `code-review.toolset.jsonc`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\toolsets\code-review.toolset.jsonc`
> SHA-256: `5d938a7cdd8e547c1cfdd2591a02fbb70975b7f63d259abdf5eee1f07bda0229`

```jsonc
// Auto-generated toolset for code-review DevCycle
{
  "name": "code-review.toolset",
  "description": "Perform structured code reviews",
  "contextFiles": [
    "../instructions/code-review.instructions.md",
    "../prompts/code-review.prompt.md",
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
    "callMCP",
    "updateReports",
    "commentDiffs"
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