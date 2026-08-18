---
title: 'The Hipster Stack™ Technology Stack\template\prisma\migrations\20260804065000_shared_webhook_claims\migration.sql'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\prisma\migrations\20260804065000_shared_webhook_claims\migration.sql'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.prisma.migrations.20260804065000-shared-webhook-claims.migration.sql'
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
source_path: 'The Hipster Stack™ Technology Stack\template\prisma\migrations\20260804065000_shared_webhook_claims\migration.sql'
source_file: 'migration.sql'
source_sha256: 'b6ad8eb1aee0a1553070e95324755d5e89c0658a2cfe5e127e326f1c5ce7cd53'
generated: true
---

# `migration.sql`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\prisma\migrations\20260804065000_shared_webhook_claims\migration.sql`
> SHA-256: `b6ad8eb1aee0a1553070e95324755d5e89c0658a2cfe5e127e326f1c5ce7cd53`

```sql
ALTER TYPE "ProviderWebhookStatus" ADD VALUE 'processing' AFTER 'received';

DROP INDEX "provider_webhook_events_processed_idx";

ALTER TABLE "users" ADD COLUMN "identityProviderUpdatedAt" TIMESTAMP(3);

ALTER TABLE "provider_webhook_events"
  DROP COLUMN "processed",
  ADD COLUMN "attemptCount" INTEGER NOT NULL DEFAULT 0,
  ADD COLUMN "lastAttemptAt" TIMESTAMP(3),
  ADD COLUMN "processingStartedAt" TIMESTAMP(3),
  ALTER COLUMN "providerEventId" TYPE VARCHAR(255),
  ALTER COLUMN "eventType" TYPE VARCHAR(120),
  ALTER COLUMN "processingError" TYPE VARCHAR(500);

CREATE INDEX "provider_webhook_events_status_processingStartedAt_idx"
  ON "provider_webhook_events"("status", "processingStartedAt");

```