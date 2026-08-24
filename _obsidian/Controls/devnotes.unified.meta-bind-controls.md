---
title: DevNotes Unified Meta Bind Controls
namespace: devnotes.devnotes.meta-bind.controls.reference
role: devnotes
system: devnotes
workspace:
type: reference
status: active
authority: operational
created: 2026-08-23
updated: 2026-08-23
tags:
  - obsidian/meta-bind
  - devnotes/ux
---

# Meta Bind Controls

Properties remain canonical state. These controls expose routine edits without making plugin configuration authoritative.

## Core state

Work / task status: `INPUT[dn-status-task][:status]`

Knowledge status: `INPUT[dn-status-knowledge][:status]`

Decision status: `INPUT[dn-status-decision][:status]`

Validation status: `INPUT[dn-status-validation][:status]`

Authority: `INPUT[dn-authority][:authority]`

Role: `INPUT[dn-role][:role]`

Workspace: `INPUT[dn-text][:workspace]`

## Project state

Priority: `INPUT[dn-priority][:priority]`

Health: `INPUT[dn-health][:health]`

Progress: `INPUT[dn-progress][:progress]`

Target: `INPUT[dn-date][:target]`

Scheduled: `INPUT[dn-date][:scheduled]`

Due: `INPUT[dn-date][:due]`
