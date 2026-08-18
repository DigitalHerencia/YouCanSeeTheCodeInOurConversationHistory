---
title: 'The Maximal Template™ Domain Library\lib\constants\limits.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\constants\limits.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.constants.limits.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\constants\limits.ts'
source_file: 'limits.ts'
source_sha256: '919f08ea5a7808a412bd7228803ab08971e384ce5f39fcec0c12c63f45270db2'
generated: true
---

# `limits.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\constants\limits.ts`
> SHA-256: `919f08ea5a7808a412bd7228803ab08971e384ce5f39fcec0c12c63f45270db2`

```ts
export const limits = {
  name: 200,
  title: 240,
  shortText: 2_000,
  longText: 50_000,
  uploadBytes: 25 * 1024 * 1024,
  socialAttachments: 20,
  campaignSteps: 100,
  invoiceLines: 250,
} as const;

```