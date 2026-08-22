---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\coldfusion-cfc.instructions.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\coldfusion-cfc.instructions.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.instructions.coldfusion-cfc.instructions.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\coldfusion-cfc.instructions.md'
source_file: 'coldfusion-cfc.instructions.md'
source_sha256: '34385c0ee478704e0395c8399972ce2d02ed24bcb217cf32bb69cee28771631f'
generated: true
---

# `coldfusion-cfc.instructions.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\instructions\coldfusion-cfc.instructions.md`
> SHA-256: `34385c0ee478704e0395c8399972ce2d02ed24bcb217cf32bb69cee28771631f`

```markdown
---
description: 'ColdFusion Coding Standards for CFC component and application patterns'
applyTo: "**/*.cfc"
---

# ColdFusion Coding Standards for CFC Files

- Use CFScript where possible for cleaner syntax.
- Avoid using deprecated tags and functions.
- Follow consistent naming conventions for variables and components.
- Use `cfqueryparam` to prevent SQL injection.
- Escape CSS hash symbols inside <cfoutput> blocks using ##

# Additional Best Practices

- Use `this` scope for component properties and methods when appropriate.
- Document all functions with purpose, parameters, and return values (use Javadoc or similar style).
- Use access modifiers (`public`, `private`, `package`, `remote`) for functions and variables.
- Prefer dependency injection for component collaboration.
- Avoid business logic in setters/getters; keep them simple.
- Validate and sanitize all input parameters in public/remote methods.
- Use `cftry`/`cfcatch` for error handling within methods as needed.
- Avoid hardcoding configuration or credentials in CFCs.
- Use consistent indentation (2 spaces, as per global standards).
- Group related methods logically within the component.
- Use meaningful, descriptive names for methods and properties.
- Avoid using `cfcomponent` attributes that are deprecated or unnecessary.

- Use ternary operators where possible
- Ensure consistent tab alignment.

```