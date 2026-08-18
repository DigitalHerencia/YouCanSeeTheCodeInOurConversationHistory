---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\scripts\Run-AllAnalysis.ps1'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\scripts\Run-AllAnalysis.ps1'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.scripts.run-allanalysis.ps1'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\scripts\Run-AllAnalysis.ps1'
source_file: 'Run-AllAnalysis.ps1'
source_sha256: '559635669a87164ad622081cd1509315ce49ed0010885ed3c230dfcbf785b19a'
generated: true
---

# `Run-AllAnalysis.ps1`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\scripts\Run-AllAnalysis.ps1`
> SHA-256: `559635669a87164ad622081cd1509315ce49ed0010885ed3c230dfcbf785b19a`

```powershell
<#
.SYNOPSIS
    Master script to run all analysis and generate comprehensive reports
.DESCRIPTION
    Orchestrates all analysis scripts and generates a unified report
    optimized for AI agent onboarding.
#>

param(
    [string]$OutputDir
)

$ErrorActionPreference = "Stop"
$ScriptDir = $PSScriptRoot
$ProjectRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)

if (-not $PSBoundParameters.ContainsKey('OutputDir') -or [string]::IsNullOrWhiteSpace($OutputDir)) {
    $OutputDir = Join-Path $ProjectRoot ".copilot"
}

if (-not (Test-Path -LiteralPath $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir -Force | Out-Null
}

Write-Host @"
╔══════════════════════════════════════════════════════════════╗
║             NOTIONISTA - AI AGENT ONBOARDING SYSTEM          ║
║                    Analysis Suite v1.0                       ║
╚══════════════════════════════════════════════════════════════╝
"@ -ForegroundColor Cyan

$startTime = Get-Date

# Run environment check
Write-Host "`n[1/4] Environment Validation" -ForegroundColor Magenta
& "$ScriptDir\Test-DevEnvironment.ps1"

# Run codebase analysis
Write-Host "`n[2/4] Codebase Structure Analysis" -ForegroundColor Magenta
& "$ScriptDir\Analyze-Codebase.ps1" -OutputDir $OutputDir -Format "both"

# Generate symbol map
Write-Host "`n[3/4] Symbol Map Generation" -ForegroundColor Magenta
& "$ScriptDir\Get-SymbolMap.ps1" -OutputPath (Join-Path $OutputDir "symbol-map.json")

# Build context chunks
Write-Host "`n[4/4] Context Chunk Generation" -ForegroundColor Magenta
& "$ScriptDir\Build-ContextChunks.ps1" -OutputDir $OutputDir -MaxChunkTokens 2000

$endTime = Get-Date
$duration = $endTime - $startTime

Write-Host @"

╔══════════════════════════════════════════════════════════════╗
║                    ANALYSIS COMPLETE                         ║
╠══════════════════════════════════════════════════════════════╣
║  Duration: $($duration.ToString                              ║           ║  ("mm\:ss"))                                                 ║
║  Output: $OutputDir                                          ║
║                                                              ║
║  Generated Artifacts:                                        ║
║  • codebase-analysis.json    - Full structure data           ║
║  • codebase-analysis.md      - Human-readable report         ║
║  • symbol-map.json           - Exported symbols index        ║
║  • context-chunks.json       - RAG-optimized chunks          ║
╚══════════════════════════════════════════════════════════════╝
"@ -ForegroundColor Green

```