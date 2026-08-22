---
title: 'The Maximal Template™ Domain Library\lib\utils\strings.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\utils\strings.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.utils.strings.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\utils\strings.ts'
source_file: 'strings.ts'
source_sha256: '15dd0c1ea52b6d4e3612568bdd4d96d05067b8bf657b9daecf1bb55267dbfd65'
generated: true
---

# `strings.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\utils\strings.ts`
> SHA-256: `15dd0c1ea52b6d4e3612568bdd4d96d05067b8bf657b9daecf1bb55267dbfd65`

```ts
export function slugify(value: string) {
  return value
    .normalize("NFKD")
    .replace(/[\u0300-\u036f]/g, "")
    .toLowerCase()
    .trim()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "");
}

export function truncate(value: string, maximumLength: number) {
  if (value.length <= maximumLength) return value;
  return `${value.slice(0, Math.max(0, maximumLength - 1)).trimEnd()}…`;
}

export function safeHref(value: string | undefined | null) {
  if (!value) return "#";
  if (value.startsWith("/") || value.startsWith("#")) return value;

  try {
    const protocol = new URL(value).protocol;
    return ["https:", "http:", "mailto:", "tel:"].includes(protocol)
      ? value
      : "#";
  } catch {
    return "#";
  }
}

export function sanitizeCssValue(value: string) {
  return value.replace(/[;{}<>]/g, "").trim();
}

```