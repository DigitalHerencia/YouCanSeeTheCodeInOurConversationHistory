---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\attester-verify-packages.instructions.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\attester-verify-packages.instructions.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.instructions.attester-verify-packages.instructions.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\attester-verify-packages.instructions.md'
source_file: 'attester-verify-packages.instructions.md'
source_sha256: 'ca5df65f90926224a7ae800037c3ab122b9cc0de76b8eec3f4b9b1c46313047e'
generated: true
---

# `attester-verify-packages.instructions.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\instructions\attester-verify-packages.instructions.md`
> SHA-256: `ca5df65f90926224a7ae800037c3ab122b9cc0de76b8eec3f4b9b1c46313047e`

```markdown
---
description: 'Verify PyPI and npm package and symbol names against the attester.dev existence oracle before installing or importing, so hallucinated dependencies never reach code'
applyTo: '**'
---

# Verify packages before installing or importing

Use the attester.dev existence oracle before adding any third-party dependency or calling a library symbol you cannot confirm exists. The oracle answers from real published artifacts (PyPI wheels, npm tarballs), not from model memory.

This instruction exists because models invent plausible package names: a USENIX Security 2025 study measured 5.2% to 21.7% of suggested package names as nonexistent, depending on model and ecosystem.

## When to check

- Before adding a package to a dependency file (`requirements.txt`, `pyproject.toml`, `package.json`) or running an install command for a package you did not choose yourself.
- Before writing an `import`, `require`, or `from ... import` for a third-party package.
- Before calling a function, class, or constant you cannot confirm exists in the target package.
- When a build fails on a missing package or symbol: check the name before changing anything else.

Skip the check for standard library modules, local project modules, and names already verified this session.

## How to check

Free keyless endpoint, no account or API key. Quota: 25 calls per day per client IP, reset 00:00 UTC.

1. Package check: POST `https://attester.dev/demo/v1/package/exists` with body `{"ecosystem": "pypi" | "npm", "name": "<name>"}`. Proceed only when `exists` is `true`.
2. Symbol check: POST `https://attester.dev/demo/v1/symbol/exists` with body `{"ecosystem": "pypi" | "npm", "package": "<package>", "symbol": "<symbol>"}`. On a miss, prefer the `closest_match` suggestions over inventing variants.

On HTTP 429 (daily quota spent) or on network failure: state that the check was skipped and why, then continue with the most conservative option (prefer well-known packages and pinned versions).

## What to do with answers

- `exists: true`: proceed. When pinning, prefer the version in `latest_version`.
- `exists: false`: do not install or import. Report the negative to the user together with the oracle's closest real names (`adjacent_to`, `closest_match`) and ask which one was meant.
- `typosquat_adjacent: true`: treat as a strong signal that the name is a typo or a hallucination. Never install the flagged name.

## Higher volume

The free tier covers normal editing sessions. A paid route without the daily cap exists for high-volume use; see the service docs for details.

```