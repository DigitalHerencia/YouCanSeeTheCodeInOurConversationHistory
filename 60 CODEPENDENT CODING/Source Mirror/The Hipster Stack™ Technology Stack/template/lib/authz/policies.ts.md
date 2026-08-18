---
title: 'The Hipster Stack™ Technology Stack\template\lib\authz\policies.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\authz\policies.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.authz.policies.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\authz\policies.ts'
source_file: 'policies.ts'
source_sha256: '594b64a6b48d49b04666c36079243bd251b5fc9c7a2b2f8d319ec7785cd4dabd'
generated: true
---

# `policies.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\authz\policies.ts`
> SHA-256: `594b64a6b48d49b04666c36079243bd251b5fc9c7a2b2f8d319ec7785cd4dabd`

```ts
import {
  primaryOrganizationRole,
  type Capability,
  type OrganizationRole,
  type TenantContext,
} from '@/types/authzTypes';

type ProjectAccessRecord = {
  organizationId: string;
  status: 'active' | 'archived';
};

type MembershipAccessRecord = {
  organizationId: string;
  role: OrganizationRole;
};

function hasTenantCapability(
  context: TenantContext,
  capability: Capability,
): boolean {
  return (
    context.organization.status === 'active' &&
    context.capabilities.some((candidate) => candidate === capability)
  );
}

function isCurrentTenant(
  context: TenantContext,
  organizationId: string,
): boolean {
  return context.organization.id === organizationId;
}

export function canReadProject(
  context: TenantContext,
  project: ProjectAccessRecord,
): boolean {
  return (
    isCurrentTenant(context, project.organizationId) &&
    hasTenantCapability(context, 'project.read')
  );
}

export function canCreateProject(context: TenantContext): boolean {
  return hasTenantCapability(context, 'project.create');
}

export function canUpdateProject(
  context: TenantContext,
  project: ProjectAccessRecord,
): boolean {
  return (
    project.status === 'active' &&
    isCurrentTenant(context, project.organizationId) &&
    hasTenantCapability(context, 'project.update')
  );
}

export function canTransitionProjectStatus(
  context: TenantContext,
  project: ProjectAccessRecord,
  nextStatus: ProjectAccessRecord['status'],
): boolean {
  if (!isCurrentTenant(context, project.organizationId)) return false;
  if (!hasTenantCapability(context, 'project.archive')) return false;

  return (
    (project.status === 'active' && nextStatus === 'archived') ||
    (project.status === 'archived' && nextStatus === 'active')
  );
}

export function canManageMembership(
  context: TenantContext,
  target: MembershipAccessRecord,
  ownerCount: number,
  nextRole: OrganizationRole | null,
): boolean {
  if (!isCurrentTenant(context, target.organizationId)) return false;
  if (!hasTenantCapability(context, 'membership.manage')) return false;
  if (
    target.role === primaryOrganizationRole &&
    context.membership.role !== primaryOrganizationRole
  )
    return false;
  if (
    nextRole === primaryOrganizationRole &&
    context.membership.role !== primaryOrganizationRole
  )
    return false;

  const removesOwner =
    target.role === primaryOrganizationRole &&
    nextRole !== primaryOrganizationRole;
  return !removesOwner || ownerCount > 1;
}

export function canCreateInvitation(
  context: TenantContext,
  role: OrganizationRole,
): boolean {
  return (
    role !== primaryOrganizationRole &&
    hasTenantCapability(context, 'invitation.manage')
  );
}

```