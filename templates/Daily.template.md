---
type: daily
id: DLY-<% tp.date.now("YYYY-MM-DD") %>
tags: [type/daily]
created: <% tp.date.now("YYYY-MM-DD") %>
---

# <% tp.date.now("dddd, MMMM D, YYYY") %>

> [!info] Operating Snapshot
> Generated from current vault state. Human sections are preserved during refresh.

## Yesterday
<!-- HEARTH:GENERATED:YESTERDAY:START -->
<%* tR += await tp.user.hearth.dailyYesterday(tp); %>
<!-- HEARTH:GENERATED:YESTERDAY:END -->

## Today
<!-- HEARTH:GENERATED:TODAY:START -->
<%* tR += await tp.user.hearth.dailyToday(tp); %>
<!-- HEARTH:GENERATED:TODAY:END -->

## Blockers
<!-- HEARTH:GENERATED:BLOCKERS:START -->
<%* tR += await tp.user.hearth.dailyBlockers(tp); %>
<!-- HEARTH:GENERATED:BLOCKERS:END -->

## Deadlines & Reviews
<!-- HEARTH:GENERATED:DEADLINES:START -->
<%* tR += await tp.user.hearth.dailyDeadlines(tp); %>
<!-- HEARTH:GENERATED:DEADLINES:END -->

## Cadence
<!-- HEARTH:GENERATED:CADENCE:START -->
<%* tR += await tp.user.hearth.dailyCadence(tp); %>
<!-- HEARTH:GENERATED:CADENCE:END -->

## Current Work
<!-- HEARTH:GENERATED:WORK:START -->
<%* tR += await tp.user.hearth.dailyWorkContext(tp); %>
<!-- HEARTH:GENERATED:WORK:END -->

## Code Lab
<!-- HEARTH:GENERATED:CODELAB:START -->
<%* tR += await tp.user.hearth.dailyCodeLab(tp); %>
<!-- HEARTH:GENERATED:CODELAB:END -->

## Notes
<!-- HUMAN:NOTES:START -->

<!-- HUMAN:NOTES:END -->

## Shutdown
<!-- HUMAN:SHUTDOWN:START -->
What changed? What remains? What should start first next workday?

<!-- HUMAN:SHUTDOWN:END -->
