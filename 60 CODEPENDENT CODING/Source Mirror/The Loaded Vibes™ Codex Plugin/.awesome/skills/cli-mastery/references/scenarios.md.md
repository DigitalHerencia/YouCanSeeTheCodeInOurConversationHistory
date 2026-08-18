---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\cli-mastery\references\scenarios.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\cli-mastery\references\scenarios.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.cli-mastery.references.scenarios.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\cli-mastery\references\scenarios.md'
source_file: 'scenarios.md'
source_sha256: 'fc2bea675c2cdb7d484cb7e9f02701816f8ac05bfb3a56eb76e7a9f4e0b9e79d'
generated: true
---

# `scenarios.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\cli-mastery\references\scenarios.md`
> SHA-256: `fc2bea675c2cdb7d484cb7e9f02701816f8ac05bfb3a56eb76e7a9f4e0b9e79d`

```markdown
# Scenario Challenges

Present these as real-world situations. Ask the user what commands/shortcuts they'd use.
Use `ask_user` with choices for each step.

## Scenario 1: Hotfix Review Under Pressure
> A production bug fix is ready. You need to inspect the diff, run code review, and keep sensitive data hidden because you're on a livestream.

**Answer:** `/streamer-mode` → `/diff` → `/review @src/payment.ts`

## Scenario 2: Context Window Rescue
> Your session is huge and model quality is dropping. Keep continuity while shrinking noise.

**Answer:** `/context` → `/compact` → `/resume` (or restart with `--continue`)

## Scenario 3: Autonomous Refactor Sprint
> You want an agent to execute a refactor with minimal prompts, but only after reviewing a plan and setting permissions.

**Answer:** `Shift+Tab` (Plan mode) → validate plan → `/allow-all` → execute in Autopilot mode

## Scenario 4: Enterprise Onboarding
> Set up custom agents, repo instructions, and MCP integration for a new team repository.

**Answer:** Add agent profiles to `.github/agents/`, verify `/instructions`, then `/mcp add`

## Scenario 5: Power Editing Session
> You're crafting a long prompt and need to edit quickly without losing context.

**Answer:** `Ctrl+G` (open in editor), `Ctrl+A` (jump to start), `Ctrl+K` (trim)

## Scenario 6: Agent Orchestration
> You're leading a complex project: understand code, run tests, refactor, then review.

**Answer:** `explore` agent (understand) → `task` agent (tests) → `general-purpose` (refactor) → `code-review` (verify)

## Scenario 7: New Project Setup
> You cloned a new repo and need to set up Copilot CLI for max productivity.

**Answer:** `/init` → `/model` → `/mcp add` (if needed) → `Shift+Tab` to Plan mode for first task

## Scenario 8: Production Safety
> Switching from boilerplate work to production deployment scripts.

**Answer:** `/reset-allowed-tools` → Plan mode → `/review` before every commit

```