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

function Ensure-Parent {
  param([string]$Path)
  $parent = Split-Path -Path $Path -Parent
  if ($parent) { Ensure-Dir $parent }
}

function Move-FileSafe {
  param([string]$From, [string]$To)

  if (-not (Test-Path -LiteralPath $From)) {
    Write-Host "SKIP missing: $From" -ForegroundColor DarkGray
    return
  }

  if (Test-Path -LiteralPath $To) {
    Write-Host "SKIP exists: $To" -ForegroundColor Yellow
    return
  }

  Ensure-Parent $To
  Move-Item -LiteralPath $From -Destination $To
  Write-Host "MOVE $From -> $To" -ForegroundColor Cyan
}

Write-Host "== ZETTELKASTEN CAPTURES ==" -ForegroundColor Magenta

Move-FileSafe "Untitled.md" "00 ZETTELKASTEN/untitled.000.capture.md"
Move-FileSafe "Untitled 1.md" "00 ZETTELKASTEN/untitled.001.capture.md"
Move-FileSafe "Untitled 2.md" "00 ZETTELKASTEN/untitled.002.capture.md"
Move-FileSafe "File Types for Documentation.md" "90 OBSIDIAN/Contracts/obsidian.documentation.file-types.md"

Write-Host "== RATELTD ==" -ForegroundColor Magenta

Move-FileSafe "10 PROJECTS/RateLtd/00 - RateLtd Index.md" "10 PROJECTS/RateLtd/00 PROJECT MAP/rateltd.project.map.md"
Move-FileSafe "10 PROJECTS/RateLtd/01 - Product Vision.md" "10 PROJECTS/RateLtd/10 PRODUCT/rateltd.product.vision.md"
Move-FileSafe "10 PROJECTS/RateLtd/02 - Feature Inventory.md" "10 PROJECTS/RateLtd/40 FEATURES/rateltd.features.inventory.md"
Move-FileSafe "10 PROJECTS/RateLtd/03 - Architecture Plan.md" "10 PROJECTS/RateLtd/30 ARCHITECTURE/rateltd.architecture.plan.md"
Move-FileSafe "10 PROJECTS/RateLtd/04 - Module Specifications.md" "10 PROJECTS/RateLtd/20 CONTRACTS/rateltd.modules.specifications.contract.md"
Move-FileSafe "10 PROJECTS/RateLtd/05 - Integration Plan.md" "10 PROJECTS/RateLtd/20 CONTRACTS/integrations/rateltd.integrations.plan.contract.md"
Move-FileSafe "10 PROJECTS/RateLtd/06 - Task Matrix.md" "10 PROJECTS/RateLtd/60 EXECUTION/rateltd.execution.task-matrix.md"
Move-FileSafe "10 PROJECTS/RateLtd/07 - Codex Work Packages.md" "10 PROJECTS/RateLtd/50 AGENT OPS/rateltd.codex.work-packages.md"
Move-FileSafe "10 PROJECTS/RateLtd/08 - Decisions and Risks.md" "10 PROJECTS/RateLtd/60 EXECUTION/rateltd.decisions-and-risks.md"
Move-FileSafe "10 PROJECTS/RateLtd/Comprehensive Scope.md" "10 PROJECTS/RateLtd/10 PRODUCT/rateltd.product.comprehensive-scope.md"

Write-Host "== VOUCH ==" -ForegroundColor Magenta

Move-FileSafe "10 PROJECTS/Vouch/Disclaimer.md" "10 PROJECTS/Vouch/80 LEGAL/vouch.legal.disclaimer.md"
Move-FileSafe "10 PROJECTS/Vouch/Privacy Policy.md" "10 PROJECTS/Vouch/80 LEGAL/vouch.legal.privacy-policy.md"
Move-FileSafe "10 PROJECTS/Vouch/Terms of Service.md" "10 PROJECTS/Vouch/80 LEGAL/vouch.legal.terms-of-service.md"
Move-FileSafe "10 PROJECTS/Vouch/User Agreement.md" "10 PROJECTS/Vouch/80 LEGAL/vouch.legal.user-agreement.md"
Move-FileSafe "10 PROJECTS/Vouch/Gas Pump Analogy.md" "10 PROJECTS/Vouch/10 PRODUCT/vouch.product.gas-pump-analogy.md"
Move-FileSafe "10 PROJECTS/Vouch/How the Machine Becomes Trustworthy.md" "10 PROJECTS/Vouch/10 PRODUCT/vouch.product.trust-model.md"
Move-FileSafe "10 PROJECTS/Vouch/Vouch Messaging.md" "10 PROJECTS/Vouch/10 PRODUCT/vouch.messaging.product.md"
Move-FileSafe "10 PROJECTS/Vouch/What Next.md" "10 PROJECTS/Vouch/60 EXECUTION/vouch.execution.what-next.md"

Ensure-Dir "10 PROJECTS/Vouch/90 ARCHIVE/legacy"

Move-FileSafe "10 PROJECTS/Vouch/Legacy/Backend inventory.md" "10 PROJECTS/Vouch/90 ARCHIVE/legacy/vouch.backend.inventory.legacy.md"
Move-FileSafe "10 PROJECTS/Vouch/Legacy/Blue Prints.md" "10 PROJECTS/Vouch/90 ARCHIVE/legacy/vouch.blueprints.legacy.md"
Move-FileSafe "10 PROJECTS/Vouch/Legacy/Dev Prompts.md" "10 PROJECTS/Vouch/50 AGENT OPS/vouch.codex.dev-prompts.legacy.md"
Move-FileSafe "10 PROJECTS/Vouch/Legacy/PRD.md" "10 PROJECTS/Vouch/10 PRODUCT/vouch.product.prd.legacy.md"
Move-FileSafe "10 PROJECTS/Vouch/Legacy/Pricing.md" "10 PROJECTS/Vouch/10 PRODUCT/vouch.product.pricing.legacy.md"
Move-FileSafe "10 PROJECTS/Vouch/Legacy/Vouch Route Implementation Matrix.md" "10 PROJECTS/Vouch/30 ARCHITECTURE/vouch.routes.implementation-matrix.legacy.md"
Move-FileSafe "10 PROJECTS/Vouch/Legacy/Vouch Stripe Setup Guide.md" "10 PROJECTS/Vouch/20 CONTRACTS/payments/vouch.payments.stripe-setup-guide.legacy.md"
Move-FileSafe "10 PROJECTS/Vouch/Legacy/Vouch.md" "10 PROJECTS/Vouch/10 PRODUCT/vouch.product.overview.legacy.md"

Write-Host "== CTRLPLUS ==" -ForegroundColor Magenta

Move-FileSafe "10 PROJECTS/CtrlPlus/Architecture Core Principles.md" "10 PROJECTS/CtrlPlus/30 ARCHITECTURE/ctrlplus.architecture.core-principles.md"
Move-FileSafe "10 PROJECTS/CtrlPlus/Architecture Recommended Target Directory Tree.md" "10 PROJECTS/CtrlPlus/30 ARCHITECTURE/ctrlplus.architecture.target-directory-tree.md"
Move-FileSafe "10 PROJECTS/CtrlPlus/CtrlPlus Canonical File Placement and Contract Rules.md" "10 PROJECTS/CtrlPlus/20 CONTRACTS/architecture/ctrlplus.architecture.boundaries.contract.md"
Move-FileSafe "10 PROJECTS/CtrlPlus/CtrlPlus Server-First Architecture Blueprint.md" "10 PROJECTS/CtrlPlus/30 ARCHITECTURE/ctrlplus.architecture.server-first-blueprint.md"
Move-FileSafe "10 PROJECTS/CtrlPlus/Codex Implementation Spec Catalog Wrap-Driven Visualizer Migration.md" "10 PROJECTS/CtrlPlus/50 AGENT OPS/ctrlplus.codex.wrap-visualizer-migration.spec.md"
Move-FileSafe "10 PROJECTS/CtrlPlus/Codex Implementation Spec Visualizer Generation Pipeline Catalog-Driven Hugging Face Cloudinary.md" "10 PROJECTS/CtrlPlus/50 AGENT OPS/ctrlplus.codex.visualizer-generation-pipeline.spec.md"
Move-FileSafe "10 PROJECTS/CtrlPlus/CtrlPlus Refactor.md" "10 PROJECTS/CtrlPlus/60 EXECUTION/ctrlplus.execution.refactor.md"
Move-FileSafe "10 PROJECTS/CtrlPlus/Production-ready refactor & redesign of the Wrap Catalog and Vehicle Visualizer in CtrlPlus.md" "10 PROJECTS/CtrlPlus/60 EXECUTION/ctrlplus.execution.wrap-catalog-visualizer-refactor.md"

Write-Host "== MEATHARNESS ==" -ForegroundColor Magenta

Move-FileSafe "10 PROJECTS/MeatHarness/README_PROJECT_PACKET.md" "10 PROJECTS/MeatHarness/00 PROJECT MAP/meatharness.project.packet.md"
Move-FileSafe "10 PROJECTS/MeatHarness/PROJECT_INSTRUCTIONS.md" "10 PROJECTS/MeatHarness/50 AGENT OPS/meatharness.project.instructions.md"
Move-FileSafe "10 PROJECTS/MeatHarness/Implementation Plan.md" "10 PROJECTS/MeatHarness/60 EXECUTION/meatharness.execution.implementation-plan.md"
Move-FileSafe "10 PROJECTS/MeatHarness/ink-tui-cheatsheet.md" "10 PROJECTS/MeatHarness/70 RESEARCH/meatharness.ink-tui.cheatsheet.md"
Move-FileSafe "10 PROJECTS/MeatHarness/meatharness-ai-contract.yaml" "10 PROJECTS/MeatHarness/20 CONTRACTS/meatharness.ai.contract.yaml"
Move-FileSafe "10 PROJECTS/MeatHarness/execution-state.template.json" "10 PROJECTS/MeatHarness/60 EXECUTION/meatharness.execution-state.template.json"

Write-Host ""
Write-Host "PASS 2 COMPLETE" -ForegroundColor Green
git status --short