[CmdletBinding()]
param(
  [Parameter(Mandatory=$true)][string]$VaultPath,
  [switch]$Apply,
  [switch]$Force
)

$ErrorActionPreference = "Stop"
$packageRoot = Split-Path -Parent $PSScriptRoot
$overlay = Join-Path $packageRoot "07-vault-overlay"

if (-not (Test-Path -LiteralPath $VaultPath)) { throw "VaultPath does not exist: $VaultPath" }

Write-Host ("Mode: " + $(if ($Apply) { "APPLY" } else { "DRY RUN" }))

Get-ChildItem -LiteralPath $overlay -Recurse -File | ForEach-Object {
  $relative = $_.FullName.Substring($overlay.Length).TrimStart('\','/')
  $target = Join-Path $VaultPath $relative
  $exists = Test-Path -LiteralPath $target

  if ($exists -and -not $Force) {
    Write-Host "[SKIP existing] $relative"
    return
  }

  if (-not $Apply) {
    Write-Host ("[WOULD {0}] {1}" -f $(if ($exists) { "OVERWRITE" } else { "CREATE" }), $relative)
    return
  }

  $parent = Split-Path -Parent $target
  if (-not (Test-Path -LiteralPath $parent)) { New-Item -ItemType Directory -Path $parent -Force | Out-Null }
  Copy-Item -LiteralPath $_.FullName -Destination $target -Force
  Write-Host ("[{0}] {1}" -f $(if ($exists) { "OVERWROTE" } else { "CREATED" }), $relative)
}

Write-Host "No files were moved or deleted. .obsidian was not modified."
