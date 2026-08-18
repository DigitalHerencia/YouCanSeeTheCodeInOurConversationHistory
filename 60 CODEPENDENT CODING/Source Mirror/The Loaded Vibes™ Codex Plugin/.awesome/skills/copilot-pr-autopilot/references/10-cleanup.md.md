---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-pr-autopilot\references\10-cleanup.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-pr-autopilot\references\10-cleanup.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.copilot-pr-autopilot.references.10-cleanup.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-pr-autopilot\references\10-cleanup.md'
source_file: '10-cleanup.md'
source_sha256: '4c6fe8af2b4237b379810b6ce96157beb9eff2e198e7429fb9574832cc968754'
generated: true
---

# `10-cleanup.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-pr-autopilot\references\10-cleanup.md`
> SHA-256: `4c6fe8af2b4237b379810b6ce96157beb9eff2e198e7429fb9574832cc968754`

````markdown
# Step 10: Cleanup outdated

Owner: **parent** (no sub-agent); budget: n/a. Runs **once, after
convergence** (step 9 returned `Converged: true`).

## Inputs

- `PrNumber` for the converged PR.

## Return contract

- None — step 10 is terminal. After it runs, the loop is complete and
  the parent calls `task_complete` with the convergence proof from
  step 9.

## Procedure

```pwsh
pwsh ./scripts/10-cleanup-outdated.ps1 -PrNumber <n>
```

Safety net only. Most loops converge with nothing to clean — outdated
threads should already have been replied + resolved in step 8 like any
other open thread. Unresolved state is the source of truth in the PR
UI; `10-cleanup-outdated.ps1` only catches strays.

````