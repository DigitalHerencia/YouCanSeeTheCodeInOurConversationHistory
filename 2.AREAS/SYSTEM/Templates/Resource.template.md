---
type: resource
status: backlog
priority: normal
created: {{date:YYYY-MM-DD}}
updated: {{date:YYYY-MM-DD}}
---
# {{title}}

> [!info] Purpose
> Record the source, decision context, and intended outcome before execution. Keep human-authored sections intact during generated refresh.


## Owner controls
- State: `INPUT[select(option(inbox), option(processing), option(processed), option(archived)):resource_state]` · Authority: `INPUT[text:authority]`
- Role: `INPUT[text:resource_role]` · Review due: `INPUT[date:review_due]` · Superseded by: `INPUT[text:superseded_by]`

## Context and starter content
- Source / provenance: add the originating note, issue, or conversation.
- Outcome: state the observable result.
- Constraints and dependencies: link only verified relations.

## Acceptance criteria
- [ ] Outcome is explicit and reviewable.
- [ ] Required evidence or output is linked.

## Human input
<!-- hearth:human:start -->
Add owner-authored context here.
<!-- hearth:human:end -->

## Generated state
<!-- hearth:generated:start -->
Refreshed by Hearth.
<!-- hearth:generated:end -->
