---
title: 'The Loaded Vibes™ Codex Plugin\.notion\prompts\task-completion.prompt.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\prompts\task-completion.prompt.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.prompts.task-completion.prompt.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\prompts\task-completion.prompt.md'
source_file: 'task-completion.prompt.md'
source_sha256: 'bf22ead1f7a7eccd923e55c558fb08a85573c1fe6ca8c3914d7eb01c37860541'
generated: true
---

# `task-completion.prompt.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\prompts\task-completion.prompt.md`
> SHA-256: `bf22ead1f7a7eccd923e55c558fb08a85573c1fe6ca8c3914d7eb01c37860541`

```markdown
---
mode: agent
description: Complete a task and optionally create Portfolio page for deliverables
agent: Notion Dashboard Automation
---

# Task Completion Workflow

Mark a task as complete and create Portfolio documentation if applicable.

## Task

{{task}}

## Create Portfolio

{{create_portfolio}} (yes/no)

## Workflow Steps

1. **Query the task** to confirm current state
   - Verify task exists and is not already done
   - Get project and team relations
   - Get task code (T01-T05)

2. **Mark task Done**
   - Set `Done=true` checkbox property

3. **Create Portfolio page** (if {{create_portfolio}} = yes)
   - Title: Task name (the deliverable name)
   - Relations:
     - `tasks`: Link to the completed task
     - `projects`: Link to the parent project
     - `teams`: Link to the responsible team
     - `meetings`: Link to meeting where task was assigned (if known)

4. **Archive task** (optional)
   - Set `Archived=true` if the task should be hidden from active views

5. **Identify next task**
   - Query remaining incomplete tasks for the project
   - Report next sequential task (e.g., if T02 completed, report T03)

6. **Report results**:
   - Task marked complete
   - Portfolio page created (if applicable)
   - Next task in sequence
   - Project completion progress (X/5 tasks done)

## Safety

- This is a write operation—await "Approved" before modifying
- Verify task belongs to the expected project before updating
- Portfolio pages are manually created (not auto-generated)

```