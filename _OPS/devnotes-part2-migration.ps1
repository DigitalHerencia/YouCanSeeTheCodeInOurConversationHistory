param(
  [switch]$DryRun,
  [switch]$Execute,
  [string]$ImportDate = (Get-Date -Format "yyyy-MM-dd")
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if ($DryRun -eq $Execute) {
  throw "Use exactly one mode: -DryRun or -Execute."
}

if (-not (Test-Path -LiteralPath ".obsidian")) {
  throw "Run this script from the DevNotes vault root."
}

$InboxPath = "00 ZETTELKASTEN\INBOX"
$ChatOutputPath = "00 ZETTELKASTEN\10 CHAT ARCHIVE"
$SourceOutputPath = "00 ZETTELKASTEN\20 SOURCE INDEX"
$ArchiveRoot = "00 ZETTELKASTEN\90 ARCHIVE\imports\$ImportDate"
$ManifestDir = "_OPS\manifests"
$ManifestPath = Join-Path $ManifestDir "devnotes-part2-migration-$ImportDate.csv"
$FolderManifestPath = Join-Path $ManifestDir "devnotes-part2-empty-folders-$ImportDate.csv"

function Ensure-Dir {
  param([string]$Path)
  if (-not (Test-Path -LiteralPath $Path)) {
    if ($DryRun) {
      Write-Host "DRY DIR  $Path"
    } else {
      New-Item -ItemType Directory -Force -Path $Path | Out-Null
      Write-Host "DIR      $Path"
    }
  }
}

function ConvertTo-Slug {
  param([string]$Value)
  if ([string]::IsNullOrWhiteSpace($Value)) {
    $Value = "untitled"
  }
  $slug = $Value.ToLowerInvariant()
  $slug = $slug -replace '&', ' and '
  $slug = $slug -replace '[^a-z0-9]+', '.'
  $slug = $slug.Trim('.')
  $slug = $slug -replace '\.{2,}', '.'
  if ([string]::IsNullOrWhiteSpace($slug)) { return "untitled" }
  return $slug
}

function ConvertTo-YamlScalar {
  param($Value)
  if ($null -eq $Value) { return "" }
  $text = [string]$Value
  $text = $text -replace '"', '\"'
  return '"' + $text + '"'
}

function ConvertTo-MarkdownText {
  param($Value)
  if ($null -eq $Value) { return "" }
  return ([string]$Value).TrimEnd()
}

function Get-RelativePath {
  param([string]$Path)
  $root = (Get-Location).Path
  $full = [System.IO.Path]::GetFullPath($Path)
  if ($full.StartsWith($root, [System.StringComparison]::OrdinalIgnoreCase)) {
    return ($full.Substring($root.Length).TrimStart('\') -replace '\\', '/')
  }
  return ($Path -replace '\\', '/')
}

function Write-TextFile {
  param(
    [string]$Path,
    [string]$Content
  )
  if ($DryRun) {
    Write-Host "DRY FILE $Path"
    return
  }
  $dir = Split-Path -Parent $Path
  Ensure-Dir $dir
  [System.IO.File]::WriteAllText((Resolve-Path -LiteralPath $dir).Path + "\" + (Split-Path -Leaf $Path), $Content, [System.Text.UTF8Encoding]::new($false))
  Write-Host "FILE     $Path"
}

function Move-Original {
  param(
    [string]$SourcePath,
    [string]$ArchivePath
  )
  if ($DryRun) {
    Write-Host "DRY MOVE $SourcePath -> $ArchivePath"
    return
  }
  Ensure-Dir (Split-Path -Parent $ArchivePath)
  if (Test-Path -LiteralPath $ArchivePath) {
    $leaf = [System.IO.Path]::GetFileNameWithoutExtension($ArchivePath)
    $ext = [System.IO.Path]::GetExtension($ArchivePath)
    $parent = Split-Path -Parent $ArchivePath
    $ArchivePath = Join-Path $parent "$leaf.$([guid]::NewGuid().ToString('N').Substring(0,8))$ext"
  }
  Move-Item -LiteralPath $SourcePath -Destination $ArchivePath
  Write-Host "MOVE     $SourcePath -> $ArchivePath"
}

function Add-ManifestRow {
  param(
    [System.Collections.Generic.List[object]]$Rows,
    [string]$Action,
    [string]$SourcePath,
    [string]$OutputPath,
    [string]$ArchivePath,
    [string]$NoteType,
    [string]$Status,
    [string]$Hash,
    [string]$Details
  )
  $Rows.Add([pscustomobject]@{
    action = $Action
    source_path = Get-RelativePath $SourcePath
    output_path = $OutputPath
    archive_path = $ArchivePath
    note_type = $NoteType
    status = $Status
    sha256 = $Hash
    details = $Details
  }) | Out-Null
}

function New-Frontmatter {
  param(
    [string]$Title,
    [string]$Type,
    [string]$Scope,
    [string]$Domain,
    [string]$Artifact,
    [string]$Kind,
    [string]$Namespace,
    [string]$Status,
    [string]$Authority,
    [string]$Parent,
    [string[]]$Tags,
    [hashtable]$Extra = @{}
  )
  $lines = [System.Collections.Generic.List[string]]::new()
  $lines.Add("---") | Out-Null
  $lines.Add("title: $(ConvertTo-YamlScalar $Title)") | Out-Null
  $lines.Add("type: $Type") | Out-Null
  $lines.Add("scope: $Scope") | Out-Null
  $lines.Add("project:") | Out-Null
  $lines.Add("domain: $Domain") | Out-Null
  $lines.Add("artifact: $Artifact") | Out-Null
  $lines.Add("kind: $Kind") | Out-Null
  $lines.Add("namespace: $Namespace") | Out-Null
  $lines.Add("status: $Status") | Out-Null
  $lines.Add("authority: $Authority") | Out-Null
  $lines.Add("parent: $(ConvertTo-YamlScalar $Parent)") | Out-Null
  $lines.Add("depends_on: []") | Out-Null
  $lines.Add("supersedes: []") | Out-Null
  $lines.Add("tags:") | Out-Null
  foreach ($tag in $Tags) {
    $lines.Add("  - $tag") | Out-Null
  }
  $lines.Add("created: $ImportDate") | Out-Null
  $lines.Add("updated: $ImportDate") | Out-Null
  foreach ($key in ($Extra.Keys | Sort-Object)) {
    $lines.Add("${key}: $(ConvertTo-YamlScalar $Extra[$key])") | Out-Null
  }
  $lines.Add("---") | Out-Null
  return ($lines -join "`r`n") + "`r`n"
}

function Test-HasFrontmatter {
  param([string]$Path)
  $reader = [System.IO.StreamReader]::new($Path, $true)
  try {
    $first = $reader.ReadLine()
    return $first -eq "---"
  } finally {
    $reader.Dispose()
  }
}

function Convert-ChatArchives {
  param([System.Collections.Generic.List[object]]$Rows)
  $threadMap = @{}
  $chatFiles = @(Get-ChildItem -LiteralPath $InboxPath -File -Filter "aichatbackup*.json" -ErrorAction SilentlyContinue)
  foreach ($file in $chatFiles) {
    $hash = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash
    $json = Get-Content -LiteralPath $file.FullName -Raw | ConvertFrom-Json
    if (-not ($json.PSObject.Properties.Name -contains "threads")) {
      Add-ManifestRow $Rows "inventory" $file.FullName "" "" "json" "unrecognized" $hash "JSON file does not contain threads."
      continue
    }
    foreach ($thread in @($json.threads)) {
      $id = [string]$thread.id
      if ([string]::IsNullOrWhiteSpace($id)) { continue }
      if (-not $threadMap.ContainsKey($id)) {
        $threadMap[$id] = [ordered]@{
          Thread = $thread
          Sources = [System.Collections.Generic.List[string]]::new()
          Hashes = [System.Collections.Generic.List[string]]::new()
        }
      }
      $threadMap[$id].Sources.Add((Get-RelativePath $file.FullName)) | Out-Null
      $threadMap[$id].Hashes.Add($hash) | Out-Null
    }
  }

  foreach ($id in ($threadMap.Keys | Sort-Object)) {
    $thread = $threadMap[$id].Thread
    $title = if ([string]::IsNullOrWhiteSpace([string]$thread.title)) { "Untitled Chat Thread" } else { [string]$thread.title }
    $shortId = $id.Substring(0, [Math]::Min(8, $id.Length))
    $slug = ConvertTo-Slug $title
    $namespace = "chat.archive.$slug.$shortId"
    $outputPath = Join-Path $ChatOutputPath "$namespace.md"
    $sources = ($threadMap[$id].Sources | Sort-Object -Unique) -join "; "
    $hashes = ($threadMap[$id].Hashes | Sort-Object -Unique) -join "; "
    $extra = @{
      source = "aichatbackup"
      source_files = $sources
      source_hashes = $hashes
      provider = [string]$thread.provider
      provider_id = [string]$thread.providerId
      thread_id = $id
      thread_created = [string]$thread.createdAt
      thread_updated = [string]$thread.updatedAt
    }
    $frontmatter = New-Frontmatter `
      -Title $title `
      -Type "reference" `
      -Scope "vault" `
      -Domain "chat-archive" `
      -Artifact $shortId `
      -Kind "chat-thread" `
      -Namespace $namespace `
      -Status "archived" `
      -Authority "archive" `
      -Parent "[[devnotes.zettelkasten.map]]" `
      -Tags @("chat-archive", "imports/aichatbackup", "status/archived") `
      -Extra $extra

    $body = [System.Collections.Generic.List[string]]::new()
    $body.Add("# $title") | Out-Null
    $body.Add("") | Out-Null
    $body.Add("Source files: $sources") | Out-Null
    $body.Add("") | Out-Null
    $body.Add("## Messages") | Out-Null
    foreach ($message in @($thread.messages)) {
      $role = if ($message.PSObject.Properties.Name -contains "role") { [string]$message.role } else { "message" }
      $createdAt = if ($message.PSObject.Properties.Name -contains "createdAt") { [string]$message.createdAt } else { "" }
      $content = if ($message.PSObject.Properties.Name -contains "content") { ConvertTo-MarkdownText $message.content } else { "" }
      $body.Add("") | Out-Null
      $body.Add("### $role $createdAt") | Out-Null
      $body.Add("") | Out-Null
      $body.Add($content) | Out-Null
    }
    Write-TextFile $outputPath ($frontmatter + ($body -join "`r`n") + "`r`n")
    Add-ManifestRow $Rows "convert-chat-thread" ($threadMap[$id].Sources[0]) $outputPath "" "reference" "generated" $hashes "thread_id=$id"
  }

  foreach ($file in $chatFiles) {
    $hash = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash
    $archivePath = Join-Path $ArchiveRoot ("INBOX\" + $file.Name)
    Move-Original $file.FullName $archivePath
    Add-ManifestRow $Rows "archive-original" $file.FullName "" $archivePath "json" "archived" $hash "aichatbackup source preserved"
  }
}

function Convert-InboxSources {
  param([System.Collections.Generic.List[object]]$Rows)
  $files = @(Get-ChildItem -LiteralPath $InboxPath -File -ErrorAction SilentlyContinue | Where-Object { $_.Name -notlike "aichatbackup*.json" })
  foreach ($file in $files) {
    $hash = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash
    $slug = ConvertTo-Slug ([System.IO.Path]::GetFileNameWithoutExtension($file.Name))
    $namespace = "inbox.source.$slug"
    $outputPath = Join-Path $SourceOutputPath "$namespace.md"
    $archivePath = Join-Path $ArchiveRoot ("INBOX\" + $file.Name)

    if ($file.Extension -in @(".md", ".txt")) {
      $content = Get-Content -LiteralPath $file.FullName -Raw
      if (Test-HasFrontmatter $file.FullName) {
        $noteContent = $content
      } else {
        $frontmatter = New-Frontmatter `
          -Title ([System.IO.Path]::GetFileNameWithoutExtension($file.Name)) `
          -Type "reference" `
          -Scope "vault" `
          -Domain "inbox" `
          -Artifact $slug `
          -Kind "source-note" `
          -Namespace $namespace `
          -Status "review" `
          -Authority "archive" `
          -Parent "[[devnotes.zettelkasten.map]]" `
          -Tags @("inbox", "imports/source-note", "status/review") `
          -Extra @{ source_file = (Get-RelativePath $file.FullName); source_hash = $hash }
        $noteContent = $frontmatter + "# $([System.IO.Path]::GetFileNameWithoutExtension($file.Name))`r`n`r`n" + $content
      }
      Write-TextFile $outputPath $noteContent
      Add-ManifestRow $Rows "convert-source-note" $file.FullName $outputPath "" "reference" "generated" $hash "markdown-or-text preserved"
      Move-Original $file.FullName $archivePath
      Add-ManifestRow $Rows "archive-original" $file.FullName "" $archivePath $file.Extension.TrimStart(".") "archived" $hash "source preserved"
      continue
    }

    if ($file.Extension -eq ".pdf") {
      $frontmatter = New-Frontmatter `
        -Title ([System.IO.Path]::GetFileNameWithoutExtension($file.Name)) `
        -Type "reference" `
        -Scope "vault" `
        -Domain "inbox" `
        -Artifact $slug `
        -Kind "pdf-source" `
        -Namespace $namespace `
        -Status "review" `
        -Authority "archive" `
        -Parent "[[devnotes.zettelkasten.map]]" `
        -Tags @("inbox", "imports/pdf", "status/review") `
        -Extra @{ source_file = (Get-RelativePath $file.FullName); source_hash = $hash; source_size_bytes = [string]$file.Length }
      $body = "# $([System.IO.Path]::GetFileNameWithoutExtension($file.Name))`r`n`r`nOriginal PDF preserved at: `"$archivePath`"`r`n`r`nExtraction status: not extracted in Part II first pass.`r`n"
      Write-TextFile $outputPath ($frontmatter + $body)
      Add-ManifestRow $Rows "index-pdf-source" $file.FullName $outputPath "" "reference" "generated" $hash "pdf indexed without OCR"
      Move-Original $file.FullName $archivePath
      Add-ManifestRow $Rows "archive-original" $file.FullName "" $archivePath "pdf" "archived" $hash "source preserved"
      continue
    }

    if ($file.Extension -eq ".json") {
      $frontmatter = New-Frontmatter `
        -Title ([System.IO.Path]::GetFileNameWithoutExtension($file.Name)) `
        -Type "reference" `
        -Scope "vault" `
        -Domain "inbox" `
        -Artifact $slug `
        -Kind "json-source" `
        -Namespace $namespace `
        -Status "review" `
        -Authority "archive" `
        -Parent "[[devnotes.zettelkasten.map]]" `
        -Tags @("inbox", "imports/json", "status/review") `
        -Extra @{ source_file = (Get-RelativePath $file.FullName); source_hash = $hash; source_size_bytes = [string]$file.Length }
      $body = "# $([System.IO.Path]::GetFileNameWithoutExtension($file.Name))`r`n`r`nOriginal JSON preserved at: `"$archivePath`"`r`n`r`nSchema status: unrecognized in Part II first pass; not parsed into durable notes.`r`n"
      Write-TextFile $outputPath ($frontmatter + $body)
      Add-ManifestRow $Rows "index-json-source" $file.FullName $outputPath "" "reference" "generated" $hash "unrecognized JSON indexed without parsing"
      Move-Original $file.FullName $archivePath
      Add-ManifestRow $Rows "archive-original" $file.FullName "" $archivePath "json" "archived" $hash "source preserved"
      continue
    }

    if ($file.Extension -in @(".ts", ".tsx", ".yaml", ".yml")) {
      $language = switch ($file.Extension) {
        ".ts" { "typescript" }
        ".tsx" { "tsx" }
        ".yaml" { "yaml" }
        ".yml" { "yaml" }
      }
      $frontmatter = New-Frontmatter `
        -Title ([System.IO.Path]::GetFileNameWithoutExtension($file.Name)) `
        -Type "reference" `
        -Scope "vault" `
        -Domain "inbox" `
        -Artifact $slug `
        -Kind "source-code" `
        -Namespace $namespace `
        -Status "review" `
        -Authority "archive" `
        -Parent "[[devnotes.zettelkasten.map]]" `
        -Tags @("inbox", "imports/source-code", "status/review") `
        -Extra @{ source_file = (Get-RelativePath $file.FullName); source_hash = $hash }
      $content = Get-Content -LiteralPath $file.FullName -Raw
      $fence = '```'
      $body = "# $([System.IO.Path]::GetFileNameWithoutExtension($file.Name))`r`n`r`n$fence$language`r`n$content`r`n$fence`r`n"
      Write-TextFile $outputPath ($frontmatter + $body)
      Add-ManifestRow $Rows "convert-source-code" $file.FullName $outputPath "" "reference" "generated" $hash "source code preserved in fenced block"
      Move-Original $file.FullName $archivePath
      Add-ManifestRow $Rows "archive-original" $file.FullName "" $archivePath $file.Extension.TrimStart(".") "archived" $hash "source preserved"
      continue
    }

    Add-ManifestRow $Rows "inventory" $file.FullName "" "" $file.Extension.TrimStart(".") "unhandled" $hash "file type inventoried only"
  }
}

function Archive-EmptyFolders {
  param([System.Collections.Generic.List[object]]$FolderRows)
  $root = (Resolve-Path -LiteralPath "10 PROJECTS").Path
  $folders = @(Get-ChildItem -LiteralPath $root -Recurse -Directory -Force | Where-Object {
      $relative = Get-RelativePath $_.FullName
      $parts = $relative -split '\\'
      $parts.Count -ge 4 -and @(Get-ChildItem -LiteralPath $_.FullName -Force -ErrorAction SilentlyContinue).Count -eq 0
    } | Sort-Object { $_.FullName.Length } -Descending)

  foreach ($folder in $folders) {
    $relative = Get-RelativePath $folder.FullName
    $FolderRows.Add([pscustomobject]@{
      action = "archive-empty-folder"
      folder_path = $relative
      archived_in = $FolderManifestPath
      status = if ($DryRun) { "planned" } else { "removed-empty-folder-after-manifest" }
    }) | Out-Null
    if ($DryRun) {
      Write-Host "DRY RMDIR $relative"
    } else {
      Remove-Item -LiteralPath $folder.FullName -Force
      Write-Host "RMDIR    $relative"
    }
  }
}

Ensure-Dir $ManifestDir
Ensure-Dir $ChatOutputPath
Ensure-Dir $SourceOutputPath
Ensure-Dir $ArchiveRoot

$rows = [System.Collections.Generic.List[object]]::new()
$folderRows = [System.Collections.Generic.List[object]]::new()

Convert-ChatArchives $rows
Convert-InboxSources $rows
Archive-EmptyFolders $folderRows

if (-not $DryRun) {
  if (Test-Path -LiteralPath $ManifestPath) {
    $rows = [System.Collections.Generic.List[object]]@(@(Import-Csv -LiteralPath $ManifestPath) + @($rows))
  }
  if (Test-Path -LiteralPath $FolderManifestPath) {
    $folderRows = [System.Collections.Generic.List[object]]@(@(Import-Csv -LiteralPath $FolderManifestPath) + @($folderRows))
  }
  $rows | Export-Csv -LiteralPath $ManifestPath -NoTypeInformation -Encoding UTF8
  $folderRows | Export-Csv -LiteralPath $FolderManifestPath -NoTypeInformation -Encoding UTF8
  Write-Host "MANIFEST $ManifestPath"
  Write-Host "MANIFEST $FolderManifestPath"
} else {
  Write-Host "DRY manifest rows: $($rows.Count)"
  Write-Host "DRY folder rows: $($folderRows.Count)"
}
