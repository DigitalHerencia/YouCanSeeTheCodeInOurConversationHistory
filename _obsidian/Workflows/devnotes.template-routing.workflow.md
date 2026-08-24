---
title: DevNotes Unified Template Routing
namespace: devnotes.devnotes.template-routing.workflow
role: devnotes
system: devnotes
workspace:
type: workflow
status: active
authority: operational
created: 2026-08-23
updated: 2026-08-23
tags:
  - obsidian/templater
  - devnotes/workflow
---

# Template Routing

Templater uses `_obsidian/Templates` and `_obsidian/Scripts/templater`. QuickAdd selects a note type and routes it to a valid role/workspace destination. Automatic templates are limited to folders with one unambiguous document shape.

| Context | Default |
|---|---|
| `DevNotes/Inbox` | Capture |
| `Chief of Staff/Daily` | Daily Note |

Workspace folders deliberately have no automatic template. Use QuickAdd so a workspace can contain projects, specifications, tasks, research, decisions, evidence, and handoffs without receiving the wrong document shape.

The complete routing reference is [[Templater-and-QuickAdd-Routing]].
