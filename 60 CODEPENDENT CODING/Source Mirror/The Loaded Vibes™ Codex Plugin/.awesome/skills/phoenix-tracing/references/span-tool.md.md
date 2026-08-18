---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\span-tool.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\span-tool.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-tracing.references.span-tool.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\span-tool.md'
source_file: 'span-tool.md'
source_sha256: 'df587fd2dcd18afd8206695ca621e73c9df53388bc4b83b24ed0a65aa5e111db'
generated: true
---

# `span-tool.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\span-tool.md`
> SHA-256: `df587fd2dcd18afd8206695ca621e73c9df53388bc4b83b24ed0a65aa5e111db`

````markdown
# TOOL Spans

## Purpose

TOOL spans represent external tool or function invocations (API calls, database queries, calculators, custom functions).

## Required Attributes

| Attribute                 | Type   | Description        | Required    |
| ------------------------- | ------ | ------------------ | ----------- |
| `openinference.span.kind` | String | Must be "TOOL"     | Yes         |
| `tool.name`               | String | Tool/function name | Recommended |

## Attribute Reference

### Tool Execution Attributes

| Attribute          | Type          | Description                                |
| ------------------ | ------------- | ------------------------------------------ |
| `tool.name`        | String        | Tool/function name                         |
| `tool.description` | String        | Tool purpose/description                   |
| `tool.parameters`  | String (JSON) | JSON schema defining the tool's parameters |
| `input.value`      | String (JSON) | Actual input values passed to the tool     |
| `output.value`     | String        | Tool output/result                         |
| `output.mime_type` | String        | Result content type (e.g., "application/json") |

## Examples

### API Call Tool

```json
{
  "openinference.span.kind": "TOOL",
  "tool.name": "get_weather",
  "tool.description": "Fetches current weather for a location",
  "tool.parameters": "{\"type\": \"object\", \"properties\": {\"location\": {\"type\": \"string\"}, \"units\": {\"type\": \"string\", \"enum\": [\"celsius\", \"fahrenheit\"]}}, \"required\": [\"location\"]}",
  "input.value": "{\"location\": \"San Francisco\", \"units\": \"celsius\"}",
  "output.value": "{\"temperature\": 18, \"conditions\": \"partly cloudy\"}"
}
```

### Calculator Tool

```json
{
  "openinference.span.kind": "TOOL",
  "tool.name": "calculator",
  "tool.description": "Performs mathematical calculations",
  "tool.parameters": "{\"type\": \"object\", \"properties\": {\"expression\": {\"type\": \"string\", \"description\": \"Math expression to evaluate\"}}, \"required\": [\"expression\"]}",
  "input.value": "{\"expression\": \"2 + 2\"}",
  "output.value": "4"
}
```

### Database Query Tool

```json
{
  "openinference.span.kind": "TOOL",
  "tool.name": "sql_query",
  "tool.description": "Executes SQL query on user database",
  "tool.parameters": "{\"type\": \"object\", \"properties\": {\"query\": {\"type\": \"string\", \"description\": \"SQL query to execute\"}}, \"required\": [\"query\"]}",
  "input.value": "{\"query\": \"SELECT * FROM users WHERE id = 123\"}",
  "output.value": "[{\"id\": 123, \"name\": \"Alice\", \"email\": \"alice@example.com\"}]",
  "output.mime_type": "application/json"
}
```

````