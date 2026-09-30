---
type: milestone
id: <% tp.user.hearthId(tp, "{{TITLE}}") %>
project: <% tp.user.hearthProject(tp) %>
number:
title:
status: backlog
risk:
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - type/milestone
---

# {{TITLE}}

## Human controls
Status: `INPUT[select(option(backlog), option(ready), option(in-progress), option(review), option(done), option(cancelled)):status]` · Target: `INPUT[date:target_end]` · Risk: `INPUT[select(option(unknown), option(low), option(medium), option(high)):risk]`

## Objective
What validated product/business state does this milestone represent?

## Entry Criteria
- 

## Exit Criteria
- 

## Phases
<!-- HEARTH:GENERATED:PHASES:START -->
<!-- HEARTH:GENERATED:PHASES:END -->

## Review
<!-- HEARTH:GENERATED:REVIEW:START -->
<!-- HEARTH:GENERATED:REVIEW:END -->



