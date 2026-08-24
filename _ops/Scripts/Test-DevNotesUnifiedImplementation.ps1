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
    Get-Item ".obsidian/plugins/callout-studio/data.json"
    Get-Item ".obsidian/plugins/hearth/data.json"
    Get-Item ".obsidian/plugins/note-toolbar/data.json"
    Get-Item ".obsidian/plugins/obsidian-meta-bind-plugin/data.json"
    Get-Item ".obsidian/plugins/templater-obsidian/data.json"
    Get-Item "_obsidian/Canvases/codependent-coding.workspace.canvas"
    Get-Item "_ops/Reports/source-mirror-classification.summary.json"
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
  foreach($mapping in $templater.folder_templates) {
    if(Test-Path -LiteralPath $mapping.template) { Pass "Templater target $($mapping.template)" }
    else { Fail "Templater target missing: $($mapping.template)" }
  }

  $hearth = Get-Content -Raw ".obsidian/plugins/hearth/data.json" | ConvertFrom-Json
  $dashboard = $hearth.dashboards | Where-Object id -eq $hearth.activeDashboardId
  if($dashboard) { Pass "Hearth active dashboard $($hearth.activeDashboardId)" } else { Fail "Hearth active dashboard missing" }
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

  $summary = Get-Content -Raw "_ops/Reports/source-mirror-classification.summary.json" | ConvertFrom-Json
  $mirrorCount = (Get-ChildItem "10 PROJECTS/10.PROJECTS.CODEPENDENTCODING/10.PROJECTS.CODEPENDENTCODING.Source Mirror" -Recurse -File -Filter "*.md").Count
  if($summary.total -eq $mirrorCount -and -not $summary.deletion_performed) { Pass "Source Mirror preserved ($mirrorCount artifacts)" }
  else { Fail "Source Mirror inventory mismatch or deletion flag changed" }

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
