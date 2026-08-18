---
title: 'The Hipster Stack™ Technology Stack\template\.agents\contracts\database-security.yaml'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\.agents\contracts\database-security.yaml'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.agents.contracts.database-security.yaml'
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
source_path: 'The Hipster Stack™ Technology Stack\template\.agents\contracts\database-security.yaml'
source_file: 'database-security.yaml'
source_sha256: 'fee675ab767015a45f1001d8c40942337f764796d2cc8078956f00e3f98f377c'
generated: true
---

# `database-security.yaml`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\.agents\contracts\database-security.yaml`
> SHA-256: `fee675ab767015a45f1001d8c40942337f764796d2cc8078956f00e3f98f377c`

```yaml
id: white-label-application.database-security
version: 1
authority: migration-and-executable-test-contract
connections:
  migration: direct owner connection
  runtime: pooled restricted login inheriting vibes_runtime
roles:
  migration_owner:
    owns_schema: true
    runtime_use: forbidden
  vibes_runtime:
    login: false
    owns_protected_tables: false
    superuser: false
    bypass_rls: false
    create_database: false
    create_role: false
tenant_context:
  setting: app.current_organization_id
  setter: lib/db/withTenantContext.ts
  transaction_local: true
protected_tables:
  organizations: id
  memberships: organizationId
  organization_invitations: organizationId
  projects: organizationId
  audit_events: organizationId
  billing_customers: organizationId
  billing_subscriptions: organizationId
  billing_subscription_items: parent subscription organizationId
  billing_entitlements: organizationId
  connect_accounts: organizationId
  connect_payments: organizationId
  connect_refunds: organizationId
  connect_recovery_snapshots: organizationId
  media_assets: organizationId
  location_records: organizationId
global_tables:
  users: local identity
  provider_webhook_events: provider event ledger
  provider_customer_bindings: opaque provider customer to organization locator for verified webhooks
  provider_connect_account_bindings: opaque connected account to organization locator for verified webhooks
  provider_media_asset_bindings: opaque media asset to organization locator for verified webhooks
policy_commands: [SELECT, INSERT, UPDATE, DELETE]
rls:
  enabled: true
  forced: true
  missing_context: default deny
verification:
  command: pnpm test:database-security
  database: ephemeral PostgreSQL container
  attacks:
    [
      missing-context,
      cross-tenant-select,
      cross-tenant-insert,
      cross-tenant-update,
      cross-tenant-delete,
      broad-prisma-query,
    ]
live_neon:
  verified: false
  reason: provider CLI did not return in the current shell; no provider mutation was authorized

```