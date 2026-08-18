---
title: 'The Hipster Stack™ Technology Stack\template\features\maps\map-feature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\maps\map-feature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.maps.map-feature.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\features\maps\map-feature.tsx'
source_file: 'map-feature.tsx'
source_sha256: '5e2931180f30b8b3691f8348e4a764fd4b9eb71904917b5d3095281c1fe79e90'
generated: true
---

# `map-feature.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\maps\map-feature.tsx`
> SHA-256: `5e2931180f30b8b3691f8348e4a764fd4b9eb71904917b5d3095281c1fe79e90`

```tsx
import { PageHero } from "@/components/blocks/page-hero"
import { LocationSearchFeature } from "@/features/maps/location-search-feature"
import { getSavedLocations } from "@/lib/fetchers/capabilityFetchers"

export async function MapFeature() {
  const saved = await getSavedLocations()
  return (
    <div className="grid gap-8">
      <PageHero
        eyebrow="Maps"
        title="Search and retain useful locations."
        description="Mapbox owns geocoding; product authorization and persisted locations remain application-owned."
      />
      <LocationSearchFeature />
      <section>
        <h2 className="mb-4 text-2xl">Saved locations</h2>
        <ul className="grid gap-2">
          {saved.map((location) => (
            <li key={location.id} className="border bg-card p-4">
              {location.label}
            </li>
          ))}
        </ul>
      </section>
    </div>
  )
}

```