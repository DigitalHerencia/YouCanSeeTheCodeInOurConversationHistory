---
title: 'The Loaded Vibes™ Codex Plugin\.notion\prompts\daily-meeting.prompt.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\prompts\daily-meeting.prompt.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.prompts.daily-meeting.prompt.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\prompts\daily-meeting.prompt.md'
source_file: 'daily-meeting.prompt.md'
source_sha256: 'ae44c5daef1b2940d9cf71d3365b597f57ab773354b76af5a4ea3a1bd0d772e9'
generated: true
---

# `daily-meeting.prompt.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\prompts\daily-meeting.prompt.md`
> SHA-256: `ae44c5daef1b2940d9cf71d3365b597f57ab773354b76af5a4ea3a1bd0d772e9`

```markdown
---
mode: agent
description: Execute daily meeting workflow - get next task and add to meeting
agent: Notion Dashboard Automation
---

# Daily Meeting Workflow

Execute the daily workflow for the specified team.

## Team

{{team}}

## Workflow Steps

1. **Query today's meeting** for the {{team}}
   - For Operations, Design, Engineering: Query their dedicated meeting
   - For Product, Marketing, Research: Query the shared Daily Standup

2. **Get next task** from the active project
   - Filter: `Done=false`
   - Sort by: `Task Code` ascending
   - Take: First result (next sequential task)

3. **Add task relation** to meeting's Action Items

4. **Update task due date** to today (if not already set)

5. **Report results**:
   - Meeting name and date
   - Task added (name and code)
   - Project context
   - Any previous task status

## Safety

- This is a write operation—await "Approved" before modifying the meeting
- Verify the meeting exists before attempting to add relations
- Confirm the task is from the correct team's active project

```