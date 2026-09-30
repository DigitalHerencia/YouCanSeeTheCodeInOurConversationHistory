---
type: phase
id: <% await tp.system.prompt("Phase ID") %>
project: <% await tp.system.prompt("Project") %>
milestone: <% await tp.system.prompt("Milestone ID") %>
roadmap_code:
title: <% tp.file.title %>
status: backlog
priority: normal
target_end:
risk: unknown
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - type/phase
---

# <% tp.file.title %>

## Controls
Status: `INPUT[select(option(backlog), option(ready), option(in-progress), option(review), option(done), option(cancelled)):status]`  
Priority: `INPUT[select(option(low), option(normal), option(high)):priority]`  
Target: `INPUT[date:target_end]`  
Risk: `INPUT[select(option(unknown), option(low), option(medium), option(high)):risk]`

## Purpose

## Key Activities

## Primary Outputs

## RoadMap

## Tasks

## Review
