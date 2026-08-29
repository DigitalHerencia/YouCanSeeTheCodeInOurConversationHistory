---
title: Meta Bind Controls
role: DevNotes
system: DevNotes
workspace:
type: reference
status: Active
authority: Reference
created: 2026-08-28
updated: 2026-08-28
tags:
  - obsidian
  - meta-bind
  - properties
  - state
---

# Meta Bind Controls

Meta Bind changes **mutable state**. Note Toolbar performs **actions**.

Routine workflow should not require manually editing YAML.

## Work state

Status: `INPUT[dn-status-task][:status]`

## Knowledge state

Status: `INPUT[dn-status-knowledge][:status]`

## Validation evidence

Result: `INPUT[dn-status-validation][:status]`

## Governance

Authority: `INPUT[dn-authority][:authority]`

Role: `INPUT[dn-role][:role]`

Workspace: `INPUT[dn-text][:workspace]`

## Project / task state

Priority: `INPUT[dn-priority][:priority]`

Health: `INPUT[dn-health][:health]`

Progress: `INPUT[dn-progress][:progress]`

Target: `INPUT[dn-date][:target]`

Scheduled: `INPUT[dn-date][:scheduled]`

Due: `INPUT[dn-date][:due]`

## Active vocabularies

Authority:

`Source of Truth` · `Working` · `Reference` · `Derived` · `Historical`

Knowledge:

`Draft` · `Review` · `Active` · `Superseded` · `Archived`

Work:

`Backlog` · `Ready` · `In Progress` · `Blocked` · `Done` · `Cancelled`

Project health:

`On Track` · `At Risk` · `Blocked` · `Paused`

Validation evidence:

`Passed` · `Failed` · `Skipped` · `Blocked` · `Inferred`

There is no generic decision-status control in the shared contract. Decision-specific state should only be introduced when a controlling decision contract defines it.
