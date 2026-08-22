---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\flowstudio-power-automate-mcp\references\MCP-BOOTSTRAP.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\flowstudio-power-automate-mcp\references\MCP-BOOTSTRAP.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.flowstudio-power-automate-mcp.references.mcp-bootstrap.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\flowstudio-power-automate-mcp\references\MCP-BOOTSTRAP.md'
source_file: 'MCP-BOOTSTRAP.md'
source_sha256: 'a0f100df8c50311819350c33b5880402332185ac7a480689236b5cf1231b64cf'
generated: true
---

# `MCP-BOOTSTRAP.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\flowstudio-power-automate-mcp\references\MCP-BOOTSTRAP.md`
> SHA-256: `a0f100df8c50311819350c33b5880402332185ac7a480689236b5cf1231b64cf`

````markdown
# MCP Bootstrap — Quick Reference

Everything an agent needs to start calling the FlowStudio MCP server.

```
Endpoint:  https://mcp.flowstudio.app/mcp
Protocol:  JSON-RPC 2.0 over HTTP POST
Transport: Streamable HTTP — single POST per request, no SSE, no WebSocket
Auth:      x-api-key header with JWT token (NOT Bearer)
```

## Required Headers

```
Content-Type: application/json
x-api-key: <token>
User-Agent: FlowStudio-MCP/1.0    ← required, or Cloudflare blocks you
```

## Step 1 — Discover Tool Bundles

Preferred cold-start call:

```json
POST {"jsonrpc":"2.0","id":1,"method":"tools/call",
      "params":{"name":"list_skills","arguments":{}}}
```

Returns the current bundles (`build-flow`, `create-flow`, `debug-flow`,
`monitor-flow`, `discover`, `governance`) and their member tool names. Free —
not counted against plan limits.

Then load the relevant schemas:

```json
POST {"jsonrpc":"2.0","id":2,"method":"tools/call",
      "params":{"name":"tool_search","arguments":{"query":"skill:create-flow"}}}
```

Use `query:"select:tool1,tool2"` to load exact tools and keyword search such as
`query:"send email"` when the user intent is ambiguous.

Fallback for very low-level MCP clients:

```json
POST {"jsonrpc":"2.0","id":1,"method":"tools/list","params":{}}
```

`tools/list` returns all tools with names, descriptions, and input schemas, but
it is heavier and should not be the first choice for agents that know the
FlowStudio meta-tools.

## Step 2 — Call a Tool

```json
POST {"jsonrpc":"2.0","id":1,"method":"tools/call",
      "params":{"name":"<tool_name>","arguments":{...}}}
```

## Response Shape

```
Success → {"result":{"content":[{"type":"text","text":"<JSON string>"}]}}
Error   → {"result":{"content":[{"type":"text","text":"{\"error\":{...}}"}]}}
```

Always parse `result.content[0].text` as JSON to get the actual data.

## Key Tips

- Tool results are JSON strings inside the text field — **double-parse needed**
- `"error"` field in parsed body: `null` = success, object = failure
- `environmentName` is required for most tools, but **not** for:
  `list_live_environments`, `list_live_connections`, `list_store_flows`,
  `list_store_environments`, `list_store_makers`, `get_store_maker`,
  `list_store_power_apps`, `list_store_connections`
- When in doubt, check the `required` array in each tool's schema from
  `tool_search` (or `tools/list` as a fallback)

````