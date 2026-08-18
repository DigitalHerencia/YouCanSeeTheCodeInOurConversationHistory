---
title: 'The Hipster Stack™ Technology Stack\template\.agents\contracts\domain-model.yaml'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\.agents\contracts\domain-model.yaml'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.agents.contracts.domain-model.yaml'
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
source_path: 'The Hipster Stack™ Technology Stack\template\.agents\contracts\domain-model.yaml'
source_file: 'domain-model.yaml'
source_sha256: 'df1ffff6979c26fb869b5e6d0e92d32ce8c347d771596da49e0b55e736db4984'
generated: true
---

# `domain-model.yaml`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\.agents\contracts\domain-model.yaml`
> SHA-256: `df1ffff6979c26fb869b5e6d0e92d32ce8c347d771596da49e0b55e736db4984`

```yaml
id: white-label-application.domain-model
version: 2
authority: current-source-contract
current_models:
  - User
  - Organization
  - Membership
  - OrganizationInvitation
  - Project
  - AuditEvent
  - ProviderWebhookEvent
  - BillingCustomer
  - ProviderCustomerBinding
  - BillingSubscription
  - BillingSubscriptionItem
  - BillingEntitlement
  - ConnectAccount
  - ProviderConnectAccountBinding
  - ConnectPayment
  - ConnectRefund
  - ConnectRecoverySnapshot
  - MediaAsset
  - ProviderMediaAssetBinding
  - LocationRecord
identity:
  provider: clerk
  local_model: User
authorization:
  current_scope: organization tenant, tenant-owned Project, billing, Connect, media, and location resources
  membership_model: Membership
  role_model: OrganizationRole
  capability_source: lib/authz/capabilities.ts
  resource_policy_source: lib/authz/policies.ts
tenant:
  abstraction_required: true
  selected_name: Organization
  project_is_tenant: false
  context_source: server-derived local membership
  rls_implemented: true
known_gaps:
  - live Clerk configuration and authenticated browser journeys require separate provider-backed verification
  - live Stripe products, price, portal configuration, webhook endpoint, and journeys require separate provider-backed verification
  - live Cloudinary, Hugging Face, and Mapbox journeys require separate provider-backed verification

```