---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\create-github-issues-feature-from-implementation-plan\SKILL.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\create-github-issues-feature-from-implementation-plan\SKILL.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.create-github-issues-feature-from-implementation-plan.skill.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\create-github-issues-feature-from-implementation-plan\SKILL.md'
source_file: 'SKILL.md'
source_sha256: '6cc82a68a65904fed67fa7da9ae797f18b245bc9e1a6a3370a8af842dd0816d0'
generated: true
---

# `SKILL.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\create-github-issues-feature-from-implementation-plan\SKILL.md`
> SHA-256: `6cc82a68a65904fed67fa7da9ae797f18b245bc9e1a6a3370a8af842dd0816d0`

```markdown
---
name: create-github-issues-feature-from-implementation-plan
description: 'Create GitHub Issues from implementation plan phases using feature_request.yml or chore_request.yml templates.'
---

# Create GitHub Issue from Implementation Plan

Create GitHub Issues for the implementation plan at `${file}`.

## Process

1. Analyze plan file to identify phases
2. Check existing issues using `search_issues`
3. Create new issue per phase using `create_issue` or update existing with `update_issue`
4. Use `feature_request.yml` or `chore_request.yml` templates (fallback to default)

## Requirements

- One issue per implementation phase
- Clear, structured titles and descriptions
- Include only changes required by the plan
- Verify against existing issues before creation

## Issue Content

- Title: Phase name from implementation plan
- Description: Phase details, requirements, and context
- Labels: Appropriate for issue type (feature/chore)

```