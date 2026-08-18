---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\github-actions-efficiency\references\reporting.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\github-actions-efficiency\references\reporting.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.github-actions-efficiency.references.reporting.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\github-actions-efficiency\references\reporting.md'
source_file: 'reporting.md'
source_sha256: '18eec5acd0d9e52b450f86b8232e9994c5c5b7760240bcb2e97417f8a847508c'
generated: true
---

# `reporting.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\github-actions-efficiency\references\reporting.md`
> SHA-256: `18eec5acd0d9e52b450f86b8232e9994c5c5b7760240bcb2e97417f8a847508c`

```markdown
# Efficiency Reporting and Follow-Up Review

Load this reference when the user asks what changed, wants a before/after report, or asks for another pass over remaining expensive jobs.

## Reporting Rules

- Separate expected savings from measured savings.
- Do not claim exact time or cost savings without before/after run data.
- Call out confounders such as cache warm-up, changed matrix breadth, runner changes, or unusually small PRs.

Use this phrasing when data is incomplete:

`I can report the efficiency mechanisms that changed, but I cannot honestly claim exact minutes saved without comparing before/after GitHub Actions runs.`

## What To Measure

Gather:

1. A baseline sample before the change
2. A post-change sample after caches warm
3. Per-workflow or per-job duration comparisons
4. Avoided runs, skipped jobs, or avoided matrix legs

Always separate:

- PR wall-clock time
- Total runner time across jobs
- Work avoided entirely

These answer different questions. A change can reduce runner spend without materially improving the fastest feedback path.

## Follow-Up Review Pass

After the first round of fixes is validated, inspect the remaining expensive jobs:

- Compare setup time versus execution time
- Identify heavyweight wrapper actions and confirm what they really enforce
- Review whether each matrix dimension still serves an active decision
- Recheck after caches warm
- Break down the dominant slow step before proposing further changes

Keep the follow-up compact. Report the next few highest-value opportunities, not a long wishlist.

```