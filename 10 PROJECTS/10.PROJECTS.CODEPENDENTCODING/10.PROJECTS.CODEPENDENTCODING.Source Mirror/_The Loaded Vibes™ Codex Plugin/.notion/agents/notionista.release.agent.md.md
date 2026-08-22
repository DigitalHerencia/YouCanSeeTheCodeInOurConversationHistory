---
title: 'The Loaded Vibes™ Codex Plugin\.notion\agents\notionista.release.agent.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\agents\notionista.release.agent.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.agents.notionista.release.agent.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\agents\notionista.release.agent.md'
source_file: 'notionista.release.agent.md'
source_sha256: 'c54265703a17247636ec966ff6a85bd419efdb4db38c3adae70a4433abb60f93'
generated: true
---

# `notionista.release.agent.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\agents\notionista.release.agent.md`
> SHA-256: `c54265703a17247636ec966ff6a85bd419efdb4db38c3adae70a4433abb60f93`

```markdown
---
name: notionista.release
description: Release Agent - prepares release branches, creates PRs, and triggers CI/CD for publish. Requires human approval for production releases.
model: gpt-5-mini
tools:
  - github-api
  - github-actions-trigger
---

# Notionista Release Agent

Purpose: Automate PR creation, attach test results, and trigger cloud CI/CD. Production deploys require explicit human approval via PR review label.

Input: { releaseType, changelog, artifacts, approvedBy }

Output: { prUrl, releaseNotesUrl, deployJobId }

```