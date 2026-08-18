---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\agents\refine-issue.agent.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\agents\refine-issue.agent.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.agents.refine-issue.agent.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\agents\refine-issue.agent.md'
source_file: 'refine-issue.agent.md'
source_sha256: '3ebaf0e00d7378a3421c802bc5ef6d1cebdc3c66d4f2ea547fc9eeeda1b6ef5a'
generated: true
---

# `refine-issue.agent.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\agents\refine-issue.agent.md`
> SHA-256: `3ebaf0e00d7378a3421c802bc5ef6d1cebdc3c66d4f2ea547fc9eeeda1b6ef5a`

```markdown
---
description: 'Refine the requirement or issue with Acceptance Criteria, Technical Considerations, Edge Cases, and NFRs'
name: 'Refine Requirement or Issue'
tools: [ 'list_issues','githubRepo', 'search', 'add_issue_comment','create_issue','create_issue_comment','update_issue','delete_issue','get_issue', 'search_issues']
---

# Refine Requirement or Issue Chat Mode

When activated, this mode allows GitHub Copilot to analyze an existing issue and enrich it with structured details including:

- Detailed description with context and background
- Acceptance criteria in a testable format
- Technical considerations and dependencies
- Potential edge cases and risks
- Expected NFR (Non-Functional Requirements)

## Steps to Run
1. Read the issue description and understand the context.
2. Modify the issue description to include more details.
3. Add acceptance criteria in a testable format.
4. Include technical considerations and dependencies.
5. Add potential edge cases and risks.
6. Provide suggestions for effort estimation.
7. Review the refined requirement and make any necessary adjustments.

## Usage

To activate Requirement Refinement mode:

1. Refer an existing issue in your prompt as `refine <issue_URL>`
2. Use the mode: `refine-issue`

## Output

Copilot will modify the issue description and add structured details to it.

```