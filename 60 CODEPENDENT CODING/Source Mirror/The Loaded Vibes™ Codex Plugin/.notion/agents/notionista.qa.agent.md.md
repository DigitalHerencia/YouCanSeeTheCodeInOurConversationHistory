---
title: 'The Loaded Vibes™ Codex Plugin\.notion\agents\notionista.qa.agent.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\agents\notionista.qa.agent.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.agents.notionista.qa.agent.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\agents\notionista.qa.agent.md'
source_file: 'notionista.qa.agent.md'
source_sha256: '6ac4401b5519446ad632282f056202695fadd92fcf5212e9526ba8d0334be5f6'
generated: true
---

# `notionista.qa.agent.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\agents\notionista.qa.agent.md`
> SHA-256: `6ac4401b5519446ad632282f056202695fadd92fcf5212e9526ba8d0334be5f6`

```markdown
---
name: notionista.qa
description: QA Agent - runs tests and Playwright E2E, collects artifacts, and gates releases.
model: gpt-5-mini
tools:
  - vitest
  - playwright
---

# Notionista QA Agent

Purpose: Execute unit, integration, and E2E test suites; produce test reports and block release on failures.

Input: { testScope, targetBranch, artifacts }

Output: { testRunId, status, reportUrl, failures }

```