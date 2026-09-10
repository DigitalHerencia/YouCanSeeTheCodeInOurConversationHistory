---
status: backlog
priority: normal
due:
archive: false
tags:
  - type/task
---
# <% tp.file.title %>

`INPUT[select(option(backlog), option(ready), option(in-progress), option(blocked), option(done), option(cancelled)):status]` `INPUT[select(option(low), option(normal), option(high)):priority]` `INPUT[toggle:archive]`

## Project

<%* const project = await tp.user.related_project(tp); if (project) tR += project; %>

## Definition of Done

## Context

## Evidence
