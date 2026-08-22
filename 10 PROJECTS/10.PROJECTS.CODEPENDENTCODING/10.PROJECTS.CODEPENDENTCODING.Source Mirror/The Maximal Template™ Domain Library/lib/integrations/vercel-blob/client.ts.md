---
title: 'The Maximal Template™ Domain Library\lib\integrations\vercel-blob\client.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\integrations\vercel-blob\client.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.integrations.vercel-blob.client.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\integrations\vercel-blob\client.ts'
source_file: 'client.ts'
source_sha256: '1794bc62caeb9bdb5d4e26ebd4c2982bdc8e55190242e46548dc1a43eb2ebe3f'
generated: true
---

# `client.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\integrations\vercel-blob\client.ts`
> SHA-256: `1794bc62caeb9bdb5d4e26ebd4c2982bdc8e55190242e46548dc1a43eb2ebe3f`

```ts
import "server-only";

export function getBlobToken() {
  const token = process.env.BLOB_READ_WRITE_TOKEN;
  if (!token)
    throw new Error(
      "Vercel Blob is not configured. Add BLOB_READ_WRITE_TOKEN to .env.local.",
    );
  return token;
}

```