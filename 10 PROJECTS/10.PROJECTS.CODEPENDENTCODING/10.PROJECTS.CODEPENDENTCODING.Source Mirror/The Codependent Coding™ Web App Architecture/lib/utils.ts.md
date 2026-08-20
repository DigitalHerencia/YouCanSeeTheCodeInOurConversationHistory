---
title: 'The Hipster Stack™ Technology Stack\apps\web\lib\utils.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\apps\web\lib\utils.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.apps.web.lib.utils.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\apps\web\lib\utils.ts'
source_file: 'utils.ts'
source_sha256: '74e8fe9d0d680c442ed6adb13e7d119d6c210c19ae6c114313b2a72552be0883'
generated: true
---

# `utils.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\apps\web\lib\utils.ts`
> SHA-256: `74e8fe9d0d680c442ed6adb13e7d119d6c210c19ae6c114313b2a72552be0883`

```ts
import { type ClassValue, clsx } from 'clsx';
import { twMerge } from 'tailwind-merge';

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}

```