---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\cli-mastery\references\module-4-agents.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\cli-mastery\references\module-4-agents.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.cli-mastery.references.module-4-agents.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\cli-mastery\references\module-4-agents.md'
source_file: 'module-4-agents.md'
source_sha256: '7a0c25edc4e3186003afab6c9d9a10bd26afb915a396f5e661127053da7cd428'
generated: true
---

# `module-4-agents.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\cli-mastery\references\module-4-agents.md`
> SHA-256: `7a0c25edc4e3186003afab6c9d9a10bd26afb915a396f5e661127053da7cd428`

````markdown
# Module 4: Agent System

## Built-in Agents

| Agent | Model | Best For | Key Trait |
|-------|-------|----------|-----------|
| `explore` | Haiku | Fast codebase Q&A | Read-only, <300 words, safe to parallelize |
| `task` | Haiku | Running commands (tests, builds, lints) | Brief on success, verbose on failure |
| `general-purpose` | Sonnet | Complex multi-step tasks | Full toolset, separate context window |
| `code-review` | Sonnet | Analyzing code changes | Never modifies code, high signal-to-noise |

## Custom Agents — define your own in Markdown

| Level | Location | Scope |
|-------|----------|-------|
| Personal | `~/.copilot/agents/*.md` | All your projects |
| Project | `.github/agents/*.md` | Everyone on this repo |
| Organization | `.github-private/agents/` in org repo | Entire org |

## Agent file anatomy

```markdown
---
name: my-agent
description: What this agent does
tools:
  - bash
  - edit
  - view
---

# Agent Instructions
Your detailed behavior instructions here.
```

## Agent orchestration patterns

1. **Fan-out exploration** — Launch multiple `explore` agents in parallel to answer different questions simultaneously
2. **Pipeline** — `explore` → understand → `general-purpose` → implement → `code-review` → verify
3. **Specialist handoff** — Identify task → `/agent` to pick specialist → review with `/fleet` or `/tasks`

Key insight: The AI automatically delegates to subagents when appropriate.

````