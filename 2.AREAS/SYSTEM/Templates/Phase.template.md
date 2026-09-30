---
type: phase
id: <% tp.user.hearthId(tp, "{{TITLE}}") %>
project: <% await tp.system.prompt("Project") %>
milestone: <% await tp.system.prompt("Milestone ID") %>
roadmap:
number:
title:
status: backlog
risk:
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - type/phase
---

# {{TITLE}}

## Human controls
Status: `INPUT[select(option(backlog), option(ready), option(in-progress), option(blocked), option(review), option(done), option(cancelled)):status]` · Target: `INPUT[date:end]` · Risk: `INPUT[select(option(unknown), option(low), option(medium), option(high)):risk]`

## Controls
Status: `INPUT[select(option(backlog), option(ready), option(in-progress), option(review), option(done), option(cancelled)):status]`  
Priority: `INPUT[select(option(low), option(normal), option(high)):priority]`

## Purpose
What bounded outcome should this phase produce?

## Entry Criteria
- 

## Exit Criteria
- 

## RoadMap

## Tasks
![[Active Project Tasks.base]]

## Review
- What changed?
- What was validated?
- What remains?
- What advances next?



