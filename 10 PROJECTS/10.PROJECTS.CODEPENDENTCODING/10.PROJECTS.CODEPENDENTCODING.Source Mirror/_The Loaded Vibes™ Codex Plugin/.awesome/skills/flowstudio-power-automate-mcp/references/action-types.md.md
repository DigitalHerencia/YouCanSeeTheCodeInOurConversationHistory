---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\flowstudio-power-automate-mcp\references\action-types.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\flowstudio-power-automate-mcp\references\action-types.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.flowstudio-power-automate-mcp.references.action-types.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\flowstudio-power-automate-mcp\references\action-types.md'
source_file: 'action-types.md'
source_sha256: 'ede1d72feee71701d13d8f7b1719930244c7ec0987ce2bdd65eef538ead2cf45'
generated: true
---

# `action-types.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\flowstudio-power-automate-mcp\references\action-types.md`
> SHA-256: `ede1d72feee71701d13d8f7b1719930244c7ec0987ce2bdd65eef538ead2cf45`

```markdown
# FlowStudio MCP — Action Types Reference

Compact lookup for recognising action types returned by `get_live_flow`.
Use this to **read and understand** existing flow definitions.

> For full copy-paste construction patterns, see the `flowstudio-power-automate-build` skill.

---

## How to Read a Flow Definition

Every action has `"type"`, `"runAfter"`, and `"inputs"`. The `runAfter` object
declares dependencies: `{"Previous": ["Succeeded"]}`. Valid statuses:
`Succeeded`, `Failed`, `Skipped`, `TimedOut`.

---

## Action Type Quick Reference

| Type | Purpose | Key fields to inspect | Output reference |
|---|---|---|---|
| `Compose` | Store/transform a value | `inputs` (any expression) | `outputs('Name')` |
| `InitializeVariable` | Declare a variable | `inputs.variables[].{name, type, value}` | `variables('name')` |
| `SetVariable` | Update a variable | `inputs.{name, value}` | `variables('name')` |
| `IncrementVariable` | Increment a numeric variable | `inputs.{name, value}` | `variables('name')` |
| `AppendToArrayVariable` | Push to an array variable | `inputs.{name, value}` | `variables('name')` |
| `If` | Conditional branch | `expression.and/or`, `actions`, `else.actions` | — |
| `Switch` | Multi-way branch | `expression`, `cases.{case, actions}`, `default` | — |
| `Foreach` | Loop over array | `foreach`, `actions`, `operationOptions` | `item()` / `items('Name')` |
| `Until` | Loop until condition | `expression`, `limit.{count, timeout}`, `actions` | — |
| `Wait` | Delay | `inputs.interval.{count, unit}` | — |
| `Scope` | Group / try-catch | `actions` (nested action map) | `result('Name')` |
| `Terminate` | End run | `inputs.{runStatus, runError}` | — |
| `OpenApiConnection` | Connector call (SP, Outlook, Teams…) | `inputs.host.{apiId, connectionName, operationId}`, `inputs.parameters` | `outputs('Name')?['body/...']` |
| `OpenApiConnectionWebhook` | Webhook wait (approvals, adaptive cards) | same as above | `body('Name')?['...']` |
| `Http` | External HTTP call | `inputs.{method, uri, headers, body}` | `outputs('Name')?['body']` |
| `Response` | Return to HTTP caller | `inputs.{statusCode, headers, body}` | — |
| `Query` | Filter array | `inputs.{from, where}` | `body('Name')` (filtered array) |
| `Select` | Reshape/project array | `inputs.{from, select}` | `body('Name')` (projected array) |
| `Table` | Array → CSV/HTML string | `inputs.{from, format, columns}` | `body('Name')` (string) |
| `ParseJson` | Parse JSON with schema | `inputs.{content, schema}` | `body('Name')?['field']` |
| `Expression` | Built-in function (e.g. ConvertTimeZone) | `kind`, `inputs` | `body('Name')` |

---

## Connector Identification

When you see `type: OpenApiConnection`, identify the connector from `host.apiId`:

| apiId suffix | Connector |
|---|---|
| `shared_sharepointonline` | SharePoint |
| `shared_office365` | Outlook / Office 365 |
| `shared_teams` | Microsoft Teams |
| `shared_approvals` | Approvals |
| `shared_office365users` | Office 365 Users |
| `shared_flowmanagement` | Flow Management |

The `operationId` tells you the specific operation (e.g. `GetItems`, `SendEmailV2`,
`PostMessageToConversation`). The `connectionName` maps to a GUID in
`properties.connectionReferences`.

---

## Common Expressions (Reading Cheat Sheet)

| Expression | Meaning |
|---|---|
| `@outputs('X')?['body/value']` | Array result from connector action X |
| `@body('X')` | Direct body of action X (Query, Select, ParseJson) |
| `@item()?['Field']` | Current loop item's field |
| `@triggerBody()?['Field']` | Trigger payload field |
| `@variables('name')` | Variable value |
| `@coalesce(a, b)` | First non-null of a, b |
| `@first(array)` | First element (null if empty) |
| `@length(array)` | Array count |
| `@empty(value)` | True if null/empty string/empty array |
| `@union(a, b)` | Merge arrays — **first wins** on duplicates |
| `@result('Scope')` | Array of action outcomes inside a Scope |

```