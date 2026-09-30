---
type: resource
id: <% tp.user.hearthId(tp, "{{TITLE}}") %>
resource_type:
resource_state: triage
source_kind:
authority:
resource_role:
source_url:
creator:
published:
accessed:
version:
license:
project_links: []
knowledge_links: []
codelab_links: []
related_patterns: []
last_verified:
review_due:
superseded_by:
capture_source:
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - type/resource
---

# {{TITLE}}

## Human controls
State: `INPUT[select(option(inbox), option(triage), option(active), option(reference), option(retained), option(superseded), option(archived)):resource_state]` · Authority: `INPUT[select(option(canonical), option(authoritative), option(supporting), option(exploratory)):authority]` · Role: `INPUT[select(option(evidence), option(reference), option(tutorial), option(pattern), option(inspiration), option(source), option(dependency), option(example)):resource_role]` · Review: `INPUT[date:review_due]`

## Source
- URL:
- Creator:
- Published:
- Accessed:

## Why Retained

## Key Claims
- 

## Useful Notes
- 

## Linked Knowledge

## Applied To

## Verification
- Authority:
- Version:
- Last verified:
- Review due:




