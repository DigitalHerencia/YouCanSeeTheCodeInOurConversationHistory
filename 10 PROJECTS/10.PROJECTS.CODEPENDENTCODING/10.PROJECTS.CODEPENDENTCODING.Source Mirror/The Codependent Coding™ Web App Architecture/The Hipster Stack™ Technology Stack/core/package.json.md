---
title: 'The Hipster Stack™ Technology Stack\packages\core\package.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\packages\core\package.json'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.packages.core.package.json'
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
source_path: 'The Hipster Stack™ Technology Stack\packages\core\package.json'
source_file: 'package.json'
source_sha256: '3479140cc498a40ff4eee502eb96fc37c48ecf4a8f2b361a96e4c266ea1301ce'
generated: true
---

# `package.json`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\packages\core\package.json`
> SHA-256: `3479140cc498a40ff4eee502eb96fc37c48ecf4a8f2b361a96e4c266ea1301ce`

```json
{
  "name": "@hipster-stack/core",
  "version": "0.1.0",
  "private": true,
  "type": "module",
  "exports": {
    ".": "./src/index.ts",
    "./browser": "./src/browser.ts"
  },
  "dependencies": {
    "@hipster-stack/schema": "workspace:*",
    "execa": "9.6.1",
    "validate-npm-package-name": "7.0.2",
    "zod": "4.4.3"
  }
}

```