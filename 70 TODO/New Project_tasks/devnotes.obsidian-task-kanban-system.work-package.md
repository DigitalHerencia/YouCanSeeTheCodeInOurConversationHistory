---
pm-task: true
projectId: "aujyaujimsy9s0iz"
parentId:
id: "pnsyhxgwmsy9yurw"
title: "devnotes.obsidian-task-kanban-system.work-package"
type: "task"
status: "todo"
priority: "medium"
start: "2026-08-18"
due: ""
progress: 0
assignees: []
tags: []
subtaskIds: []
dependencies: []
createdAt: "2026-08-18T06:21:48.236Z"
updatedAt: "2026-08-18T06:21:48.236Z"
---

# Install the Execution Task Notes into Obsidian Tasks and Kanban Workflows

**Priority:** P0  
**Phase:** Execution System  
**Task status:** Backlog

## Outcome

Turn the project work packages into operational Obsidian task and Kanban views without making the Kanban board the source of architectural truth.

## Why This Exists

The vault now contains the Obsidian Kanban and Tasks community plugins; these notes are designed as work packages with checkbox subtasks and project/status metadata.

## Execution Checklist

- [ ] Place each project task-note directory in the chosen DevNotes project execution area.
- [ ] Create one Kanban board per project with Backlog, Ready, In Progress, Blocked, Verification, and Done lanes.
- [ ] Link each card to the corresponding work-package note instead of duplicating task content on the board.
- [ ] Keep detailed subtasks inside the work-package note for Obsidian Tasks indexing.
- [ ] Add a cross-project master execution dashboard/map.
- [ ] Use priority and dependency metadata to sequence Ready work.
- [ ] Do not mark a note done until its acceptance criteria are checked.
- [ ] Avoid putting canonical architecture rules into mutable board cards.

## Acceptance Criteria

- [ ] Every project has a board and linked task notes.
- [ ] Kanban cards reference one canonical work-package note each.
- [ ] Tasks queries can surface unchecked subtasks across projects.
- [ ] Status movement does not alter architecture authority.

## Dependencies

- [[devnotes.project-folder-realignment.work-package]]

## Source Basis

- Current DevNotes `.obsidian` plugin inventory
- These generated execution task notes

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.

Project: [[New Project|New Project]]