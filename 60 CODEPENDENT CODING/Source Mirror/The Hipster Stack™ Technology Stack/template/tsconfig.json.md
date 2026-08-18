---
title: 'The Hipster Stack™ Technology Stack\template\tsconfig.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\tsconfig.json'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.tsconfig.json'
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
source_path: 'The Hipster Stack™ Technology Stack\template\tsconfig.json'
source_file: 'tsconfig.json'
source_sha256: '306c4d25d4ebf1ca0129cc78f3cf7a861756bf797180fae1572b89fc5bf3337b'
generated: true
---

# `tsconfig.json`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\tsconfig.json`
> SHA-256: `306c4d25d4ebf1ca0129cc78f3cf7a861756bf797180fae1572b89fc5bf3337b`

```json
{
  "compilerOptions": {
    "target": "ES2024",
    "lib": ["dom", "dom.iterable", "es2024"],
    "allowJs": false,
    "skipLibCheck": true,
    "strict": true,
    "noUncheckedIndexedAccess": true,
    "exactOptionalPropertyTypes": true,
    "noImplicitOverride": true,
    "noFallthroughCasesInSwitch": true,
    "noEmit": true,
    "incremental": true,
    "isolatedModules": true,
    "module": "Preserve",
    "moduleResolution": "Bundler",
    "resolveJsonModule": true,
    "allowSyntheticDefaultImports": true,
    "esModuleInterop": true,
    "verbatimModuleSyntax": true,
    "jsx": "react-jsx",
    "plugins": [
      {
        "name": "next"
      }
    ],
    "paths": {
      "@/*": ["./*"],
      "@/app/*": ["./app/*"],
      "@/components/*": ["./components/*"],
      "@/content/*": ["./content/*"],
      "@/features/*": ["./features/*"],
      "@/lib/*": ["./lib/*"],
      "@/prisma/*": ["./prisma/*"],
      "@/schemas/*": ["./schemas/*"],
      "@/types/*": ["./types/*"]
    }
  },
  "include": [
    "next-env.d.ts",
    ".next/types/**/*.ts",
    ".next/dev/types/**/*.ts",
    "**/*.ts",
    "**/*.tsx",
    "**/*.mts",
    "**/*.cts"
  ],
  "exclude": [
    "node_modules",
    ".next",
    "out",
    "coverage",
    "playwright-report",
    "test-results",
    "prisma/generated/prisma"
  ]
}

```