---
title: 'The Maximal Template™ Domain Library\lib\actions\projectsActions.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\actions\projectsActions.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.actions.projectsactions.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\actions\projectsActions.ts'
source_file: 'projectsActions.ts'
source_sha256: '43a1b2c0110413b76a18cb8c539fae05dedff1d74042df9f3fc18c7bf10c0641'
generated: true
---

# `projectsActions.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\actions\projectsActions.ts`
> SHA-256: `43a1b2c0110413b76a18cb8c539fae05dedff1d74042df9f3fc18c7bf10c0641`

```ts
"use server";

import {
  createProjectSchema,
  createTaskSchema,
  updateTaskStatusSchema,
} from "../../schemas/projectsSchemas";

import { requireIdentity } from "../auth/identity";
import { assertPermission } from "../authz/permissions";
import { toProjectSummaryDTO, toTaskDTO } from "../db/dto/projects.dto";
import {
  projectSummarySelect,
  taskSelect,
} from "../db/selects/projects.selects";
import { withTenantTransaction } from "../db/tenant";
import { ResourceNotFoundError } from "../db/transactions/errors";
import { updateTaskStatusTx } from "../db/transactions/update-task-status.tx";

export async function createProject(rawInput: unknown) {
  const input = createProjectSchema.parse(rawInput);
  const identity = await requireIdentity();

  return withTenantTransaction(identity, async (tx, access) => {
    assertPermission(access, "projects:write");

    const record = await tx.project.create({
      data: {
        organizationId: access.organizationId,
        ownerMembershipId: access.membershipId,
        name: input.name,
        description: input.description ?? null,
        startsAt: input.startsAt ?? null,
        dueAt: input.dueAt ?? null,
        status: "PLANNED",
        members: {
          create: {
            organizationId: access.organizationId,
            membershipId: access.membershipId,
            role: "OWNER",
          },
        },
      },
      select: projectSummarySelect,
    });

    await tx.auditEvent.create({
      data: {
        organizationId: access.organizationId,
        actorUserId: access.userId,
        action: "project.created",
        resourceType: "Project",
        resourceId: record.id,
      },
    });

    return toProjectSummaryDTO(record);
  });
}

export async function createTask(rawInput: unknown) {
  const input = createTaskSchema.parse(rawInput);
  const identity = await requireIdentity();

  return withTenantTransaction(identity, async (tx, access) => {
    assertPermission(access, "projects:write");

    const project = await tx.project.findFirst({
      where: {
        id: input.projectId,
        organizationId: access.organizationId,
        archivedAt: null,
      },
      select: {
        id: true,
      },
    });

    if (!project) {
      throw new ResourceNotFoundError("Project");
    }

    const record = await tx.task.create({
      data: {
        organizationId: access.organizationId,
        projectId: input.projectId,
        milestoneId: input.milestoneId ?? null,
        parentTaskId: input.parentTaskId ?? null,
        assigneeMembershipId: input.assigneeMembershipId ?? null,
        title: input.title,
        description: input.description ?? null,
        priority: input.priority,
        dueAt: input.dueAt ?? null,
      },
      select: taskSelect,
    });

    return toTaskDTO(record);
  });
}

export async function updateTaskStatus(rawInput: unknown) {
  const input = updateTaskStatusSchema.parse(rawInput);
  const identity = await requireIdentity();

  return withTenantTransaction(identity, async (tx, access) => {
    assertPermission(access, "projects:write");

    const record = await updateTaskStatusTx(tx, {
      organizationId: access.organizationId,
      taskId: input.taskId,
      status: input.status,
      expectedVersion: input.expectedVersion,
    });

    return toTaskDTO(record);
  });
}

```