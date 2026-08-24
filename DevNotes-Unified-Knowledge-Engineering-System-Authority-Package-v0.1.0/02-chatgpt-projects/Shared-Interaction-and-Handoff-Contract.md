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
