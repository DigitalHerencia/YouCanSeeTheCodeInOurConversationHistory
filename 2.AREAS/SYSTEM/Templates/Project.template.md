---
type: project
project_id: <% await tp.system.prompt("Project ID") %>
project: <% tp.file.title %>
project_type: <% await tp.system.suggester(["Operations","Product","Design","Engineering","Marketing"],["OPS","PROD","DES","ENG","MKT"]) %>
status: backlog
priority: normal
target_end:
current_focus: ""
blocker: ""
codelab_enabled: false
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - type/project
---
# <% tp.file.title %>

## Human controls
Status: `INPUT[select(option(backlog), option(ready), option(in-progress), option(review), option(done), option(cancelled)):status]` · Priority: `INPUT[select(option(low), option(normal), option(high)):priority]` · Target: `INPUT[date:target_end]`
Focus: `INPUT[text:current_focus]` · Blocker: `INPUT[text:blocker]` · Code Lab enabled: `INPUT[toggle:codelab_enabled]`

## Purpose and approved outcome
Describe the owner-approved project outcome and cite the requirement or decision that authorizes it. No requirements are inferred during creation.

## Acceptance
- [ ] Each project outcome has a measurable acceptance condition.
- [ ] Constraints, assumptions, and dependencies link to source evidence.

## Controls
Status: `INPUT[select(option(backlog), option(ready), option(in-progress), option(review), option(done), option(cancelled)):status]`  
Priority: `INPUT[select(option(low), option(normal), option(high)):priority]`  
Target: `INPUT[date:target_end]`

## Current state
<!-- HEARTH:BEGIN PROJECT-STATE -->
Reconciled automatically from linked milestone, phase, and TaskNotes records.
<!-- HEARTH:END PROJECT-STATE -->

## Execution
- Board: [[Board]]
- Milestone, phase, and tasks are reconciled from this project’s source relations.
![[Active Project Tasks.base]]

## Documents and evidence
![[Active Project Documents.base]]
![[Active Project Evidence.base]]



