---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\java-docs\SKILL.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\java-docs\SKILL.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.java-docs.skill.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\java-docs\SKILL.md'
source_file: 'SKILL.md'
source_sha256: '9f837092e00114d9f18a9e744707ef11bfc68913247d8014adc534a29e46d087'
generated: true
---

# `SKILL.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\java-docs\SKILL.md`
> SHA-256: `9f837092e00114d9f18a9e744707ef11bfc68913247d8014adc534a29e46d087`

```markdown
---
name: java-docs
description: 'Ensure that Java types are documented with Javadoc comments and follow best practices for documentation.'
---

# Java Documentation (Javadoc) Best Practices

- Public and protected members should be documented with Javadoc comments.
- It is encouraged to document package-private and private members as well, especially if they are complex or not self-explanatory.
- The first sentence of the Javadoc comment is the summary description. It should be a concise overview of what the method does and end with a period.
- Use `@param` for method parameters. The description starts with a lowercase letter and does not end with a period.
- Use `@return` for method return values.
- Use `@throws` or `@exception` to document exceptions thrown by methods.
- Use `@see` for references to other types or members.
- Use `{@inheritDoc}` to inherit documentation from base classes or interfaces.
  - Unless there is major behavior change, in which case you should document the differences.
- Use `@param <T>` for type parameters in generic types or methods.
- Use `{@code}` for inline code snippets.
- Use `<pre>{@code ... }</pre>` for code blocks.
- Use `@since` to indicate when the feature was introduced (e.g., version number).
- Use `@version` to specify the version of the member.
- Use `@author` to specify the author of the code.
- Use `@deprecated` to mark a member as deprecated and provide an alternative.

```