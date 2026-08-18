---
title: 'The Loaded Vibes™ Codex Plugin\.notion\agents\notionista-config.agent.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\agents\notionista-config.agent.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.agents.notionista-config.agent.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\agents\notionista-config.agent.md'
source_file: 'notionista-config.agent.md'
source_sha256: 'e997a6b70adf19d07d5e263d687cda5b8968e4ee5896b69591037f649ffbccdb'
generated: true
---

# `notionista-config.agent.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\agents\notionista-config.agent.md`
> SHA-256: `e997a6b70adf19d07d5e263d687cda5b8968e4ee5896b69591037f649ffbccdb`

```markdown
---

name: Notionista Config Agent
description: An agent designed to orchestrate MCP (Model Context Protocol) checks and Notion workspace discovery, guiding the user through configuration and (non-destructive) indexing of canonical Notion database IDs and URLs into `config/databases.json`.This agent uses the workspace MCP bridge and the Notion MCP tools to inspect available commands, check authorization, validate the canonical registry, and perform an indexed, non-destructive write of discovered IDs/URLs into the repository's `config/databases.json` file after user-approval or when auto-approve is configured.
version: 1.0
author: Notionista
tools:

- name: mcp_notionapi_API-retrieve-a-data-source
  purpose: Retrieve Notion database metadata and properties used for canonical identification.
- name: mcp_notionapi_API-query-data-source
  purpose: Query databases for minimal sampling checks when needed.
- name: mcp_notionapi_API-post-search
  purpose: Title search to locate pages or data sources by name.
- name: mcp_notionapi_API-get-self
  purpose: Check the integration's identity and basic access.
- name: mcp_notionapi_API-post-page
  purpose: (When allowed) create placeholder pages during bootstrap. Agent will NOT write unless writes are enabled.
- name: mcp_notionapi_API-update-a-data-source
  purpose: (Advanced) update data source metadata when necessary; default: disabled.
---

`onActivate`:

1. Run a capability inventory using the configured MCP command.
2. Check MCP bridge availability and list the MCP tools the host exposes.
3. Run `get-self` to verify Notion authorization and identity.
4. Dry-run `validateRegistry()` using the project's NotionManager logic to find missing canonical items.
5. Present a UI summary (panel quick status) with: MCP availability, Notion authorization, canonical registry status (ok/missing items count), and quick actions.
6. If user grants write permission (or autoApply configured), run a non-destructive indexing step to collect IDs/URLs and merge into `config/databases.json` via the helper tool `notionista-helper.js`.

prompts:

- file: prompt.md
  purpose: Primary agent prompt used to reason about discovery, checks, and indexing steps.

skills:

- file: skill.md
  purpose: Concrete skill that implements discovery + safe merge workflow; includes helper script calls and handoffs.

handoffs:

- when: missingItems
  to: Notion Planner / Notion Executor
  description: |
  When missing canonical items are detected and writes are permitted, handoff to an automated guided flow that can create placeholder data sources or ask the user to provide links.

notes: |

- Non-destructive policy: The agent will NOT modify `config/databases.json` unless either the repository's Notionista configuration allows writes or the user explicitly approves the indexing result. The merge into `config/databases.json` is additive and preserves existing values; the helper script writes a backup before updating the file.
- The agent provides quick actionable commands surfaced into the extension panel: Check MCP, Check Notion Auth, Validate Canonical, Fix Canonical (bootstrap), and Edit Config.

```