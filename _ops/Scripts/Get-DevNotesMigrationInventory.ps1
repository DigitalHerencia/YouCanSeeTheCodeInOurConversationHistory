[CmdletBinding()]
param(
  [Parameter(Mandatory=$true)][string]$VaultPath,
  [string]$OutputCsv = "devnotes-migration-inventory.csv"
)
$ErrorActionPreference = "Stop"

function Write-Utf8Lf {
  param([string]$Path,[string[]]$Content)
  $fullPath = [IO.Path]::GetFullPath($Path)
  $text = ($Content -join "`n").Replace("`r`n", "`n").Replace("`r", "`n").TrimEnd([char[]]"`r`n") + "`n"
  [IO.File]::WriteAllText($fullPath, $text, [Text.UTF8Encoding]::new($false))
}

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
  if($rel.Replace('\','/').StartsWith("_mounts/")) { continue }
  $lines = Get-Content -LiteralPath $file.FullName -TotalCount 80
  [pscustomobject]@{
    Path=$rel
    LegacyRoot=(($rel -replace '\\','/').Split('/')[0])
    Title=Get-Fm $lines "title"
    Namespace=Get-Fm $lines "namespace"
    Role=Get-Fm $lines "role"
    System=Get-Fm $lines "system"
    Workspace=Get-Fm $lines "workspace"
    Type=Get-Fm $lines "type"
    Project=Get-Fm $lines "project"
    Domain=Get-Fm $lines "domain"
    Status=Get-Fm $lines "status"
    Authority=Get-Fm $lines "authority"
  }
}
$csv = $rows | Sort-Object LegacyRoot,Path | ConvertTo-Csv -NoTypeInformation
Write-Utf8Lf -Path $OutputCsv -Content $csv
Write-Host "Wrote read-only inventory: $OutputCsv"
