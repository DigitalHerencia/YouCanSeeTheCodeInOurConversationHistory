---
title: 'The Maximal Template™ Domain Library\lib\db\transactions\schedule-social-post.tx.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\transactions\schedule-social-post.tx.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.transactions.schedule-social-post.tx.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\transactions\schedule-social-post.tx.ts'
source_file: 'schedule-social-post.tx.ts'
source_sha256: 'e588eea317981ba1ddd75a6d006690b65c48963775f4ab845d88ff8159185c2d'
generated: true
---

# `schedule-social-post.tx.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\transactions\schedule-social-post.tx.ts`
> SHA-256: `e588eea317981ba1ddd75a6d006690b65c48963775f4ab845d88ff8159185c2d`

```ts
import type { Prisma } from "../../../generated/prisma/client";

import { socialPostSelect } from "../selects/social.selects";
import { ConcurrencyConflictError, InvariantViolationError } from "./errors";

export async function scheduleSocialPostTx(
  tx: Prisma.TransactionClient,
  input: {
    organizationId: string;
    postId: string;
    scheduledAt: Date;
    expectedVersion: number;
  },
) {
  if (input.scheduledAt.getTime() <= Date.now()) {
    throw new InvariantViolationError(
      "A scheduled social post must have a future publication time.",
    );
  }

  const result = await tx.socialPost.updateMany({
    where: {
      id: input.postId,
      organizationId: input.organizationId,
      version: input.expectedVersion,
      status: {
        in: ["DRAFT", "FAILED"],
      },
    },
    data: {
      status: "SCHEDULED",
      scheduledAt: input.scheduledAt,
      version: {
        increment: 1,
      },
    },
  });

  if (result.count !== 1) {
    throw new ConcurrencyConflictError("Social post");
  }

  await tx.socialVariant.updateMany({
    where: {
      organizationId: input.organizationId,
      postId: input.postId,
    },
    data: {
      status: "SCHEDULED",
    },
  });

  return tx.socialPost.findFirstOrThrow({
    where: {
      id: input.postId,
      organizationId: input.organizationId,
    },
    select: socialPostSelect,
  });
}

```