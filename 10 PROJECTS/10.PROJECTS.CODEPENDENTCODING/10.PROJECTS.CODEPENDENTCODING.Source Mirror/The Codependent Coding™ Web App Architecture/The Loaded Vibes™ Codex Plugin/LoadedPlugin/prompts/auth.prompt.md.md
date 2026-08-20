---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\auth.prompt.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\auth.prompt.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.prompts.auth.prompt.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\auth.prompt.md'
source_file: 'auth.prompt.md'
source_sha256: '0fea649e5374d035656b8acc47bf51d763556594c7ac3f50e2fa70bd08b9bb5b'
generated: true
---

# `auth.prompt.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\auth.prompt.md`
> SHA-256: `0fea649e5374d035656b8acc47bf51d763556594c7ac3f50e2fa70bd08b9bb5b`

```markdown
---
name: "AuthDevCyclePrompt"
description: "Implement and harden Clerk auth, RBAC, and security flows."
argument-hint: "Summarize the auth scenario or issue you're targeting."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/auth.instructions.md"
toolset: "../toolsets/auth.toolset.jsonc"
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

# Auth DevCycle Prompt

You are starting the **Auth** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/auth.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/auth.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Review Authentication requirements and data dependencies.
- Plan middleware, helper utilities, and secrets updates.
- Confirm testing + documentation strategy for auth flows.

## Deliver back to the human reviewer
- Implementation plan for auth components.
- Clarifications about roles, onboarding, or compliance.
- List of validations/tests to run.

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```