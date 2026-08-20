---
title: 'The Loaded Vibes™ Codex Plugin\.notion\agents\notion.dashboard.agent.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\agents\notion.dashboard.agent.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.agents.notion.dashboard.agent.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\agents\notion.dashboard.agent.md'
source_file: 'notion.dashboard.agent.md'
source_sha256: '99d7849aa4719eb1124425856ee44f162dcaf6ca46719ac2de4f6b638528e93b'
generated: true
---

# `notion.dashboard.agent.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\agents\notion.dashboard.agent.md`
> SHA-256: `99d7849aa4719eb1124425856ee44f162dcaf6ca46719ac2de4f6b638528e93b`

```markdown
---
name: notion.dashboard
description: Notion Dashboard Automation - maintains dashboards and scheduled syncs after Notion writes.
model: gpt-5-mini
tools:
  - mcp_notionapi_API-query-data-source
  - scheduler
---

# Notion Dashboard Automation

Purpose: Update dashboards, rollups, and scheduled syncs after Executor runs. Runs on cron or post-execution triggers.

Input: { trigger: "post-execution|cron", executionId, dashboardSpec }

Output: { dashboardId, updateResults, nextRun }

```