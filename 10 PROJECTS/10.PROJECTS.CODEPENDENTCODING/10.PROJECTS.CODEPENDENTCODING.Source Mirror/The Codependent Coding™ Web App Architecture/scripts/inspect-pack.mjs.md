---
title: 'The Hipster Stack™ Technology Stack\scripts\inspect-pack.mjs'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\scripts\inspect-pack.mjs'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.scripts.inspect-pack.mjs'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-hipster-stack-technology-stack
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Hipster Stack™ Technology Stack\scripts\inspect-pack.mjs'
source_file: 'inspect-pack.mjs'
source_sha256: 'aa9e30241af063230438189f38ceef78a9282659f0c98f70fcfd28def08bb4c7'
generated: true
---

# `inspect-pack.mjs`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\scripts\inspect-pack.mjs`
> SHA-256: `aa9e30241af063230438189f38ceef78a9282659f0c98f70fcfd28def08bb4c7`

```javascript
import { readdirSync } from 'node:fs';
import { spawnSync } from 'node:child_process';

const artifact = readdirSync('.artifacts').find((name) =>
  name.endsWith('.tgz'),
);
if (!artifact) throw new Error('pnpm pack did not create an artifact.');
const result = spawnSync('tar', ['-tf', `.artifacts/${artifact}`], {
  encoding: 'utf8',
});
if (result.status !== 0) throw new Error(result.stderr);
const entries = result.stdout.split(/\r?\n/);
for (const required of [
  'package/dist/cli.mjs',
  'package/template/package.json',
  'package/template/.env.example',
  'package/template/prisma/schema.prisma',
]) {
  if (!entries.includes(required))
    throw new Error(`Packed artifact is missing ${required}`);
}
for (const forbidden of [
  '.env.local',
  '.env.development',
  '.env.production',
  '.clerk/',
  'node_modules/',
  '.git/',
  '.tsbuildinfo',
]) {
  if (entries.some((entry) => entry.includes(forbidden)))
    throw new Error(
      `Packed artifact contains forbidden path fragment: ${forbidden}`,
    );
}
console.log(`Pack contains ${entries.filter(Boolean).length} safe entries.`);

```