---
title: 'The Loaded Vibes™ Codex Plugin\.notion\prompts\sprint-planning.prompt.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\prompts\sprint-planning.prompt.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.prompts.sprint-planning.prompt.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\prompts\sprint-planning.prompt.md'
source_file: 'sprint-planning.prompt.md'
source_sha256: 'cc8bbbf5b0ef2887ce5e7216df09e50d210acb6116e41aefa58ab8de74307233'
generated: true
---

# `sprint-planning.prompt.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\prompts\sprint-planning.prompt.md`
> SHA-256: `cc8bbbf5b0ef2887ce5e7216df09e50d210acb6116e41aefa58ab8de74307233`

```markdown
---
mode: agent
description: Execute sprint planning workflow - assign projects to teams for the sprint
agent: Notion Dashboard Automation
---

# Sprint Planning Workflow

Execute sprint planning for a 2-week sprint cycle.

## Team

{{team}}

## Sprint Dates

- Start: {{start_date}}
- End: {{end_date}}

## Workflow Steps

1. **Query active projects** for the {{team}}
   - Filter: `Status=Active`
   - Include: Project name, phase, milestone, current task progress

2. **Query Sprint Planning meeting** for the sprint start date
   - Find the biweekly Sprint Planning meeting

3. **Review project alignment**:
   - Verify projects match current dev cycle phase (M1/P1.1)
   - Check all 5 tasks (T01-T05) exist for each project
   - Identify any blocked or at-risk projects

4. **Assign projects** to the sprint meeting via relations
   - Add project relations to meeting's Projects property
   - Add team relation to meeting's Attendees property

5. **Report sprint scope**:
   - Projects included in sprint
   - Total tasks to complete
   - Phase/milestone alignment
   - Any dependencies or risks

## Safety

- This is a write operation—await "Approved" before modifying
- Sprint Planning meetings already exist (recurring template)
- Only add relations, never create meetings

```