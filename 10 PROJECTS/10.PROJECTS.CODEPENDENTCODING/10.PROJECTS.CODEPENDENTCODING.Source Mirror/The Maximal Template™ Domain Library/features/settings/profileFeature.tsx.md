---
title: 'The Maximal Template™ Domain Library\features\settings\profileFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\settings\profileFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.settings.profilefeature.tsx'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-maximal-template-domain-library
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Maximal Template™ Domain Library\features\settings\profileFeature.tsx'
source_file: 'profileFeature.tsx'
source_sha256: '0bbb1d2850c09e791cd6462dd0528815188e885ba079cd743a85b6b7982d186d'
generated: true
---

# `profileFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\settings\profileFeature.tsx`
> SHA-256: `0bbb1d2850c09e791cd6462dd0528815188e885ba079cd743a85b6b7982d186d`

```tsx
import { Show, UserProfile } from "@clerk/nextjs";

export function ProfileFeature() {
  return (
    <>
      <Show when="signed-out">
        <section className="border-3 border-foreground bg-card p-6">
          <h1 className="text-xl font-semibold">Account profile</h1>
          <p className="mt-2 text-sm text-muted-foreground">
            This screen is publicly visible in the template. Sign in to open the
            live Clerk user-profile control.
          </p>
        </section>
      </Show>
      <Show when="signed-in">
        <UserProfile routing="hash" />
      </Show>
    </>
  );
}

```