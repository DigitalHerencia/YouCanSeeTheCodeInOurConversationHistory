---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-pr-autopilot\templates\reply-decline.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-pr-autopilot\templates\reply-decline.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.copilot-pr-autopilot.templates.reply-decline.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-pr-autopilot\templates\reply-decline.md'
source_file: 'reply-decline.md'
source_sha256: 'bb2012270ef967146ea45fb415971113f36b7c9ad0d1a83d3b25ba5102188c2a'
generated: true
---

# `reply-decline.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-pr-autopilot\templates\reply-decline.md`
> SHA-256: `bb2012270ef967146ea45fb415971113f36b7c9ad0d1a83d3b25ba5102188c2a`

````markdown
# Reply: declined with rationale

Use when triage decided `decline`. The reply must explain WHY
declining is the right call — not just that you considered it. Always
resolve the thread after replying; an open thread with no reply
signals avoidance.

```
Considered this, but declining: <concrete reason rooted in code or
design>. <Optional: the interleaving / scenario you ruled out, or
the alternative cost>. Happy to revisit if <specific trigger>.
```

Example (domain-neutral):

> Considered extending the lock into the initialization path, but
> declining: initialization runs to completion before any concurrent
> caller can reach this code, so the race window only opens after
> the init callback has returned. Sharing the lock across modules
> costs more in coupling than the actual exposure justifies. Happy
> to revisit if telemetry shows a real interleaving.

````