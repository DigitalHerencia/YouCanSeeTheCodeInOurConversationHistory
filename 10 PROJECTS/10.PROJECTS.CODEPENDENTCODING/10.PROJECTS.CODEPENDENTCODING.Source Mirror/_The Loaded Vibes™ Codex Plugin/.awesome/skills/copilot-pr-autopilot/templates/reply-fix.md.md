---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-pr-autopilot\templates\reply-fix.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-pr-autopilot\templates\reply-fix.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.copilot-pr-autopilot.templates.reply-fix.md'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-loaded-vibes-codex-plugin
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-pr-autopilot\templates\reply-fix.md'
source_file: 'reply-fix.md'
source_sha256: 'aea9fb3e05deac3b8b169dc69fd0ffd0be77a7c920840d68d117452eaa5d794c'
generated: true
---

# `reply-fix.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-pr-autopilot\templates\reply-fix.md`
> SHA-256: `aea9fb3e05deac3b8b169dc69fd0ffd0be77a7c920840d68d117452eaa5d794c`

````markdown
# Reply: accepted fix

Use after the loop has committed and pushed a fix for the finding. Cite
the pushed commit SHA from step 7.

```
<one sentence acknowledging the finding>.
<one or two sentences describing the fix>.
Fixed in <commit-sha>.
```

Example (language-neutral):

> The lock did not cover the install side of the path, so two
> parallel writers could read the same baseline and clobber each
> other. Promoted the per-instance lock to a process-wide
> function-local static so all read-modify-write paths share it.
> Fixed in abc1234.

When the fix is in a tested area, add a one-line test confirmation:

> Replaced the platform UUID dependency with a PID + monotonic-clock
> + atomic counter so the test target no longer pulls in the
> platform UUID library. All 42 tests in the affected suite still
> pass. Fixed in abc1234.

````