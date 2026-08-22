---
title: 'The Loaded Vibes™ Codex Plugin\.notion\prompts\dev-cycle-status.prompt.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\prompts\dev-cycle-status.prompt.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.prompts.dev-cycle-status.prompt.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\prompts\dev-cycle-status.prompt.md'
source_file: 'dev-cycle-status.prompt.md'
source_sha256: '54bc004f28b7e76dd2918a9d72ef88c48efec060e88bcfc88da20b995b14d9e9'
generated: true
---

# `dev-cycle-status.prompt.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\prompts\dev-cycle-status.prompt.md`
> SHA-256: `54bc004f28b7e76dd2918a9d72ef88c48efec060e88bcfc88da20b995b14d9e9`

````markdown
---
mode: agent
description: Show current dev cycle status across all teams
agent: Notion Dashboard Automation
---

# Dev Cycle Status Report

Generate a comprehensive status report for the current development cycle.

## Current Dev Cycle

**Product:** Competitive Advantage (SaaS Product)
**Phase:** M1 / P1.1

## Workflow Steps

1. **Query all teams** (6 total)
   - Engineering, Design, Marketing, Operations, Product, Research

2. **For each team, query**:
   - Active projects (filter: `Status=Active`, `Milestone=M1`, `Phase=P1.1`)
   - Task completion status (count of `Done=true` vs total)
   - Current task in progress (first incomplete task by Task Code)

3. **Calculate metrics**:
   - Per-team progress: Tasks completed / Total tasks
   - Per-project progress: Tasks completed / 5
   - Overall dev cycle progress

4. **Identify blockers**:
   - Overdue tasks (due date < today, Done=false)
   - Stalled projects (no task progress in current sprint)

5. **Generate report**:

```markdown
## Dev Cycle Status: Competitive Advantage

**Current Phase:** M1 / P1.1 - Requirements Gathering & Planning

### Team Progress

| Team | Project | Progress | Current Task | Status   |
| ---- | ------- | -------- | ------------ | -------- |
| ...  | ...     | X/5      | T0X          | 🟢/🟡/🔴 |

### Overall Metrics

- Total Projects: X active
- Total Tasks: X/Y completed (Z%)
- Overdue Tasks: X

### Blockers & Risks

- [List any overdue or at-risk items]

### Next Actions

- [Recommended next steps per team]
```

## Safety

- This is a read-only operation
- No approval required for queries
- Report includes actionable recommendations

````