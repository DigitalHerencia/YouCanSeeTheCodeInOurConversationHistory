Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if (-not (Test-Path ".obsidian")) {
  throw "Run this from the DevNotes vault root."
}

function Ensure-Dir {
  param([string]$Path)
  if (-not (Test-Path -LiteralPath $Path)) {
    New-Item -ItemType Directory -Force -Path $Path | Out-Null
    Write-Host "DIR + $Path" -ForegroundColor Green
  }
}

function Move-FolderSafe {
  param([string]$From, [string]$To)

  if (-not (Test-Path -LiteralPath $From)) {
    Write-Host "SKIP missing: $From" -ForegroundColor DarkGray
    return
  }

  if (Test-Path -LiteralPath $To) {
    Write-Host "SKIP exists: $To" -ForegroundColor Yellow
    return
  }

  Move-Item -LiteralPath $From -Destination $To
  Write-Host "MOVE $From -> $To" -ForegroundColor Cyan
}

Write-Host "== TOP LEVEL ==" -ForegroundColor Magenta

Ensure-Dir "00 ZETTELKASTEN"

Move-FolderSafe "PROJECTS" "10 PROJECTS"
Move-FolderSafe "DOCUMENTATION" "20 DOCUMENTATION"
Move-FolderSafe "DEEP RESEARCH" "30 DEEP RESEARCH"
Move-FolderSafe "TECH STACK" "40 TECH STACK"
Move-FolderSafe "REGRETS, CIGARETTES, & NUERAL NETS" "50 REGRETS, CIGARETTES, & NEURAL NETS"
Move-FolderSafe "OBSIDIAN" "90 OBSIDIAN"

Ensure-Dir "90 OBSIDIAN"
Ensure-Dir "90 OBSIDIAN/Contracts"
Ensure-Dir "90 OBSIDIAN/OB-Templates"
Ensure-Dir "90 OBSIDIAN/OB-Templates/Contracts"
Ensure-Dir "90 OBSIDIAN/Workflows"
Ensure-Dir "90 OBSIDIAN/Dashboards"

Write-Host "== PROJECT SHELLS ==" -ForegroundColor Magenta

Move-FolderSafe "10 PROJECTS/BorderPulse-PRO" "10 PROJECTS/BorderPulse"
Move-FolderSafe "10 PROJECTS/CodependentCoding-PRO" "10 PROJECTS/CodependentCoding"

$projects = @(
  "RateLtd",
  "Vouch",
  "CtrlPlus",
  "MeatHarness",
  "BorderPulse",
  "CodependentCoding"
)

$sections = @(
  "00 PROJECT MAP",
  "10 PRODUCT",
  "20 CONTRACTS",
  "30 ARCHITECTURE",
  "40 FEATURES",
  "50 AGENT OPS",
  "60 EXECUTION",
  "70 RESEARCH",
  "80 LEGAL",
  "90 ARCHIVE"
)

foreach ($project in $projects) {
  Ensure-Dir "10 PROJECTS/$project"
  foreach ($section in $sections) {
    Ensure-Dir "10 PROJECTS/$project/$section"
  }
}

Write-Host "== CONTRACT DOMAIN FOLDERS ==" -ForegroundColor Magenta

$rateLtdDomains = @(
  "product","commands","tui-shell","filesystem","repositories",
  "git-diffs","powershell","termcn-ui","monaco","integrations",
  "data","ui","tests"
)

foreach ($domain in $rateLtdDomains) {
  Ensure-Dir "10 PROJECTS/RateLtd/20 CONTRACTS/$domain"
}

$vouchDomains = @(
  "product","domain","authz","readiness","identity","payments",
  "payouts","confirmations","settlement","legal","messaging",
  "routes","data","tests"
)

foreach ($domain in $vouchDomains) {
  Ensure-Dir "10 PROJECTS/Vouch/20 CONTRACTS/$domain"
}

$ctrlPlusDomains = @(
  "product","architecture","tenancy","authz","wrap-catalog",
  "visualizer","vehicles","media","cloudinary","huggingface",
  "billing","routes","data","tests"
)

foreach ($domain in $ctrlPlusDomains) {
  Ensure-Dir "10 PROJECTS/CtrlPlus/20 CONTRACTS/$domain"
}

Write-Host ""
Write-Host "PASS 1 COMPLETE" -ForegroundColor Green
git status --short
obsidian folders total
obsidian files total