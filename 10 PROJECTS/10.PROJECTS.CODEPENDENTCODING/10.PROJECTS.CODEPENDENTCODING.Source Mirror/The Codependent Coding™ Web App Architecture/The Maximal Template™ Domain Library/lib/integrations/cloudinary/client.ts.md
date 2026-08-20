---
title: 'The Maximal Template™ Domain Library\lib\integrations\cloudinary\client.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\integrations\cloudinary\client.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.integrations.cloudinary.client.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\integrations\cloudinary\client.ts'
source_file: 'client.ts'
source_sha256: '6df2150035aa0ff982023f4339011ae5aea0e9f19080edfccacb489efc216739'
generated: true
---

# `client.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\integrations\cloudinary\client.ts`
> SHA-256: `6df2150035aa0ff982023f4339011ae5aea0e9f19080edfccacb489efc216739`

```ts
import "server-only";

import { v2 as cloudinary } from "cloudinary";

let configured = false;
export function getCloudinaryClient() {
  const {
    CLOUDINARY_CLOUD_NAME: cloud_name,
    CLOUDINARY_API_KEY: api_key,
    CLOUDINARY_API_SECRET: api_secret,
  } = process.env;
  if (!cloud_name || !api_key || !api_secret)
    throw new Error(
      "Cloudinary is not configured. Add CLOUDINARY_CLOUD_NAME, CLOUDINARY_API_KEY, and CLOUDINARY_API_SECRET to .env.local.",
    );
  if (!configured) {
    cloudinary.config({ cloud_name, api_key, api_secret, secure: true });
    configured = true;
  }
  return cloudinary;
}

```