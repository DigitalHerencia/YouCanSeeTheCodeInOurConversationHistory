---
title: 'The Loaded Vibes™ Codex Plugin\.notion\agents\notion.notifier.agent.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\agents\notion.notifier.agent.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.agents.notion.notifier.agent.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\agents\notion.notifier.agent.md'
source_file: 'notion.notifier.agent.md'
source_sha256: 'ce5792c97400c58376ce35bbd903adf5360d7e5a35020b83f50307c9d8bb2f65'
generated: true
---

# `notion.notifier.agent.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\agents\notion.notifier.agent.md`
> SHA-256: `ce5792c97400c58376ce35bbd903adf5360d7e5a35020b83f50307c9d8bb2f65`

```markdown
---
name: notion.notifier
description: Notion Notifier - background notifier for orchestration events (PRs, approvals, executions, failures).
model: gpt-5-mini
tools:
  - http-webhook
  - github-api
---

# Notion Notifier

Purpose: Deliver notifications to configured channels (Slack, GitHub PR comments) for important events. Respects opt-out lists and rate limits.

Input: { eventType, payload, channels }

Output: { delivered, channelsSucceeded, channelsFailed }

```