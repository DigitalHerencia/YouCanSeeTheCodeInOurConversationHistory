---
title: 'The Loaded Vibes™ Codex Plugin\.notion\skills\docs-generation\scripts\docs\generateAgentsIndex.js'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\skills\docs-generation\scripts\docs\generateAgentsIndex.js'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.skills.docs-generation.scripts.docs.generateagentsindex.js'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\skills\docs-generation\scripts\docs\generateAgentsIndex.js'
source_file: 'generateAgentsIndex.js'
source_sha256: 'e581a94d79514325a6d6da026a6a8a3f7655986f4ac7694885c357a5a7b45092'
generated: true
---

# `generateAgentsIndex.js`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\skills\docs-generation\scripts\docs\generateAgentsIndex.js`
> SHA-256: `e581a94d79514325a6d6da026a6a8a3f7655986f4ac7694885c357a5a7b45092`

```javascript
#!/usr/bin/env node
'use strict';
const fs = require('fs');
const path = require('path');
const agentsDir = path.resolve(process.cwd(), '.github', 'agents');
const out = path.resolve(process.cwd(), '.copilot', 'docs', 'agents-index.md');
if (!fs.existsSync(agentsDir)) {
  console.error('No agents directory found:', agentsDir);
  process.exit(1);
}
const files = fs.readdirSync(agentsDir).filter((f) => f.endsWith('.agent.md'));
let md = '# Agents Index\n\n';
for (const f of files) {
  const content = fs.readFileSync(path.join(agentsDir, f), 'utf8');
  const title = f.replace('.agent.md', '');
  md += `- [${title}](../.github/agents/${f})\n`;
}
fs.mkdirSync(path.dirname(out), { recursive: true });
fs.writeFileSync(out, md);
console.log('Agents index written to', out);

```