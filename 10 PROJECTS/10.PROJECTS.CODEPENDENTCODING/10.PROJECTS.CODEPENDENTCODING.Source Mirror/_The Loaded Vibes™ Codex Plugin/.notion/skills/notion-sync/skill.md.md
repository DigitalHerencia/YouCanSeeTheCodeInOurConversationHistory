---
title: 'The Loaded Vibes™ Codex Plugin\.notion\skills\notion-sync\skill.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\skills\notion-sync\skill.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.skills.notion-sync.skill.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\skills\notion-sync\skill.md'
source_file: 'skill.md'
source_sha256: '1d41936a44d06e097f0513343c2d1d59c60fc8a133c7f5dfcbaca9b2be92c980'
generated: true
---

# `skill.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\skills\notion-sync\skill.md`
> SHA-256: `1d41936a44d06e097f0513343c2d1d59c60fc8a133c7f5dfcbaca9b2be92c980`

```markdown
# Notionista Discovery & Indexing Skill

## Purpose

This skill performs the concrete steps required by `notionista-config.agent.md`: MCP capability inventory, Notion authorization check, registry validation, and (optionally) a safe merge of discovered Notion database IDs/URLs into `config/databases.json`.

## Inputs

- `allowWrites` (boolean) — whether the repository allows writing config files automatically.
- `autoApply` (boolean) — whether to auto-apply discovered items without extra modal confirmation.

## Outputs

- `canonicalReport` — an object describing discovered IDs, URLs, and any missing canonical items.

## Steps

1. Call MCP command inventory and `get-self`.
2. Run repository `NotionManager.validateRegistry()` logic (dry-run) to determine missing/unknown items.
3. Attempt to locate missing items using `post-search` and `retrieve-a-data-source` with fuzzy matches on canonical names.
4. Build an output payload matching the shape of `config/databases.json`: fill in discovered IDs and URLs in the correct properties, but do NOT overwrite non-null existing values unless explicitly approved.
5. If `allowWrites` and `autoApply` are true, run the helper script `notionista-helper.js` with the payload to merge into the file. Otherwise, present the payload for user review and require explicit approval to apply.

## Helper script usage

The skill uses `notionista-helper.js` to perform the merge. The helper:

- Backs up `config/databases.json` to `config/databases.json.bak.TIMESTAMP`.
- Merges only null entries (or entries explicitly flagged) with discovered values.
- Validates JSON schema after merge and reports any anomalies.

## Safety & Audit

- All writes must be logged to `./.copilot/reports/process/notionista-index.log` (skill will create entries) and the UI panel will show the last indexing time.

```