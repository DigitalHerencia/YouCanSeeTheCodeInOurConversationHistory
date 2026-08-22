---
title: 'The Maximal Template™ Domain Library\lib\utils\cn.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\utils\cn.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.utils.cn.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\utils\cn.ts'
source_file: 'cn.ts'
source_sha256: 'd1f1e0d62cb8d8d1e04c26e14de842d8a151f75812d81b046c65b5d1fe8e4b27'
generated: true
---

# `cn.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\utils\cn.ts`
> SHA-256: `d1f1e0d62cb8d8d1e04c26e14de842d8a151f75812d81b046c65b5d1fe8e4b27`

```ts
import { clsx, type ClassValue } from "clsx";
import { twMerge } from "tailwind-merge";

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}

```