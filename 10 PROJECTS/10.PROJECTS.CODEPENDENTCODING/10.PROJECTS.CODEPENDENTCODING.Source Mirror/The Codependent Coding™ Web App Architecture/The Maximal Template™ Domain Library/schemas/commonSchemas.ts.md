---
title: 'The Maximal Template™ Domain Library\schemas\commonSchemas.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\schemas\commonSchemas.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.schemas.commonschemas.ts'
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
source_path: 'The Maximal Template™ Domain Library\schemas\commonSchemas.ts'
source_file: 'commonSchemas.ts'
source_sha256: '42bb1e3275a0c105db8819f342801c95484689dffd6af6b20f64168abc7f858e'
generated: true
---

# `commonSchemas.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\schemas\commonSchemas.ts`
> SHA-256: `42bb1e3275a0c105db8819f342801c95484689dffd6af6b20f64168abc7f858e`

```ts
import { z } from "zod";

export const organizationSettingsSchema = z.object({
  timezone: z.string().min(1).max(100),
  locale: z.string().min(2).max(35),
  defaultCurrency: z
    .string()
    .length(3)
    .transform((value) => value.toUpperCase()),
});

```