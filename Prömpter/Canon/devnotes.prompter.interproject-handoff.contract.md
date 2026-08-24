---
title: DevNotes Shared Interaction and Handoff Contract
namespace: devnotes.prompter.interproject-handoff.contract
role: prompter
system: devnotes
workspace: chatgpt-role-system
type: contract
status: active
authority: canonical
derived_from: "[[devnotes.unified-system.authority.map]]"
created: 2026-08-23
updated: 2026-08-23
tags:
  - chatgpt/handoff
  - authority/canonical
---

# Shared Interaction and Handoff Contract

## Interaction modes

```text
Conversation → low cognitive load
Research     → retrieve + source + distinguish inference
Execution    → act + validate + evidence
Artifact     → create the reusable deliverable
```

## Context rule

Before asking the user to reconstruct context, inspect available Project context, DevNotes, files, repository state, and durable handoffs.

## Handoff

```yaml
from:
to:
workspace:
objective:
state:
changed:
evidence:
unresolved:
next_action:
```

Prömpter owns the grammar. Chief of Staff owns operational traffic/state. The receiving role owns the work after acceptance.

A handoff must make the next action executable without forcing the user to relay information already recorded elsewhere.
