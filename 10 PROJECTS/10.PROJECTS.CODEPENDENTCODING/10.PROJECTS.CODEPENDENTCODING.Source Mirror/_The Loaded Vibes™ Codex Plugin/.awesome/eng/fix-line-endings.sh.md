---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\fix-line-endings.sh'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\fix-line-endings.sh'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.eng.fix-line-endings.sh'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\fix-line-endings.sh'
source_file: 'fix-line-endings.sh'
source_sha256: '0d82d641d87bdba2d87220258b97932a3c57f0a7093d6670a11f381796c981bc'
generated: true
---

# `fix-line-endings.sh`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\eng\fix-line-endings.sh`
> SHA-256: `0d82d641d87bdba2d87220258b97932a3c57f0a7093d6670a11f381796c981bc`

```bash
#!/bin/bash
# Script to fix line endings in all markdown files

echo "Normalizing line endings in markdown files..."

# Find all markdown files and convert CRLF to LF
find . -name "*.md" -type f -exec sed -i 's/\r$//' {} \;

echo "Done! All markdown files now have LF line endings."

```