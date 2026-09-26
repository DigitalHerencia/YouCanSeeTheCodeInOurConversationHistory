---
type: project
status: backlog
created: {{date:YYYY-MM-DD}}
updated: {{date:YYYY-MM-DD}}
---
# {{VALUE}}

> [!info] Purpose
> Record the source, decision context, and intended outcome before execution. Keep human-authored sections intact during generated refresh.


## Owner controls
- Status: `INPUT[select(option(backlog), option(active), option(done), option(archived)):status]`
- Priority: `INPUT[select(option(none), option(low), option(normal), option(high)):priority]`
- Target start: `INPUT[date:target_start]` · Target end: `INPUT[date:target_end]`
- Current focus: `INPUT[text:current_focus]` · Blocker: `INPUT[text:blocker]`
- Code Lab enabled: `INPUT[toggle:codelab_enabled]`

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

<%* await tp.user.hearth_create_project(tp); tR += ""; %>
