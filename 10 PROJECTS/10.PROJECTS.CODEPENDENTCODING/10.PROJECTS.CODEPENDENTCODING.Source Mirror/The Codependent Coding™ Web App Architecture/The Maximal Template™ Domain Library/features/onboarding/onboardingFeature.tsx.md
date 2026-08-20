---
title: 'The Maximal Template™ Domain Library\features\onboarding\onboardingFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\onboarding\onboardingFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.onboarding.onboardingfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\onboarding\onboardingFeature.tsx'
source_file: 'onboardingFeature.tsx'
source_sha256: '913b2886616e64be9c4f5b4f28d0edbcb645fba1da688835445a8ac2006885ba'
generated: true
---

# `onboardingFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\onboarding\onboardingFeature.tsx`
> SHA-256: `913b2886616e64be9c4f5b4f28d0edbcb645fba1da688835445a8ac2006885ba`

```tsx
import { Show, SignInButton } from "@clerk/nextjs";

import { Button } from "@/components/ui/button";

// Features orchestrate blocks and lib helpers; they never import raw UI primitives.
export function OnboardingFeature() {
  return (
    <section className="mx-auto w-full max-w-3xl space-y-6 px-6 py-12">
      <header className="space-y-2">
        <p className="text-sm font-semibold uppercase tracking-widest">
          Application workspace
        </p>
        <h1 className="text-3xl font-bold tracking-tight">Workspace setup</h1>
        <p className="text-muted-foreground">
          Clerk authenticates the user. Organizations, memberships, roles, and
          tenant selection belong to the application database.
        </p>
      </header>
      <div className="border-3 border-foreground bg-card p-5">
        <Show when="signed-out">
          <p className="mb-4 text-sm text-muted-foreground">
            The template remains publicly browsable. Sign in only to exercise
            authenticated application behavior.
          </p>
          <SignInButton mode="modal">
            <Button type="button">Sign in</Button>
          </SignInButton>
        </Show>
        <Show when="signed-in">
          <p className="text-sm">
            Your application-owned workspace is resolved from your local
            membership after authentication.
          </p>
        </Show>
      </div>
    </section>
  );
}

```