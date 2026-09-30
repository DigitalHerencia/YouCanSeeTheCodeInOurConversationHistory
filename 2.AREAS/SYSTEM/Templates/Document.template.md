---
type: document
document_type: document
id: <% tp.user.hearthId(tp, "{{TITLE}}") %>
project: <% tp.user.hearthProject(tp) %>
status: draft
authority: project-specific
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - type/document
---
# {{TITLE}}

## Purpose
What durable decision, requirement, specification, or report does this document own?

## Source Context
- Project:
- Milestone:
- Phase:
- Upstream documents:
- Source requirements:

## Content

## Decisions and Invariants

## Human controls
Status: `INPUT[select(option(draft), option(review), option(approved), option(superseded), option(archived)):status]` · Review status: `INPUT[select(option(pending), option(in-review), option(approved), option(rejected)):review_status]`

## Acceptance Criteria
- [ ] The document's purpose is satisfied.
- [ ] Required upstream context is linked.
- [ ] Claims have an identified source or rationale.

## Downstream Use
- Implemented by:
- Validated by:
- Handoff to:

## Evidence




