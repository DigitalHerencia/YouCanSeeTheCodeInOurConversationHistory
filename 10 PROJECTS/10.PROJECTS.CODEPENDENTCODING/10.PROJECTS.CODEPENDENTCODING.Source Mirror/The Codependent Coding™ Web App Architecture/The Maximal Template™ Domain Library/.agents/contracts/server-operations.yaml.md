---
title: 'The Hipster Stack™ Technology Stack\template\.agents\contracts\server-operations.yaml'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\.agents\contracts\server-operations.yaml'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.agents.contracts.server-operations.yaml'
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
source_path: 'The Hipster Stack™ Technology Stack\template\.agents\contracts\server-operations.yaml'
source_file: 'server-operations.yaml'
source_sha256: 'c79f73d93877944f4981fcc05c492fd2bc66a4046ad116dc0cc0d250ebbf9b14'
generated: true
---

# `server-operations.yaml`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\.agents\contracts\server-operations.yaml`
> SHA-256: `c79f73d93877944f4981fcc05c492fd2bc66a4046ad116dc0cc0d250ebbf9b14`

```yaml
id: white-label-application.server-operations
version: 1
authority: current-source-and-validator-contract
flow: route -> feature -> fetcher/action -> workflow -> transaction/provider
inventory:
  prisma_runtime: [lib/db, lib/webhooks]
  raw_sql: [lib/db/withTenantContext.ts]
  clerk_backend: [lib/auth, proxy.ts, app/api/clerk/webhooks]
  stripe_sdk: [lib/integrations/stripe]
  cloudinary_http: [lib/integrations/cloudinary]
  huggingface_http: [lib/integrations/huggingface]
  mapbox_http: [lib/integrations/mapbox]
  server_actions: [lib/actions]
  cache_invalidation: [lib/cache/revalidate.ts]
  redirects: [lib/actions]
rules:
  routes_components_database_access: forbidden
  routes_components_provider_sdk_access: forbidden
  provider_webhook_integration_adapter: allowed
  fetcher_writes: forbidden
  component_server_actions: forbidden
  prisma_in_public_types: forbidden
  action_direct_infrastructure_access: forbidden
  transaction_ui_or_provider_behavior: forbidden
  unexpected_action_error_swallowing: forbidden
  server_only_guards: required
expected_errors:
  representation: lib/errors/expectedActionError.ts
  public_result: types/actionResultTypes.ts
  unexpected_behavior: rethrow
verification:
  command: pnpm architecture:validate
  validator: scripts/validate-architecture.mjs
  fixtures: tests/contract/architecture-validator.test.ts

```