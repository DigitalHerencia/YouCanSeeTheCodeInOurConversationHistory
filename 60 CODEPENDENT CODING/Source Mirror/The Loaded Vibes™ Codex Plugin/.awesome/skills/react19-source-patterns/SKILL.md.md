---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\react19-source-patterns\SKILL.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\react19-source-patterns\SKILL.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.react19-source-patterns.skill.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\react19-source-patterns\SKILL.md'
source_file: 'SKILL.md'
source_sha256: 'cbbf1227b3f46f9b91c948c3846611a539496b363e4dc1bbd3faff2e913dff86'
generated: true
---

# `SKILL.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\react19-source-patterns\SKILL.md`
> SHA-256: `cbbf1227b3f46f9b91c948c3846611a539496b363e4dc1bbd3faff2e913dff86`

````markdown
---
name: react19-source-patterns
description: 'Reference for React 19 source-file migration patterns, including API changes, ref handling, and context updates.'
---

# React 19 Source Migration Patterns

Reference for every source-file migration required for React 19.

## Quick Reference Table

| Pattern | Action | Reference |
|---|---|---|
| `ReactDOM.render(...)` | → `createRoot().render()` | See references/api-migrations.md |
| `ReactDOM.hydrate(...)` | → `hydrateRoot(...)` | See references/api-migrations.md |
| `unmountComponentAtNode` | → `root.unmount()` | Inline fix |
| `ReactDOM.findDOMNode` | → direct ref | Inline fix |
| `forwardRef(...)` wrapper | → ref as direct prop | See references/api-migrations.md |
| `Component.defaultProps = {}` | → ES6 default params | See references/api-migrations.md |
| `useRef()` no arg | → `useRef(null)` | Inline fix  add `null` |
| Legacy Context | → `createContext` | [→ api-migrations.md#legacy-context](references/api-migrations.md#legacy-context) |
| String refs `this.refs.x` | → `createRef()` | [→ api-migrations.md#string-refs](references/api-migrations.md#string-refs) |
| `import React from 'react'` (unused) | Remove | Only if no `React.` usage in file |

## PropTypes Rule

Do **not** remove `.propTypes` assignments. The `prop-types` package still works as a standalone validator. React 19 only removes the built-in runtime checking from the React package  the package itself remains valid.

Add this comment above any `.propTypes` block:
```jsx
// NOTE: React 19 no longer runs propTypes validation at runtime.
// PropTypes kept for documentation and IDE tooling only.
```

## Read the Reference

For full before/after code for each migration, read **`references/api-migrations.md`**. It contains the complete patterns including edge cases for `forwardRef` with `useImperativeHandle`, `defaultProps` null vs undefined behavior, and legacy context provider/consumer cross-file migrations.

````