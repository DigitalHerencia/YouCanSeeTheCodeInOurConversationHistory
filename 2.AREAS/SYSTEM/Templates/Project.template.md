---
type: project
project_id: <% await tp.system.prompt("Project ID") %>
project: <% tp.file.title %>
project_type: <% await tp.system.suggester(["Operations","Product","Design","Engineering","Marketing"],["OPS","PROD","DES","ENG","MKT"]) %>
status: backlog
priority: normal
target_end:
current_focus:
blocker:
codelab_enabled: false
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - type/project
---

# <% tp.file.title %>

## Controls
Status: `INPUT[select(option(backlog), option(ready), option(in-progress), option(review), option(done), option(cancelled)):status]`  
Priority: `INPUT[select(option(low), option(normal), option(high)):priority]`  
Target: `INPUT[date:target_end]`  
Focus: `INPUT[text:current_focus]`  
Blocker: `INPUT[text:blocker]`  
Code Lab enabled: `INPUT[toggle:codelab_enabled]`

## Purpose and approved outcome

## Milestones

## Phase Boards

## RoadMaps

## Tasks
![[Active Project Tasks.base]]

## Documents
![[Active Project Documents.base]]

## Evidence
![[Active Project Evidence.base]]

## Resources
- [[Resources]]

## Codebase
- [[Codebase]]

## Posts
- [[Posts]]

## Artifacts
- [[Artifacts]]
