---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\toolsets\template.toolset.jsonc'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\toolsets\template.toolset.jsonc'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.toolsets.template.toolset.jsonc'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\toolsets\template.toolset.jsonc'
source_file: 'template.toolset.jsonc'
source_sha256: '1fff36c8ec5a777b3c0a8e55abd44712038f13c70ab69c0169556388edc92201'
generated: true
---

# `template.toolset.jsonc`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\toolsets\template.toolset.jsonc`
> SHA-256: `1fff36c8ec5a777b3c0a8e55abd44712038f13c70ab69c0169556388edc92201`

```jsonc
{
  // Template for a toolset definition. Copy this file and customize it per DevCycle.
  "tools": {
    "mcpServers": [
      "filesystem",
      "prisma-postgres",
      "neon",
      "clerk",
      "sequentialthinking",
      "memory",
      "github",
      "docs"
    ],
    "extensions": [
      "@types/node",
      "@tailwindcss/forms"
    ],
    "cli": [
      "node",
      "pnpm",
      "npx"
    ]
  },
  // Allowed operations specify which high‑level actions the agent may perform during this DevCycle
  "allowedOperations": [
    "readFiles",
    "writeFiles",
    "runCLI",
    "callMCP",
    "updateRepo",
    "updateIssues"
  ],
  // Denied operations restrict risky or out‑of‑scope actions
  "deniedOperations": [
    "deleteRepository",
    "exfiltrateSecrets"
  ]
}
```