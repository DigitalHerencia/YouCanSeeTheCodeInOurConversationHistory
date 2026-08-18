---
title: 'The Loaded Vibes™ Codex Plugin\.notion\skills\mcp-notion\SKILL.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\skills\mcp-notion\SKILL.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.skills.mcp-notion.skill.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\skills\mcp-notion\SKILL.md'
source_file: 'SKILL.md'
source_sha256: 'ad6bc1ab77ddafa54bc94d87459a0eb9e97601730717aa686970289585365d67'
generated: true
---

# `SKILL.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\skills\mcp-notion\SKILL.md`
> SHA-256: `ad6bc1ab77ddafa54bc94d87459a0eb9e97601730717aa686970289585365d67`

```markdown
# MCP Notion Skill

Purpose: Helpers and CLI wrappers to interact with Notion MCP endpoints. Used by Notion Planner and Notion Executor to perform dry-runs, queries, and safe execution with audit logging.

Invocation examples:

- Dry-run: node .copilot/skills/mcp-notion/scripts/mcp/dryRunProposal.js --proposal=proposal.json --out=dryrun.json
- Execute: node .copilot/skills/mcp-notion/scripts/mcp/executeOperations.js --ops=ops.json --audit=./audit.log --approval=PR123

Files:

- scripts/mcp/dryRunProposal.js - produce dry-run diffs
- scripts/mcp/executeOperations.js - idempotent executor with audit logging
- scripts/mcp/querySchema.js - fetch schema mapping

```