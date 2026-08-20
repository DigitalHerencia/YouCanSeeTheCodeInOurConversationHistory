---
title: 'The Hipster Stack™ Technology Stack\template\components\blocks\onboarding-flowFeatureClient.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\blocks\onboarding-flowFeatureClient.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.blocks.onboarding-flowfeatureclient.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\blocks\onboarding-flowFeatureClient.tsx'
source_file: 'onboarding-flowFeatureClient.tsx'
source_sha256: 'ceeb49a89fb9f9018b973dc2a8133a2ea8915892e9d9d1fd6d25b44e2c77abbd'
generated: true
---

# `onboarding-flowFeatureClient.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\blocks\onboarding-flowFeatureClient.tsx`
> SHA-256: `ceeb49a89fb9f9018b973dc2a8133a2ea8915892e9d9d1fd6d25b44e2c77abbd`

```tsx
"use client"

import { BadgeCheck, Building, CreditCard, Shield, User } from "lucide-react"

import {
  CompletionScreen,
  GoalSelection,
  OnboardingWizard,
  ProfileSetup,
  WelcomeScreen,
  WorkspaceSetup,
} from "@/components/blocks/onboarding-flow"

const features = [
  {
    icon: <CreditCard className="h-5 w-5" />,
    title: "Payment Setup",
    description: "Prepare provider-backed payment readiness.",
  },
  {
    icon: <Shield className="h-5 w-5" />,
    title: "Boundaries",
    description: "Confirm the deterministic release rule.",
  },
  {
    icon: <BadgeCheck className="h-5 w-5" />,
    title: "Confirm",
    description: "Know when and how to confirm presence.",
  },
]

const goals = [
  {
    id: "create",
    title: "Create Vouches",
    description: "Coordinate payer commitments.",
    icon: <CreditCard className="h-5 w-5" />,
  },
  {
    id: "accept",
    title: "Accept Vouches",
    description: "Prepare payout readiness.",
    icon: <Building className="h-5 w-5" />,
  },
  {
    id: "confirm",
    title: "Confirm Presence",
    description: "Resolve agreements in time.",
    icon: <BadgeCheck className="h-5 w-5" />,
  },
  {
    id: "review",
    title: "Review State",
    description: "Track provider-backed outcomes.",
    icon: <Shield className="h-5 w-5" />,
  },
]

export function OnboardingFlowFeatureClient() {
  return (
    <main className="p-8 md:p-12">
      <section className="grid gap-8 md:gap-16">
        <OnboardingWizard
          steps={[
            {
              id: "profile",
              title: "Profile",
              description: "Identify the participant.",
              icon: <User className="h-7 w-7" />,
              content: (
                <p className="text-neutral-400">Add account details before creating a Vouch.</p>
              ),
            },
            {
              id: "payment",
              title: "Payment",
              description: "Prepare payment readiness.",
              icon: <CreditCard className="h-7 w-7" />,
              content: <p className="text-neutral-400">Connect provider-backed payment setup.</p>,
            },
            {
              id: "confirm",
              title: "Confirm",
              description: "Understand the confirmation window.",
              icon: <BadgeCheck className="h-7 w-7" />,
              content: <p className="text-neutral-400">Both parties must confirm in time.</p>,
            },
          ]}
        />
        <WelcomeScreen
          title="Welcome to Vouch"
          subtitle="Set up commitment-backed coordination."
          features={features}
          primaryAction={{ label: "Begin" }}
          secondaryAction={{ label: "Skip" }}
        />
        <ProfileSetup />
        <WorkspaceSetup onSkip={() => undefined} />
        <GoalSelection goals={goals} />
        <CompletionScreen
          features={[
            {
              title: "Account Ready",
              description: "Your profile can now create or accept Vouches.",
            },
            {
              title: "Rule Accepted",
              description: "Both confirmations in time are required for release.",
            },
          ]}
          primaryAction={{ label: "Open Dashboard" }}
        />
      </section>
    </main>
  )
}

```