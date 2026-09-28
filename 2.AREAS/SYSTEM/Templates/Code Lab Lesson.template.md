---
type: codelab
codelab_kind: lesson
id: <% tp.user.hearthId(tp, "{{TITLE}}") %>
module:
devcycle:
project: <% tp.user.hearthProject(tp) %>
status: not-started
mastery_state: not-started
mastery: 0
confidence: 0
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags: [type/codelab]
---

# {{TITLE}}

## DevCycle

## Objective

## Applied Context
What part of the real project is being built?

## Patterns

## Acceptance Criteria
- [ ]

## Applied Drill
- Task:

## Evidence
- Test/run:
- Commit:
- Output:

## Reflection

## Human controls
Mastery: `INPUT[number:mastery]` · Confidence: `INPUT[number:confidence]` · State: `INPUT[select(option(not-started), option(in-progress), option(in-review), option(mastered)):mastery_state]` · Next review: `INPUT[date:next_review]`

## Mastery



