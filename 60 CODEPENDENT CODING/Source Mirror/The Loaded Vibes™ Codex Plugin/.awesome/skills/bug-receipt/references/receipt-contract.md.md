---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\bug-receipt\references\receipt-contract.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\bug-receipt\references\receipt-contract.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.bug-receipt.references.receipt-contract.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\bug-receipt\references\receipt-contract.md'
source_file: 'receipt-contract.md'
source_sha256: '94889929e1b696402b735f5fed242166b652297ecd54dba68499b32a1e61eca9'
generated: true
---

# `receipt-contract.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\bug-receipt\references\receipt-contract.md`
> SHA-256: `94889929e1b696402b735f5fed242166b652297ecd54dba68499b32a1e61eca9`

```markdown
# Machine-readable receipt contract

Use JSON only when the user, CI, or another tool needs a structured artifact. Keep the normal final answer human-readable.

## Required fields

- `version`: integer `2` for new receipts. Version `1` remains accepted for compatibility.
- `status`: `verified`, `partial`, or `blocked`.
- `evidenceSource`: `executed-now`, `supplied`, or `mixed` (required in version `2`).
- `problem`: concise defect and intended behavior.
- `baseline`: object with `command`, `result`, and `evidence`.
- `rootCause`: object with `summary` and at least one evidence item for `verified`.
- `changes`: array of `{ "file", "summary" }` objects.
- `verification`: array of `{ "command", "result", "evidence" }` objects.
- `gaps`: array of explicit missing proof statements.

Baseline results are `failed`, `observed`, or `not-run`. Verification results are `passed`, `failed`, or `not-run`.

## Status invariants

For `verified`:

- Require an observed baseline: `failed` or `observed`, never `not-run`.
- Require at least one concrete root-cause evidence item with `location` and `observation`.
- Require at least one changed file or artifact.
- Require at least one verification item.
- Require every verification result to be `passed`.
- Require `gaps` to be empty.

For `partial`:

- Preserve all evidence obtained.
- Put every missing or inconclusive proof layer in `gaps`.
- Never convert an unrun check into `passed`.

For `blocked`:

- Require at least one gap naming the external blocking condition.
- Leave unperformed work empty or mark it `not-run`; do not speculate about the result.

Validate against [receipt.schema.json](receipt.schema.json), run `node scripts/validate-receipt.mjs <file>` from the skill directory, pipe JSON to `node scripts/validate-receipt.mjs - --json`, or use `bug-receipt check <file>` when the package CLI is installed.

```