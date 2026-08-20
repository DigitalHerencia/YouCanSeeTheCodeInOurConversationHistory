---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\context-engineering.instructions.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\context-engineering.instructions.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.instructions.context-engineering.instructions.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\context-engineering.instructions.md'
source_file: 'context-engineering.instructions.md'
source_sha256: '303780cee09b1707be6b2aa99ad2215514f2f76cbd2da59378194483dc6bf499'
generated: true
---

# `context-engineering.instructions.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\instructions\context-engineering.instructions.md`
> SHA-256: `303780cee09b1707be6b2aa99ad2215514f2f76cbd2da59378194483dc6bf499`

```markdown
---
description: 'Guidelines for structuring code and projects to maximize GitHub Copilot effectiveness through better context management'
applyTo: '**'
---

# Context Engineering

Principles for helping GitHub Copilot understand your codebase and provide better suggestions.

## Project Structure

- **Use descriptive file paths**: `src/auth/middleware.ts` > `src/utils/m.ts`. Copilot uses paths to infer intent.
- **Colocate related code**: Keep components, tests, types, and hooks together. One search pattern should find everything related.
- **Export public APIs from index files**: What's exported is the contract; what's not is internal. This helps Copilot understand boundaries.

## Code Patterns

- **Prefer explicit types over inference**: Type annotations are context. `function getUser(id: string): Promise<User>` tells Copilot more than `function getUser(id)`.
- **Use semantic names**: `activeAdultUsers` > `x`. Self-documenting code is AI-readable code.
- **Define constants**: `MAX_RETRY_ATTEMPTS = 3` > magic number `3`. Named values carry meaning.

## Working with Copilot

- **Keep relevant files open in tabs**: Copilot uses open tabs as context signals. Working on auth? Open auth-related files.
- **Position cursor intentionally**: Copilot prioritizes code near your cursor. Put cursor where context matters.
- **Use Copilot Chat for complex tasks**: Inline completions have minimal context. Chat mode sees more files.

## Context Hints

- **Add a COPILOT.md file**: Document architecture decisions, patterns, and conventions Copilot should follow.
- **Use strategic comments**: At the top of complex modules, briefly describe the flow or purpose.
- **Reference patterns explicitly**: "Follow the same pattern as `src/api/users.ts`" gives Copilot a concrete example.

## Multi-File Changes

- **Describe scope first**: Tell Copilot all files involved before asking for changes. "I need to update the User model, API endpoint, and tests."
- **Work incrementally**: One file at a time, verifying each change. Don't ask for everything at once.
- **Check understanding**: Ask "What files would you need to see?" before complex refactors.

## When Copilot Struggles

- **Missing context**: Open the relevant files in tabs, or explicitly paste code snippets.
- **Stale suggestions**: Copilot may not see recent changes. Re-open files or restart the session.
- **Generic answers**: Be more specific. Add constraints, mention frameworks, reference existing code.

```