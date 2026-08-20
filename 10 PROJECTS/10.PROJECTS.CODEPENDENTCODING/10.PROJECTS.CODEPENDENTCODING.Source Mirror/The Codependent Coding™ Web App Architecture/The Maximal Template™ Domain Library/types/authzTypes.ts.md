---
title: 'The Hipster Stack™ Technology Stack\template\types\authzTypes.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\types\authzTypes.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.types.authztypes.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\types\authzTypes.ts'
source_file: 'authzTypes.ts'
source_sha256: 'd09b85767f5905536efc3cc15d019beeb96f3a0a0b28136faa5a2293ac1ac639'
generated: true
---

# `authzTypes.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\types\authzTypes.ts`
> SHA-256: `d09b85767f5905536efc3cc15d019beeb96f3a0a0b28136faa5a2293ac1ac639`

```ts
import type { AuthenticatedUserContext } from '@/types/authTypes';

export const organizationRoles = [
  'owner',
  'admin',
  'member',
  'viewer',
] as const;
export type OrganizationRole = (typeof organizationRoles)[number];

export const organizationRoleLabels = {
  owner: 'Owner',
  admin: 'Administrator',
  member: 'Member',
  viewer: 'Viewer',
} as const satisfies Record<OrganizationRole, string>;

export const primaryOrganizationRole: OrganizationRole = 'owner';
export const defaultOrganizationRole: OrganizationRole = 'viewer';
export const invitationRoles = [
  'admin',
  'member',
  'viewer',
] as const satisfies readonly OrganizationRole[];
export const defaultInvitationRole: OrganizationRole = 'member';

export type Capability =
  | 'organization.read'
  | 'organization.manage'
  | 'membership.read'
  | 'membership.manage'
  | 'invitation.manage'
  | 'project.read'
  | 'project.create'
  | 'project.update'
  | 'project.archive'
  | 'audit.read'
  | 'billing.manage'
  | 'connect.manage'
  | 'media.read'
  | 'media.manage'
  | 'ai.use'
  | 'map.read'
  | 'map.manage';

export type TenantContext = AuthenticatedUserContext & {
  organization: {
    id: string;
    status: 'active' | 'suspended';
  };
  membership: {
    id: string;
    role: OrganizationRole;
  };
  capabilities: readonly Capability[];
};

```