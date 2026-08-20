---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\github-actions-efficiency\references\patterns.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\github-actions-efficiency\references\patterns.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.github-actions-efficiency.references.patterns.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\github-actions-efficiency\references\patterns.md'
source_file: 'patterns.md'
source_sha256: 'a9fb61ee95b5f2f4cb372064f5de9d04ca749da1b78d050e42e909e9e97228dd'
generated: true
---

# `patterns.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\github-actions-efficiency\references\patterns.md`
> SHA-256: `a9fb61ee95b5f2f4cb372064f5de9d04ca749da1b78d050e42e909e9e97228dd`

````markdown
# Canonical Patterns

Load this reference only when you need concrete examples during implementation.

## Dependency Cache

```yaml
- uses: actions/cache@v4
  with:
    path: ~/.npm
    key: ${{ runner.os }}-node-${{ hashFiles('**/package-lock.json') }}
    restore-keys: |
      ${{ runner.os }}-node-
```

Adapt the cache path and invalidation file to the repo's ecosystem.

## Cancel Stale Runs

```yaml
concurrency:
  group: ${{ github.workflow }}-${{ github.ref }}
  cancel-in-progress: true
```

## Scope Triggers

```yaml
on:
  push:
    paths:
      - "src/**"
      - "tests/**"
      - "package.json"
```

Use `paths-ignore` when exclusion is easier to maintain than inclusion.

## Job-Level Changed-File Gating

Use a small change-detection step that emits explicit outputs such as:

- `docs_relevant`
- `runtime_relevant`
- `compat_relevant`
- `run_tests`

Gate downstream jobs on those outputs when event-level filters are not expressive enough.

## Matrix Reduction

Use the minimum matrix that matches the decision:

- Full matrix on release
- Reduced compatibility matrix on sensitive runtime surfaces
- Single representative leg for ordinary code changes

## Optional Write-Back Job

Use label-driven or manual triggers for jobs that mutate the PR branch, such as formatting bots.

````