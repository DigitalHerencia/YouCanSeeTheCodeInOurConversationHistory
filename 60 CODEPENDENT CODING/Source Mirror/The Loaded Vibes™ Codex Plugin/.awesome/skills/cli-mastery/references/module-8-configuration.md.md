---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\cli-mastery\references\module-8-configuration.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\cli-mastery\references\module-8-configuration.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.cli-mastery.references.module-8-configuration.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\cli-mastery\references\module-8-configuration.md'
source_file: 'module-8-configuration.md'
source_sha256: 'd256475f4fb601441636d649618b0efa11e4f4611594726b8a5cb19d2e3d7c96'
generated: true
---

# `module-8-configuration.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\cli-mastery\references\module-8-configuration.md`
> SHA-256: `d256475f4fb601441636d649618b0efa11e4f4611594726b8a5cb19d2e3d7c96`

```markdown
# Module 8: Configuration

## Key files

| File | Purpose |
|------|---------|
| `~/.copilot/config.json` | Main settings (model, theme, logging, experimental flags) |
| `~/.copilot/mcp-config.json` | MCP servers |
| `~/.copilot/lsp-config.json` | Language servers (user-level) |
| `.github/lsp.json` | Language servers (repo-level) |
| `~/.copilot/copilot-instructions.md` | Global custom instructions |
| `.github/copilot-instructions.md` | Repo-level custom instructions |

## Environment variables

| Variable | Purpose |
|----------|---------|
| `EDITOR` | Text editor for `Ctrl+G` (edit prompt in external editor) |
| `COPILOT_LOG_LEVEL` | Logging verbosity (error/warn/info/debug/trace) |
| `GH_TOKEN` / `GITHUB_TOKEN` | GitHub authentication token (checked in order) |
| `COPILOT_CUSTOM_INSTRUCTIONS_DIRS` | Additional directories for custom instructions |

## Permissions model

- Default: confirmation required for edits, creates, shell commands
- `/allow-all` or `--yolo`: skip all confirmations for the session
- `/reset-allowed-tools`: re-enable confirmations
- Directory allowlists, tool approval gates, MCP server trust

## Logging levels

error, warn, info, debug, trace (`COPILOT_LOG_LEVEL=debug copilot`)

Use debug/trace for: MCP connection issues, tool failures, unexpected behavior, bug reports

```