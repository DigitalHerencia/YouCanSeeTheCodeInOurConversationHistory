---
type: review
review_kind: weekly
id: <% tp.user.hearthId(tp, "{{TITLE}}") %>
week:
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - type/review
---
# Weekly Review — {{WEEK}}

## Generated Operating Summary
### Completed
### In Progress
### Overdue
### Blocked
### Upcoming

## Project Movement
| Project | Previous State | Current State | Evidence |
|---|---|---|---|

## Decisions Required

## Resource / Zettelkasten Processing

## Code Lab Progress

## What Worked

## What Did Not

## Next Week
### Focus
### Risks
### Reviews / Gates

## System Health




## Human controls
Review state: `INPUT[select(option(draft), option(review), option(complete)):status]`

## Acceptance
- [ ] Generated sections are refreshed from current task/project state.
- [ ] Decisions and next actions link to authoritative notes.
