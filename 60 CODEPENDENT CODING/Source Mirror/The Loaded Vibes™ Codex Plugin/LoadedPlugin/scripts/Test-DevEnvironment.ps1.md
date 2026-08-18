---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\scripts\Test-DevEnvironment.ps1'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\scripts\Test-DevEnvironment.ps1'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.scripts.test-devenvironment.ps1'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-loaded-vibes-codex-plugin
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\scripts\Test-DevEnvironment.ps1'
source_file: 'Test-DevEnvironment.ps1'
source_sha256: '9a9bce957d4bdbc856fd0628146425fd2252a1d29a1907c2f7d181bd44aae14f'
generated: true
---

# `Test-DevEnvironment.ps1`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\scripts\Test-DevEnvironment.ps1`
> SHA-256: `9a9bce957d4bdbc856fd0628146425fd2252a1d29a1907c2f7d181bd44aae14f`

```powershell
<#
.SYNOPSIS
    Validates the development environment for AI coding agents.
.DESCRIPTION
    Checks required tools, configurations, and project files to ensure the dev
    environment is ready. Designed to run from the repo's .copilot/scripts folder.
.OUTPUTS
    Exits with code 0 when all checks pass, otherwise 1.
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# Repo root is parent of ".copilot"
$ProjectRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)

function Write-Result {
    param(
        [Parameter(Mandatory)] [bool] $Ok,
        [Parameter(Mandatory)] [string] $Label,
        [string] $Details
    )

    if ($Ok) {
        Write-Host ("  [OK]  {0}" -f $Label) -ForegroundColor Green
        if ($Details) { Write-Host ("        {0}" -f $Details) -ForegroundColor DarkGray }
    } else {
        Write-Host ("  [FAIL]{0}" -f $Label.PadLeft($Label.Length + 1)) -ForegroundColor Red
        if ($Details) { Write-Host ("        {0}" -f $Details) -ForegroundColor DarkGray }
    }
}

function Test-Command {
    param(
        [Parameter(Mandatory)] [string] $Command,
        [Parameter(Mandatory)] [string] $DisplayName,
        [string[]] $VersionArgs = @("--version")
    )

    try {
        $cmd = Get-Command $Command -ErrorAction Stop
        $versionText = $null

        # Best-effort version capture (don’t fail the whole check if version args differ)
        try {
            $versionText = & $cmd.Source @VersionArgs 2>$null | Select-Object -First 1
        } catch {
            $versionText = $null
        }

        Write-Result -Ok $true -Label $DisplayName -Details ($versionText ?? $cmd.Source)
        return $true
    } catch {
        Write-Result -Ok $false -Label $DisplayName -Details "Not found on PATH (command: $Command)"
        return $false
    }
}

function Test-File {
    param(
        [Parameter(Mandatory)] [string] $Path,
        [Parameter(Mandatory)] [string] $DisplayName
    )

    $exists = Test-Path -LiteralPath $Path
    Write-Result -Ok $exists -Label $DisplayName -Details $Path
    return $exists
}

Write-Host ""
Write-Host "Development Environment Check" -ForegroundColor Cyan
Write-Host "=============================" -ForegroundColor Cyan
Write-Host ("ProjectRoot: {0}" -f $ProjectRoot) -ForegroundColor DarkGray
Write-Host ""

$passed = 0
$failed = 0

Write-Host "Required Tools:" -ForegroundColor Yellow
@(
    @{ Cmd = "node"; Name = "Node.js" },
    @{ Cmd = "npm";  Name = "npm" },
    @{ Cmd = "npx";  Name = "npx" },
    @{ Cmd = "git";  Name = "Git" }
) | ForEach-Object {
    if (Test-Command -Command $_.Cmd -DisplayName $_.Name) { $passed++ } else { $failed++ }
}

Write-Host ""
Write-Host "Required Files:" -ForegroundColor Yellow
@(
    @{ Path = (Join-Path $ProjectRoot "package.json");           Name = "package.json" },
    @{ Path = (Join-Path $ProjectRoot "tsconfig.json");         Name = "tsconfig.json" },
    @{ Path = (Join-Path $ProjectRoot "next.config.ts");        Name = "next.config.ts" },
    @{ Path = (Join-Path $ProjectRoot "prisma.config.ts");      Name = "prisma.config.ts" },
    @{ Path = (Join-Path $ProjectRoot "prisma\schema.prisma");  Name = "prisma/schema.prisma" },
    @{ Path = (Join-Path $ProjectRoot "proxy.ts");              Name = "proxy.ts" }
) | ForEach-Object {
    if (Test-File -Path $_.Path -DisplayName $_.Name) { $passed++ } else { $failed++ }
}

Write-Host ""
Write-Host "Environment Files (local):" -ForegroundColor Yellow
@(
    @{ Path = (Join-Path $ProjectRoot ".env");       Name = ".env (local)" },
    @{ Path = (Join-Path $ProjectRoot ".env.local"); Name = ".env.local" }
) | ForEach-Object {
    # These are commonly optional depending on workflow; treat missing as warning.
    $exists = Test-Path -LiteralPath $_.Path
    if ($exists) {
        Write-Result -Ok $true -Label $_.Name -Details $_.Path
        $passed++
    } else {
        Write-Result -Ok $false -Label $_.Name -Details "Missing (may be OK depending on setup)"
        $failed++
    }
}

Write-Host ""
Write-Host "Node Modules:" -ForegroundColor Yellow
$nodeModules = Join-Path $ProjectRoot "node_modules"
if (Test-Path -LiteralPath $nodeModules) {
    Write-Result -Ok $true -Label "node_modules" -Details $nodeModules
    $passed++
} else {
    Write-Result -Ok $false -Label "node_modules" -Details "Run: npm install"
    $failed++
}

Write-Host ""
Write-Host "Prisma Client:" -ForegroundColor Yellow
$prismaClient = Join-Path $ProjectRoot "node_modules\.prisma\client"
if (Test-Path -LiteralPath $prismaClient) {
    Write-Result -Ok $true -Label "Prisma Client" -Details $prismaClient
    $passed++
} else {
    Write-Result -Ok $false -Label "Prisma Client" -Details "Run: npx prisma generate"
    $failed++
}

Write-Host ""
Write-Host "Summary:" -ForegroundColor Cyan
Write-Host ("  Passed: {0}" -f $passed) -ForegroundColor Green
Write-Host ("  Failed: {0}" -f $failed) -ForegroundColor $(if ($failed -gt 0) { "Red" } else { "Green" })

if ($failed -eq 0) {
    Write-Host ""
    Write-Host "Environment ready for development." -ForegroundColor Green
    exit 0
}

Write-Host ""
Write-Host "Environment has issues. Fix failures above and re-run." -ForegroundColor Red
exit 1

```