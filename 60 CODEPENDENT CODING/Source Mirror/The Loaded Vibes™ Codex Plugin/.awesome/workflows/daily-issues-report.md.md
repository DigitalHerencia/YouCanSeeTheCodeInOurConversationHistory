---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\workflows\daily-issues-report.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\workflows\daily-issues-report.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.workflows.daily-issues-report.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\workflows\daily-issues-report.md'
source_file: 'daily-issues-report.md'
source_sha256: '39682f8217a86fc24d59ad1dc336720b7020039019d21cf93e099d7cdbd444d2'
generated: true
---

# `daily-issues-report.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\workflows\daily-issues-report.md`
> SHA-256: `39682f8217a86fc24d59ad1dc336720b7020039019d21cf93e099d7cdbd444d2`

```markdown
---
name: "Daily Issues Report"
description: "Generates a daily summary of open issues and recent activity as a GitHub issue"
on:
  schedule: daily on weekdays
permissions:
  contents: read
  issues: read
safe-outputs:
  create-issue:
    title-prefix: "[daily-report] "
    labels: [report]
---

## Daily Issues Report

Create a daily summary of open issues for the team.

## What to Include

- New issues opened in the last 24 hours
- Issues closed or resolved
- Stale issues that need attention

```