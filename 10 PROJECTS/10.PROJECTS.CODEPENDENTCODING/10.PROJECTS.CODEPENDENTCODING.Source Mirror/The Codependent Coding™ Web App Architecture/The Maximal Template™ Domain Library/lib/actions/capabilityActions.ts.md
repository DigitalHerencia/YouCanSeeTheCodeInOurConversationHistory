---
title: 'The Hipster Stack™ Technology Stack\template\lib\actions\capabilityActions.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\actions\capabilityActions.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.actions.capabilityactions.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\actions\capabilityActions.ts'
source_file: 'capabilityActions.ts'
source_sha256: 'efd182ff3dbb34432ed23ae6c1338e3205828e0a1467e82a744a27337ce8da58'
generated: true
---

# `capabilityActions.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\actions\capabilityActions.ts`
> SHA-256: `efd182ff3dbb34432ed23ae6c1338e3205828e0a1467e82a744a27337ce8da58`

```ts
"use server"

import { ZodError } from "zod"

import {
  runInferenceWorkflow,
  saveLocationWorkflow,
  searchLocationsWorkflow,
  uploadMediaWorkflow,
} from "@/lib/capabilities/workflows/capabilityWorkflows"
import { actionFailure, actionSuccess, type ActionResult } from "@/types/actionResultTypes"
import type { InferenceResult, LocationResult } from "@/types/capabilityTypes"

function formString(formData: FormData, key: string): string {
  const value = formData.get(key)
  return typeof value === "string" ? value : ""
}

function invalid(error: unknown): ActionResult<never> {
  if (error instanceof ZodError)
    return actionFailure(
      "INVALID_INPUT",
      "Check the submitted values.",
      error.flatten().fieldErrors
    )
  throw error
}

export async function uploadMediaAction(
  _state: ActionResult<{ id: string }>,
  formData: FormData
): Promise<ActionResult<{ id: string }>> {
  try {
    const asset = await uploadMediaWorkflow({ file: formData.get("file") })
    return actionSuccess({ id: asset.id })
  } catch (error) {
    return invalid(error)
  }
}

export async function runInferenceAction(
  _state: ActionResult<InferenceResult>,
  formData: FormData
): Promise<ActionResult<InferenceResult>> {
  try {
    return actionSuccess(await runInferenceWorkflow({ prompt: formString(formData, "prompt") }))
  } catch (error) {
    return invalid(error)
  }
}

export async function searchLocationsAction(
  _state: ActionResult<LocationResult[]>,
  formData: FormData
): Promise<ActionResult<LocationResult[]>> {
  try {
    return actionSuccess(await searchLocationsWorkflow({ query: formString(formData, "query") }))
  } catch (error) {
    return invalid(error)
  }
}

export async function saveLocationAction(formData: FormData): Promise<void> {
  await saveLocationWorkflow({
    label: formString(formData, "label"),
    mapboxId: formString(formData, "mapboxId") || undefined,
    longitude: formString(formData, "longitude"),
    latitude: formString(formData, "latitude"),
  })
}

```