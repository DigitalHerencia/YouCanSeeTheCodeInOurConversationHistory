---
title: 'The Hipster Stack™ Technology Stack\template\features\ai\inference-form-client.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\ai\inference-form-client.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.ai.inference-form-client.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\features\ai\inference-form-client.tsx'
source_file: 'inference-form-client.tsx'
source_sha256: '06e3f74693bc47dc58420b16c02673e2111efdfa9f8c716aa1d319927ab9a884'
generated: true
---

# `inference-form-client.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\ai\inference-form-client.tsx`
> SHA-256: `06e3f74693bc47dc58420b16c02673e2111efdfa9f8c716aa1d319927ab9a884`

```tsx
"use client"

import { useActionState } from "react"

import { Button } from "@/components/ui/button"
import { Textarea } from "@/components/ui/textarea"
import { runInferenceAction } from "@/lib/actions/capabilityActions"
import type { ActionResult } from "@/types/actionResultTypes"
import type { InferenceResult } from "@/types/capabilityTypes"

const initialState: ActionResult<InferenceResult> = { ok: true, data: { model: "", text: "" } }

export function InferenceFormClient() {
  const [state, action, pending] = useActionState(runInferenceAction, initialState)
  return (
    <div className="grid max-w-3xl gap-6">
      <form action={action} className="grid gap-4">
        <Textarea
          name="prompt"
          required
          minLength={3}
          maxLength={4000}
          placeholder="Describe what you want the model to help with."
        />
        <Button disabled={pending}>{pending ? "Running..." : "Run inference"}</Button>
      </form>
      {!state.ok ? (
        <p className="text-sm text-destructive">{state.formError}</p>
      ) : state.data.text ? (
        <section className="border bg-card p-6 whitespace-pre-wrap">
          <p className="mb-3 text-xs text-muted-foreground">{state.data.model}</p>
          {state.data.text}
        </section>
      ) : null}
    </div>
  )
}

```