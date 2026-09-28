---
type: document
document_type: RFC
id: <% tp.user.hearthId(tp, "{{TITLE}}") %>
project: <% tp.user.hearthProject(tp) %>
status: proposed
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags: [type/document, type/decision]
---
# RFC — {{TITLE}}

## Problem

## Proposal

## Alternatives
| Option | Tradeoffs | Evidence |
|---|---|---|

## Impact

## Migration / Rollout

## Risks

## Decision Record

## Human controls
Status: `INPUT[select(option(draft), option(review), option(approved), option(superseded), option(archived)):status]` · Review status: `INPUT[select(option(pending), option(in-review), option(approved), option(rejected)):review_status]`

## Acceptance Criteria
- [ ]



