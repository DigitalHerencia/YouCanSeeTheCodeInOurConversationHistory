---
title: 'The Hipster Stack™ Technology Stack\template\lib\db\dto\project.mappers.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\db\dto\project.mappers.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.db.dto.project.mappers.ts'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-hipster-stack-technology-stack
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Hipster Stack™ Technology Stack\template\lib\db\dto\project.mappers.ts'
source_file: 'project.mappers.ts'
source_sha256: 'd35ca9ea7d1ec995d51228f130bf9a2fdff7a40ef405b3c45a874e6c6e186e3a'
generated: true
---

# `project.mappers.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\db\dto\project.mappers.ts`
> SHA-256: `d35ca9ea7d1ec995d51228f130bf9a2fdff7a40ef405b3c45a874e6c6e186e3a`

```ts
import 'server-only';

import type { Prisma } from '@/prisma/generated/prisma/client';

import {
  projectDetailSelect,
  projectSummarySelect,
} from '@/lib/db/selects/project.selects';
import type {
  OrganizationMembershipDTO,
  ProjectDetailDTO,
  ProjectSummaryDTO,
} from '@/types/projectTypes';
import {
  defaultOrganizationRole,
  type OrganizationRole,
} from '@/types/authzTypes';

type ProjectSummaryRecord = Prisma.ProjectGetPayload<{
  select: typeof projectSummarySelect;
}>;
type ProjectDetailRecord = Prisma.ProjectGetPayload<{
  select: typeof projectDetailSelect;
}>;

function roleForUser(
  memberships: Array<{ userId: string; role: OrganizationRole }>,
  userId: string,
): OrganizationRole {
  return (
    memberships.find((membership) => membership.userId === userId)?.role ??
    defaultOrganizationRole
  );
}

export function mapProjectSummaryDTO(
  project: ProjectSummaryRecord,
  userId: string,
): ProjectSummaryDTO {
  return {
    id: project.id,
    organizationId: project.organizationId,
    name: project.name,
    slug: project.slug,
    description: project.description,
    status: project.status,
    role: roleForUser(project.organization.memberships, userId),
    updatedAt: project.updatedAt.toISOString(),
  };
}

function mapOrganizationMembershipDTO(
  membership: ProjectDetailRecord['organization']['memberships'][number],
): OrganizationMembershipDTO {
  return {
    id: membership.id,
    userId: membership.user.id,
    email: membership.user.email,
    displayName: membership.user.displayName,
    role: membership.role,
    createdAt: membership.createdAt.toISOString(),
  };
}

export function mapProjectDetailDTO(
  project: ProjectDetailRecord,
  userId: string,
): ProjectDetailDTO {
  return {
    id: project.id,
    organizationId: project.organizationId,
    ownerId: project.ownerId,
    name: project.name,
    slug: project.slug,
    description: project.description,
    status: project.status,
    role: roleForUser(
      project.organization.memberships.map((membership) => ({
        userId: membership.user.id,
        role: membership.role,
      })),
      userId,
    ),
    createdAt: project.createdAt.toISOString(),
    updatedAt: project.updatedAt.toISOString(),
    memberships: project.organization.memberships.map(
      mapOrganizationMembershipDTO,
    ),
  };
}

```