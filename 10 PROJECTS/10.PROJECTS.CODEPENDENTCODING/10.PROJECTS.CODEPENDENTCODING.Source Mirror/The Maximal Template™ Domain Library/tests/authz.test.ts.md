---
title: 'The Maximal Template™ Domain Library\tests\authz.test.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\tests\authz.test.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.tests.authz.test.ts'
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
source_path: 'The Maximal Template™ Domain Library\tests\authz.test.ts'
source_file: 'authz.test.ts'
source_sha256: '579b5f3a1e088954477de7e3fd27a9af7c8f0cfffb72955b0c39c24a97853a9e'
generated: true
---

# `authz.test.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\tests\authz.test.ts`
> SHA-256: `579b5f3a1e088954477de7e3fd27a9af7c8f0cfffb72955b0c39c24a97853a9e`

```ts
import assert from "node:assert/strict";
import test from "node:test";

import {
  authorizeOwnedOrAssignedWrite,
  authorizeResourceRead,
  ResourceAuthorizationError,
} from "../lib/authz/authorize";
import { AuthorizationError } from "../lib/authz/permissions";
import type { AccessContext } from "../types/access";

const member: AccessContext = {
  clerkUserId: "user_member",
  userId: "user-internal",
  organizationId: "org-internal-one",
  membershipId: "membership-member",
  role: "MEMBER",
};

test("rejects access to a resource in another tenant", () => {
  assert.throws(
    () =>
      authorizeResourceRead(member, "projects:read", {
        kind: "project",
        organizationId: "org-internal-two",
      }),
    ResourceAuthorizationError,
  );
});

test("permits an assigned member to update a project resource", () => {
  assert.doesNotThrow(() =>
    authorizeOwnedOrAssignedWrite(member, "projects:write", {
      kind: "task",
      organizationId: member.organizationId,
      assigneeMembershipId: member.membershipId,
    }),
  );
});

test("rejects a viewer before resource policy evaluation", () => {
  assert.throws(
    () =>
      authorizeOwnedOrAssignedWrite(
        { ...member, role: "VIEWER" },
        "projects:write",
        {
          kind: "project",
          organizationId: member.organizationId,
          ownerMembershipId: member.membershipId,
        },
      ),
    AuthorizationError,
  );
});

test("limits client reads to client-visible or related resources", () => {
  const client: AccessContext = { ...member, role: "CLIENT" };

  assert.throws(
    () =>
      authorizeResourceRead(client, "portal:read", {
        kind: "portal-document",
        organizationId: client.organizationId,
        clientVisible: false,
      }),
    ResourceAuthorizationError,
  );

  assert.doesNotThrow(() =>
    authorizeResourceRead(client, "portal:read", {
      kind: "portal-document",
      organizationId: client.organizationId,
      clientVisible: true,
    }),
  );
});

```