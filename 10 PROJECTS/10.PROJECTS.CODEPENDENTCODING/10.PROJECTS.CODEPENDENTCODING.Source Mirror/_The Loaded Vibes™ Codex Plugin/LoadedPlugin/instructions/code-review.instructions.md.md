---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\instructions\code-review.instructions.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\instructions\code-review.instructions.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.instructions.code-review.instructions.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\instructions\code-review.instructions.md'
source_file: 'code-review.instructions.md'
source_sha256: '3b648d83f40c553f7c4ba62e227556597afff0c06215fc6502c9ac0ef8df9b65'
generated: true
---

# `code-review.instructions.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\instructions\code-review.instructions.md`
> SHA-256: `3b648d83f40c553f7c4ba62e227556597afff0c06215fc6502c9ac0ef8df9b65`

````markdown
```instructions
---
name: code-review.instructions
applyTo: "**"
description: "Instructions for the Code Review DevCycle."
---

# Code Review DevCycle Instructions

## 1. Purpose
- Perform structured reviews of pull requests or change sets before integration.
- Enforce Loaded Vibes coding standards, security requirements, and workflow guardrails.

## 2. Responsibilities
### 2.1 Context Gathering
- Load PRD references, associated tickets, and DevCycle outputs to understand change scope.
- Identify dependencies or migrations that require special scrutiny.

### 2.2 Review Execution
- Analyze diffs for correctness, maintainability, performance, security, and documentation completeness.
- Confirm tests exist for new functionality and that changelog/todo updates accompany the work.

### 2.3 Findings & Severity
- Categorize findings (blocker, required, optional) with file/line references.
- Link findings to PRD/TechReq clauses or DevCycle instructions to justify severity.

### 2.4 Communication & Follow-up
- Provide actionable feedback, alternative proposals, or approval rationale.
- Track required changes via tasks/issues and ensure they are resolved before approval.

## 3. Inputs
- Pull request or diff summary
- PRD/Tech Requirements
- Test + verification results
- Toolset for Code Review cycle

## 4. Outputs
- Review report summarizing findings, approvals, or requested changes
- Logged tasks for follow-up work
- Updated changelog/todo references if reviewer makes edits

## 5. Success Criteria
- Every change receives at least one review aligned with these instructions.
- Findings are documented with severity and references; approvals include validation evidence.
- Human reviewer (approver) records final decision in repo tooling.

## 6. Error Handling
- Pause the review if context (design, tests, migrations) is missing; request additional artifacts.
- Reject changes that bypass required DevCycles or security gates.

## 7. Toolset Hook
Use only `../toolsets/code-review.toolset.jsonc` capabilities.

## 8. Traceability
- WHEN code is ready for integration, THE SYSTEM SHALL execute this Code Review DevCycle before merging (PRD §7.4, TechReq §3 DevCycle 14).
- WHEN issues surface, THE SYSTEM SHALL log remediation tasks referencing PRD §8 and TechReq §7.
```

````