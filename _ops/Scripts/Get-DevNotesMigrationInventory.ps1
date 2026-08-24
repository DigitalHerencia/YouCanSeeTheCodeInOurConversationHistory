[CmdletBinding()]
param(
  [Parameter(Mandatory=$true)][string]$VaultPath,
  [string]$OutputCsv = "devnotes-migration-inventory.csv",
  [string]$OutputSummary = "devnotes-migration-inventory.summary.json"
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

function Get-MigrationProjection {
  param(
    [string]$RelativePath,
    [string]$LegacyRoot,
    [string]$Type,
    [string]$Role,
    [string]$System,
    [string]$Workspace
  )

  $normalized = $RelativePath.Replace('\','/')
  $projection = [ordered]@{
    SuggestedRole = $Role
    SuggestedSystem = $System
    SuggestedWorkspace = $Workspace
    SuggestedTarget = $LegacyRoot
    MigrationDisposition = "already-unified"
    Confidence = "high"
    NeedsHumanReview = $false
  }

  switch -Regex ($LegacyRoot) {
    '^00 ZETTELKASTEN$' {
      $projection.SuggestedRole = if($Role){$Role}else{"devnotes"}
      $projection.SuggestedSystem = if($System){$System}else{"devnotes"}
      $projection.SuggestedTarget = "DevNotes/Inbox"
      if($Type -eq "capture") {
        $projection.MigrationDisposition = "promote-capture-when-processed"
      } else {
        $projection.MigrationDisposition = "classify-before-promotion"
        $projection.Confidence = "medium"
        $projection.NeedsHumanReview = $true
      }
    }
    '^10 PROJECTS$' {
      if($normalized -match '/10\.PROJECTS\.CHATGPT(/|$)') {
        $projection.SuggestedRole = if($Role){$Role}else{"chief-of-staff"}
        $projection.SuggestedSystem = if($System){$System}else{"devnotes"}
        $projection.SuggestedWorkspace = if($Workspace){$Workspace}else{"chatgpt-role-system"}
        $projection.SuggestedTarget = "role Canon or Chief of Staff/Workspaces/chatgpt-role-system"
        $projection.MigrationDisposition = "preserve-provenance-and-link"
        $projection.Confidence = "medium"
        $projection.NeedsHumanReview = $true
      } elseif($normalized -match '/10\.PROJECTS\.CODEPENDENTCODING/10\.PROJECTS\.CODEPENDENTCODING\.Source Mirror(/|$)') {
        $projection.SuggestedSystem = "codependent-coding"
        $projection.SuggestedWorkspace = "codependent-coding"
        $projection.SuggestedTarget = "preserve Source Mirror pending explicit deletion gate"
        $projection.MigrationDisposition = "preserve-source-mirror"
      } elseif($normalized -match '/10\.PROJECTS\.CODEPENDENTCODING(/|$)') {
        $projection.SuggestedRole = if($Role){$Role}else{"role-owner-by-responsibility"}
        $projection.SuggestedSystem = "codependent-coding"
        $projection.SuggestedWorkspace = if($Workspace){$Workspace}else{"codependent-coding"}
        $projection.SuggestedTarget = "role-owned Codependent Coding lens or current project workspace"
        $projection.MigrationDisposition = "preserve-canon-and-link"
        $projection.Confidence = "medium"
        $projection.NeedsHumanReview = -not [bool]$Role
      } else {
        $projection.SuggestedRole = if($Role){$Role}else{"role-owner-by-responsibility"}
        $projection.SuggestedWorkspace = if($Workspace){$Workspace}else{"derive-from-project"}
        $projection.SuggestedTarget = "receiving role/Workspaces/<workspace>"
        $projection.MigrationDisposition = "classify-project-by-responsibility"
        $projection.Confidence = "low"
        $projection.NeedsHumanReview = $true
      }
    }
    '^20 DOCUMENTATION$' {
      $projection.SuggestedRole = if($Role){$Role}else{"devnotes"}
      $projection.SuggestedTarget = "receiving role/Reference or DevNotes/Reference"
      $projection.MigrationDisposition = "classify-reference-by-meaning"
      $projection.Confidence = "low"
      $projection.NeedsHumanReview = $true
    }
    '^30 DEEP RESEARCH$' {
      $projection.SuggestedRole = if($Role){$Role}else{"role-owner-by-subject"}
      $projection.SuggestedTarget = "receiving role/Workspaces/<workspace>/Research or DevNotes/Research"
      $projection.MigrationDisposition = "classify-research-by-subject"
      $projection.Confidence = "low"
      $projection.NeedsHumanReview = $true
    }
    '^40 ARCHIVE$' {
      $projection.SuggestedRole = if($Role){$Role}else{"role-owner-by-history"}
      $projection.SuggestedTarget = "receiving role/Archive"
      $projection.MigrationDisposition = "preserve-archive"
      $projection.Confidence = "medium"
      $projection.NeedsHumanReview = $true
    }
    '^50 (REGRETS, CIGARETTES, & NEURAL NETS|CIGARETTES, REGRETS, & NEURAL NETS)$' {
      $projection.SuggestedRole = if($Role){$Role}else{"role-owner-by-meaning"}
      $projection.SuggestedTarget = "classify note-by-note"
      $projection.MigrationDisposition = "no-blanket-rule"
      $projection.Confidence = "low"
      $projection.NeedsHumanReview = $true
    }
    '^60 CODEPENDENT CODING$' {
      $projection.SuggestedRole = if($Role){$Role}else{"role-owner-by-responsibility"}
      $projection.SuggestedSystem = "codependent-coding"
      $projection.SuggestedTarget = "receiving role/Canon with stable namespace links"
      $projection.MigrationDisposition = "preserve-shared-kernel-and-link"
      $projection.Confidence = "medium"
      $projection.NeedsHumanReview = -not [bool]$Role
    }
    '^70 TODO$' {
      $projection.SuggestedRole = if($Role){$Role}else{"chief-of-staff"}
      $projection.SuggestedTarget = "Chief of Staff work views"
      $projection.MigrationDisposition = "project-into-operational-views"
    }
    '^90 OBSIDIAN$' {
      $projection.SuggestedRole = "devnotes"
      $projection.SuggestedSystem = "devnotes"
      $projection.SuggestedTarget = "_obsidian durable asset or legacy compatibility path"
      $projection.MigrationDisposition = "preserve-until-path-consumers-migrate"
    }
  }

  return [pscustomobject]$projection
}

function Get-PathSensitiveEvidence {
  param([string]$Content)
  $kinds = [Collections.Generic.List[string]]::new()
  $count = 0
  $patterns = [ordered]@{
    "path-qualified-wikilink" = '!?' + '\[\[[^\]\r\n]*[/\\][^\]\r\n]*\]\]'
    "embed" = '!\[\['
    "query-folder-source" = '(?im)\bFROM\s+["''][^"'']+["'']|file\.inFolder\s*\('
    "path-qualified-markdown-link" = '\]\((?!https?://|mailto:|#)[^\)\r\n]*[/\\][^\)\r\n]*\)'
  }
  foreach($entry in $patterns.GetEnumerator()) {
    $matches = [regex]::Matches($Content,$entry.Value)
    if($matches.Count -gt 0) {
      $kinds.Add($entry.Key)
      $count += $matches.Count
    }
  }
  return [pscustomobject]@{ Count=$count; Kinds=($kinds -join ';') }
}

$base = (Resolve-Path $VaultPath).Path
$rows = foreach($file in Get-ChildItem -LiteralPath $VaultPath -Recurse -File -Filter "*.md") {
  $rel = $file.FullName.Substring($base.Length).TrimStart('\','/')
  if($rel.Replace('\','/').StartsWith("_mounts/")) { continue }
  $lines = Get-Content -LiteralPath $file.FullName -TotalCount 80
  $content = Get-Content -Raw -LiteralPath $file.FullName
  $legacyRoot = (($rel -replace '\\','/').Split('/')[0])
  $type = Get-Fm $lines "type"
  $role = Get-Fm $lines "role"
  $system = Get-Fm $lines "system"
  $workspace = Get-Fm $lines "workspace"
  $projection = Get-MigrationProjection -RelativePath $rel -LegacyRoot $legacyRoot -Type $type -Role $role -System $system -Workspace $workspace
  $pathEvidence = Get-PathSensitiveEvidence -Content $content
  [pscustomobject]@{
    Path=$rel
    LegacyRoot=$legacyRoot
    Title=Get-Fm $lines "title"
    Namespace=Get-Fm $lines "namespace"
    Role=$role
    System=$system
    Workspace=$workspace
    Type=$type
    Project=Get-Fm $lines "project"
    Domain=Get-Fm $lines "domain"
    Status=Get-Fm $lines "status"
    Authority=Get-Fm $lines "authority"
    SuggestedRole=$projection.SuggestedRole
    SuggestedSystem=$projection.SuggestedSystem
    SuggestedWorkspace=$projection.SuggestedWorkspace
    SuggestedTarget=$projection.SuggestedTarget
    MigrationDisposition=$projection.MigrationDisposition
    Confidence=$projection.Confidence
    NeedsHumanReview=$projection.NeedsHumanReview
    PathSensitiveReferenceCount=$pathEvidence.Count
    PathSensitiveKinds=$pathEvidence.Kinds
  }
}
$csv = $rows | Sort-Object LegacyRoot,Path | ConvertTo-Csv -NoTypeInformation
Write-Utf8Lf -Path $OutputCsv -Content $csv

$summary = [ordered]@{
  generated_at = (Get-Date).ToUniversalTime().ToString("o")
  total = @($rows).Count
  human_review = @($rows | Where-Object NeedsHumanReview).Count
  path_sensitive = @($rows | Where-Object PathSensitiveReferenceCount -gt 0).Count
  low_risk_physical_moves_performed = 0
  deletion_performed = $false
  by_root = [ordered]@{}
  by_disposition = [ordered]@{}
}
foreach($group in $rows | Group-Object LegacyRoot | Sort-Object Name) { $summary.by_root[$group.Name] = $group.Count }
foreach($group in $rows | Group-Object MigrationDisposition | Sort-Object Name) { $summary.by_disposition[$group.Name] = $group.Count }
Write-Utf8Lf -Path $OutputSummary -Content (($summary | ConvertTo-Json -Depth 6) -split "`r?`n")
Write-Host "Wrote conservative migration inventory: $OutputCsv"
Write-Host "Wrote migration summary: $OutputSummary"
