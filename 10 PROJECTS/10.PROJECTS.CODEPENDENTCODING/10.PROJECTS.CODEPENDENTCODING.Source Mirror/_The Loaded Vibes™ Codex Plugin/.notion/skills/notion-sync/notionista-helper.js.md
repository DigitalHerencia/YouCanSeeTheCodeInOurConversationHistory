---
title: 'The Loaded Vibes™ Codex Plugin\.notion\skills\notion-sync\notionista-helper.js'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\skills\notion-sync\notionista-helper.js'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.skills.notion-sync.notionista-helper.js'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\skills\notion-sync\notionista-helper.js'
source_file: 'notionista-helper.js'
source_sha256: 'dd857dde0777906fbae65609cd8c26a649c3d191e1e9090e31c9722a89fd67fc'
generated: true
---

# `notionista-helper.js`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\skills\notion-sync\notionista-helper.js`
> SHA-256: `dd857dde0777906fbae65609cd8c26a649c3d191e1e9090e31c9722a89fd67fc`

```javascript
#!/usr/bin/env node
import * as fs from 'fs';
import * as path from 'path';
import { fileURLToPath } from 'url';

function backupFile(filePath) {
  const ts = new Date().toISOString().replace(/[:.]/g, '-');
  const bak = filePath + '.bak.' + ts;
  fs.copyFileSync(filePath, bak);
  return bak;
}

function deepMergeConfig(existing, discovered) {
  // Only set values in existing if they are null or missing
  for (const k of Object.keys(discovered)) {
    if (existing[k] === undefined || existing[k] === null) {
      existing[k] = discovered[k];
    } else if (typeof discovered[k] === 'object' && discovered[k] !== null) {
      existing[k] = deepMergeConfig(existing[k] || {}, discovered[k]);
    }
  }
  return existing;
}

function main() {
  const argv = process.argv.slice(2);
  const inputPathIdx = argv.indexOf('--input');
  const inputJson = (() => {
    if (inputPathIdx !== -1 && argv[inputPathIdx + 1]) {
      const p = path.resolve(argv[inputPathIdx + 1]);
      return JSON.parse(fs.readFileSync(p, 'utf8'));
    }
    // otherwise read stdin
    try {
      const raw = fs.readFileSync(0, 'utf8');
      return raw ? JSON.parse(raw) : null;
    } catch (err) {
      console.error('Failed to parse stdin JSON', err);
      return null;
    }
  })();

  if (!inputJson) {
    console.error('No input JSON provided. Use --input <file> or pipe JSON to stdin.');
    process.exit(2);
  }

  const configPath = path.resolve(__dirname, '..', 'config', 'databases.json');
  if (!fs.existsSync(configPath)) {
    console.error('config/databases.json not found at expected path:', configPath);
    process.exit(3);
  }

  // Load existing config
  const existing = JSON.parse(fs.readFileSync(configPath, 'utf8'));

  // Back up
  const bak = backupFile(configPath);
  console.log('Backed up config to', bak);

  // Merge discovered IDs/URLs into existing config (non-destructive)
  const merged = deepMergeConfig(existing, inputJson);

  // Write merged file
  fs.writeFileSync(configPath, JSON.stringify(merged, null, 2), 'utf8');
  console.log('Merged discovered data into', configPath);
  // Append audit log
  try {
    const logPath = path.resolve(
      __dirname,
      '..',
      '.copilot',
      'reports',
      'process',
      'notionista-index.log'
    );
    const entry = `[${new Date().toISOString()}] Merged ${JSON.stringify(Object.keys(inputJson))} into ${configPath}\n`;
    fs.appendFileSync(logPath, entry, 'utf8');
  } catch (err) {
    console.warn('Failed to write audit log', err);
  }
  process.exit(0);
}

const __filename = fileURLToPath(import.meta.url);
if (process.argv[1] === __filename) main();

```