---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\playwright-generate-test\SKILL.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\playwright-generate-test\SKILL.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.playwright-generate-test.skill.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\playwright-generate-test\SKILL.md'
source_file: 'SKILL.md'
source_sha256: '79dbb1a49fc5a6502788ccba1a4bd30769a017a1cc31d9db329d1326ea3d898f'
generated: true
---

# `SKILL.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\playwright-generate-test\SKILL.md`
> SHA-256: `79dbb1a49fc5a6502788ccba1a4bd30769a017a1cc31d9db329d1326ea3d898f`

```markdown
---
name: playwright-generate-test
description: 'Generate a Playwright test based on a scenario using Playwright MCP'
---

# Test Generation with Playwright MCP

Your goal is to generate a Playwright test based on the provided scenario after completing all prescribed steps.

## Specific Instructions

- You are given a scenario, and you need to generate a playwright test for it. If the user does not provide a scenario, you will ask them to provide one.
- DO NOT generate test code prematurely or based solely on the scenario without completing all prescribed steps.
- DO run steps one by one using the tools provided by the Playwright MCP.
- Only after all steps are completed, emit a Playwright TypeScript test that uses `@playwright/test` based on message history
- Save generated test file in the tests directory
- Execute the test file and iterate until the test passes

```