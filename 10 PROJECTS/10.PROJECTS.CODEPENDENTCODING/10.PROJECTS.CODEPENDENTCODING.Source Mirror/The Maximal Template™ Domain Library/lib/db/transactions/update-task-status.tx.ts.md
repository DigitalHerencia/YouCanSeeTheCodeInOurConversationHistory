---
title: 'The Maximal Template™ Domain Library\lib\db\transactions\update-task-status.tx.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\transactions\update-task-status.tx.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.transactions.update-task-status.tx.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\transactions\update-task-status.tx.ts'
source_file: 'update-task-status.tx.ts'
source_sha256: 'aea442b9a90a9fc619fa3de2f82be4afce00e375327c2dea72e8fef1d95ee94f'
generated: true
---

# `update-task-status.tx.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\transactions\update-task-status.tx.ts`
> SHA-256: `aea442b9a90a9fc619fa3de2f82be4afce00e375327c2dea72e8fef1d95ee94f`

```ts
import type { Prisma, TaskStatus } from "../../../generated/prisma/client";

import { taskSelect } from "../selects/projects.selects";
import { ConcurrencyConflictError } from "./errors";

export async function updateTaskStatusTx(
  tx: Prisma.TransactionClient,
  input: {
    organizationId: string;
    taskId: string;
    status: TaskStatus;
    expectedVersion: number;
  },
) {
  const result = await tx.task.updateMany({
    where: {
      id: input.taskId,
      organizationId: input.organizationId,
      version: input.expectedVersion,
    },
    data: {
      status: input.status,
      completedAt: input.status === "DONE" ? new Date() : null,
      version: {
        increment: 1,
      },
    },
  });

  if (result.count !== 1) {
    throw new ConcurrencyConflictError("Task");
  }

  return tx.task.findFirstOrThrow({
    where: {
      id: input.taskId,
      organizationId: input.organizationId,
    },
    select: taskSelect,
  });
}

```