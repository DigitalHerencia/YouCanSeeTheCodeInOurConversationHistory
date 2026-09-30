---
type: project-board
project: <% tp.user.hearthProject(tp) %>
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - type/kanban
---
# <% tp.file.title %> — Milestone Board

This project-local Kanban moves **Milestone note links only**. Run `Hearth: Reconcile Project Board` after moving a card; the workflow writes the new human-selected status to the milestone note. Phase/task execution stays in TaskNotes.

## Backlog

## Ready

## In Progress

## Review

## Done

## Cancelled

## Board rules
- Keep every milestone in exactly one column.
- Link its authoritative milestone note; do not create task cards here.
- A Milestone Review with linked evidence is the completion gate.
