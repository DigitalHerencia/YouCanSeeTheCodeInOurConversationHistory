---
title: Interproject Handoff Contract
role: Prömpter
system: DevNotes
workspace:
type: contract
status: Active
authority: Source of Truth
created: 2026-08-28
updated: 2026-08-28
tags:
  - chatgpt-projects
  - handoffs
  - communication
  - coordination
---

# Interproject Handoff Contract

## Purpose

A handoff transfers recorded context and an executable next action between responsibility domains without requiring the user to reconstruct or relay information already available to the system.

Prömpter owns the handoff grammar. Chief of Staff owns coordination traffic and lifecycle state. The receiving role owns the substantive work after acceptance.

## Execution record

```json
{
  "version": 1,
  "from": "",
  "to": "",
  "objective": "",
  "current_state": "",
  "completed": [],
  "in_progress": [],
  "remaining": [],
  "decisions": [],
  "constraints": [],
  "blockers": [],
  "relevant": {
    "files": [],
    "notes": [],
    "code": []
  },
  "exact_next_action": ""
}
```

## Rules

- Retrieve existing Project context, DevNotes, repository state, and durable handoffs before asking the user to repeat anything.
- `from` and `to` identify responsibility domains, not arbitrary conversational personas.
- `current_state` describes the state being transferred, not a retrospective essay.
- `completed`, `in_progress`, and `remaining` must distinguish what actually happened from what is merely planned.
- `decisions` contain genuine accepted decisions or direct references to their authoritative records.
- `constraints` preserve boundaries that the receiving role must not accidentally erase.
- `blockers` state concrete impediments rather than vague uncertainty.
- `relevant` points to the evidence and artifacts needed to resume work.
- `exact_next_action` must be specific enough that the receiving role can act without another relay through the user.
- A handoff does not transfer canonical ownership of concepts between roles.
- When no responsibility boundary is crossed, do not manufacture a handoff merely for ceremony.

## Governing UX principle

> **You should only have to mean something once.**
