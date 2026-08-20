---
title: 'The Hipster Stack™ Technology Stack\template\.agents\contracts\routes.yaml'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\.agents\contracts\routes.yaml'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.agents.contracts.routes.yaml'
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
source_path: 'The Hipster Stack™ Technology Stack\template\.agents\contracts\routes.yaml'
source_file: 'routes.yaml'
source_sha256: '6fc94a1c65bf6ea1b6f038db7f99ad19b5b65bedb525a9579f8c06d6fb22c137'
generated: true
---

# `routes.yaml`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\.agents\contracts\routes.yaml`
> SHA-256: `6fc94a1c65bf6ea1b6f038db7f99ad19b5b65bedb525a9579f8c06d6fb22c137`

```yaml
id: white-label-application.routes
version: 1
authority: current-source-contract
public: ["/", "/pricing", "/faq", "/contact", "/privacy", "/terms"]
auth: ["/sign-in", "/sign-up"]
protected:
  [
    "/onboarding",
    "/dashboard",
    "/projects",
    "/projects/new",
    "/projects/[projectId]",
    "/team",
    "/uploads",
    "/maps",
    "/ai",
    "/settings",
    "/admin",
    "/checkout",
    "/success",
    "/canceled",
  ]
api:
  [
    "/api/clerk/webhooks",
    "/api/stripe/webhooks",
    "/api/stripe/connect/webhooks",
    "/api/cloudinary/webhooks",
  ]
reference_catalog:
  status: production-opt-in
  route_groups:
    - app/(presentation)
    - app/(public)/(presentation)
    - app/(auth)/(presentation)
    - app/(tenant)/(presentation)
  index: /catalog
  production_gate: PRESENTATION_CATALOG_ENABLED
  search_metadata: content/presentation/registry.ts
  robots: noindex,nofollow

```