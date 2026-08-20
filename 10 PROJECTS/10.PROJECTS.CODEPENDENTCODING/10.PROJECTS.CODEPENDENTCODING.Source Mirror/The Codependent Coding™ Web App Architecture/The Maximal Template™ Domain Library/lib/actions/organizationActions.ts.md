---
title: 'The Hipster Stack™ Technology Stack\template\lib\actions\organizationActions.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\actions\organizationActions.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.actions.organizationactions.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\actions\organizationActions.ts'
source_file: 'organizationActions.ts'
source_sha256: 'e347c9b23a9cfae7337d7cbd9cd4844b315f88022b9b40a11801007e18951001'
generated: true
---

# `organizationActions.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\actions\organizationActions.ts`
> SHA-256: `e347c9b23a9cfae7337d7cbd9cd4844b315f88022b9b40a11801007e18951001`

```ts
"use server"

import {
  createOrganizationWorkflow,
  inviteOrganizationMemberWorkflow,
  updateMembershipWorkflow,
  updateOrganizationWorkflow,
} from "@/lib/organizations/workflows/organizationWorkflows"
import {
  createOrganizationSchema,
  inviteOrganizationMemberSchema,
  updateMembershipSchema,
  updateOrganizationSchema,
} from "@/schemas/organizationSchemas"
import { actionFailure, actionSuccess, type ActionResult } from "@/types/actionResultTypes"

function formString(formData: FormData, key: string): string {
  const value = formData.get(key)
  return typeof value === "string" ? value : ""
}

export async function updateOrganizationAction(
  _state: ActionResult<{ name: string }>,
  formData: FormData
): Promise<ActionResult<{ name: string }>> {
  const parsed = updateOrganizationSchema.safeParse({ name: formString(formData, "name") })
  if (!parsed.success)
    return actionFailure(
      "INVALID_INPUT",
      "Check the organization name.",
      parsed.error.flatten().fieldErrors
    )
  const organization = await updateOrganizationWorkflow(parsed.data)
  return actionSuccess({ name: organization.name })
}

export async function updateMembershipAction(
  membershipId: string,
  _state: ActionResult<{ role: string }>,
  formData: FormData
): Promise<ActionResult<{ role: string }>> {
  const parsed = updateMembershipSchema.safeParse({
    membershipId,
    role: formString(formData, "role"),
  })
  if (!parsed.success)
    return actionFailure(
      "INVALID_INPUT",
      "Check the membership role.",
      parsed.error.flatten().fieldErrors
    )
  const membership = await updateMembershipWorkflow(parsed.data)
  if (membership.removed) return actionFailure("MEMBERSHIP_REMOVED", "Membership was removed.")
  return actionSuccess({ role: membership.role })
}

export async function createOrganizationAction(
  _state: ActionResult<{ id: string }>,
  formData: FormData
): Promise<ActionResult<{ id: string }>> {
  const parsed = createOrganizationSchema.safeParse({ name: formString(formData, "name") })
  if (!parsed.success)
    return actionFailure(
      "INVALID_INPUT",
      "Check the organization name.",
      parsed.error.flatten().fieldErrors
    )
  const organization = await createOrganizationWorkflow(parsed.data)
  return actionSuccess({ id: organization.id })
}

export async function inviteOrganizationMemberAction(
  _state: ActionResult<{ id: string }>,
  formData: FormData
): Promise<ActionResult<{ id: string }>> {
  const parsed = inviteOrganizationMemberSchema.safeParse({
    email: formString(formData, "email"),
    role: formString(formData, "role"),
  })
  if (!parsed.success)
    return actionFailure(
      "INVALID_INPUT",
      "Check the invitation details.",
      parsed.error.flatten().fieldErrors
    )
  const invitation = await inviteOrganizationMemberWorkflow(parsed.data)
  return actionSuccess({ id: invitation.id })
}

```