---
title: 'The Hipster Stack™ Technology Stack\apps\web\tsconfig.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\apps\web\tsconfig.json'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.apps.web.tsconfig.json'
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
source_path: 'The Hipster Stack™ Technology Stack\apps\web\tsconfig.json'
source_file: 'tsconfig.json'
source_sha256: 'c62a321526c0dfa21429af77f9cb7b3a195913d982c1719d74a31883a153bae7'
generated: true
---

# `tsconfig.json`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\apps\web\tsconfig.json`
> SHA-256: `c62a321526c0dfa21429af77f9cb7b3a195913d982c1719d74a31883a153bae7`

```json
{
  "compilerOptions": {
    "target": "ES2017",
    "lib": ["dom", "dom.iterable", "esnext"],
    "allowJs": false,
    "skipLibCheck": true,
    "strict": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "bundler",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "react-jsx",
    "incremental": true,
    "plugins": [
      {
        "name": "next"
      }
    ],
    "paths": {
      "@/*": ["./*"]
    }
  },
  "include": [
    "next-env.d.ts",
    "**/*.ts",
    "**/*.tsx",
    ".next/types/**/*.ts",
    ".next/dev/types/**/*.ts"
  ],
  "exclude": ["node_modules"]
}

```