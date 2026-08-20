---
title: 'The Hipster Stack™ Technology Stack\template\scripts\Test-ConnectRemoval.ps1'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\scripts\Test-ConnectRemoval.ps1'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.scripts.test-connectremoval.ps1'
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
source_path: 'The Hipster Stack™ Technology Stack\template\scripts\Test-ConnectRemoval.ps1'
source_file: 'Test-ConnectRemoval.ps1'
source_sha256: '8169ec37204cea268df5852b18ad2a24c8bb6ef5a5d10e2ba8d558804d324912'
generated: true
---

# `Test-ConnectRemoval.ps1`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\scripts\Test-ConnectRemoval.ps1`
> SHA-256: `8169ec37204cea268df5852b18ad2a24c8bb6ef5a5d10e2ba8d558804d324912`

```powershell
$ErrorActionPreference = "Stop"

$sourceRoot = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot ".."))
$tempBase = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$tempRoot = [IO.Path]::GetFullPath((Join-Path $tempBase ("vibes-connect-removal-" + [guid]::NewGuid().ToString("N"))))

if (-not $tempRoot.StartsWith($tempBase, [StringComparison]::OrdinalIgnoreCase)) {
  throw "Connect removal workspace must stay inside the system temporary directory."
}

$optionalPaths = @(
  "app/api/stripe/connect",
  "lib/actions/connectActions.ts",
  "lib/connect",
  "lib/db/transactions/connectTransactions.ts",
  "lib/fetchers/connectFetchers.ts",
  "lib/integrations/stripe/connect.ts",
  "lib/integrations/stripe/connectWebhooks.ts",
  "lib/webhooks/connectWebhookWorkflow.ts",
  "schemas/connectSchemas.ts",
  "types/connectTypes.ts",
  "tests/unit/connect",
  "tests/integration/stripe-connect.test.ts",
  "tests/contract/stripe-connect-surface.test.ts"
)

try {
  New-Item -ItemType Directory -Path $tempRoot | Out-Null
  robocopy $sourceRoot $tempRoot /E /XD .git .next node_modules coverage test-results playwright-report /XF .env .env.local | Out-Null
  if ($LASTEXITCODE -gt 7) { throw "Could not copy the removal-proof workspace." }

  foreach ($relativePath in $optionalPaths) {
    $target = [IO.Path]::GetFullPath((Join-Path $tempRoot $relativePath))
    if (-not $target.StartsWith($tempRoot, [StringComparison]::OrdinalIgnoreCase)) {
      throw "Optional-module target escaped the removal-proof workspace."
    }
    if (Test-Path -LiteralPath $target) {
      Remove-Item -LiteralPath $target -Recurse -Force
    }
  }

  Push-Location $tempRoot
  try {
    corepack pnpm install --prefer-offline --frozen-lockfile --ignore-scripts
    if ($LASTEXITCODE -ne 0) { throw "Could not materialize the isolated dependency tree." }
    corepack pnpm exec prisma generate
    if ($LASTEXITCODE -ne 0) { throw "Could not generate the isolated Prisma client." }
    corepack pnpm exec next build
    if ($LASTEXITCODE -ne 0) { throw "Core build failed after removing Stripe Connect." }
  }
  finally {
    Pop-Location
  }
}
finally {
  if (
    (Test-Path -LiteralPath $tempRoot) -and
    $tempRoot.StartsWith($tempBase, [StringComparison]::OrdinalIgnoreCase)
  ) {
    Remove-Item -LiteralPath $tempRoot -Recurse -Force
  }
}

```