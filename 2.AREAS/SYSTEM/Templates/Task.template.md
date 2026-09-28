---
type: task
status: ready
project: <% tp.user.hearthProject(tp) %>
milestone: <% tp.user.hearthMilestone(tp) %>
phase: <% tp.user.hearthPhase(tp) %>
ticket_code:
source_requirement:
source_document:
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags: [type/task]
---
# Task Context — {{TITLE}}

> Create execution tasks through TaskNotes. This template is contextual support and must not create a second task database.

## Objective

## Human controls
Status: `INPUT[select(option(backlog), option(ready), option(in-progress), option(blocked), option(done), option(cancelled)):status]` · Priority: `INPUT[select(option(none), option(low), option(normal), option(high)):priority]` · Due: `INPUT[date:due]` · Scheduled: `INPUT[date:scheduled]` · Blocker: `INPUT[text:blocker]`

## Acceptance Criteria
- [ ] 

## Project Context
- Project:
- Milestone:
- Phase:

## Upstream

## Expected Output

## Evidence Plan

## Handoff



