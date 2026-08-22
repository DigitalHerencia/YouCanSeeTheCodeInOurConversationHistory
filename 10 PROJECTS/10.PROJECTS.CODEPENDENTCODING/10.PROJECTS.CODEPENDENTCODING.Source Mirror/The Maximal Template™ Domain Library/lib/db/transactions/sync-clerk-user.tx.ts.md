---
title: 'The Maximal Template™ Domain Library\lib\db\transactions\sync-clerk-user.tx.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\transactions\sync-clerk-user.tx.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.transactions.sync-clerk-user.tx.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\transactions\sync-clerk-user.tx.ts'
source_file: 'sync-clerk-user.tx.ts'
source_sha256: '8c655c340dbf9ce5d88c7d0ee60dc0198201cc7920eb0ec08afc269d3aefe2db'
generated: true
---

# `sync-clerk-user.tx.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\transactions\sync-clerk-user.tx.ts`
> SHA-256: `8c655c340dbf9ce5d88c7d0ee60dc0198201cc7920eb0ec08afc269d3aefe2db`

```ts
import { randomUUID } from "node:crypto";

import type { Prisma } from "../../../generated/prisma/client";
import type { ClerkUserProjection } from "../../auth/clerkWebhook";

function workspaceSlug(username: string | null, clerkUserId: string): string {
  const base =
    (username ?? "workspace")
      .toLowerCase()
      .replace(/[^a-z0-9]+/g, "-")
      .replace(/^-+|-+$/g, "")
      .slice(0, 40) || "workspace";
  return `${base}-${clerkUserId.slice(-8).toLowerCase()}`;
}

export async function syncClerkUserTx(
  tx: Prisma.TransactionClient,
  user: ClerkUserProjection,
) {
  await tx.$executeRaw`SELECT set_config('app.clerk_user_id', ${user.clerkUserId}, true)`;
  const record = await tx.user.upsert({
    where: { clerkUserId: user.clerkUserId },
    create: {
      clerkUserId: user.clerkUserId,
      email: user.email,
      displayName: user.displayName,
      imageUrl: user.imageUrl,
    },
    update: {
      email: user.email,
      displayName: user.displayName,
      imageUrl: user.imageUrl,
    },
    select: { id: true },
  });
  const membership = await tx.membership.findFirst({
    where: { userId: record.id, status: "ACTIVE" },
    select: { id: true },
  });
  if (membership) return;

  const organizationId = randomUUID();
  await tx.$executeRaw`SELECT set_config('app.organization_id', ${organizationId}, true)`;
  const organization = await tx.organization.create({
    data: {
      id: organizationId,
      slug: workspaceSlug(user.username, user.clerkUserId),
      name: user.username ? `${user.username}'s Workspace` : "My Workspace",
    },
    select: { id: true },
  });
  await tx.membership.create({
    data: {
      organizationId: organization.id,
      userId: record.id,
      role: "OWNER",
      status: "ACTIVE",
    },
  });
  await tx.organizationSettings.create({
    data: { organizationId: organization.id },
  });
}

export async function anonymizeClerkUserTx(
  tx: Prisma.TransactionClient,
  clerkUserId: string,
) {
  await tx.$executeRaw`SELECT set_config('app.clerk_user_id', ${clerkUserId}, true)`;
  await tx.user.updateMany({
    where: { clerkUserId },
    data: { email: null, displayName: "Deleted user", imageUrl: null },
  });
}

```