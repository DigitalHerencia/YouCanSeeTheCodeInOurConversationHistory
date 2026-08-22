---
title: 'The Loaded Vibes™ Codex Plugin\LoadedBackup\bootstrapper_template.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedBackup\bootstrapper_template.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedbackup.bootstrapper-template.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedBackup\bootstrapper_template.md'
source_file: 'bootstrapper_template.md'
source_sha256: '4f29d4af2273cd1a15f2bcb081f202410711fef1435708136b4bdcaab3c97596'
generated: true
---

# `bootstrapper_template.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedBackup\bootstrapper_template.md`
> SHA-256: `4f29d4af2273cd1a15f2bcb081f202410711fef1435708136b4bdcaab3c97596`

````markdown
---

## name: bootstrapper.template applyTo: "\*\*" description: Template for the Bootstrapper (PowerShell + GenAI automation).

# Bootstrapper Template

This file defines the structure and responsibilities of the **Bootstrapper**, which automates detection, creation, and modification of the project profile and configures the GenAI extension environment.

The Bootstrapper is implemented using **PowerShell** and **GenAI Script**, but its behavior is stack-agnostic.

## Purpose

- Detect the current VS Code environment and project state.
- Generate or update the project profile.
- Install or verify required extensions.
- Set up MCP servers.
- Register GenAI Script memory and cross-agent context.
- Prepare the workspace for DevCycle execution.

## Responsibilities

### 1. Detect Existing Profile

The Bootstrapper MUST:

- Check for an existing profile file.
- Validate required fields (settings, extensions, MCP servers, tasks).
- Load and normalize profile content.

### 2. Create or Update Profile

The Bootstrapper MUST generate or update profile information including:

- Workspace settings
- User settings overrides (where allowed)
- Required VS Code extensions
- MCP server definitions
- DevCycle automation tasks

### 3. Configure GenAI Script Extension

Configure the environment to support:

- Cross-agent memory
- Persistent context storage
- Access to instructions, prompts, and agents
- Automatic instruction file discovery

### 4. Detect and Register MCP Servers

Using PowerShell commands and `mcp.json`:

- Detect installed MCP server binaries
- Register missing servers
- Validate server availability

### 5. Generate Workspace Automation Tasks

Tasks SHOULD map to DevCycles, for example:

- `Initialize-Project`
- `Scaffold-Project`
- `Configure-Project`
- `Verify-Project`

These are invoked via VS Code tasks or the command palette.

## Structure (Pseudo PowerShell Example)

```powershell
# Detect existing profile
$profilePath = "./profile.jsonc"
if (Test-Path $profilePath) {
    $profile = Get-Content $profilePath -Raw | ConvertFrom-Json
} else {
    $profile = @{}
}

# Update settings
$profile.settings = @{ "editor.formatOnSave" = $true }

# Register extensions
$profile.extensions = @(
    "github.copilot",
    "modelcontextprotocol.mcp"
)

# Register MCP servers
$profile.mcpServers = @(
    @{ name = "filesystem"; command = "mcp-filesystem"; args = @() }
)

# Write file
$profile | ConvertTo-Json -Depth 10 | Set-Content -Path $profilePath
```

## Structure (GenAI Script Example)

```ts
import { defineBootstrapper } from "genaiscript";

export default defineBootstrapper(async ({ workspace, profile, mcp }) => {
  // Detect and merge profile
  const existing = await workspace.readJsonc("profile.jsonc");

  // Update with required extensions
  existing.extensions = [
    "github.copilot",
    "modelcontextprotocol.mcp",
  ];

  // Register MCP
  existing.mcpServers = mcp.detectDefaultServers();

  await workspace.writeJsonc("profile.jsonc", existing);
});
```

## Notes

- The Bootstrapper is the automation backbone of the framework.
- It guarantees the environment matches the project's expectations.
- It operates before any DevCycle begins.
- It ensures consistent, reproducible development experience.


````