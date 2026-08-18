---
title: 'The Hipster Stack™ Technology Stack\template\.github\workflows\pull-request-validation.yml'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\.github\workflows\pull-request-validation.yml'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.github.workflows.pull-request-validation.yml'
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
source_path: 'The Hipster Stack™ Technology Stack\template\.github\workflows\pull-request-validation.yml'
source_file: 'pull-request-validation.yml'
source_sha256: '76da6dd2a2ebd4acfcb9c7b1eddf12a3a8274437a064509672f3cfeb6ca79b1c'
generated: true
---

# `pull-request-validation.yml`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\.github\workflows\pull-request-validation.yml`
> SHA-256: `76da6dd2a2ebd4acfcb9c7b1eddf12a3a8274437a064509672f3cfeb6ca79b1c`

```yaml
name: Pull request validation

on:
  pull_request:
  workflow_dispatch:

permissions:
  contents: read

concurrency:
  group: validation-${{ github.workflow }}-${{ github.event.pull_request.number || github.ref }}
  cancel-in-progress: true

jobs:
  validation:
    name: Credential-free validation
    runs-on: ubuntu-latest
    timeout-minutes: 20
    permissions:
      contents: read
    steps:
      - name: Check out source without persisted credentials
        uses: actions/checkout@11d5960a326750d5838078e36cf38b85af677262
        with:
          persist-credentials: false

      - name: Use repository Node.js version
        uses: actions/setup-node@49933ea5288caeca8642d1e84afbd3f7d6820020
        with:
          node-version-file: .node-version

      - name: Activate repository pnpm version
        run: |
          corepack enable
          corepack install

      - name: Install frozen dependencies
        run: corepack pnpm install --frozen-lockfile

      - name: Run credential-free CI gate
        run: corepack pnpm validate:ci

```