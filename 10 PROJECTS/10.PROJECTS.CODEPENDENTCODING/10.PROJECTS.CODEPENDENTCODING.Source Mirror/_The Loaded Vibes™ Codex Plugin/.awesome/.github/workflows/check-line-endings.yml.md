---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\check-line-endings.yml'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\check-line-endings.yml'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.github.workflows.check-line-endings.yml'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\check-line-endings.yml'
source_file: 'check-line-endings.yml'
source_sha256: '7ab6d89613aac0baf9f8acc51bcc0900a779e70c7c01ad64e3d9c6a05699f51e'
generated: true
---

# `check-line-endings.yml`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\check-line-endings.yml`
> SHA-256: `7ab6d89613aac0baf9f8acc51bcc0900a779e70c7c01ad64e3d9c6a05699f51e`

```yaml
name: Check Line Endings

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

permissions:
  contents: read

jobs:
  check-line-endings:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@f43a0e5ff2bd294095638e18286ca9a3d1956744 # v3.6.0

      - name: Check for CRLF line endings in markdown files
        run: |
          ! grep -l $'\r' $(find . -name "*.md")
          if [ $? -eq 0 ]; then
            echo "✅ No CRLF line endings found in markdown files"
            exit 0
          else
            echo "❌ CRLF line endings found in markdown files"
            echo "Files with CRLF line endings:"
            grep -l $'\r' $(find . -name "*.md")
            exit 1
          fi

```