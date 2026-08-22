---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\create-github-issue-feature-from-specification\SKILL.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\create-github-issue-feature-from-specification\SKILL.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.create-github-issue-feature-from-specification.skill.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\create-github-issue-feature-from-specification\SKILL.md'
source_file: 'SKILL.md'
source_sha256: '8398e075cb4a89daccef2bb003779eeeb199b24b8e319e11571e488fa0da8132'
generated: true
---

# `SKILL.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\create-github-issue-feature-from-specification\SKILL.md`
> SHA-256: `8398e075cb4a89daccef2bb003779eeeb199b24b8e319e11571e488fa0da8132`

```markdown
---
name: create-github-issue-feature-from-specification
description: 'Create GitHub Issue for feature request from specification file using feature_request.yml template.'
---

# Create GitHub Issue from Specification

Create GitHub Issue for the specification at `${file}`.

## Process

1. Analyze specification file to extract requirements
2. Check existing issues using `search_issues`
3. Create new issue using `create_issue` or update existing with `update_issue`
4. Use `feature_request.yml` template (fallback to default)

## Requirements

- Single issue for the complete specification
- Clear title identifying the specification
- Include only changes required by the specification
- Verify against existing issues before creation

## Issue Content

- Title: Feature name from specification
- Description: Problem statement, proposed solution, and context
- Labels: feature, enhancement (as appropriate)

```