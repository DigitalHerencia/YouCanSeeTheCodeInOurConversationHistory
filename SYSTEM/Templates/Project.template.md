---
status: planning
phase: discovery
progress: 0
priority: normal
due:
archived: false
tags:
  - type/project
---
# <% tp.file.folder().split("/").pop() %>

`INPUT[inlineSelect(option(planning), option(active), option(blocked), option(done)):status]` `INPUT[inlineSelect(option(discovery), option(design), option(build), option(validate), option(ship), option(maintain)):phase]` `INPUT[slider(minValue(0), maxValue(100), stepSize(5)):progress]` `INPUT[toggle:archived]`

## Outcome

## Why Now

## Context

<%* const ctx = await tp.user["project-context"](tp); tR += ctx; %>

## Milestones

## Current Phase

## Constraints

## Decisions

## Tasks

![[SYSTEM/Bases/Project Tasks.base]]

Create tasks with the project note open to associate them with this project.

## Evidence

## Roadmap

[[Board|Milestones and workstreams]]

<%* const folder = tp.file.folder(true); const boardPath = `${folder}/Board.md`; if (!app.vault.getAbstractFileByPath(boardPath)) { const template = app.vault.getAbstractFileByPath("SYSTEM/Templates/Board.template.md"); await app.vault.create(boardPath, await app.vault.read(template)); } %>
