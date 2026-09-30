---
type: review
review_kind: phase
id: <% tp.user.hearthId(tp, "{{TITLE}}") %>
project: <% tp.user.hearthProject(tp) %>
milestone: <% tp.user.hearthMilestone(tp) %>
phase: <% tp.user.hearthPhase(tp) %>
status: proposed
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - type/review
---
# Phase Review — {{TITLE}}

## Phase Goal

## Generated Results
- Tasks completed:
- Tasks incomplete:
- Blockers:
- Evidence:

## Deliverables
| Deliverable | Status | Evidence |
|---|---|---|

## Acceptance Criteria
- [ ] All required tasks completed or explicitly carried forward.
- [ ] Required evidence exists.
- [ ] Outputs are linked.
- [ ] Open blockers have owners/actions.

## Decisions

## Carry Forward

## Result
- [ ] Passed
- [ ] Failed
- [ ] Blocked



