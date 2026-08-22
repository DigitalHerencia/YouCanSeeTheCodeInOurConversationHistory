---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\acquire-codebase-knowledge\assets\templates\CONVENTIONS.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\acquire-codebase-knowledge\assets\templates\CONVENTIONS.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.acquire-codebase-knowledge.assets.templates.conventions.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\acquire-codebase-knowledge\assets\templates\CONVENTIONS.md'
source_file: 'CONVENTIONS.md'
source_sha256: 'c20c1dca3226992b785229b4ba2c08caada775bd0e26a85f1185d0600b6f2a37'
generated: true
---

# `CONVENTIONS.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\acquire-codebase-knowledge\assets\templates\CONVENTIONS.md`
> SHA-256: `c20c1dca3226992b785229b4ba2c08caada775bd0e26a85f1185d0600b6f2a37`

```markdown
# Coding Conventions

## Core Sections (Required)

### 1) Naming Rules

| Item | Rule | Example | Evidence |
|------|------|---------|----------|
| Files | [RULE] | [EXAMPLE] | [FILE] |
| Functions/methods | [RULE] | [EXAMPLE] | [FILE] |
| Types/interfaces | [RULE] | [EXAMPLE] | [FILE] |
| Constants/env vars | [RULE] | [EXAMPLE] | [FILE] |

### 2) Formatting and Linting

- Formatter: [TOOL + CONFIG FILE]
- Linter: [TOOL + CONFIG FILE]
- Most relevant enforced rules: [RULE_1], [RULE_2], [RULE_3]
- Run commands: [COMMANDS]

### 3) Import and Module Conventions

- Import grouping/order: [RULE]
- Alias vs relative import policy: [RULE]
- Public exports/barrel policy: [RULE]

### 4) Error and Logging Conventions

- Error strategy by layer: [SHORT SUMMARY]
- Logging style and required context fields: [SUMMARY]
- Sensitive-data redaction rules: [SUMMARY]

### 5) Testing Conventions

- Test file naming/location rule: [RULE]
- Mocking strategy norm: [RULE]
- Coverage expectation: [RULE or TODO]

### 6) Evidence

- [path/to/lint-config]
- [path/to/format-config]
- [path/to/representative-source-file]

## Extended Sections (Optional)

Add only for large or inconsistent codebases:

- Layer-specific error handling matrix
- Language-specific strictness options
- Repo-specific commit/branching conventions
- Known convention violations to clean up

```