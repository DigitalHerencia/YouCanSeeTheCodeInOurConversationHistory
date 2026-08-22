---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\cli-mastery\references\module-6-mcp.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\cli-mastery\references\module-6-mcp.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.cli-mastery.references.module-6-mcp.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\cli-mastery\references\module-6-mcp.md'
source_file: 'module-6-mcp.md'
source_sha256: 'a82a53a4751cf5c6ac0b6eef5862e6c974e7790a27451cd02d358c3aded02bdc'
generated: true
---

# `module-6-mcp.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\cli-mastery\references\module-6-mcp.md`
> SHA-256: `a82a53a4751cf5c6ac0b6eef5862e6c974e7790a27451cd02d358c3aded02bdc`

````markdown
# Module 6: MCP Integration

## What is MCP?

- Model Context Protocol — a standard for connecting AI to external tools
- Think of it as "USB ports for AI" — plug in any compatible tool
- The GitHub MCP server is **built-in** (search repos, issues, PRs, actions)

## Key commands

| Command | What it does |
|---------|-------------|
| `/mcp` | List connected MCP servers |
| `/mcp add <name> <command>` | Add a new MCP server |

## Popular MCP servers

- `@modelcontextprotocol/server-postgres` — Query PostgreSQL databases
- `@modelcontextprotocol/server-sqlite` — Query SQLite databases
- `@modelcontextprotocol/server-filesystem` — Access local files with permissions
- `@modelcontextprotocol/server-memory` — Persistent knowledge graph
- `@modelcontextprotocol/server-puppeteer` — Browser automation

## Configuration

| Level | File |
|-------|------|
| User | `~/.copilot/mcp-config.json` |
| Project | `.github/mcp-config.json` |

## Config file format

```json
{
  "mcpServers": {
    "my-server": {
      "command": "npx",
      "args": ["@modelcontextprotocol/server-postgres", "{{env.DATABASE_URL}}"],
      "env": { "NODE_ENV": "development" }
    }
  }
}
```

## Security best practices

- Never put credentials directly in config files
- Use environment variable references: `{{env.SECRET}}`
- Review MCP server source before using
- Only connect servers you actually need

````