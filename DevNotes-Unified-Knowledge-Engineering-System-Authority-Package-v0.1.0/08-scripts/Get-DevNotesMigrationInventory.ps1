[CmdletBinding()]
param(
  [Parameter(Mandatory=$true)][string]$VaultPath,
  [string]$OutputCsv = "devnotes-migration-inventory.csv"
)
$ErrorActionPreference = "Stop"

function Get-Fm {
  param([string[]]$Lines,[string]$Key)
  foreach($line in $Lines) {
    if($line -match ("^\s*" + [regex]::Escape($Key) + ":\s*(.*)$")) { return $Matches[1].Trim().Trim('"') }
  }
  return ""
}

$base = (Resolve-Path $VaultPath).Path
$rows = foreach($file in Get-ChildItem -LiteralPath $VaultPath -Recurse -File -Filter "*.md") {
  $rel = $file.FullName.Substring($base.Length).TrimStart('\','/')
  $lines = Get-Content -LiteralPath $file.FullName -TotalCount 80
  [pscustomobject]@{
    Path=$rel
    LegacyRoot=(($rel -replace '\\','/').Split('/')[0])
    Title=Get-Fm $lines "title"
    Namespace=Get-Fm $lines "namespace"
    Type=Get-Fm $lines "type"
    Project=Get-Fm $lines "project"
    Domain=Get-Fm $lines "domain"
    Status=Get-Fm $lines "status"
    Authority=Get-Fm $lines "authority"
  }
}
$rows | Sort-Object LegacyRoot,Path | Export-Csv -NoTypeInformation -Encoding UTF8 -Path $OutputCsv
Write-Host "Wrote read-only inventory: $OutputCsv"
