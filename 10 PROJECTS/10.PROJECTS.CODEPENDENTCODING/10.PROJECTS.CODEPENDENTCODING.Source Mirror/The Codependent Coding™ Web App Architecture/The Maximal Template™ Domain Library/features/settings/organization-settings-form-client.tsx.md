---
title: 'The Hipster Stack™ Technology Stack\template\features\settings\organization-settings-form-client.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\settings\organization-settings-form-client.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.settings.organization-settings-form-client.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\features\settings\organization-settings-form-client.tsx'
source_file: 'organization-settings-form-client.tsx'
source_sha256: 'c57c5ba0a7ad95d7f4c63af9e6bad7d0d6838faa9dc4e9fed3f3e0f463aa3b0b'
generated: true
---

# `organization-settings-form-client.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\settings\organization-settings-form-client.tsx`
> SHA-256: `c57c5ba0a7ad95d7f4c63af9e6bad7d0d6838faa9dc4e9fed3f3e0f463aa3b0b`

```tsx
"use client"

import { useActionState } from "react"

import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { updateOrganizationAction } from "@/lib/actions/organizationActions"
import type { ActionResult } from "@/types/actionResultTypes"

const initialState: ActionResult<{ name: string }> = { ok: true, data: { name: "" } }

export function OrganizationSettingsFormClient({ name }: { name: string }) {
  const [state, action, pending] = useActionState(updateOrganizationAction, initialState)
  return (
    <form action={action} className="grid max-w-xl gap-4 border bg-card p-6">
      <Label htmlFor="organization-name">Organization name</Label>
      <Input
        id="organization-name"
        name="name"
        defaultValue={name}
        required
        minLength={2}
        maxLength={120}
      />
      {!state.ok ? <p className="text-sm text-destructive">{state.formError}</p> : null}
      {state.ok && state.data.name ? (
        <p className="text-sm text-primary">Organization updated.</p>
      ) : null}
      <Button className="w-fit" disabled={pending}>
        {pending ? "Saving..." : "Save organization"}
      </Button>
    </form>
  )
}

```