---
title: 'The Hipster Stack™ Technology Stack\template\tests\unit\dto\projectMappers.test.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\tests\unit\dto\projectMappers.test.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.tests.unit.dto.projectmappers.test.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\tests\unit\dto\projectMappers.test.ts'
source_file: 'projectMappers.test.ts'
source_sha256: '8936856e19572f4ad25fa4cab81b6902314a5712d0e7867978def4aeeea79af8'
generated: true
---

# `projectMappers.test.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\tests\unit\dto\projectMappers.test.ts`
> SHA-256: `8936856e19572f4ad25fa4cab81b6902314a5712d0e7867978def4aeeea79af8`

```ts
import { describe, expect, it } from "vitest"

import { mapProjectDetailDTO, mapProjectSummaryDTO } from "@/lib/db/dto/project.mappers"

describe("project DTO mappers", () => {
  const now = new Date("2026-05-20T18:00:00.000Z")

  it("maps summary records to transport-safe DTOs", () => {
    const dto = mapProjectSummaryDTO(
      {
        id: "project_1",
        organizationId: "organization_1",
        name: "Operations Desk",
        slug: "operations-desk",
        description: null,
        status: "active",
        updatedAt: now,
        organization: {
          memberships: [{ userId: "user_1", role: "owner" }],
        },
      },
      "user_1"
    )

    expect(dto.updatedAt).toBe("2026-05-20T18:00:00.000Z")
    expect(dto.role).toBe("owner")
    expect(dto).not.toHaveProperty("memberships")
  })

  it("maps detail records without leaking Date objects", () => {
    const dto = mapProjectDetailDTO(
      {
        id: "project_1",
        organizationId: "organization_1",
        ownerId: "user_1",
        name: "Operations Desk",
        slug: "operations-desk",
        description: "Internal workflow tracking.",
        status: "active",
        createdAt: now,
        updatedAt: now,
        organization: {
          memberships: [
            {
              id: "membership_1",
              role: "owner",
              createdAt: now,
              user: {
                id: "user_1",
                email: "owner@example.com",
                displayName: "Owner",
              },
            },
          ],
        },
      },
      "user_1"
    )

    expect(dto.createdAt).toBe("2026-05-20T18:00:00.000Z")
    expect(dto.memberships[0]?.createdAt).toBe("2026-05-20T18:00:00.000Z")
  })
})

```