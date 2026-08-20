---
title: 'The Loaded Vibes™ Codex Plugin\.notion\skills\notion-portfolio\portfolio-workflow.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\skills\notion-portfolio\portfolio-workflow.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.skills.notion-portfolio.portfolio-workflow.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\skills\notion-portfolio\portfolio-workflow.md'
source_file: 'portfolio-workflow.md'
source_sha256: '3d8d94ddb5de68725d5c41a7c767bb6aed84b51faaf7371a2b81109589fe788b'
generated: true
---

# `portfolio-workflow.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\skills\notion-portfolio\portfolio-workflow.md`
> SHA-256: `3d8d94ddb5de68725d5c41a7c767bb6aed84b51faaf7371a2b81109589fe788b`

````markdown
# Portfolio Creation Execution Guide

## Prerequisites

- Notion MCP integration connected
- Task exists and has a deliverable to document
- Task has proper relations (project, team)

## Step 1: Query the Task

```text
Query Tasks database:
- Filter: name = [task_name] OR id = [task_id]
- Include: project relation, team relation, done status
```

**MCP Tool:** `mcp_notionapi_API-query-data-source`

**Database ID:** `{{registry.databases.tasks.id}}`

## Step 2: Mark Task Complete

```text
Update task page:
- Set done = true
```

**MCP Tool:** `mcp_notionapi_API-patch-page`

**Requires:** User approval ("Approved")

## Step 3: Create Portfolio Page

```text
Create page in Portfolio database:
- parent: { database_id: "{{registry.databases.portfolio.id}}" }
- properties:
  - title: [Task Name / Deliverable Name]
  - tasks: [Task ID]
  - projects: [Project ID from task relation]
  - teams: [Team ID from task relation]
  - meetings: [Meeting ID if known]
```

**MCP Tool:** `mcp_notionapi_API-post-page`

**Requires:** User approval ("Approved")

## Step 4: Add Content (Optional)

```text
Append blocks to Portfolio page:
- Description of deliverable
- Links to artifacts (code, designs, docs)
- Key decisions or notes
```

**MCP Tool:** `mcp_notionapi_API-patch-block-children`

## Step 5: Archive Task (Optional)

```text
Update task page:
- Set archived = true
```

**MCP Tool:** `mcp_notionapi_API-patch-page`

## Step 6: Report Results

Provide summary:

- Task: [Name] marked complete
- Portfolio: [Name] created with ID [id]
- Relations established:
  - Task ↔ Portfolio
  - Project ↔ Portfolio
  - Team ↔ Portfolio
- Next task: T0X ready for assignment

````