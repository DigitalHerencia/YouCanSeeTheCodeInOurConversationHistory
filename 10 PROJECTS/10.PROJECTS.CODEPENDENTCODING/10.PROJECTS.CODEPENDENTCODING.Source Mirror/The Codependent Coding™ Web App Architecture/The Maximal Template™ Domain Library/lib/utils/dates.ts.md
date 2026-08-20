---
title: 'The Maximal Template™ Domain Library\lib\utils\dates.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\utils\dates.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.utils.dates.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\utils\dates.ts'
source_file: 'dates.ts'
source_sha256: '19c42bfd523bad185409e7ff2ac4e69f07a6924a2161763c93cc938ebd8bac3f'
generated: true
---

# `dates.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\utils\dates.ts`
> SHA-256: `19c42bfd523bad185409e7ff2ac4e69f07a6924a2161763c93cc938ebd8bac3f`

```ts
export function addMinutes(date: Date, minutes: number) {
  return new Date(date.getTime() + minutes * 60_000);
}

export function isPast(date: Date, now = new Date()) {
  return date.getTime() < now.getTime();
}

export function startOfUtcDay(date: Date) {
  return new Date(
    Date.UTC(date.getUTCFullYear(), date.getUTCMonth(), date.getUTCDate()),
  );
}

export function formatDate(
  date: Date | string,
  options: Intl.DateTimeFormatOptions = { dateStyle: "medium" },
  locale = "en",
) {
  return new Intl.DateTimeFormat(locale, options).format(new Date(date));
}

```