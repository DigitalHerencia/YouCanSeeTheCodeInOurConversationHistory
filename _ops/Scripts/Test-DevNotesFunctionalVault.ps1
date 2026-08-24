[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$vaultRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..\..')).Path
$failures = [System.Collections.Generic.List[string]]::new()
$passes = [System.Collections.Generic.List[string]]::new()

function Test-Condition([bool]$Condition, [string]$Message) {
  if ($Condition) { $passes.Add($Message) } else { $failures.Add($Message) }
}

Push-Location $vaultRoot
try {
  $legacyRoots = @('00 ZETTELKASTEN','10 PROJECTS','20 DOCUMENTATION','30 DEEP RESEARCH','40 ARCHIVE','50 CIGARETTES, REGRETS, & NEURAL NETS','50 REGRETS, CIGARETTES, & NEURAL NETS','60 CODEPENDENT CODING','70 TODO','90 OBSIDIAN')
  Test-Condition (-not ($legacyRoots | Where-Object { Test-Path -LiteralPath $_ })) 'Legacy numbered roots are retired'
  Test-Condition (-not (Test-Path -LiteralPath 'DevNotes-Unified-Knowledge-Engineering-System-Authority-Package-v0.1.0')) 'Expanded authority package is removed'
  Test-Condition (-not (Get-ChildItem -LiteralPath . -Recurse -Directory -ErrorAction SilentlyContinue | Where-Object Name -match 'Source Mirror|Code Mirror')) 'No code-mirror directory remains'

  $jsonFiles = Get-ChildItem -LiteralPath '.system','.obsidian' -Recurse -File -Filter '*.json' | Where-Object FullName -notmatch '\\workspace\.json$'
  foreach ($file in $jsonFiles) {
    try { Get-Content -LiteralPath $file.FullName -Raw | ConvertFrom-Json | Out-Null }
    catch { $failures.Add("Invalid JSON: $($file.FullName.Substring($vaultRoot.Length + 1))") }
  }
  Test-Condition ($jsonFiles.Count -gt 0) "Parsed $($jsonFiles.Count) machine and plugin JSON files"

  $codeSpace = Get-Content -LiteralPath '.obsidian\plugins\code-space\data.json' -Raw | ConvertFrom-Json
  Test-Condition ($codeSpace.enableExternalMounts -and @($codeSpace.externalMounts).Count -eq 1) 'Code Space has exactly one external mount'
  Test-Condition ($codeSpace.externalMounts[0].sourcePath -eq 'D:\TheCodependentCodingWebAppArchitecture') 'Code Space targets the requested source directory'
  $mount = Get-Item -LiteralPath '_mounts\CodependentCoding' -Force
  Test-Condition ($mount.LinkType -eq 'Junction' -and $mount.Target -eq 'D:\TheCodependentCodingWebAppArchitecture') 'Code Space junction resolves to the requested source directory'

  $community = Get-Content -LiteralPath '.obsidian\community-plugins.json' -Raw | ConvertFrom-Json
  foreach ($plugin in @('hearth','note-toolbar','obsidian-meta-bind-plugin','quickadd','templater-obsidian','callout-studio','code-space','tasknotes','calendar','iconic')) {
    Test-Condition ($community -contains $plugin) "Plugin enabled: $plugin"
  }

  $hearth = Get-Content -LiteralPath '.obsidian\plugins\hearth\data.json' -Raw | ConvertFrom-Json
  $dashboard = @($hearth.dashboards | Where-Object id -eq $hearth.activeDashboardId)
  Test-Condition (@($hearth.dashboards).Count -eq 1 -and $dashboard.Count -eq 1) 'Hearth has one active unified dashboard'
  $hearthTargets = @($dashboard[0].cards | Where-Object target | ForEach-Object target)
  Test-Condition ($hearthTargets -contains '_obsidian/Bases/TaskNotes/kanban-default.base') 'Hearth exposes the project Kanban'
  Test-Condition ($hearthTargets -contains '_obsidian/Bases/TaskNotes/calendar-default.base') 'Hearth exposes the task calendar'

  $quickAdd = Get-Content -LiteralPath '.obsidian\plugins\quickadd\data.json' -Raw | ConvertFrom-Json
  Test-Condition (@($quickAdd.choices).Count -eq 12) 'QuickAdd exposes twelve focused creation commands'
  $unsafeChoices = @($quickAdd.choices | Where-Object { $_.folder.createInSameFolderAsActiveFile })
  Test-Condition ($unsafeChoices.Count -eq 0) 'QuickAdd does not create typed notes in arbitrary active folders'

  $templater = Get-Content -LiteralPath '.obsidian\plugins\templater-obsidian\data.json' -Raw | ConvertFrom-Json
  Test-Condition (@($templater.folder_templates).Count -eq 2) 'Automatic templates are limited to Inbox and Daily Notes'

  $toolbars = Get-Content -LiteralPath '.obsidian\plugins\note-toolbar\data.json' -Raw | ConvertFrom-Json
  Test-Condition (@($toolbars.toolbars | Where-Object name -eq 'Project Management').Count -eq 1) 'Project Management toolbar exists'
  Test-Condition (@($toolbars.folderMappings | Where-Object folder -like 'Chief of Staff/*').Count -ge 3) 'Project Management toolbar has contextual folder mappings'

  $callouts = Get-Content -LiteralPath '.obsidian\plugins\callout-studio\data.json' -Raw | ConvertFrom-Json
  $expectedCallouts = @('truth','decision','requirement','working','risk','blocked','evidence','handoff','spark','deprecated')
  Test-Condition (@($callouts.callouts).Count -eq 10 -and -not ($callouts.callouts.id | Where-Object { $_ -notin $expectedCallouts })) 'Callout Studio contains only the ten semantic callouts'

  $taskViews = Get-ChildItem -LiteralPath '_obsidian\Bases\TaskNotes' -File -Filter '*.base'
  Test-Condition ($taskViews.Count -eq 7) 'TaskNotes task, Kanban, agenda, calendar, and relationship views exist'
  Test-Condition (Test-Path -LiteralPath '.obsidian\daily-notes.json') 'Daily Notes has a committed configuration'
  Test-Condition (Test-Path -LiteralPath '_obsidian\Templates\daily-note.template.md') 'Daily Note template exists'
  Test-Condition (Test-Path -LiteralPath '_obsidian\Templates\task.template.md') 'Task template exists'

  $canvas = Get-Content -LiteralPath '_obsidian\Canvases\codependent-coding.workspace.canvas' -Raw | ConvertFrom-Json
  $nodeIds = @($canvas.nodes.id)
  Test-Condition ($nodeIds.Count -eq @($nodeIds | Select-Object -Unique).Count) 'Canvas node IDs are unique'
  Test-Condition (-not ($canvas.edges | Where-Object { $_.fromNode -notin $nodeIds -or $_.toNode -notin $nodeIds })) 'Canvas edges reference existing nodes'

  foreach ($pass in $passes) { Write-Output "PASS: $pass" }
  foreach ($failure in $failures) { Write-Error "FAIL: $failure" }
  if ($failures.Count -gt 0) { exit 1 }
  Write-Output "PASS: $($passes.Count) focused functional checks"
}
finally {
  Pop-Location
}
