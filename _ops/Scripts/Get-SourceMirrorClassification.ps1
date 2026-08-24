[CmdletBinding()]
param(
  [Parameter(Mandatory=$true)][string]$VaultPath,
  [Parameter(Mandatory=$true)][string]$SourceRoot,
  [string]$OutputCsv = "source-mirror-classification.csv",
  [string]$SummaryJson = "source-mirror-classification.summary.json"
)

$ErrorActionPreference = "Stop"

function Write-Utf8Lf {
  param([string]$Path,[string[]]$Content)
  $fullPath = [IO.Path]::GetFullPath($Path)
  $text = ($Content -join "`n").Replace("`r`n", "`n").Replace("`r", "`n").TrimEnd([char[]]"`r`n") + "`n"
  [IO.File]::WriteAllText($fullPath, $text, [Text.UTF8Encoding]::new($false))
}

function Get-FrontmatterValue {
  param([string[]]$Lines,[string]$Key)
  foreach($line in $Lines) {
    if($line -match ("^\s*" + [regex]::Escape($Key) + ":\s*(.*)$")) {
      return $Matches[1].Trim().Trim("'").Trim('"')
    }
  }
  return ""
}

$vault = (Resolve-Path -LiteralPath $VaultPath).Path
$source = (Resolve-Path -LiteralPath $SourceRoot).Path
$mirrorRelative = "10 PROJECTS\10.PROJECTS.CODEPENDENTCODING\10.PROJECTS.CODEPENDENTCODING.Source Mirror"
$mirror = Join-Path $vault $mirrorRelative

if(-not (Test-Path -LiteralPath $mirror)) { throw "Source Mirror does not exist: $mirror" }

$rows = foreach($file in Get-ChildItem -LiteralPath $mirror -Recurse -File -Filter "*.md") {
  $lines = Get-Content -LiteralPath $file.FullName -TotalCount 80
  $sourcePath = Get-FrontmatterValue $lines "source_path"
  $sourceSha = (Get-FrontmatterValue $lines "source_sha256").ToLowerInvariant()
  $generated = (Get-FrontmatterValue $lines "generated").ToLowerInvariant() -eq "true"
  $type = Get-FrontmatterValue $lines "type"
  $livePath = if($sourcePath) { Join-Path $source $sourcePath } else { "" }
  $liveExists = $livePath -and (Test-Path -LiteralPath $livePath -PathType Leaf)
  $liveSha = if($liveExists) { (Get-FileHash -LiteralPath $livePath -Algorithm SHA256).Hash.ToLowerInvariant() } else { "" }
  $exactMatch = $liveExists -and $sourceSha -and ($sourceSha -eq $liveSha)

  $classification = "provenance/history"
  $reason = "Generated or source-identified snapshot is not an exact current live-code duplicate."
  $deletionCandidate = $false

  if($generated -and $exactMatch) {
    $classification = "live-code duplicate"
    $reason = "Generated mirror wrapper records the same SHA-256 as the current trusted source file."
    $deletionCandidate = $true
  }
  elseif(-not $generated -and $type -in @("contract","reference","research","map","source-document")) {
    $classification = "durable extracted knowledge"
    $reason = "Non-generated durable knowledge shape; preserve and inspect before any move."
  }
  elseif(-not $generated -and -not $sourcePath) {
    $classification = "unique annotation"
    $reason = "No generated/source-path declaration; preserve as potentially unique annotation."
  }

  [pscustomobject]@{
    mirror_path = $file.FullName.Substring($vault.Length).TrimStart('\','/')
    source_path = $sourcePath
    live_path = $livePath
    generated = $generated
    source_sha256 = $sourceSha
    live_sha256 = $liveSha
    live_exists = [bool]$liveExists
    exact_match = [bool]$exactMatch
    primary_classification = $classification
    deletion_candidate = [bool]$deletionCandidate
    reason = $reason
  }
}

$rows = @($rows | Sort-Object primary_classification,mirror_path)
$csv = $rows | ConvertTo-Csv -NoTypeInformation
Write-Utf8Lf -Path $OutputCsv -Content $csv

$summary = [ordered]@{
  generated_at = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ssK")
  source_root = $source
  source_root_is_git_repository = Test-Path -LiteralPath (Join-Path $source ".git")
  mirror_root = $mirrorRelative.Replace('\','/')
  total = $rows.Count
  classifications = [ordered]@{
    "live-code duplicate" = 0
    "durable extracted knowledge" = 0
    "provenance/history" = 0
    "unique annotation" = 0
  }
  deletion_candidates = @($rows | Where-Object deletion_candidate).Count
  deletion_performed = $false
  deletion_gate = "Explicit user approval plus path/link/query verification"
}

$rows | Group-Object primary_classification | Sort-Object Name | ForEach-Object {
  $summary.classifications[$_.Name] = $_.Count
}

$summaryJsonContent = $summary | ConvertTo-Json -Depth 6
Write-Utf8Lf -Path $SummaryJson -Content $summaryJsonContent
Write-Host "Wrote classification inventory: $OutputCsv"
Write-Host "Wrote classification summary: $SummaryJson"
Write-Host "No Source Mirror files were changed or deleted."
