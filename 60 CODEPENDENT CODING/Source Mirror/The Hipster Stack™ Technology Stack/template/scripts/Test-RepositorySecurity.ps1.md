---
title: 'The Hipster Stack™ Technology Stack\template\scripts\Test-RepositorySecurity.ps1'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\scripts\Test-RepositorySecurity.ps1'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.scripts.test-repositorysecurity.ps1'
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
source_path: 'The Hipster Stack™ Technology Stack\template\scripts\Test-RepositorySecurity.ps1'
source_file: 'Test-RepositorySecurity.ps1'
source_sha256: '5c8dcb9146f25af2a736e9991c649eb526e060efd0c47c4cc7b0cbc97094f1bc'
generated: true
---

# `Test-RepositorySecurity.ps1`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\scripts\Test-RepositorySecurity.ps1`
> SHA-256: `5c8dcb9146f25af2a736e9991c649eb526e060efd0c47c4cc7b0cbc97094f1bc`

```powershell
[CmdletBinding()]
param(
  [string]$RepositoryRoot = (Join-Path $PSScriptRoot '..'),
  [string]$ArchiveRef = 'HEAD'
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$repositoryPath = (Resolve-Path -LiteralPath $RepositoryRoot).Path
$scanner = Join-Path $PSScriptRoot 'Invoke-SecretScan.ps1'
$fixtureTest = Join-Path $PSScriptRoot 'Test-SecretScanner.ps1'
$temporaryRoot = Join-Path ([System.IO.Path]::GetTempPath()) ('vibes-security-' + [guid]::NewGuid().ToString('N'))
$archivePath = Join-Path $temporaryRoot 'repository.zip'
$expandedPath = Join-Path $temporaryRoot 'archive'

function Invoke-CheckedPowerShell {
  param(
    [Parameter(Mandatory)][string]$Label,
    [Parameter(Mandatory)][string[]]$Arguments
  )

  Write-Host "Running: $Label"
  & pwsh -NoProfile @Arguments
  if ($LASTEXITCODE -ne 0) {
    throw "$Label failed."
  }
}

try {
  Invoke-CheckedPowerShell -Label 'worktree secret scan' -Arguments @('-File', $scanner, '-Mode', 'Worktree', '-RepositoryRoot', $repositoryPath)
  Invoke-CheckedPowerShell -Label 'all-ref Git history secret scan' -Arguments @('-File', $scanner, '-Mode', 'History', '-RepositoryRoot', $repositoryPath)

  [System.IO.Directory]::CreateDirectory($temporaryRoot) | Out-Null
  [System.IO.Directory]::CreateDirectory($expandedPath) | Out-Null
  & git -C $repositoryPath archive --format=zip --output=$archivePath $ArchiveRef
  if ($LASTEXITCODE -ne 0) {
    throw "Unable to create the release archive from $ArchiveRef."
  }

  Expand-Archive -LiteralPath $archivePath -DestinationPath $expandedPath
  Invoke-CheckedPowerShell -Label 'generated release archive secret scan' -Arguments @('-File', $scanner, '-Mode', 'Path', '-RepositoryRoot', $repositoryPath, '-ScanPath', $expandedPath)
  Invoke-CheckedPowerShell -Label 'intentional secret fixture rejection' -Arguments @('-File', $fixtureTest, '-RepositoryRoot', $repositoryPath)

  Write-Host 'Repository security verification passed.'
}
finally {
  if (Test-Path -LiteralPath $temporaryRoot) {
    Remove-Item -LiteralPath $temporaryRoot -Recurse -Force
  }
}

```