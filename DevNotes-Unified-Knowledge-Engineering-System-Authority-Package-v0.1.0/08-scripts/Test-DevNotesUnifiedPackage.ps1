[CmdletBinding()]
param([string]$PackagePath=(Split-Path -Parent $PSScriptRoot))
$ErrorActionPreference = "Stop"

$required = @(
"README.md",
"01-authority/DevNotes-Unified-System.Authoritative-Blueprint.md",
"05-machine/role-registry.json",
"05-machine/knowledge-model.json",
"05-machine/note.schema.json",
"06-migration/No-Delete-Migration-Plan.md",
"07-vault-overlay/AGENTS.md",
"08-scripts/Install-DevNotesUnifiedOverlay.ps1"
)

$failed=$false
foreach($rel in $required) {
  if(Test-Path -LiteralPath (Join-Path $PackagePath $rel)) { Write-Host "[PASS] $rel" }
  else { Write-Host "[FAIL] $rel"; $failed=$true }
}

Get-ChildItem -LiteralPath (Join-Path $PackagePath "05-machine") -Filter "*.json" | ForEach-Object {
  try { Get-Content -Raw $_.FullName | ConvertFrom-Json | Out-Null; Write-Host "[PASS JSON] $($_.Name)" }
  catch { Write-Host "[FAIL JSON] $($_.Name)"; $failed=$true }
}

if($failed) { throw "Package validation failed." }
Write-Host "Package validation passed."
