---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-pr-autopilot\references\01-request-review.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-pr-autopilot\references\01-request-review.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.copilot-pr-autopilot.references.01-request-review.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-pr-autopilot\references\01-request-review.md'
source_file: '01-request-review.md'
source_sha256: 'f750010b97d28e94df77d8764c14ea709a1d41eaec45a9347180b36c6bcb897b'
generated: true
---

# `01-request-review.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-pr-autopilot\references\01-request-review.md`
> SHA-256: `f750010b97d28e94df77d8764c14ea709a1d41eaec45a9347180b36c6bcb897b`

````markdown
# Step 1: Request review

Owner: **parent** (no sub-agent); budget: n/a.

## Inputs

- `PrNumber` for the target PR.

## Return contract

- Captured `baseline` = `LatestCopilotReview.submittedAt` string (or empty)
  to be passed to step 2.
- Boolean `single_iteration_mode` — `true` if the trigger failed because
  Copilot isn't a valid reviewer; `false` otherwise.

## Procedure

1. Snapshot first to learn whether Copilot is already pending:

   ```pwsh
   $snap = pwsh ./scripts/02-check-review-status.ps1 -PrNumber <n>
   $baseline = if ($snap -match '"submittedAt":"([^"]+)"') { $Matches[1] } else { '' }
   $pending  = ($snap -match '"CopilotPending":true')
   ```

   Regex on raw JSON keeps `submittedAt` a string across the
   parent → sub-agent boundary on any PS version (5.1 / 7.x), avoiding
   `[datetime]` rebinding.

2. **If `$pending`** — skip the trigger; jump to step 2 with `baseline`.

3. **Else** — fire the trigger:

   ```pwsh
   pwsh ./scripts/01-request-review.ps1 -PrNumber <n>
   ```

   The script keeps its own `InFlight` short-circuit as a safety net,
   but the canonical "is Copilot pending?" signal lives in
   `02-check-review-status.ps1` (above).

4. If `01-request-review.ps1` throws because Copilot isn't a valid
   reviewer (Copilot Code Review not enabled on the repo / account),
   take the [single-iteration fallback](orchestration.md#single-iteration-fallback).

````