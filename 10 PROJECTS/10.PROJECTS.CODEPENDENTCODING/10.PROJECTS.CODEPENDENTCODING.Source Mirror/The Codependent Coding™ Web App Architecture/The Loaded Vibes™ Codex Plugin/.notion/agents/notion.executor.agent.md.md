---
title: 'The Loaded Vibes™ Codex Plugin\.notion\agents\notion.executor.agent.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\agents\notion.executor.agent.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.agents.notion.executor.agent.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\agents\notion.executor.agent.md'
source_file: 'notion.executor.agent.md'
source_sha256: '394fc67e1003526abfe342400cd6acb1b136ac8239cc35a38b824587709b3a9c'
generated: true
---

# `notion.executor.agent.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\agents\notion.executor.agent.md`
> SHA-256: `394fc67e1003526abfe342400cd6acb1b136ac8239cc35a38b824587709b3a9c`

```markdown
---
name: notion.executor
description: Notion Executor - executes approved Notion operations and writes audit logs.
model: gpt-5-mini
tools:
  - mcp_notionapi_API-patch-page
  - mcp_notionapi_API-post-page
  - local-audit-log
---

# Notion Executor

Purpose: Apply approved changes to Notion. Requires an approvalArtifact (PR number or explicit Approve token). Writes are idempotent and logged.

Input: { proposalId, approvalArtifact, operations }

Output: { executionId, results, failed, auditLogPath }

Handoff: On success notify Notion Dashboard Automation and Notion Notifier. On failure open issue and notify QA.

```