---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\github-release\references\commit-classification.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\github-release\references\commit-classification.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.github-release.references.commit-classification.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\github-release\references\commit-classification.md'
source_file: 'commit-classification.md'
source_sha256: '61c0d5145358aea2fa5984364513d880d757a0946432ee074ffbadc8d0e47626'
generated: true
---

# `commit-classification.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\github-release\references\commit-classification.md`
> SHA-256: `61c0d5145358aea2fa5984364513d880d757a0946432ee074ffbadc8d0e47626`

```markdown
# Commit Classification Heuristics

> **Role in the workflow:** Commit messages are a *secondary* signal. The code diff
> is always read first and treated as ground truth. Use these heuristics to add
> intent and context on top of what the diff already shows — not to replace it.
> When a commit message contradicts the diff, trust the diff.

When reading `git log` output, map each commit to one of the categories below.
Repos that follow Conventional Commits (https://www.conventionalcommits.org/) will
have explicit prefixes — use them directly. For freeform commit messages, use the
heuristics.

---

## Conventional Commit prefixes → category

| Prefix | Category |
|---|---|
| `feat:` / `feat(scope):` | feat |
| `fix:` / `fix(scope):` | fix |
| `perf:` | perf |
| `refactor:` | refactor |
| `docs:` | docs |
| `chore:` | chore |
| `test:` / `tests:` | test |
| `ci:` | chore |
| `build:` | chore |
| `style:` | chore |
| `revert:` | depends on what was reverted |
| `BREAKING CHANGE` in footer or `!` after type (e.g. `feat!:`) | breaking |

---

## Freeform commit message heuristics

**Breaking:**
- Contains words: *breaking*, *incompatible*, *remove*, *rename*, *drop support*
- Phrase patterns: *no longer*, *was removed*, *has been deleted*, *breaking change*

**Feat (new feature):**
- Starts with: *add*, *implement*, *introduce*, *support*, *new*
- Contains: *now supports*, *ability to*, *can now*

**Fix:**
- Starts with: *fix*, *patch*, *resolve*, *correct*, *handle*
- Contains: *bug*, *regression*, *crash*, *error*, *wrong*, *incorrect*, *broken*

**Perf:**
- Contains: *speed up*, *faster*, *reduce memory*, *optimize*, *performance*

**Refactor:**
- Contains: *refactor*, *clean up*, *reorganize*, *restructure*, *simplify*, *extract*

**Docs:**
- Contains: *docs*, *readme*, *comment*, *example*, *typo*

**Chore:**
- Contains: *bump*, *upgrade dependencies*, *update deps*, *version bump*, *ci*, *lint*

**Test:**
- Contains: *test*, *spec*, *coverage*, *fixture*

---

## Classifying merge commits

Merge commits (e.g., `Merge pull request #42`) are usually noise. Look at the PR title
or the commits inside the merge. If the PR title follows Conventional Commits, use that.

---

## When you can't tell

Default to **PATCH** if the commit looks like maintenance. Escalate to **MINOR** if
there's any mention of new functionality. Escalate to **MAJOR** only with explicit
evidence of a breaking change — don't guess at breaking.

---

## Mapping categories to Keep a Changelog sections

| Category | Changelog section |
|---|---|
| `breaking` + new behavior | Changed |
| `breaking` + removal | Removed |
| `feat` | Added |
| `fix`, `perf` | Fixed |
| `security` | Security |
| `refactor`, `docs`, `chore`, `test` | Omit (unless user-visible) |

**User-visible refactor example:** Extracting a previously internal helper into a
new public export → treat as Added, not Refactor.

```