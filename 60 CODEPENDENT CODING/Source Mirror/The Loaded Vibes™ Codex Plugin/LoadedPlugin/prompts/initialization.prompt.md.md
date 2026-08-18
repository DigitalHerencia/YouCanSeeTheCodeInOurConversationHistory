---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\initialization.prompt.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\initialization.prompt.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.prompts.initialization.prompt.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\initialization.prompt.md'
source_file: 'initialization.prompt.md'
source_sha256: 'ab3502b2b5ddd3bfbfe244e27d0a158425363d76910b281f24fa7be21c188ea4'
generated: true
---

# `initialization.prompt.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\initialization.prompt.md`
> SHA-256: `ab3502b2b5ddd3bfbfe244e27d0a158425363d76910b281f24fa7be21c188ea4`

```markdown
---
name: "InitializationDevCyclePrompt"
description: "Audit workspace readiness before other DevCycles."
argument-hint: "Specify the readiness checks or blockers you need investigated."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/initialization.instructions.md"
toolset: "../toolsets/initialization.toolset.jsonc"
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

# Initialization DevCycle Prompt

You are starting the **Initialization** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/initialization.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/initialization.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Audit VS Code extensions, MCP servers, and tasks from the toolset.
- Validate PRD and Tech Requirements sections before proceeding.
- Capture git status and outstanding changes for downstream DevCycles.

## Deliver back to the human reviewer
- Environment readiness plan and checklist.
- Questions or blockers requiring human decisions.
- Tasks to capture remediation work.

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```