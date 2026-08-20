---
title: 'The Hipster Stack™ Technology Stack\template\schemas\organizationSchemas.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\schemas\organizationSchemas.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.schemas.organizationschemas.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\schemas\organizationSchemas.ts'
source_file: 'organizationSchemas.ts'
source_sha256: '832f3d9148d59424396dcfa8ebb8cdf7795c53410be092a30a64fb3dc0d94f5f'
generated: true
---

# `organizationSchemas.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\schemas\organizationSchemas.ts`
> SHA-256: `832f3d9148d59424396dcfa8ebb8cdf7795c53410be092a30a64fb3dc0d94f5f`

```ts
import { z } from 'zod';
import { invitationRoles, organizationRoles } from '@/types/authzTypes';

const organizationRoleSchema = z.enum(organizationRoles);
const invitationRoleSchema = z.enum(invitationRoles);

export const createOrganizationSchema = z
  .object({
    name: z
      .string()
      .trim()
      .min(2, 'Name must be at least 2 characters.')
      .max(120),
  })
  .strict();

export const updateOrganizationSchema = z
  .object({
    name: z
      .string()
      .trim()
      .min(2, 'Name must be at least 2 characters.')
      .max(120),
  })
  .strict();

export const inviteOrganizationMemberSchema = z
  .object({
    email: z.string().trim().toLowerCase().pipe(z.email()),
    role: invitationRoleSchema,
  })
  .strict();

export const updateMembershipSchema = z
  .object({
    membershipId: z.string().trim().min(1),
    role: organizationRoleSchema.nullable(),
  })
  .strict();

export type CreateOrganizationInput = z.infer<typeof createOrganizationSchema>;
export type UpdateOrganizationInput = z.infer<typeof updateOrganizationSchema>;
export type InviteOrganizationMemberInput = z.infer<
  typeof inviteOrganizationMemberSchema
>;
export type UpdateMembershipInput = z.infer<typeof updateMembershipSchema>;

```