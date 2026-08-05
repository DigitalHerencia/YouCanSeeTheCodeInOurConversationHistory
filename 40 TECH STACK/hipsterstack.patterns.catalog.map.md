---
title: Hipster Stack Canonical Patterns Catalog
type: map
scope: domain
project:
domain: hipsterstack
artifact: canonical-patterns
kind: map
namespace: hipsterstack.patterns.catalog.map
status: review
authority: working-note
parent: "[[hipsterstack.engineering-system.definition.source-document]]"
depends_on:
  - "[[hipsterstack.patterns.fetcher.reference]]"
  - "[[hipsterstack.patterns.server-action.reference]]"
  - "[[hipsterstack.patterns.application-workflow.reference]]"
  - "[[hipsterstack.patterns.transaction-helper.reference]]"
  - "[[hipsterstack.patterns.auth-authz-boundary.reference]]"
  - "[[hipsterstack.patterns.webhook-processor.reference]]"
supersedes: []
tags:
  - tech-stack/hipsterstack
  - patterns/canonical
  - maps/domain
  - status/review
created: 2026-08-03
updated: 2026-08-05
---

# Hipster Stack Canonical Patterns Catalog

These notes define the current detailed implementation grammar for the Hipster Stack engineering system.

## Existing Patterns

1. [[hipsterstack.patterns.fetcher.reference]] — authenticated and authorized read use cases, query scoping, explicit selects, DTO mapping, and bounded pagination.
2. [[hipsterstack.patterns.server-action.reference]] — thin Next.js mutation adapters, runtime validation, typed results, and framework-owned invalidation.
3. [[hipsterstack.patterns.application-workflow.reference]] — named business use cases, resource authorization, invariant enforcement, provider coordination, recovery, and invalidation intent.
4. [[hipsterstack.patterns.transaction-helper.reference]] — atomic database mutations, optimistic concurrency, serializable retries, audit, and outbox writes.
5. [[hipsterstack.patterns.auth-authz-boundary.reference]] — identity, local actors, tenant membership, capabilities, resource policies, readiness, and RLS containment.
6. [[hipsterstack.patterns.webhook-processor.reference]] — signature verification, durable inboxes, leases, idempotent reconciliation, recovery, and outbox effects.

## Known Missing Definitions

The collection remains under review until dedicated notes define:

- feature and route orchestration;
- layer contracts and dependency boundaries;
- the complete system lifecycle and canonical data flows.

## Authority

These notes are working references, not yet final source-of-truth contracts. Their code examples and recommendations must be reviewed for current framework behavior, security, performance, unnecessary complexity, and consistency with [[hipsterstack.engineering-system.definition.source-document]].
