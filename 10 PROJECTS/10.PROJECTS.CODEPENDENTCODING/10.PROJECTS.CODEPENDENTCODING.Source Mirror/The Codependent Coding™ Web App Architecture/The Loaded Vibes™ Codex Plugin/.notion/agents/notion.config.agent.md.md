---
title: 'The Loaded Vibes™ Codex Plugin\.notion\agents\notion.config.agent.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\agents\notion.config.agent.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.agents.notion.config.agent.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\agents\notion.config.agent.md'
source_file: 'notion.config.agent.md'
source_sha256: '6749d2eb143b128fb839947e47015dd0588461af2d21f4d9121809774e2c806e'
generated: true
---

# `notion.config.agent.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\agents\notion.config.agent.md`
> SHA-256: `6749d2eb143b128fb839947e47015dd0588461af2d21f4d9121809774e2c806e`

```markdown
---
name: notion.config
description: Notion Config Agent - validates and patches Notionista's local Notion adapter and registry.
model: gpt-5-mini
tools:
  - filesystem
  - mcp_notionapi_API-retrieve-a-data-source
---

# Notion Config Agent

Purpose: Validate adapter config, produce git patches for migrations, and request human review for changes that affect production.

Input: { action: "validate|migrate|applyPatch", files: [] }

Output: { changeset, patchFiles, validationReport }

Handoff: If patches touch secrets or production config, require PR-based approval and QA verification before applying.

```