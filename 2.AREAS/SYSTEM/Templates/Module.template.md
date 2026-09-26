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
- Mastery state: `INPUT[select(option(not-started), option(in-progress), option(mastered), option(review)):mastery_state]` · Mastery: `INPUT[number:mastery]`
- Confidence: `INPUT[number:confidence]` · Last attempted: `INPUT[date:last_attempted]` · Next review: `INPUT[date:next_review]`

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
