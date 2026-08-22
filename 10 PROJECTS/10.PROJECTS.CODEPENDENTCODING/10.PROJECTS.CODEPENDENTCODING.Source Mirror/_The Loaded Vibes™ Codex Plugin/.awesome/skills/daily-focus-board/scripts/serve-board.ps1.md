---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\daily-focus-board\scripts\serve-board.ps1'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\daily-focus-board\scripts\serve-board.ps1'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.daily-focus-board.scripts.serve-board.ps1'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\daily-focus-board\scripts\serve-board.ps1'
source_file: 'serve-board.ps1'
source_sha256: '2c5dbddb59f1463962283f379594a125a83dce5afe9923c6c77a8127117e31c1'
generated: true
---

# `serve-board.ps1`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\daily-focus-board\scripts\serve-board.ps1`
> SHA-256: `2c5dbddb59f1463962283f379594a125a83dce5afe9923c6c77a8127117e31c1`

```powershell
# serve-board.ps1 — serve a generated focus board and print the URL.
# Usage: pwsh scripts/serve-board.ps1 [-Dir <folder>] [-File focus-board.html] [-Port 8799]
param(
  [string]$Dir  = (Get-Location).Path,
  [string]$File = "focus-board.html",
  [int]   $Port = 8799
)
$full = Join-Path $Dir $File
if (-not (Test-Path $full)) { Write-Error "Board not found: $full"; exit 1 }
try {
  if (Get-NetTCPConnection -State Listen -LocalPort $Port -ErrorAction SilentlyContinue) {
    Write-Error "Port $Port is already in use — choose another with -Port or stop the existing server."; exit 1
  }
} catch { }  # Get-NetTCPConnection may be unavailable on some platforms; skip the pre-check there.
$proc = Start-Process -FilePath "python" -ArgumentList @("-m","http.server","$Port","--bind","127.0.0.1","--directory","`"$Dir`"") -WindowStyle Hidden -PassThru
Start-Sleep -Seconds 2
if ($proc.HasExited) {
  Write-Error "The server exited on startup (code $($proc.ExitCode)) — is Python installed and the port free?"; exit 1
}
$url = "http://localhost:$Port/$File"
Write-Host "Focus board: $url"
Write-Host "Server PID $($proc.Id) — stop it with: Stop-Process -Id $($proc.Id)"
Start-Process $url   # opens in default browser; in a Copilot-app session, open a browser canvas to this URL instead

```