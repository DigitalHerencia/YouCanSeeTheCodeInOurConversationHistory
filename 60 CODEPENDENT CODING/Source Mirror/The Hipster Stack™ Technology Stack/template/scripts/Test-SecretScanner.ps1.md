---
title: 'The Hipster Stack™ Technology Stack\template\scripts\Test-SecretScanner.ps1'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\scripts\Test-SecretScanner.ps1'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.scripts.test-secretscanner.ps1'
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
source_path: 'The Hipster Stack™ Technology Stack\template\scripts\Test-SecretScanner.ps1'
source_file: 'Test-SecretScanner.ps1'
source_sha256: 'fefcb557a89c6d737d00ae3f262184bf0e3583330342234132920ebff4992123'
generated: true
---

# `Test-SecretScanner.ps1`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\scripts\Test-SecretScanner.ps1`
> SHA-256: `fefcb557a89c6d737d00ae3f262184bf0e3583330342234132920ebff4992123`

```powershell
[CmdletBinding()]
param(
  [string]$RepositoryRoot = (Join-Path $PSScriptRoot '..')
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$scanner = Join-Path $PSScriptRoot 'Invoke-SecretScan.ps1'
$fixtureRoot = Join-Path ([System.IO.Path]::GetTempPath()) ('vibes-secret-fixture-' + [guid]::NewGuid().ToString('N'))

try {
  [System.IO.Directory]::CreateDirectory($fixtureRoot) | Out-Null
  $fixturePath = Join-Path $fixtureRoot 'intentional-fixture.txt'
  $syntheticValue = ('sk' + '_test_' + ('A' * 32))
  [System.IO.File]::WriteAllText($fixturePath, "CLERK_SECRET_KEY=$syntheticValue")

  & pwsh -NoProfile -File $scanner -Mode Path -RepositoryRoot $RepositoryRoot -ScanPath $fixtureRoot *> $null
  if ($LASTEXITCODE -eq 0) {
    throw 'The intentional synthetic secret fixture was not rejected.'
  }

  Write-Host 'Intentional synthetic secret fixture was rejected as expected.'
}
finally {
  if (Test-Path -LiteralPath $fixtureRoot) {
    Remove-Item -LiteralPath $fixtureRoot -Recurse -Force
  }
}

```