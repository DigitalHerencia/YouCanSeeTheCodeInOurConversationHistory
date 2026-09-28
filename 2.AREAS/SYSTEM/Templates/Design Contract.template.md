---
type: document
document_type: DCS
id: <% tp.user.hearthId(tp, "{{TITLE}}") %>
project: <% tp.user.hearthProject(tp) %>
status: draft
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags: [type/document]
---
# Design Contract — {{TITLE}}

## Visual Intent

## Layout Rules

## Component Rules

## Motion / Feedback

## Content Rules

## Accessibility Rules

## Responsive Rules

## Human controls
Status: `INPUT[select(option(draft), option(review), option(approved), option(superseded), option(archived)):status]` · Review status: `INPUT[select(option(pending), option(in-review), option(approved), option(rejected)):review_status]`

## Acceptance Criteria
- [ ]



