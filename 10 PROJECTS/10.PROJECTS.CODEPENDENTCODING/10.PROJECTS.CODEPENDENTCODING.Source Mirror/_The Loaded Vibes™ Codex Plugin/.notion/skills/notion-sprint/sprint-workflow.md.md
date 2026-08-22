---
title: 'The Loaded Vibes™ Codex Plugin\.notion\skills\notion-sprint\sprint-workflow.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\skills\notion-sprint\sprint-workflow.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.skills.notion-sprint.sprint-workflow.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\skills\notion-sprint\sprint-workflow.md'
source_file: 'sprint-workflow.md'
source_sha256: '3e95f0782b037f9472405e580b7c35687218f8a4f2fde4821e9e3179c5229cef'
generated: true
---

# `sprint-workflow.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\skills\notion-sprint\sprint-workflow.md`
> SHA-256: `3e95f0782b037f9472405e580b7c35687218f8a4f2fde4821e9e3179c5229cef`

````markdown
# Sprint Planning Execution Guide

## Prerequisites

- Notion MCP integration connected
- Sprint Planning meeting exists for the target date (auto-generated)
- Team has active projects assigned via "Add Project" buttons

## Step 1: Query Active Projects

```text
Query Projects database:
- Filter: team = [Team]
- Filter: status = "Active"
- Filter: milestone = "M1" (current)
- Filter: phase = "P1.1" (current)
```

**MCP Tool:** `mcp_notionapi_API-query-data-source`

**Database ID:** `{{registry.databases.projects.id}}`

## Step 2: Query Sprint Planning Meeting

```text
Query Meetings database:
- Filter: type = "Sprint Planning"
- Filter: date = [sprint_start_date]
```

**MCP Tool:** `mcp_notionapi_API-query-data-source`

**Database ID:** `{{registry.databases.meetings.id}}`

## Step 3: Review Project Alignment

For each project, verify:

- Phase matches current dev cycle (P1.1)
- Milestone matches current milestone (M1)
- All 5 tasks (T01-T05) exist
- No blocking dependencies

## Step 4: Assign Projects to Meeting

```text
Update Sprint Planning meeting:
- Add projects to projects relation
- Add team to attendees relation
```

**MCP Tool:** `mcp_notionapi_API-patch-page`

**Requires:** User approval ("Approved")

## Step 5: Calculate Sprint Scope

Report:

- Total projects in sprint: X
- Total tasks to complete: X × 5 = Y
- Phase/milestone: M1 / P1.1
- Sprint dates: [start] to [end]

## Step 6: Identify Risks

Check for:

- Projects with incomplete task sets
- Carryover tasks from previous sprint
- Cross-team dependencies

````