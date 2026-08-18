---
title: 'The Hipster Stack™ Technology Stack\template\proxy.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\proxy.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.proxy.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\proxy.ts'
source_file: 'proxy.ts'
source_sha256: '16bba59848c650b485959b273c8dddfe15f309f51e5862fcfab05661a0350cc1'
generated: true
---

# `proxy.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\proxy.ts`
> SHA-256: `16bba59848c650b485959b273c8dddfe15f309f51e5862fcfab05661a0350cc1`

```ts
import { clerkMiddleware, createRouteMatcher } from "@clerk/nextjs/server"
import { NextResponse } from "next/server"

import { isPresentationCatalogEnabled } from "@/lib/presentation/catalogAccess"
import { loadedVibesCapabilities } from "@/content/loadedvibes"

const publicRoutes = [
  "/",
  "/sign-in(.*)",
  "/sign-up(.*)",
  "/api/clerk/webhooks",
  "/api/cloudinary/webhooks",
  "/contact(.*)",
  "/privacy(.*)",
  "/terms(.*)",
  ...(loadedVibesCapabilities.marketing ? ["/pricing(.*)", "/faq(.*)"] : []),
  ...(loadedVibesCapabilities.billing ? ["/api/stripe/webhooks"] : []),
  ...(loadedVibesCapabilities.stripeConnect ? ["/api/stripe/connect/webhooks"] : []),
]

const isPublicRoute = createRouteMatcher(publicRoutes)

const isAuthRoute = createRouteMatcher(["/sign-in(.*)", "/sign-up(.*)"])

const isPresentationRoute = createRouteMatcher([
  "/catalog",
  "/auth-forms",
  "/config-page",
  "/cta-section",
  "/error-pages",
  "/faq-section",
  "/feature-grid",
  "/hero-section",
  "/invoice",
  "/onboarding-flow",
  "/process-panel",
  "/settings-page",
  "/stats-section",
  "/status",
  "/D1",
  "/pA",
  "/pB",
  "/pC",
  "/tA",
  "/tB",
  "/tC",
])

function isInternalRedirect(value: string | null): value is string {
  return !!value && value.startsWith("/") && !value.startsWith("//") && !value.includes("://")
}

function requestedRedirect(req: Request): string | null {
  const url = new URL(req.url)
  const requested =
    url.searchParams.get("return_to") ??
    url.searchParams.get("returnTo") ??
    url.searchParams.get("redirect_url") ??
    url.searchParams.get("redirectUrl")

  return isInternalRedirect(requested) ? requested : null
}

export default clerkMiddleware(async (auth, req) => {
  const { userId } = await auth()
  const { pathname, search } = req.nextUrl

  if (isAuthRoute(req) && userId) {
    return NextResponse.redirect(new URL(requestedRedirect(req) ?? "/dashboard", req.url))
  }

  if (isPublicRoute(req) || (isPresentationRoute(req) && isPresentationCatalogEnabled())) {
    return NextResponse.next()
  }

  if (!userId) {
    const signInUrl = new URL("/sign-in", req.url)
    signInUrl.searchParams.set("return_to", `${pathname}${search}`)
    return NextResponse.redirect(signInUrl)
  }

  return NextResponse.next()
})

export const config = {
  matcher: [
    "/((?!_next|[^?]*\\.(?:html?|css|js(?!on)|jpe?g|webp|png|gif|svg|ttf|woff2?|ico|csv|docx?|xlsx?|zip|webmanifest)).*)",
    "/(api|trpc)(.*)",
  ],
}

```