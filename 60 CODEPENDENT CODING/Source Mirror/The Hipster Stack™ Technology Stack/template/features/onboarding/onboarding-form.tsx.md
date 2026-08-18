---
title: 'The Hipster Stack™ Technology Stack\template\features\onboarding\onboarding-form.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\onboarding\onboarding-form.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.onboarding.onboarding-form.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\features\onboarding\onboarding-form.tsx'
source_file: 'onboarding-form.tsx'
source_sha256: '18727e0daf239b22a0555291709b0734e1c4d5647371d1a906abd20604dd6377'
generated: true
---

# `onboarding-form.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\onboarding\onboarding-form.tsx`
> SHA-256: `18727e0daf239b22a0555291709b0734e1c4d5647371d1a906abd20604dd6377`

```tsx
"use client"

import { useActionState } from "react"

import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { createOrganizationAction } from "@/lib/actions/organizationActions"
import type { ActionResult } from "@/types/actionResultTypes"

const initialState: ActionResult<{ id: string }> = { ok: true, data: { id: "" } }

export function OnboardingForm() {
  const [state, action, pending] = useActionState(createOrganizationAction, initialState)
  return (
    <form action={action} className="grid max-w-lg gap-4">
      <Label htmlFor="organization-name">Organization name</Label>
      <Input id="organization-name" name="name" required minLength={2} maxLength={120} />
      {!state.ok ? <p className="text-sm text-destructive">{state.formError}</p> : null}
      {state.ok && state.data.id ? (
        <p className="text-sm text-primary">Organization created. Continue to the dashboard.</p>
      ) : null}
      <Button disabled={pending}>{pending ? "Creating..." : "Create organization"}</Button>
    </form>
  )
}

```