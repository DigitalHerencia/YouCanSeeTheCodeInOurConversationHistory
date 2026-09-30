---
type: milestone
id: <% await tp.system.prompt("Milestone ID") %>
project: <% await tp.system.prompt("Project") %>
number: <% await tp.system.prompt("Milestone ID") %>
title: <% tp.file.title %>
status: backlog
target_end:
risk: unknown
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - type/milestone
---

# <% tp.file.title %>

## Controls
Status: `INPUT[select(option(backlog), option(ready), option(in-progress), option(review), option(done), option(cancelled)):status]`  
Target: `INPUT[date:target_end]`  
Risk: `INPUT[select(option(unknown), option(low), option(medium), option(high)):risk]`

## Objective

## Entry Criteria
- 

## Exit Criteria
- 

## Phases

## Review
