---
title: 'The Maximal Template™ Domain Library\schemas\projectsSchemas.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\schemas\projectsSchemas.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.schemas.projectsschemas.ts'
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
source_path: 'The Maximal Template™ Domain Library\schemas\projectsSchemas.ts'
source_file: 'projectsSchemas.ts'
source_sha256: '883319891b16a042619ff42d2515a973a92bda925f67fbbab5ecec99b93907d3'
generated: true
---

# `projectsSchemas.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\schemas\projectsSchemas.ts`
> SHA-256: `883319891b16a042619ff42d2515a973a92bda925f67fbbab5ecec99b93907d3`

```ts
import { z } from "zod";

const uuid = z.string().uuid();

export const createProjectSchema = z.object({
  name: z.string().trim().min(1).max(200),
  description: z.string().max(10_000).nullable().optional(),
  startsAt: z.coerce.date().nullable().optional(),
  dueAt: z.coerce.date().nullable().optional(),
});

export const createTaskSchema = z.object({
  projectId: uuid,
  milestoneId: uuid.nullable().optional(),
  parentTaskId: uuid.nullable().optional(),
  assigneeMembershipId: uuid.nullable().optional(),
  title: z.string().trim().min(1).max(300),
  description: z.string().max(20_000).nullable().optional(),
  priority: z.enum(["LOW", "MEDIUM", "HIGH", "URGENT"]).default("MEDIUM"),
  dueAt: z.coerce.date().nullable().optional(),
});

export const updateTaskStatusSchema = z.object({
  taskId: uuid,
  status: z.enum([
    "BACKLOG",
    "TODO",
    "IN_PROGRESS",
    "BLOCKED",
    "DONE",
    "CANCELED",
  ]),
  expectedVersion: z.number().int().positive(),
});

```