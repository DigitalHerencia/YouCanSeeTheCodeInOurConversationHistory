---
title: 'The Hipster Stack™ Technology Stack\apps\web\next.config.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\apps\web\next.config.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.apps.web.next.config.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\apps\web\next.config.ts'
source_file: 'next.config.ts'
source_sha256: '55a89b9217cf0eb23e6bc33219c53278f586847ad57b72b68dd4727f469fa37f'
generated: true
---

# `next.config.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\apps\web\next.config.ts`
> SHA-256: `55a89b9217cf0eb23e6bc33219c53278f586847ad57b72b68dd4727f469fa37f`

```ts
import type { NextConfig } from 'next';

const config: NextConfig = {
  transpilePackages: ['@hipster-stack/core', '@hipster-stack/schema'],
  webpack(configuration) {
    configuration.resolve.extensionAlias = {
      '.js': ['.ts', '.tsx', '.js'],
      '.jsx': ['.tsx', '.jsx'],
    };
    return configuration;
  },
};

export default config;

```