---
type: project
status: backlog
priority: normal
created: {{date:YYYY-MM-DD}}
updated: {{date:YYYY-MM-DD}}
---
# {{title}}

> [!info] Purpose
> Record the source, decision context, and intended outcome before execution. Keep human-authored sections intact during generated refresh.


## Owner controls
- Status: `INPUT[select(option(backlog), option(ready), option(in-progress), option(done), option(blocked)):status]`
- Sprint: `INPUT[text:sprint]` · Risk: `INPUT[select(option(unknown), option(low), option(medium), option(high)):risk]`

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
