---
title: 'The Hipster Stack™ Technology Stack\template\features\uploads\upload-client.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\uploads\upload-client.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.uploads.upload-client.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\features\uploads\upload-client.tsx'
source_file: 'upload-client.tsx'
source_sha256: 'd6cfa587d8df0c267e06b1e5f933f921818cc61b4a41f8abf62bbd673d4d42f0'
generated: true
---

# `upload-client.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\uploads\upload-client.tsx`
> SHA-256: `d6cfa587d8df0c267e06b1e5f933f921818cc61b4a41f8abf62bbd673d4d42f0`

```tsx
"use client"

import { useActionState } from "react"

import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { uploadMediaAction } from "@/lib/actions/capabilityActions"
import type { ActionResult } from "@/types/actionResultTypes"

const initialState: ActionResult<{ id: string }> = { ok: true, data: { id: "" } }

export function UploadClient() {
  const [state, action, pending] = useActionState(uploadMediaAction, initialState)
  return (
    <form action={action} className="flex max-w-xl flex-col gap-4">
      <Input name="file" type="file" required />
      {!state.ok ? <p className="text-sm text-destructive">{state.formError}</p> : null}
      {state.ok && state.data.id ? <p className="text-sm text-primary">Upload recorded.</p> : null}
      <Button disabled={pending}>{pending ? "Uploading..." : "Upload asset"}</Button>
    </form>
  )
}

```