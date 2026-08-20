---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\coldfusion-cfm.instructions.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\coldfusion-cfm.instructions.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.instructions.coldfusion-cfm.instructions.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\coldfusion-cfm.instructions.md'
source_file: 'coldfusion-cfm.instructions.md'
source_sha256: '65e8ff3ce9f9d80b1157f8d24b96249c0de9da6f6a73a93ee57ded28a5dd3a46'
generated: true
---

# `coldfusion-cfm.instructions.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\instructions\coldfusion-cfm.instructions.md`
> SHA-256: `65e8ff3ce9f9d80b1157f8d24b96249c0de9da6f6a73a93ee57ded28a5dd3a46`

```markdown
---
description: 'ColdFusion cfm files and application patterns'
applyTo: "**/*.cfm"
---

# ColdFusion Coding Standards

- Use CFScript where possible for cleaner syntax.
- Avoid using deprecated tags and functions.
- Follow consistent naming conventions for variables and components.
- Use `cfqueryparam` to prevent SQL injection.
- Escape CSS hash symbols inside <cfoutput> blocks using ##
- When using HTMX inside <cfoutput> blocks, escape hash symbols (#) by using double hashes (##) to prevent unintended variable interpolation.
- If you are in a HTMX target file then make sure the top line is: <cfsetting showDebugOutput = "false">

# Additional Best Practices

- Use `Application.cfc` for application settings and request handling.
- Organize code into reusable CFCs (components) for maintainability.
- Validate and sanitize all user input.
- Use `cftry`/`cfcatch` for error handling and logging.
- Avoid hardcoding credentials or sensitive data in source files.
- Use consistent indentation (2 spaces, as per global standards).
- Comment complex logic and document functions with purpose and parameters.
- Prefer `cfinclude` for shared templates, but avoid circular includes.

- Use ternary operators where possible
- Ensure consistent tab alignment.

```