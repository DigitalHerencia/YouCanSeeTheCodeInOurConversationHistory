---
title: 'The Hipster Stack™ Technology Stack\eslint.config.mjs'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\eslint.config.mjs'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.eslint.config.mjs'
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
source_path: 'The Hipster Stack™ Technology Stack\eslint.config.mjs'
source_file: 'eslint.config.mjs'
source_sha256: 'f42ebb63b211df4f3bdf54f93e0f1d94ea8af779773b9207de33d89f1ca0c9a1'
generated: true
---

# `eslint.config.mjs`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\eslint.config.mjs`
> SHA-256: `f42ebb63b211df4f3bdf54f93e0f1d94ea8af779773b9207de33d89f1ca0c9a1`

```javascript
import eslint from '@eslint/js';
import tseslint from 'typescript-eslint';

export default tseslint.config(
  {
    ignores: [
      'dist/**',
      'template/**',
      'templates/**',
      '.artifacts/**',
      'coverage/**',
      '**/.next/**',
    ],
  },
  eslint.configs.recommended,
  ...tseslint.configs.recommended,
  {
    languageOptions: { globals: { console: 'readonly', process: 'readonly' } },
  },
);

```