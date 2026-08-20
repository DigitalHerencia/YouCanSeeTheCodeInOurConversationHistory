---
title: 'The Maximal Template™ Domain Library\lib\authz\resources.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\authz\resources.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.authz.resources.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\authz\resources.ts'
source_file: 'resources.ts'
source_sha256: 'e9294265c99f10edd05835ef027a515b1224e06d4b0ac084ad3fd82bc6c60705'
generated: true
---

# `resources.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\authz\resources.ts`
> SHA-256: `e9294265c99f10edd05835ef027a515b1224e06d4b0ac084ad3fd82bc6c60705`

```ts
export type ResourceKind =
  | "organization"
  | "crm"
  | "project"
  | "task"
  | "support-ticket"
  | "campaign"
  | "invoice"
  | "social-post"
  | "ai-generation"
  | "portal-document"
  | "audit-event";

export interface ResourceAccessDescriptor {
  kind: ResourceKind;
  organizationId: string;
  ownerMembershipId?: string | null;
  assigneeMembershipId?: string | null;
  clientVisible?: boolean;
}

```