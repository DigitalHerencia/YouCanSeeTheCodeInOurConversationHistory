---
type: roadmap
roadmap_id: <% await tp.system.prompt("RoadMap ID") %>
project_id: <% await tp.system.prompt("Project ID") %>
project: <% await tp.system.prompt("Project") %>
milestone: <% await tp.system.prompt("Milestone ID") %>
phase: <% await tp.system.prompt("Phase ID") %>
roadmap_code: <% await tp.system.prompt("RoadMap code") %>
title: <% tp.file.title %>
status: ready
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - type/roadmap
---

# <% tp.file.title %>

## Controls
Status: `INPUT[select(option(ready), option(in-progress), option(blocked), option(review), option(done)):status]`

## Purpose

## Key Activities

## Primary Outputs

## Tasks

## Inputs

## Dependencies

## Downstream Consumers

## Completion
- [ ] RoadMap outputs are complete.
- [ ] Associated tasks are complete.
- [ ] Required artifacts are linked.
