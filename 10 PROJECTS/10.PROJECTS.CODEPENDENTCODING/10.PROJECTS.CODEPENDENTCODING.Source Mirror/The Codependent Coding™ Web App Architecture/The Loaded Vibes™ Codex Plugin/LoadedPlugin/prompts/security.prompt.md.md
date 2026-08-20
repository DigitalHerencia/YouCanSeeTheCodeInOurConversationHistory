---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\security.prompt.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\security.prompt.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.prompts.security.prompt.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\security.prompt.md'
source_file: 'security.prompt.md'
source_sha256: 'e8adf8550733ff97c62437d4768256766d47ae11b9816f6b9abecd9dd676fff9'
generated: true
---

# `security.prompt.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\security.prompt.md`
> SHA-256: `e8adf8550733ff97c62437d4768256766d47ae11b9816f6b9abecd9dd676fff9`

```markdown
---
name: "SecurityDevCyclePrompt"
description: "Assess and harden security posture and compliance controls."
argument-hint: "Describe the threats or controls to focus on."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/security.instructions.md"
toolset: "../toolsets/security.toolset.jsonc"
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

# Security DevCycle Prompt

You are starting the **Security** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/security.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/security.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Review security requirements, previous findings, and dependencies.
- Plan scans, reviews, and code changes allowed by toolset.
- Outline reporting for risks + mitigations.

## Deliver back to the human reviewer
- Security audit checklist.
- Risk register updates with owners.
- Questions needing approval/clarification.

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```