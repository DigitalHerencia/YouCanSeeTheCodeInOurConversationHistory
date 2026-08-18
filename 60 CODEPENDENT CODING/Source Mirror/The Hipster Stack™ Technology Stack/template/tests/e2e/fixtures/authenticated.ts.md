---
title: 'The Hipster Stack™ Technology Stack\template\tests\e2e\fixtures\authenticated.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\tests\e2e\fixtures\authenticated.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.tests.e2e.fixtures.authenticated.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\tests\e2e\fixtures\authenticated.ts'
source_file: 'authenticated.ts'
source_sha256: '4222481de84fb3a6ee28c5662fe9246c0dd4b61f38156badc648dcb36989ce52'
generated: true
---

# `authenticated.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\tests\e2e\fixtures\authenticated.ts`
> SHA-256: `4222481de84fb3a6ee28c5662fe9246c0dd4b61f38156badc648dcb36989ce52`

```ts
import { clerk } from "@clerk/testing/playwright"
import { test as base } from "@playwright/test"

import { capabilitiesForRole } from "@/lib/authz/capabilities"
import type { Capability, OrganizationRole } from "@/types/authzTypes"

export type AuthenticatedAccountState = OrganizationRole | "disabled"

type AuthenticatedAccount = {
  state: AuthenticatedAccountState
  expectedCapabilities: readonly Capability[]
}

const emailEnvironmentVariables = {
  owner: "E2E_CLERK_OWNER_EMAIL",
  admin: "E2E_CLERK_ADMIN_EMAIL",
  member: "E2E_CLERK_MEMBER_EMAIL",
  viewer: "E2E_CLERK_VIEWER_EMAIL",
  disabled: "E2E_CLERK_DISABLED_EMAIL",
} as const satisfies Record<AuthenticatedAccountState, string>

export const authenticatedTest = base.extend<{
  accountState: AuthenticatedAccountState
  authenticatedAccount: AuthenticatedAccount
}>({
  accountState: ["viewer", { option: true }],
  authenticatedAccount: async ({ accountState, page }, provideAccount) => {
    const email = process.env[emailEnvironmentVariables[accountState]]
    if (!email) {
      throw new Error(`${emailEnvironmentVariables[accountState]} is required for this fixture.`)
    }

    await page.goto("/")
    await clerk.signIn({ page, emailAddress: email })

    await provideAccount({
      state: accountState,
      expectedCapabilities: accountState === "disabled" ? [] : capabilitiesForRole(accountState),
    })
  },
})

export { expect } from "@playwright/test"

```