---
title: 'The Hipster Stack™ Technology Stack\template\features\maps\location-search-feature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\maps\location-search-feature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.maps.location-search-feature.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\features\maps\location-search-feature.tsx'
source_file: 'location-search-feature.tsx'
source_sha256: '35bce1be9e41ed333791eef295cafdee041d4ad58aa01d87ba007c60e9337f4a'
generated: true
---

# `location-search-feature.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\maps\location-search-feature.tsx`
> SHA-256: `35bce1be9e41ed333791eef295cafdee041d4ad58aa01d87ba007c60e9337f4a`

```tsx
"use client"

import { useActionState } from "react"

import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { saveLocationAction, searchLocationsAction } from "@/lib/actions/capabilityActions"
import type { ActionResult } from "@/types/actionResultTypes"
import type { LocationResult } from "@/types/capabilityTypes"

const initialState: ActionResult<LocationResult[]> = { ok: true, data: [] }

export function LocationSearchFeature() {
  const [state, action, pending] = useActionState(searchLocationsAction, initialState)
  return (
    <div className="grid gap-5">
      <form action={action} className="flex max-w-2xl gap-3">
        <Input name="query" required minLength={2} placeholder="Search an address or place" />
        <Button disabled={pending}>{pending ? "Searching..." : "Search"}</Button>
      </form>
      {!state.ok ? (
        <p className="text-sm text-destructive">{state.formError}</p>
      ) : (
        <div className="grid gap-3">
          {state.data.map((result) => (
            <form
              key={result.id}
              action={saveLocationAction}
              className="flex items-center justify-between gap-4 border bg-card p-4"
            >
              <div>
                <p className="font-medium">{result.label}</p>
                <p className="text-xs text-muted-foreground">
                  {result.latitude}, {result.longitude}
                </p>
              </div>
              <input type="hidden" name="label" value={result.label} />
              <input type="hidden" name="mapboxId" value={result.id} />
              <input type="hidden" name="longitude" value={result.longitude} />
              <input type="hidden" name="latitude" value={result.latitude} />
              <Button variant="outline" size="sm">
                Save
              </Button>
            </form>
          ))}
        </div>
      )}
    </div>
  )
}

```