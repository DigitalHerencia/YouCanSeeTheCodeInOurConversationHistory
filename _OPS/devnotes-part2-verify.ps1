param(
  [string]$ImportDate = (Get-Date -Format "yyyy-MM-dd")
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath ".obsidian")) {
  throw "Run this script from the DevNotes vault root."
}

$ManifestPath = "_OPS\manifests\devnotes-part2-migration-$ImportDate.csv"
if (-not (Test-Path -LiteralPath $ManifestPath)) {
  throw "Missing migration manifest: $ManifestPath"
}

$manifest = Import-Csv -LiteralPath $ManifestPath
$generated = @($manifest | Where-Object { -not [string]::IsNullOrWhiteSpace($_.output_path) } | Select-Object -ExpandProperty output_path -Unique)
$archives = @($manifest | Where-Object { -not [string]::IsNullOrWhiteSpace($_.archive_path) } | Select-Object -ExpandProperty archive_path -Unique)

$errors = [System.Collections.Generic.List[string]]::new()

foreach ($path in $generated) {
  if (-not (Test-Path -LiteralPath $path)) {
    $errors.Add("Missing generated note: $path") | Out-Null
    continue
  }
  $reader = [System.IO.StreamReader]::new((Resolve-Path -LiteralPath $path).Path, $true)
  try {
    $first = $reader.ReadLine()
    if ($first -ne "---") {
      $errors.Add("Frontmatter is not first content: $path") | Out-Null
    }
  } finally {
    $reader.Dispose()
  }
  $yaml = Get-Content -LiteralPath $path -TotalCount 80
  $inYaml = $false
  foreach ($line in $yaml) {
    if ($line -eq "---") {
      if (-not $inYaml) {
        $inYaml = $true
      } else {
        break
      }
      continue
    }
    if ($inYaml -and $line.TrimStart().StartsWith("* ")) {
      $errors.Add("Markdown bullet used inside YAML: $path") | Out-Null
      break
    }
  }
}

foreach ($path in $archives) {
  if (-not (Test-Path -LiteralPath $path)) {
    $errors.Add("Missing archived original: $path") | Out-Null
  }
}

if ($errors.Count -gt 0) {
  $errors | ForEach-Object { Write-Error $_ }
  throw "Verification failed with $($errors.Count) issue(s)."
}

Write-Host "Verification passed."
Write-Host "Generated notes: $($generated.Count)"
Write-Host "Archived originals: $($archives.Count)"
