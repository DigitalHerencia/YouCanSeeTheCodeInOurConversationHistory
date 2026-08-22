---
title: 'The Loaded Vibes™ Codex Plugin\.notion\agents\notion.planner.agent.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\agents\notion.planner.agent.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.agents.notion.planner.agent.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\agents\notion.planner.agent.md'
source_file: 'notion.planner.agent.md'
source_sha256: '8af848b9e0d634935861e6639ec4b429934624d3fe3d818cdef8d35401eecfbd'
generated: true
---

# `notion.planner.agent.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\agents\notion.planner.agent.md`
> SHA-256: `8af848b9e0d634935861e6639ec4b429934624d3fe3d818cdef8d35401eecfbd`

```markdown
---
name: notion.planner
description: Notion Planner - prepares Notion read/write proposals and dry-run diffs for human approval.
model: gpt-5-mini
tools:
  - mcp_notionapi_API-post-search
  - mcp_notionapi_API-retrieve-a-data-source
  - file-diff-generator
---

# Notion Planner

Purpose: Map plan tasks to Notion data model, generate a reviewable proposal (dry-run) and produce a GitHub draft PR for approvals when writes are required.

Output: { proposalId, dryRunDiffPath, changes, requiresApproval }

Handoff: If requiresApproval true -> create draft PR and wait for approval; otherwise handoff to Notion Executor with signed proposal bundle.

```