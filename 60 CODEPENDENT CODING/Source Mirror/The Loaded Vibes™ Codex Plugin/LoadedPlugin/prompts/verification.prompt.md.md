---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\verification.prompt.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\verification.prompt.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.prompts.verification.prompt.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\verification.prompt.md'
source_file: 'verification.prompt.md'
source_sha256: '4537e8cadbad881983e76978092078df4c137dcfff1e1c6c4f717ad3d982930f'
generated: true
---

# `verification.prompt.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\verification.prompt.md`
> SHA-256: `4537e8cadbad881983e76978092078df4c137dcfff1e1c6c4f717ad3d982930f`

```markdown
---
name: "VerificationDevCyclePrompt"
description: "Perform integration and UAT checks before release."
argument-hint: "Describe the end-to-end scenario that needs verification."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/verification.instructions.md"
toolset: "../toolsets/verification.toolset.jsonc"
tools:
  [
    "filesystem/*",
    "githubRepo",
    "memory/*",
    "sequentialthinking/*",
    "runTests",
    "runTasks",
    "todos",
    "runSubagent"
  ]
---

# Verification DevCycle Prompt

You are starting the **Verification** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/verification.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/verification.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Load instructions/toolset and list commands you will run.
- Summarize expectations for pass/fail criteria.
- Plan how findings will be logged to todo/changelog.

## Deliver back to the human reviewer
- Execution plan for static checks.
- Questions about missing scripts or tooling gaps.
- Outline of reporting format for findings.

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```