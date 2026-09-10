---
status: planning
phase: discovery
progress: 0
priority: medium
due:
archive: false
tags:
  - type/project
---
# <% tp.file.title %>

`INPUT[select(option(planning), option(active), option(blocked), option(done)):status]` `INPUT[select(option(discovery), option(design), option(build), option(validate), option(ship), option(maintain)):phase]` `INPUT[slider(minValue(0), maxValue(100), stepSize(5)):progress]` `INPUT[toggle:archive]`

## Outcome

## Why Now

## Context

<%* const ctx = await tp.user.project_context(tp); tR += ctx; %>

## Milestones

## Current Phase

## Constraints

## Decisions

## Tasks

## Evidence
