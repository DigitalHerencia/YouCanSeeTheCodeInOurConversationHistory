---
title: 'The Loaded Vibes™ Codex Plugin\.notion\skills\notion-sync\sync-ids.js'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\skills\notion-sync\sync-ids.js'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.skills.notion-sync.sync-ids.js'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\skills\notion-sync\sync-ids.js'
source_file: 'sync-ids.js'
source_sha256: '29ce3ea665e022d6b468f8b81c8150db770035cd97055d8f6352e8b429a11e41'
generated: true
---

# `sync-ids.js`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\skills\notion-sync\sync-ids.js`
> SHA-256: `29ce3ea665e022d6b468f8b81c8150db770035cd97055d8f6352e8b429a11e41`

```javascript
import { readdirSync, readFileSync, writeFileSync } from 'fs';
import { dirname, join, relative, resolve } from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
const ROOT = resolve(__dirname, '..');
const OUT = resolve(__dirname, 'sync-ids-report.json');
const UUID_REGEX = /[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}/g;

function walk(dir) {
  const entries = readdirSync(dir, { withFileTypes: true });
  const files = [];
  for (const e of entries) {
    const full = join(dir, e.name);
    if (e.isDirectory()) {
      if (['node_modules', '.git', 'out', 'dist'].includes(e.name)) continue;
      files.push(...walk(full));
    } else if (e.isFile()) {
      files.push(full);
    }
  }
  return files;
}

function scan() {
  const files = walk(ROOT);
  const report = [];
  for (const f of files) {
    // scan only text files of interest
    if (!f.match(/\.(ts|tsx|js|jsx|md|mdx|json|jsonc)$/i)) continue;
    const raw = readFileSync(f, 'utf8');
    const lines = raw.split(/\r?\n/);
    for (let i = 0; i < lines.length; i++) {
      const line = lines[i];
      const m = line.match(UUID_REGEX);
      if (m) {
        for (const uuid of m) {
          report.push({ file: relative(ROOT, f), line: i + 1, uuid, snippet: line.trim() });
        }
      }
    }
  }
  return report;
}

function main() {
  const report = scan();
  writeFileSync(
    OUT,
    JSON.stringify({ generated: new Date().toISOString(), root: ROOT, items: report }, null, 2),
    'utf8'
  );
  console.warn(`Scanned ${ROOT}`);
  console.warn(`Found ${report.length} UUID matches. Report written to ${OUT}`);
}

main();

```