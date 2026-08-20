---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-pr-autopilot\references\07-commit-push.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-pr-autopilot\references\07-commit-push.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.copilot-pr-autopilot.references.07-commit-push.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-pr-autopilot\references\07-commit-push.md'
source_file: '07-commit-push.md'
source_sha256: 'ac013bb81c9f88e23add1241512024f29101bb7effe19f5bc7af9a5a0560dee4'
generated: true
---

# `07-commit-push.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\copilot-pr-autopilot\references\07-commit-push.md`
> SHA-256: `ac013bb81c9f88e23add1241512024f29101bb7effe19f5bc7af9a5a0560dee4`

```markdown
# Step 7: Commit and push

Owner: **parent** (no sub-agent); budget: n/a.

## Inputs

- The fix results from step 5 and the green build from step 6.

## Return contract

- Pushed `HeadOid` (the new commit SHA), recorded for step 8 reply
  bodies and step 9 convergence proof.

## Procedure

- Parent runs `git commit` + `git push` directly. One focused commit
  per round — bundling rounds destroys the audit trail of which finding
  drove which change and breaks `git bisect`.
- Include the trailer:
  `Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>`.
- Record the pushed SHA so step 8 can cite it in every reply body and
  step 9 can compare it against `LatestCopilotReview.commitOid`.

```