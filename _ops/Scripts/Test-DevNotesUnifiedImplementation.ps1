[CmdletBinding()]
param(
  [Parameter(Mandatory=$true)][string]$VaultPath,
  [string]$BaseRef = "master"
)

$ErrorActionPreference = "Stop"
$vault = (Resolve-Path -LiteralPath $VaultPath).Path
$failed = $false

function Pass([string]$Message) { Write-Host "[PASS] $Message" }
function Fail([string]$Message) { Write-Host "[FAIL] $Message"; $script:failed = $true }
function Rel([string]$Path) { return $Path.Substring($vault.Length).TrimStart('\','/').Replace('\','/') }

Push-Location $vault
try {
  $jsonFiles = @(
    Get-ChildItem ".system" -Recurse -File -Filter "*.json"
    Get-Item ".obsidian/appearance.json"
    Get-Item ".obsidian/community-plugins.json"
    Get-Item ".obsidian/plugins/callout-studio/data.json"
    Get-Item ".obsidian/plugins/code-space/data.json"
    Get-Item ".obsidian/plugins/hearth/data.json"
    Get-Item ".obsidian/plugins/note-toolbar/data.json"
    Get-Item ".obsidian/plugins/obsidian-meta-bind-plugin/data.json"
    Get-Item ".obsidian/plugins/quickadd/data.json"
    Get-Item ".obsidian/plugins/templater-obsidian/data.json"
    Get-Item "_obsidian/Canvases/codependent-coding.workspace.canvas"
    Get-Item "_ops/Reports/source-mirror-classification.summary.json"
    Get-Item "_ops/Reports/devnotes.unified.runtime-validation.json"
  )

  foreach($file in $jsonFiles) {
    try { Get-Content -Raw -LiteralPath $file.FullName | ConvertFrom-Json | Out-Null; Pass "JSON $(Rel $file.FullName)" }
    catch { Fail "JSON $(Rel $file.FullName): $($_.Exception.Message)" }
  }

  $yq = Get-Command yq -ErrorAction SilentlyContinue
  if(-not $yq) { Fail "yq is required for Base/frontmatter validation" }
  else {
    foreach($file in Get-ChildItem "_obsidian/Bases" -File -Filter "*.base") {
      & $yq.Source eval "." $file.FullName | Out-Null
      if($LASTEXITCODE -eq 0) { Pass "Base YAML $(Rel $file.FullName)" } else { Fail "Base YAML $(Rel $file.FullName)" }
      $baseText = Get-Content -Raw -LiteralPath $file.FullName
      if($baseText -match '10 PROJECTS/10\.PROJECTS\.CODEPENDENTCODING/10\.PROJECTS\.CODEPENDENTCODING\.Source Mirror' -and $baseText -match '_obsidian/Templates') {
        Pass "Base compatibility exclusions $(Rel $file.FullName)"
      } else { Fail "Base compatibility exclusions missing: $(Rel $file.FullName)" }
    }
  }

  $node = Get-Command node -ErrorAction SilentlyContinue
  if(-not $node) { Fail "Node.js is required for JavaScript syntax validation" }
  else {
    foreach($file in Get-ChildItem "_obsidian/Scripts" -Recurse -File -Filter "*.js") {
      & $node.Source --check $file.FullName
      if($LASTEXITCODE -eq 0) { Pass "JavaScript $(Rel $file.FullName)" } else { Fail "JavaScript $(Rel $file.FullName)" }
    }
  }

  foreach($file in Get-ChildItem "_ops/Scripts" -File -Filter "*.ps1") {
    $tokens=$null; $errors=$null
    [System.Management.Automation.Language.Parser]::ParseFile($file.FullName,[ref]$tokens,[ref]$errors) | Out-Null
    if($errors.Count -eq 0) { Pass "PowerShell $(Rel $file.FullName)" }
    else { Fail "PowerShell $(Rel $file.FullName): $($errors[0].Message)" }
  }

  $templater = Get-Content -Raw ".obsidian/plugins/templater-obsidian/data.json" | ConvertFrom-Json
  if($templater.templates_folder -eq "_obsidian/Templates") { Pass "Templater canonical folder" } else { Fail "Templater canonical folder mismatch" }
  foreach($mapping in $templater.folder_templates) {
    if(Test-Path -LiteralPath $mapping.template) { Pass "Templater target $($mapping.template)" }
    else { Fail "Templater target missing: $($mapping.template)" }
  }
  $requiredTemplates = @(
    "project-home", "prd", "technical-requirements", "architecture", "design", "auth-security",
    "knowledge-model", "validation-conformance", "specification", "adr-decision", "research",
    "work-package", "handoff", "progress", "capture", "reference", "prompt-contract", "data-model",
    "verification-evidence", "business-operation"
  )
  foreach($name in $requiredTemplates) {
    $path = "_obsidian/Templates/$name.template.md"
    if(Test-Path -LiteralPath $path) { Pass "Required template $path" } else { Fail "Required template missing: $path" }
  }

  $communityPlugins = Get-Content -Raw ".obsidian/community-plugins.json" | ConvertFrom-Json
  $quickAdd = Get-Content -Raw ".obsidian/plugins/quickadd/data.json" | ConvertFrom-Json
  $expectedQuickAdd = @(
    "New Workspace", "Capture", "New Specification", "Record Decision", "Start Research",
    "Create Work Package", "Create Handoff", "Create Verification", "Create Prompt Contract",
    "Create Data Model", "Create Business Operation"
  )
  if("quickadd" -in $communityPlugins) { Pass "QuickAdd installed and enabled" } else { Fail "QuickAdd is not enabled" }
  if(-not (Compare-Object $expectedQuickAdd @($quickAdd.choices.name))) { Pass "QuickAdd routed choice set" } else { Fail "QuickAdd routed choice set mismatch" }
  if($quickAdd.templateFolderLauncherRow -eq "off") { Pass "QuickAdd giant template launcher disabled" } else { Fail "QuickAdd template folder launcher must remain off" }
  foreach($choice in $quickAdd.choices) {
    if($choice.command -and $choice.type -eq "Template" -and (Test-Path -LiteralPath $choice.templatePath)) { Pass "QuickAdd route $($choice.name)" }
    else { Fail "QuickAdd route invalid: $($choice.name)" }
  }

  $metaBind = Get-Content -Raw ".obsidian/plugins/obsidian-meta-bind-plugin/data.json" | ConvertFrom-Json
  $expectedMetaBind = @("dn-status","dn-authority","dn-role","dn-priority","dn-health")
  if(-not (Compare-Object $expectedMetaBind @($metaBind.inputFieldTemplates.name))) { Pass "Meta Bind control templates" } else { Fail "Meta Bind control template mismatch" }
  foreach($template in $metaBind.inputFieldTemplates) {
    if($template.declaration -match '^INPUT\[[^\]]+\]$' -and $template.declaration -notmatch ':[a-z-]+\]$') { Pass "Meta Bind unbound template $($template.name)" }
    else { Fail "Meta Bind template must be reusable and unbound: $($template.name)" }
  }
  $metaBindConsumers = @(
    "Chief of Staff/Workspaces/Codependent Coding/codependent-coding.workspace.home.md",
    "_obsidian/Controls/devnotes.unified.meta-bind-controls.md"
  )
  foreach($path in $metaBindConsumers) {
    $content = Get-Content -Raw -LiteralPath $path
    if($content -match 'INPUT\[dn-[^\]]+\](?!\[:)') { Fail "Meta Bind template override missing: $path" } else { Pass "Meta Bind template overrides $path" }
    if($content -match 'INPUT\[progressBar') { Fail "Inline-only Meta Bind consumer uses progressBar: $path" } else { Pass "Meta Bind inline controls $path" }
  }

  $hearth = Get-Content -Raw ".obsidian/plugins/hearth/data.json" | ConvertFrom-Json
  $dashboard = $hearth.dashboards | Where-Object id -eq $hearth.activeDashboardId
  if($dashboard) { Pass "Hearth active dashboard $($hearth.activeDashboardId)" } else { Fail "Hearth active dashboard missing" }
  $expectedHearthCards = @("Now","Workspaces","Handoffs","Evidence","Inbox","Roles","Codependent Coding","Recent Knowledge","System Health","Knowledge Index","Create","Git")
  if(-not (Compare-Object $expectedHearthCards @($dashboard.cards.title | Where-Object { $_ }))) { Pass "Hearth operating surfaces" } else { Fail "Hearth operating surface mismatch" }
  foreach($card in $dashboard.cards) {
    if($card.kind -eq "embed") {
      if(Test-Path -LiteralPath $card.target) { Pass "Hearth embed $($card.target)" } else { Fail "Hearth embed missing: $($card.target)" }
    }
    if($card.kind -eq "templater") {
      foreach($item in $card.templater.items) {
        if(Test-Path -LiteralPath $item.template) { Pass "Hearth template $($item.template)" } else { Fail "Hearth template missing: $($item.template)" }
      }
    }
  }

  $callouts = Get-Content -Raw ".obsidian/plugins/callout-studio/data.json" | ConvertFrom-Json
  $expectedCallouts = @("truth","decision","requirement","working","risk","blocked","evidence","handoff","spark","deprecated")
  if(-not (Compare-Object $expectedCallouts @($callouts.callouts.id))) { Pass "Callout vocabulary" } else { Fail "Callout vocabulary mismatch" }

  $noteToolbar = Get-Content -Raw ".obsidian/plugins/note-toolbar/data.json" | ConvertFrom-Json
  $expectedRoleToolbars = [ordered]@{
    "Chief of Staff"=@("PROJECTS","NOW","ROADMAP","MILESTONES","HANDOFF","SCHEDULE")
    "Trust Issues"=@("VERIFY","EVIDENCE","FINDINGS","RECONCILE","HANDOFF")
    "Execution"=@("SPEC","WORK PACKAGE","CODE","PROGRESS","HANDOFF")
    "Vibes"=@("ARCHITECTURE","REPOSITORY","ENVIRONMENT","DEPLOY","INCIDENT")
    "DevNotes"=@("INBOX","PROMOTE","CLASSIFY","LINK","RESEARCH","HEALTH")
    "Schemes"=@("ONTOLOGY","MODEL","ENTITY","RELATIONSHIP","SCHEMA","LIFECYCLE")
    "Prömpter"=@("PROMPT","TERMINOLOGY","NOMENCLATURE","PROTOCOL","HANDOFF")
    "Fuck You Pay Me"=@("PIPELINE","CUSTOMER","INVOICE","OBLIGATION","FOLLOW-UP","RECONCILE")
  }
  $quickAddCommands = @($quickAdd.choices | ForEach-Object { "quickadd:choice:$($_.id)" })
  foreach($role in $expectedRoleToolbars.Keys) {
    $mapping = $noteToolbar.folderMappings | Where-Object folder -eq $role
    $toolbar = $noteToolbar.toolbars | Where-Object uuid -eq $mapping.toolbar
    if($toolbar -and -not (Compare-Object $expectedRoleToolbars[$role] @($toolbar.items.label) -SyncWindow 0)) { Pass "Note Toolbar role context $role" }
    else { Fail "Note Toolbar role context mismatch: $role"; continue }
    foreach($item in $toolbar.items) {
      if($item.linkAttr.type -eq "file" -and -not (Test-Path -LiteralPath $item.link)) { Fail "Note Toolbar missing file target: $($item.link)" }
      if($item.linkAttr.type -eq "command" -and $item.linkAttr.commandId -notin $quickAddCommands) { Fail "Note Toolbar unsupported command: $($item.linkAttr.commandId)" }
    }
  }

  $canvas = Get-Content -Raw "_obsidian/Canvases/codependent-coding.workspace.canvas" | ConvertFrom-Json
  $ids = @($canvas.nodes.id) + @($canvas.edges.id)
  if(($ids | Sort-Object -Unique).Count -eq $ids.Count) { Pass "Canvas IDs unique" } else { Fail "Canvas IDs are not unique" }
  $nodeIds = @($canvas.nodes.id)
  foreach($edge in $canvas.edges) {
    if($edge.fromNode -in $nodeIds -and $edge.toNode -in $nodeIds) { Pass "Canvas edge $($edge.id)" } else { Fail "Canvas dangling edge $($edge.id)" }
  }
  foreach($nodeItem in $canvas.nodes | Where-Object type -eq "file") {
    if(Test-Path -LiteralPath $nodeItem.file) { Pass "Canvas target $($nodeItem.file)" } else { Fail "Canvas target missing: $($nodeItem.file)" }
  }

  if((Get-FileHash "_obsidian/CSS/devnotes-unified.css").Hash -eq (Get-FileHash ".obsidian/snippets/devnotes-unified.css").Hash) {
    Pass "CSS runtime projection"
  } else { Fail "CSS runtime projection drift" }

  $codeSpace = Get-Content -Raw ".obsidian/plugins/code-space/data.json" | ConvertFrom-Json
  if($codeSpace.enableExternalMounts -and @($codeSpace.externalMounts).Count -eq 1 -and $codeSpace.externalMounts[0].mountPath -eq "_mounts/TheHipsterStack") {
    Pass "Code Space narrow pilot configuration"
  } else { Fail "Code Space pilot must contain one narrow trusted-repository mount" }
  $mountTarget = $codeSpace.externalMounts[0].sourcePath
  if((Test-Path -LiteralPath (Join-Path $mountTarget ".git")) -and (Get-Item -LiteralPath "_mounts/TheHipsterStack" -Force).LinkType -eq "Junction") {
    Pass "Code Space Git-backed junction"
  } else { Fail "Code Space trusted Git checkout or junction missing" }

  $summary = Get-Content -Raw "_ops/Reports/source-mirror-classification.summary.json" | ConvertFrom-Json
  $mirrorCount = (Get-ChildItem "10 PROJECTS/10.PROJECTS.CODEPENDENTCODING/10.PROJECTS.CODEPENDENTCODING.Source Mirror" -Recurse -File -Filter "*.md").Count
  if($summary.total -eq $mirrorCount -and -not $summary.deletion_performed) { Pass "Source Mirror preserved ($mirrorCount artifacts)" }
  else { Fail "Source Mirror inventory mismatch or deletion flag changed" }
  $migrationSummary = Get-Content -Raw "_ops/Reports/devnotes-migration-inventory.summary.json" | ConvertFrom-Json
  if(-not $migrationSummary.deletion_performed -and $migrationSummary.low_risk_physical_moves_performed -eq 0 -and $migrationSummary.path_sensitive -gt 0) {
    Pass "Conservative migration projection inventory"
  } else { Fail "Migration projection summary is incomplete or destructive" }
  $runtimeValidation = Get-Content -Raw "_ops/Reports/devnotes.unified.runtime-validation.json" | ConvertFrom-Json
  if($runtimeValidation.interactive -and $runtimeValidation.results.plugin_errors_captured -eq 0 -and $runtimeValidation.safety.obsidian_processes_stopped) {
    Pass "Interactive Obsidian runtime evidence"
  } else { Fail "Interactive Obsidian runtime evidence is incomplete" }
  $inventory = Import-Csv "_ops/Reports/devnotes-migration-inventory.csv" | Where-Object {
    $_.Namespace -and $_.Authority -in @("canonical","source-of-truth") -and
    $_.Path -notmatch 'Source Mirror|_obsidian\\Templates|90 OBSIDIAN\\Templates|DevNotes-Unified-Knowledge-Engineering-System-Authority-Package-v0.1.0\\(03-templates|07-vault-overlay)'
  }
  $changedPaths = @(& git diff --name-only "$BaseRef...HEAD") + @(& git diff --name-only)
  $changedLookup = @{}; foreach($path in $changedPaths) { if($path){ $changedLookup[$path.Replace('\','/').ToLowerInvariant()]=$true } }
  $introducedDuplicates = @($inventory | Group-Object Namespace | Where-Object Count -gt 1 | Where-Object {
    @($_.Group | Where-Object { $changedLookup.ContainsKey($_.Path.Replace('\','/').ToLowerInvariant()) }).Count -gt 0
  })
  if($introducedDuplicates.Count -eq 0) { Pass "No new duplicate canonical authorities" }
  else { Fail "New duplicate canonical authorities: $($introducedDuplicates.Name -join ', ')" }

  if($yq) {
    $representativeMarkdown = @(
      Get-Item "devnotes.home.md"
      Get-Item "Chief of Staff/Workspaces/Codependent Coding/codependent-coding.workspace.home.md"
      Get-Item "Vibes/Workspaces/Codependent Coding/codependent-coding.vibes.code-space-pilot.execution.md"
      Get-Item "_ops/Reports/devnotes.unified.migration-conformance.report.md"
      Get-ChildItem "_obsidian/Templates" -File -Filter "*.template.md"
    )
    foreach($file in $representativeMarkdown) {
      $lines = @(Get-Content -LiteralPath $file.FullName)
      $closing = -1
      for($index=1; $index -lt $lines.Count; $index++) { if($lines[$index] -eq "---") { $closing=$index; break } }
      if($lines.Count -gt 2 -and $lines[0] -eq "---" -and $closing -gt 1) {
        ($lines[1..($closing-1)] -join "`n") | & $yq.Source eval "." - | Out-Null
        if($LASTEXITCODE -eq 0) { Pass "Frontmatter YAML $(Rel $file.FullName)" } else { Fail "Frontmatter YAML $(Rel $file.FullName)" }
      } else { Fail "Frontmatter missing or malformed: $(Rel $file.FullName)" }
    }
  }

  $linkScope = @(
    Get-Item "devnotes.home.md"
    Get-ChildItem "Chief of Staff","Trust Issues","Execution","Vibes","DevNotes","Schemes","Prömpter","Fuck You Pay Me","_obsidian","_ops" -Recurse -File -Filter "*.md"
  )
  $vaultRoots = @(Get-ChildItem -Directory -Force | Where-Object Name -notin @("_mounts",".git"))
  $vaultFiles = @(Get-ChildItem -File -Force; $vaultRoots | Get-ChildItem -Recurse -File)
  $paths = @{}; $basenames = @{}
  foreach($file in $vaultFiles) {
    $relative = (Rel $file.FullName)
    $paths[$relative.ToLowerInvariant()] = $true
    $basenames[$file.BaseName.ToLowerInvariant()] = $true
  }
  $unresolved = [Collections.Generic.List[string]]::new()
  foreach($file in $linkScope) {
    $content = Get-Content -Raw -LiteralPath $file.FullName
    foreach($match in [regex]::Matches($content,'!?\[\[([^\]|#]+)')) {
      $target = $match.Groups[1].Value.Trim().Replace('\','/')
      if(-not $target -or $target -match '<%|^https?://') { continue }
      $lower = $target.ToLowerInvariant()
      $leaf = $target.Split('/')[-1].ToLowerInvariant()
      if($leaf -match '\.(md|base|canvas|json|csv)$') { $leaf = [IO.Path]::GetFileNameWithoutExtension($leaf) }
      $resolved = $paths.ContainsKey($lower) -or $paths.ContainsKey("$lower.md") -or $paths.ContainsKey("$lower.base") -or $paths.ContainsKey("$lower.canvas") -or $basenames.ContainsKey($leaf)
      if(-not $resolved) { $unresolved.Add("$(Rel $file.FullName) -> $target") }
    }
  }
  if($unresolved.Count -eq 0) { Pass "Unified-scope internal wikilinks" } else { Fail "Unresolved unified-scope wikilinks: $($unresolved -join '; ')" }

  $deleted = @(& git diff --name-only --diff-filter=D "$BaseRef...HEAD") + @(& git diff --name-only --diff-filter=D)
  if(@($deleted | Where-Object { $_ }).Count -eq 0) { Pass "No deleted files" } else { Fail "Unexpected deleted files: $($deleted -join ', ')" }

  $requiredRoleFiles = @(
    "Chief of Staff/Canon/devnotes.chief-of-staff.chatgpt-project-instructions.contract.md",
    "Trust Issues/Canon/devnotes.trust-issues.chatgpt-project-instructions.contract.md",
    "Execution/Canon/devnotes.execution.chatgpt-project-instructions.contract.md",
    "Vibes/Canon/devnotes.vibes.chatgpt-project-instructions.contract.md",
    "DevNotes/Canon/devnotes.devnotes.chatgpt-project-instructions.contract.md",
    "Schemes/Canon/devnotes.schemes.chatgpt-project-instructions.contract.md",
    "Prömpter/Canon/devnotes.prompter.chatgpt-project-instructions.contract.md",
    "Fuck You Pay Me/Canon/devnotes.fuck-you-pay-me.chatgpt-project-instructions.contract.md"
  )
  foreach($path in $requiredRoleFiles) {
    if(Test-Path -LiteralPath $path) { Pass "Role canon $path" } else { Fail "Role canon missing: $path" }
  }

  if($failed) { throw "Unified implementation validation failed." }
  Write-Host "DevNotes Unified implementation validation passed."
}
finally {
  Pop-Location
}
