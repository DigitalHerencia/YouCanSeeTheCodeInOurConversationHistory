---
title: 'The Maximal Template™ Domain Library\lib\db\transactions\errors.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\transactions\errors.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.transactions.errors.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\transactions\errors.ts'
source_file: 'errors.ts'
source_sha256: '5284d2f51b529a39a910d4a3a4801e3be55d98f1a9017a3e56ea971652e93721'
generated: true
---

# `errors.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\transactions\errors.ts`
> SHA-256: `5284d2f51b529a39a910d4a3a4801e3be55d98f1a9017a3e56ea971652e93721`

```ts
export class ConcurrencyConflictError extends Error {
  constructor(resource: string) {
    super(
      `${resource} changed after it was read. Refresh and retry with the current version.`,
    );
    this.name = "ConcurrencyConflictError";
  }
}

export class ResourceNotFoundError extends Error {
  constructor(resource: string) {
    super(`${resource} was not found in the active organization.`);
    this.name = "ResourceNotFoundError";
  }
}

export class InvariantViolationError extends Error {
  constructor(message: string) {
    super(message);
    this.name = "InvariantViolationError";
  }
}

```