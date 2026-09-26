---
type: task
status: backlog
priority: normal
created: {{date:YYYY-MM-DD}}
updated: {{date:YYYY-MM-DD}}
---
# {{title}}

> [!info] Purpose
> Record the source, decision context, and intended outcome before execution. Keep human-authored sections intact during generated refresh.


## Owner controls
- Status: `INPUT[select(option(backlog), option(ready), option(in-progress), option(blocked), option(done), option(cancelled)):status]`
- Priority: `INPUT[select(option(none), option(low), option(normal), option(high)):priority]` · Due: `INPUT[date:due]` · Scheduled: `INPUT[date:scheduled]`
- Estimate: `INPUT[number:estimate]` · Blocker: `INPUT[text:blocker]` · Mastery: `INPUT[number:mastery]` · Confidence: `INPUT[number:confidence]`

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
