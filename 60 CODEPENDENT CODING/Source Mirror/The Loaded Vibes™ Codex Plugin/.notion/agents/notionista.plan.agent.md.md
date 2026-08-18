---
title: 'The Loaded Vibes™ Codex Plugin\.notion\agents\notionista.plan.agent.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\agents\notionista.plan.agent.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.agents.notionista.plan.agent.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\agents\notionista.plan.agent.md'
source_file: 'notionista.plan.agent.md'
source_sha256: 'c7eb9f597b930e698db2dd26490047092cc784efc801f84c20741199186086ac'
generated: true
---

# `notionista.plan.agent.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\agents\notionista.plan.agent.md`
> SHA-256: `c7eb9f597b930e698db2dd26490047092cc784efc801f84c20741199186086ac`

```markdown
---
name: notionista.plan.agent
description: Plan Agent for Notionista - decomposes requests into actionable plans and delegates to Planner/QA/Release agents.
model: gpt-5-mini
tools:
  - read-only-workspace
  - git-metadata
  - file-system
---

# Notionista Plan Agent

Purpose: Produce prioritized, testable plans (JSON) and delegate to downstream agents. When plans include Notion writes, create an approval proposal and block until human approval is recorded.

Input: { "request": "string", "priority": "low|medium|high", "target": "notion|docs|release" }

Output: plan JSON with tasks and approvalRequired flag.

Handoff: Calls Notion Planner with planId and tasks. For write actions, create a draft PR and wait for approval.

```