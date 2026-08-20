---
title: 'The Hipster Stack™ Technology Stack\template\components\blocks\auth-formsFeatureClient.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\blocks\auth-formsFeatureClient.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.blocks.auth-formsfeatureclient.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\blocks\auth-formsFeatureClient.tsx'
source_file: 'auth-formsFeatureClient.tsx'
source_sha256: '3026e0ac5514fb29ecbea603fc22ca379a496257a169e24920087d2d68b608ce'
generated: true
---

# `auth-formsFeatureClient.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\blocks\auth-formsFeatureClient.tsx`
> SHA-256: `3026e0ac5514fb29ecbea603fc22ca379a496257a169e24920087d2d68b608ce`

```tsx
"use client"

import {
  AuthSplitLayout,
  ForgotPasswordForm,
  LoginForm,
  OTPVerificationForm,
  SignUpForm,
} from "@/components/blocks/auth-forms"

export function AuthFormsFeatureClient() {
  return (
    <main className="p-8 md:p-12">
      <section className="grid gap-8 md:gap-16">
        <LoginForm
          title="Welcome Back"
          description="Sign in to manage your account."
          socialProviders={["google", "github"]}
          onForgotPassword={() => undefined}
          onSignUp={() => undefined}
        />
        <SignUpForm
          title="Create Account"
          description="Start coordinating commitments today."
          socialProviders={["google", "github"]}
          onSignIn={() => undefined}
        />
        <ForgotPasswordForm onBackToLogin={() => undefined} />
        <OTPVerificationForm email="user@example.com" onResend={() => undefined} />
        <AuthSplitLayout
          brandContent={
            <div className="space-y-4 text-white">
              <h2 className="text-4xl font-black uppercase">Vouch</h2>
              <p className="text-lg font-medium">
                Commitment-backed coordination for real-world agreements.
              </p>
            </div>
          }
        >
          <LoginForm title="Split Layout" description="A login form inside the split variant." />
        </AuthSplitLayout>
      </section>
    </main>
  )
}

```