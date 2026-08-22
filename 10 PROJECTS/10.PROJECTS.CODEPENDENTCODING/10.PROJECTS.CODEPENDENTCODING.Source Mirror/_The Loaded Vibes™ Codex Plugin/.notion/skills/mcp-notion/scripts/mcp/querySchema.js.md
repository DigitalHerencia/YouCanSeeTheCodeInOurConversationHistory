---
title: 'The Loaded Vibes™ Codex Plugin\.notion\skills\mcp-notion\scripts\mcp\querySchema.js'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\skills\mcp-notion\scripts\mcp\querySchema.js'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.skills.mcp-notion.scripts.mcp.queryschema.js'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\skills\mcp-notion\scripts\mcp\querySchema.js'
source_file: 'querySchema.js'
source_sha256: '4ff394494dc583c7320ce034dbecd25226cd4bbd304fa0768ee57b664da91f54'
generated: true
---

# `querySchema.js`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\skills\mcp-notion\scripts\mcp\querySchema.js`
> SHA-256: `4ff394494dc583c7320ce034dbecd25226cd4bbd304fa0768ee57b664da91f54`

```javascript
#!/usr/bin/env node
'use strict';
// Minimal MCP schema query stub
const fs = require('fs');
const argv = require('minimist')(process.argv.slice(2));
const out = argv.out || './schema.json';

// In a real implementation this would call MCP endpoints to fetch schema
const schema = { fetchedAt: new Date().toISOString(), sources: [] };
fs.writeFileSync(out, JSON.stringify(schema, null, 2));
console.log('Schema written to', out);

```