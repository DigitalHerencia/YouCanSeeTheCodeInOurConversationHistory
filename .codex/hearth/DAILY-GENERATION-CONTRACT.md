# Daily Generation Contract

The Daily Note is a generated operating snapshot, not a journal skeleton.

## Generated regions

### Yesterday
Derive from completed tasks on the previous workday/date:
- task link
- project
- milestone
- phase
- completion time
- linked output documents
- linked evidence
- blocker resolution if present

An output is linked automatically only when it was created through a Hearth workflow or otherwise carries explicit provenance. Never infer an output from a task title.

### Today
Show:
- active project/milestone/phase
- maximum three recommended focus tasks by default
- direct task links
- due date
- priority
- blocker state
- next executable action
- a link to the full TaskNotes execution queue

### Blockers
Aggregate explicit open blockers from projects and tasks.

### Deadlines
Show overdue and upcoming target/task dates.

### Cadence
Show only meetings/reviews actually scheduled for the date. Do not create notes merely because cadence exists.

### Work context
Show:
- active project
- active milestone
- active phase
- phase progress
- project health
- current focus
- next action
- recent document/evidence changes

### Knowledge
Show:
- Zettelkasten Inbox count
- oldest unprocessed capture
- resource reviews due
- linked resources for the active project

### Code Lab
Show:
- current ontology/module
- current DevCycle lesson
- next applied drill
- mastery state
- evidence needing review

## Human regions

The template always preserves dedicated regions for:
- notes
- decisions
- reflections
- shutdown summary
- explicit blockers not yet represented in structured state

## Refresh rules

- Generated regions may be replaced on refresh.
- Human regions are never overwritten.
- Re-running refresh is idempotent.
- Empty source state produces a concise empty-state line, not fabricated content.
