---
title: 'The Loaded Vibes™ Codex Plugin\.notion\skills\notion-daily\skill.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\skills\notion-daily\skill.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.skills.notion-daily.skill.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\skills\notion-daily\skill.md'
source_file: 'skill.md'
source_sha256: 'ed54e7c5bda7bc913b44ec3323d4fdcae003073743a0c91d5bc629021d0d59eb'
generated: true
---

# `skill.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\skills\notion-daily\skill.md`
> SHA-256: `ed54e7c5bda7bc913b44ec3323d4fdcae003073743a0c91d5bc629021d0d59eb`

````markdown
# Notion Daily Workflow Skill

This skill bundle provides automated daily meeting workflows for the Digital Herencia Notion workspace.

## Purpose

Execute the daily workflow pattern:

1. Query today's meeting for a team
2. Get the next sequential task (T01→T02→T03→T04→T05)
3. Add task to meeting Action Items
4. Mark previous task as complete
5. Update task due date to today

## Files

- `skill.md` - This documentation
- `daily-workflow.md` - Step-by-step execution guide

## Usage

Invoke via the Notion Dashboard Automation agent:

```text
@Notion Dashboard Automation Run daily workflow for Engineering Team
```

## Team-Meeting Mapping

| Team        | Meeting Type           |
| ----------- | ---------------------- |
| Engineering | Engineering Meeting    |
| Design      | Design Meeting         |
| Operations  | Operations Meeting     |
| Product     | Daily Standup (shared) |
| Marketing   | Daily Standup (shared) |
| Research    | Daily Standup (shared) |

## MCP Tools Used

- `mcp_notionapi_API-query-data-source` - Query meetings and tasks
- `mcp_notionapi_API-patch-page` - Update meeting relations, mark task done
- `mcp_notionapi_API-post-search` - Find specific meetings by date

## Safety Notes

- Never create meetings (they auto-generate from templates)
- Always await "Approved" before write operations
- Verify task belongs to correct team/project before updating

````