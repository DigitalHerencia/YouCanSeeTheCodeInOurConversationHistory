---
type: document
document_type: validation-report
id: <% tp.user.hearthId(tp, "{{TITLE}}") %>
project: <% tp.user.hearthProject(tp) %>
status: draft
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - type/document
  - type/evidence
---

# Validation Report — {{TITLE}}

## Scope

## Commands Executed
| Command | Revision | Environment | Result | Limits |
|---|---|---|---|---|

## Findings

## Human controls
Status: `INPUT[select(option(draft), option(review), option(approved), option(superseded), option(archived)):status]` · Review status: `INPUT[select(option(pending), option(in-review), option(approved), option(rejected)):review_status]`

## Acceptance Mapping
| Acceptance criterion | Evidence |
|---|---|

## Result



