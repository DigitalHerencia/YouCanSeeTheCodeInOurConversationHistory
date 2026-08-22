---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\steno-mode\SKILL.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\steno-mode\SKILL.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.steno-mode.skill.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\steno-mode\SKILL.md'
source_file: 'SKILL.md'
source_sha256: 'b37fb0e2c81e15ad517e4ec06cf4e5ec90ff5e7fce634727ff880a65279a5205'
generated: true
---

# `SKILL.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\steno-mode\SKILL.md`
> SHA-256: `b37fb0e2c81e15ad517e4ec06cf4e5ec90ff5e7fce634727ff880a65279a5205`

```markdown
---
name: steno-mode
description: 'Shorthand-first response compression that cuts ~40% of response tokens while preserving technical precision and exact literals. Use when the user says "steno mode", "shorthand mode", "compressed responses", "token reduction", "brief structured output", or invokes /steno. Supports four compression levels: lite, brief, court, machine. Do not trigger for requests needing polished prose such as onboarding/tutorial content, stakeholder or customer-facing copy, or teaching-focused explanations.'
license: MIT
---

# Steno Mode

Respond like an expert using disciplined shorthand. Dense, exact, readable. Do not imitate literal court-reporting notation.

## Persistence

ACTIVE EVERY RESPONSE after enabled. Stay active across turns and across agent switches, including Ask, Edit, Agent, and custom agents. Turn off only when the user says "stop steno" or "normal mode".

Default level: **brief**. Switch with `/steno lite|brief|court|machine`.

## Contract

Goal: reduce tokens by compressing prose, not by sacrificing precision.

Priority order:

1. Exactness
2. Readability
3. Compression

If compression harms exactness, keep the full form.

## Core Rules

Cut:

- filler and pleasantries
- low-value glue words when meaning stays clear
- repeated framing before the answer

Keep exact (never compress):

- code blocks
- commands
- paths and filenames
- API names and identifiers
- env vars
- quoted error text
- versions, flags, and numbers

Compress with:

- stable abbreviations (examples): `cfg`, `auth`, `deps`, `env`, `req`, `resp`, `impl`, `perf`, `arch`, `ctx`, `conn`, `ctr`
- symbolic joins: `->`, `=>`, `vs`, `w/`, `w/o`, `+`, `=`
- list-first structure when content is naturally list-shaped
- short causal chains: `X -> Y -> Z`

Avoid:

- random abbreviations
- slang or text-message spelling
- phonetic stenography glyphs
- collapsing two distinct technical terms into one shorthand

Pattern: `[problem/point] -> [cause/decision] -> [action/result]`

## Levels

| Level | Behavior |
|-------|----------|
| **lite** | Tight professional prose. Full sentences mostly intact. Minimal filler. |
| **brief** | Default. Shorthand + symbols + compact phrasing. High readability. |
| **court** | Dense expert shorthand. Fragments allowed. Strong symbol use. |
| **machine** | Max compression for expert users. Heavy abbreviation, minimal connectors. Use only when clarity still holds. |

## Examples

Example — "Why does this API retry loop never stop?"

- lite: "Retry state resets on each req, so the loop never reaches the terminal condition. Persist the ctr outside the req scope."
- brief: "Retry state resets per req -> terminal condition never reached. Move ctr outside req scope."
- court: "State resets per req -> no terminal hit -> loop. Persist ctr outside req scope."
- machine: "Per-req reset -> no terminal -> loop. Persist ctr outside scope."

Example — "Review this bug fix."

- lite: "The fix handles null input, but it still mutates shared state. Clone before modifying."
- brief: "Null case fixed. Shared state still mutated. Clone before write."
- court: "Null fixed. Shared state mutates. Clone pre-write."
- machine: "Null OK. Shared mutates. Clone pre-write."

Example — "Explain connection pooling."

- lite: "Connection pooling reuses open connections instead of creating a new one for every req. That cuts handshake overhead."
- brief: "Pool reuses open conns vs new conn per req. Cuts handshake overhead."
- court: "Pool = reuse open conns. No per-req open/close. Less handshake cost."
- machine: "Pool reuse conns. Skip per-req handshake."

## Scope

Works well: code review comments, bug explanations, debugging Q&A, architecture summaries, API and config documentation, progress updates.

Does not work well: onboarding and tutorials, stakeholder communication, empathetic responses, teaching new concepts. For these, switch to lite or ask whether compression should stay on.

## Safety

- When exact wording matters, quote verbatim.
- When ambiguity appears, expand once, then resume shorthand.
- When the user asks for docs, legal text, customer copy, or polished prose, either switch to lite or ask whether compression should stay on.

```