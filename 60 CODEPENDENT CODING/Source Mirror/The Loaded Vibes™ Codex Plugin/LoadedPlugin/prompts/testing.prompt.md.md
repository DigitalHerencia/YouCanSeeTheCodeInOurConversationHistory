---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\testing.prompt.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\testing.prompt.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.prompts.testing.prompt.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\testing.prompt.md'
source_file: 'testing.prompt.md'
source_sha256: 'cc1440c4e35a80e41f971bd8cb9d453031c987cf729b7e0e24cedf25b979638c'
generated: true
---

# `testing.prompt.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\testing.prompt.md`
> SHA-256: `cc1440c4e35a80e41f971bd8cb9d453031c987cf729b7e0e24cedf25b979638c`

```markdown
---
name: "TestingDevCyclePrompt"
description: "Plan and run Vitest/Playwright suites with coverage goals."
argument-hint: "Describe the tests or coverage gaps to address."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/testing.instructions.md"
toolset: "../toolsets/testing.toolset.jsonc"
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

# Testing DevCycle Prompt

You are starting the **Testing** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/testing.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/testing.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Inventory existing tests and coverage gaps.
- Plan new tests or manual plans tied to PRD acceptance criteria.
- Decide how to seed data/auth for deterministic tests.

## Deliver back to the human reviewer
- Detailed testing TODOs with owners or phases.
- List of environments/commands for execution.
- Questions about acceptance criteria or blockers.

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```