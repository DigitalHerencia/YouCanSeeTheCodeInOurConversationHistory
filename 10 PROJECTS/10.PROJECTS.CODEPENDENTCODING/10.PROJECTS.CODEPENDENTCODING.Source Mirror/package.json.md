---
title: 'The Hipster Stack™ Technology Stack\apps\web\package.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\apps\web\package.json'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.apps.web.package.json'
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
source_path: 'The Hipster Stack™ Technology Stack\apps\web\package.json'
source_file: 'package.json'
source_sha256: 'd294f52e1963da7f171b9708312e026177b15b8d08950b33afd7e24fb95e7246'
generated: true
---

# `package.json`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\apps\web\package.json`
> SHA-256: `d294f52e1963da7f171b9708312e026177b15b8d08950b33afd7e24fb95e7246`

```json
{
  "name": "@hipster-stack/web",
  "version": "0.1.0",
  "private": true,
  "type": "module",
  "scripts": {
    "dev": "next dev",
    "build": "next build --webpack",
    "typecheck": "next typegen && tsc --noEmit"
  },
  "dependencies": {
    "@hipster-stack/core": "workspace:*",
    "@radix-ui/react-select": "2.3.3",
    "@radix-ui/react-slot": "1.3.0",
    "@radix-ui/react-switch": "1.3.3",
    "class-variance-authority": "0.7.1",
    "clsx": "2.1.1",
    "lucide-react": "0.562.0",
    "next": "16.2.6",
    "react": "19.2.6",
    "react-dom": "19.2.6",
    "tailwind-merge": "3.6.0"
  },
  "devDependencies": {
    "@tailwindcss/postcss": "4.3.0",
    "@types/node": "25.7.0",
    "@types/react": "19.2.14",
    "@types/react-dom": "19.2.3",
    "tailwindcss": "4.3.0",
    "typescript": "6.0.3"
  }
}

```