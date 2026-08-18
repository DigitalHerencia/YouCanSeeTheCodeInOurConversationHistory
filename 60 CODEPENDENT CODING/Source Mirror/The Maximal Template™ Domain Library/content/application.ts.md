---
title: 'The Maximal Template™ Domain Library\content\application.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\content\application.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.content.application.ts'
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
source_path: 'The Maximal Template™ Domain Library\content\application.ts'
source_file: 'application.ts'
source_sha256: '1221a54f58e627e6ec5ae67de38f94a35db77989dd856081466bf02d945ebb4e'
generated: true
---

# `application.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\content\application.ts`
> SHA-256: `1221a54f58e627e6ec5ae67de38f94a35db77989dd856081466bf02d945ebb4e`

```ts
export const applicationProduct = {
  name: "The Maximal Template™",
  description:
    "One tenant-aware SaaS superset containing every supported recipe.",
} as const;

export const applicationCapabilities = {
  marketing: true,
  crm: true,
  projects: true,
  support: true,
  marketingAutomation: true,
  invoicing: true,
  social: true,
  ai: true,
  portal: true,
  admin: true,
} as const;

export const applicationDesign = {
  navigation: "sidebar",
} as const;

```