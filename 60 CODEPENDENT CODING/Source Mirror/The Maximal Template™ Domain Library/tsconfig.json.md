---
title: 'The Maximal Template™ Domain Library\tsconfig.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\tsconfig.json'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.tsconfig.json'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-maximal-template-domain-library
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Maximal Template™ Domain Library\tsconfig.json'
source_file: 'tsconfig.json'
source_sha256: 'a8615e7a337f15b2d8b008b149cf973e074de21e5c7d896f271414997c2f057e'
generated: true
---

# `tsconfig.json`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\tsconfig.json`
> SHA-256: `a8615e7a337f15b2d8b008b149cf973e074de21e5c7d896f271414997c2f057e`

```json
{
  "compilerOptions": {
    "target": "ES2022",
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