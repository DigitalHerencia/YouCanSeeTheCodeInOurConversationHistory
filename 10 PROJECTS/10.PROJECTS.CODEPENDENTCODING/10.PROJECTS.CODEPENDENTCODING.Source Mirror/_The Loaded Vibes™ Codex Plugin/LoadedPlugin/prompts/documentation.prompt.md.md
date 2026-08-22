---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\documentation.prompt.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\documentation.prompt.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.prompts.documentation.prompt.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\documentation.prompt.md'
source_file: 'documentation.prompt.md'
source_sha256: '832c0135b65e07a18f963fe37af52fb00e2ad6b0fd4b5ba307d035ae370903ff'
generated: true
---

# `documentation.prompt.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\documentation.prompt.md`
> SHA-256: `832c0135b65e07a18f963fe37af52fb00e2ad6b0fd4b5ba307d035ae370903ff`

```markdown
---
name: "DocumentationDevCyclePrompt"
description: "Produce or update docs, runbooks, and support guides."
argument-hint: "List the documents or sections needing updates."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/documentation.instructions.md"
toolset: "../toolsets/documentation.toolset.jsonc"
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

# Documentation DevCycle Prompt

You are starting the **Documentation** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/documentation.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/documentation.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Identify doc gaps vs PRD/TechReq + latest code.
- Plan updates across README, SUPPORT, SECURITY, templates.
- Set validation approach (lint/preview).

## Deliver back to the human reviewer
- Documentation task inventory.
- Questions about tone, structure, or approvals.
- Plan for validation + changelog updates.

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```