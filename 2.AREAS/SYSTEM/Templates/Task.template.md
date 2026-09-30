---
type: task
task_id:
project_id:
project: <% await tp.system.prompt("Project") %>
milestone: <% await tp.system.prompt("Milestone ID") %>
phase: <% await tp.system.prompt("Phase ID") %>
roadmap: <% await tp.system.prompt("RoadMap code") %>
status: ready
priority: normal
dependency:
deliverable:
due:
scheduled:
blocker:
source_requirement:
source_document:
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - type/task
---

# <% tp.file.title %>

## Controls
Status: `INPUT[select(option(backlog), option(ready), option(in-progress), option(blocked), option(review), option(done), option(cancelled)):status]`  
Priority: `INPUT[select(option(low), option(normal), option(high)):priority]`  
Due: `INPUT[date:due]`  
Scheduled: `INPUT[date:scheduled]`  
Blocker: `INPUT[text:blocker]`

## Objective

## Acceptance Criteria
- [ ]

## Project Context
- Project: <% tp.frontmatter.project %>
- Milestone: <% tp.frontmatter.milestone %>
- Phase: <% tp.frontmatter.phase %>
- RoadMap: <% tp.frontmatter.roadmap %>

## Upstream

## Expected Output

## Evidence Plan

## Handoff
