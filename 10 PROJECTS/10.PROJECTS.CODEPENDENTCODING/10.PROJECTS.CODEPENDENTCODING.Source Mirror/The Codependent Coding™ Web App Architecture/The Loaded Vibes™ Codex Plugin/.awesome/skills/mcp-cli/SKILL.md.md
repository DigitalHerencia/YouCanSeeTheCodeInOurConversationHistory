---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\mcp-cli\SKILL.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\mcp-cli\SKILL.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.mcp-cli.skill.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\mcp-cli\SKILL.md'
source_file: 'SKILL.md'
source_sha256: '54081db970e9333dad51f8458bc623912fab2087ecacccb6298f2c53833d6070'
generated: true
---

# `SKILL.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\mcp-cli\SKILL.md`
> SHA-256: `54081db970e9333dad51f8458bc623912fab2087ecacccb6298f2c53833d6070`

````markdown
---
name: mcp-cli
description: Interface for MCP (Model Context Protocol) servers via CLI. Use when you need to interact with external tools, APIs, or data sources through MCP servers, list available MCP servers/tools, or call MCP tools from command line.
---

# MCP-CLI

Access MCP servers through the command line. MCP enables interaction with external systems like GitHub, filesystems, databases, and APIs.

## Commands

| Command                            | Output                          |
| ---------------------------------- | ------------------------------- |
| `mcp-cli`                          | List all servers and tool names |
| `mcp-cli <server>`                 | Show tools with parameters      |
| `mcp-cli <server>/<tool>`          | Get tool JSON schema            |
| `mcp-cli <server>/<tool> '<json>'` | Call tool with arguments        |
| `mcp-cli grep "<glob>"`            | Search tools by name            |

**Add `-d` to include descriptions** (e.g., `mcp-cli filesystem -d`)

## Workflow

1. **Discover**: `mcp-cli` → see available servers and tools
2. **Explore**: `mcp-cli <server>` → see tools with parameters
3. **Inspect**: `mcp-cli <server>/<tool>` → get full JSON input schema
4. **Execute**: `mcp-cli <server>/<tool> '<json>'` → run with arguments

## Examples

```bash
# List all servers and tool names
mcp-cli

# See all tools with parameters
mcp-cli filesystem

# With descriptions (more verbose)
mcp-cli filesystem -d

# Get JSON schema for specific tool
mcp-cli filesystem/read_file

# Call the tool
mcp-cli filesystem/read_file '{"path": "./README.md"}'

# Search for tools
mcp-cli grep "*file*"

# JSON output for parsing
mcp-cli filesystem/read_file '{"path": "./README.md"}' --json

# Complex JSON with quotes (use heredoc or stdin)
mcp-cli server/tool <<EOF
{"content": "Text with 'quotes' inside"}
EOF

# Or pipe from a file/command
cat args.json | mcp-cli server/tool

# Find all TypeScript files and read the first one
mcp-cli filesystem/search_files '{"path": "src/", "pattern": "*.ts"}' --json | jq -r '.content[0].text' | head -1 | xargs -I {} sh -c 'mcp-cli filesystem/read_file "{\"path\": \"{}\"}"'
```

## Options

| Flag         | Purpose                   |
| ------------ | ------------------------- |
| `-j, --json` | JSON output for scripting |
| `-r, --raw`  | Raw text content          |
| `-d`         | Include descriptions      |

## Exit Codes

- `0`: Success
- `1`: Client error (bad args, missing config)
- `2`: Server error (tool failed)
- `3`: Network error

````