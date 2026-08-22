---
title: 'The Maximal Template™ Domain Library\types\commonTypes.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\types\commonTypes.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.types.commontypes.ts'
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
source_path: 'The Maximal Template™ Domain Library\types\commonTypes.ts'
source_file: 'commonTypes.ts'
source_sha256: 'f118ec0a5aa6e3af5715146d14a74c39cd0d8ca937caad43c2130ce348f7aad7'
generated: true
---

# `commonTypes.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\types\commonTypes.ts`
> SHA-256: `f118ec0a5aa6e3af5715146d14a74c39cd0d8ca937caad43c2130ce348f7aad7`

```ts
export interface OrganizationDTO {
  id: string;
  slug: string;
  name: string;
  imageUrl: string | null;
  timezone: string;
  locale: string;
  defaultCurrency: string;
  memberCount: number;
}

```