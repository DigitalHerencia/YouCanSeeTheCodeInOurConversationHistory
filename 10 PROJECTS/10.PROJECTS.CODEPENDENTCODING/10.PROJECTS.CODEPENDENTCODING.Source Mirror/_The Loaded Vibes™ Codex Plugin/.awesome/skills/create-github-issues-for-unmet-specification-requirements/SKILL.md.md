---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\create-github-issues-for-unmet-specification-requirements\SKILL.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\create-github-issues-for-unmet-specification-requirements\SKILL.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.create-github-issues-for-unmet-specification-requirements.skill.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\create-github-issues-for-unmet-specification-requirements\SKILL.md'
source_file: 'SKILL.md'
source_sha256: '403939f1a02b5d08c571dc9f973bdb98a87b4f84b5e4fbe5b93284f78472b299'
generated: true
---

# `SKILL.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\create-github-issues-for-unmet-specification-requirements\SKILL.md`
> SHA-256: `403939f1a02b5d08c571dc9f973bdb98a87b4f84b5e4fbe5b93284f78472b299`

```markdown
---
name: create-github-issues-for-unmet-specification-requirements
description: 'Create GitHub Issues for unimplemented requirements from specification files using feature_request.yml template.'
---

# Create GitHub Issues for Unmet Specification Requirements

Create GitHub Issues for unimplemented requirements in the specification at `${file}`.

## Process

1. Analyze specification file to extract all requirements
2. Check codebase implementation status for each requirement
3. Search existing issues using `search_issues` to avoid duplicates
4. Create new issue per unimplemented requirement using `create_issue`
5. Use `feature_request.yml` template (fallback to default)

## Requirements

- One issue per unimplemented requirement from specification
- Clear requirement ID and description mapping
- Include implementation guidance and acceptance criteria
- Verify against existing issues before creation

## Issue Content

- Title: Requirement ID and brief description
- Description: Detailed requirement, implementation method, and context
- Labels: feature, enhancement (as appropriate)

## Implementation Check

- Search codebase for related code patterns
- Check related specification files in `/spec/` directory
- Verify requirement isn't partially implemented

```