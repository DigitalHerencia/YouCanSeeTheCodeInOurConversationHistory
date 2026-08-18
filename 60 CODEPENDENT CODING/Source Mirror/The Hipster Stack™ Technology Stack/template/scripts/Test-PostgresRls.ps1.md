---
title: 'The Hipster Stack™ Technology Stack\template\scripts\Test-PostgresRls.ps1'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\scripts\Test-PostgresRls.ps1'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.scripts.test-postgresrls.ps1'
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
source_path: 'The Hipster Stack™ Technology Stack\template\scripts\Test-PostgresRls.ps1'
source_file: 'Test-PostgresRls.ps1'
source_sha256: '335b91aabc6c2fbb495a0b6c874e768710f6c1f67fa7833ff969b1ea5be942d6'
generated: true
---

# `Test-PostgresRls.ps1`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\scripts\Test-PostgresRls.ps1`
> SHA-256: `335b91aabc6c2fbb495a0b6c874e768710f6c1f67fa7833ff969b1ea5be942d6`

```powershell
$ErrorActionPreference = "Stop"

$containerName = "vibes-rls-test-$PID"
$adminPassword = [guid]::NewGuid().ToString()
$runtimePassword = [guid]::NewGuid().ToString()
$image = "postgres:17-alpine@sha256:742f40ea20b9ff2ff31db5458d127452988a2164df9e17441e191f3b72252193"

try {
  docker version --format '{{.Server.Version}}' | Out-Null
  if ($LASTEXITCODE -ne 0) { throw "Docker is required for the credential-free PostgreSQL/RLS gate." }
  docker run --detach --name $containerName `
    --env "POSTGRES_PASSWORD=$adminPassword" `
    --env "POSTGRES_DB=vibes_test" `
    --publish "127.0.0.1::5432" `
    $image | Out-Null

  $ready = $false
  for ($attempt = 0; $attempt -lt 60; $attempt++) {
    docker exec $containerName pg_isready --username postgres --dbname vibes_test | Out-Null
    if ($LASTEXITCODE -eq 0) {
      $ready = $true
      break
    }
    Start-Sleep -Milliseconds 500
  }
  if (-not $ready) { throw "Ephemeral PostgreSQL did not become ready." }

  $portOutput = docker port $containerName 5432/tcp
  if ($portOutput -notmatch ':(\d+)$') { throw "Could not resolve the ephemeral PostgreSQL port." }
  $port = $Matches[1]
  $adminUrl = "postgresql://postgres:$adminPassword@127.0.0.1:$port/vibes_test?schema=public"
  $shadowUrl = "postgresql://postgres:$adminPassword@127.0.0.1:$port/vibes_shadow?schema=public"

  docker exec $containerName psql --username postgres --dbname postgres --command "CREATE DATABASE vibes_shadow" | Out-Null
  if ($LASTEXITCODE -ne 0) { throw "Could not create the migration-drift shadow database." }

  $env:DIRECT_DATABASE_URL = $adminUrl
  $env:DATABASE_URL = $adminUrl
  $env:SHADOW_DATABASE_URL = $shadowUrl
  $env:VIBES_SKIP_DOTENV = "1"
  corepack pnpm exec prisma migrate diff --from-migrations prisma/migrations --to-schema prisma/schema.prisma --exit-code
  if ($LASTEXITCODE -ne 0) { throw "Migration baseline drifted from the Prisma schema." }
  corepack pnpm exec prisma migrate deploy
  if ($LASTEXITCODE -ne 0) { throw "Initial migration replay failed." }
  corepack pnpm exec prisma migrate deploy
  if ($LASTEXITCODE -ne 0) { throw "Idempotent migration replay verification failed." }

  $env:TEST_DATABASE_ADMIN_URL = $adminUrl
  $env:TEST_DATABASE_RUNTIME_PASSWORD = $runtimePassword
  corepack pnpm exec vitest run --config vitest.integration.config.ts tests/integration/postgres-rls.test.ts tests/integration/webhook-processing.test.ts tests/integration/stripe-billing.test.ts tests/integration/stripe-connect.test.ts
  if ($LASTEXITCODE -ne 0) { throw "PostgreSQL security integration tests failed." }
}
finally {
  Remove-Item Env:DIRECT_DATABASE_URL -ErrorAction SilentlyContinue
  Remove-Item Env:DATABASE_URL -ErrorAction SilentlyContinue
  Remove-Item Env:TEST_DATABASE_ADMIN_URL -ErrorAction SilentlyContinue
  Remove-Item Env:TEST_DATABASE_RUNTIME_PASSWORD -ErrorAction SilentlyContinue
  Remove-Item Env:SHADOW_DATABASE_URL -ErrorAction SilentlyContinue
  Remove-Item Env:VIBES_SKIP_DOTENV -ErrorAction SilentlyContinue

  if ($containerName -like 'vibes-rls-test-*') {
    docker rm --force $containerName 2>$null | Out-Null
  }
}

```