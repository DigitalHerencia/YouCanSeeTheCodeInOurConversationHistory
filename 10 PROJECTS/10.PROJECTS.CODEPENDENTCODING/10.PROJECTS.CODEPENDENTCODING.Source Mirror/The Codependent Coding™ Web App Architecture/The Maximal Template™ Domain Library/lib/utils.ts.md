---
title: 'The Hipster Stack™ Technology Stack\template\lib\utils.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\utils.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.utils.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\utils.ts'
source_file: 'utils.ts'
source_sha256: 'e42023fa9ce0d5bb49dc8fc45561bb126016d4845abeb13b2c81d678b4c8fbd8'
generated: true
---

# `utils.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\utils.ts`
> SHA-256: `e42023fa9ce0d5bb49dc8fc45561bb126016d4845abeb13b2c81d678b4c8fbd8`

```ts
import { clsx, type ClassValue } from "clsx"
import { twMerge } from "tailwind-merge"

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}

export function safeHref(href: string): string {
  if (href.startsWith("#") || (href.startsWith("/") && !href.startsWith("//"))) return href

  const url = new URL(href)
  if (url.protocol === "https:" || url.protocol === "mailto:" || url.protocol === "tel:") {
    return href
  }

  throw new TypeError(`Unsupported URL protocol: ${url.protocol}`)
}

```