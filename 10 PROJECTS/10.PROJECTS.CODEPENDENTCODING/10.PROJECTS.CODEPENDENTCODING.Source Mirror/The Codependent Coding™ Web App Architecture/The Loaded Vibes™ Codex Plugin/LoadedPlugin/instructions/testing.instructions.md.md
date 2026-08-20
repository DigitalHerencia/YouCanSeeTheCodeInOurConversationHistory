---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\instructions\testing.instructions.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\instructions\testing.instructions.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.instructions.testing.instructions.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\instructions\testing.instructions.md'
source_file: 'testing.instructions.md'
source_sha256: '6ace6d7cc44b3df2b1e33184fb44c038d3403f045ca9409c245314c974427992'
generated: true
---

# `testing.instructions.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\instructions\testing.instructions.md`
> SHA-256: `6ace6d7cc44b3df2b1e33184fb44c038d3403f045ca9409c245314c974427992`

````markdown
```instructions
---
name: testing.instructions
applyTo: "**"
description: "Instructions for the Testing DevCycle."
---

# Testing DevCycle Instructions

## 1. Purpose
- Establish automated testing strategy across unit, integration, and end-to-end suites.
- Generate or update Vitest + Playwright scaffolding, feature test plans, and coverage targets.

## 2. Responsibilities
### 2.1 Test Harness Configuration
- Ensure Vitest and Playwright configs reflect current routes, data seeds, and auth patterns (TechReq §3 DevCycle 7).
- Add npm scripts and CI hooks for running focused suites.

### 2.2 Test Authoring & Plans
- Implement or update tests covering new functionality, mapping each to PRD acceptance criteria.
- Produce test plans/checklists when full automation is not yet feasible.

### 2.3 Data & Auth Coordination
- Seed test data securely, aligning with Data + Auth DevCycles to avoid state drift.
- Stub external services responsibly; capture assumptions.

### 2.4 Reporting
- Capture test results, coverage summaries, and flake investigations for Validation DevCycle.
- Log TODOs for missing coverage or manual verification requirements.

## 3. Inputs
- Configured toolchain
- Feature specs and PRD acceptance criteria
- Data/Auth implementations
- Toolset for Testing cycle

## 4. Outputs
- Updated Vitest/Playwright configs and scripts
- New or revised test files and/or manual test plans
- Coverage or result summaries with links to logs/artifacts
- Tasks + changelog entry capturing testing status

## 5. Success Criteria
- Critical flows identified in PRD have automated or documented manual tests.
- Test suites run successfully (or failures triaged with action plan).
- Coverage gaps and manual steps are visible for Validation/Deploy DevCycles.

## 6. Error Handling
- Stop if tests cannot run due to configuration issues; coordinate with Configuration/Verification to resolve.
- Document flakiness and create follow-up tasks rather than silently retrying.

## 7. Toolset Hook
Use capabilities listed in `../toolsets/testing.toolset.jsonc` only.

## 8. Traceability
- WHEN new functionality or regressions require validation, THE SYSTEM SHALL execute this Testing DevCycle to enforce acceptance criteria (PRD §7.4, TechReq §3 DevCycle 7).
- WHEN coverage gaps persist, THE SYSTEM SHALL log mitigation tasks referencing PRD §8 and TechReq §7.
```

````