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

function Write-Note {
  param(
    [string]$Path,
    [string]$Content
  )

  $parent = Split-Path -Path $Path -Parent
  if ($parent) { Ensure-Dir $parent }

  if (Test-Path -LiteralPath $Path) {
    Write-Host "SKIP exists: $Path" -ForegroundColor Yellow
    return
  }

  $Content | Set-Content -LiteralPath $Path -Encoding UTF8
  Write-Host "WRITE $Path" -ForegroundColor Cyan
}

function New-TopMap {
  param(
    [string]$Path,
    [string]$Title,
    [string]$Namespace,
    [string]$Folder,
    [string]$Tag
  )

  $content = @"
---
title: $Title
type: map
scope: vault
project:
domain: vault
artifact: index
kind: map
namespace: $Namespace
status: active
authority: reference
parent:
depends_on:
  - "[[obsidian.contracts.naming-standard]]"
supersedes: []
tags:
  - maps/vault
  - $Tag
  - status/active
---

# $Title

## Files

~~~dataview
LIST
FROM "$Folder"
SORT file.name ASC
~~~

## Recently Modified

~~~dataview
TABLE file.mtime AS Modified
FROM "$Folder"
SORT file.mtime DESC
LIMIT 20
~~~
"@

  Write-Note $Path $content
}

function New-ProjectMap {
  param(
    [string]$Project,
    [string]$Slug
  )

  $path = "10 PROJECTS/$Project/00 PROJECT MAP/$Slug.project.map.md"

  $content = @"
---
title: $Project Project Map
type: map
scope: project
project: $Project
domain: project
artifact: map
kind: map
namespace: $Slug.project.map
status: active
authority: source-of-truth
parent: "[[devnotes.projects.map]]"
depends_on:
  - "[[obsidian.contracts.naming-standard]]"
  - "[[obsidian.contracts.property-schema]]"
supersedes: []
tags:
  - projects/$Slug
  - maps/project
  - status/active
---

# $Project Project Map

## Product

~~~dataview
LIST
FROM "10 PROJECTS/$Project/10 PRODUCT"
SORT file.name ASC
~~~

## Contracts

~~~dataview
TABLE domain, artifact, kind, status, authority
FROM "10 PROJECTS/$Project/20 CONTRACTS"
SORT domain ASC, artifact ASC
~~~

## Architecture

~~~dataview
LIST
FROM "10 PROJECTS/$Project/30 ARCHITECTURE"
SORT file.name ASC
~~~

## Features

~~~dataview
LIST
FROM "10 PROJECTS/$Project/40 FEATURES"
SORT file.name ASC
~~~

## Agent Ops

~~~dataview
LIST
FROM "10 PROJECTS/$Project/50 AGENT OPS"
SORT file.name ASC
~~~

## Execution

~~~dataview
LIST
FROM "10 PROJECTS/$Project/60 EXECUTION"
SORT file.name ASC
~~~

## Research

~~~dataview
LIST
FROM "10 PROJECTS/$Project/70 RESEARCH"
SORT file.name ASC
~~~

## Legal

~~~dataview
LIST
FROM "10 PROJECTS/$Project/80 LEGAL"
SORT file.name ASC
~~~

## Archive

~~~dataview
LIST
FROM "10 PROJECTS/$Project/90 ARCHIVE"
SORT file.name ASC
~~~
"@

  Write-Note $path $content
}

Ensure-Dir "00 ZETTELKASTEN"
Ensure-Dir "10 PROJECTS"
Ensure-Dir "20 DOCUMENTATION"
Ensure-Dir "30 DEEP RESEARCH"
Ensure-Dir "40 TECH STACK"
Ensure-Dir "50 REGRETS, CIGARETTES, & NEURAL NETS"
Ensure-Dir "90 OBSIDIAN"

New-TopMap `
  -Path "00 ZETTELKASTEN/zettelkasten.map.md" `
  -Title "Zettelkasten Map" `
  -Namespace "devnotes.zettelkasten.map" `
  -Folder "00 ZETTELKASTEN" `
  -Tag "zettelkasten"

New-TopMap `
  -Path "20 DOCUMENTATION/documentation.map.md" `
  -Title "Documentation Map" `
  -Namespace "devnotes.documentation.map" `
  -Folder "20 DOCUMENTATION" `
  -Tag "documentation"

New-TopMap `
  -Path "30 DEEP RESEARCH/deep-research.map.md" `
  -Title "Deep Research Map" `
  -Namespace "devnotes.deep-research.map" `
  -Folder "30 DEEP RESEARCH" `
  -Tag "research"

New-TopMap `
  -Path "40 TECH STACK/tech-stack.map.md" `
  -Title "Tech Stack Map" `
  -Namespace "devnotes.tech-stack.map" `
  -Folder "40 TECH STACK" `
  -Tag "tech-stack"

New-TopMap `
  -Path "50 REGRETS, CIGARETTES, & NEURAL NETS/regrets-cigarettes-neural-nets.map.md" `
  -Title "Regrets, Cigarettes, & Neural Nets Map" `
  -Namespace "devnotes.regrets-cigarettes-neural-nets.map" `
  -Folder "50 REGRETS, CIGARETTES, & NEURAL NETS" `
  -Tag "writing"

New-TopMap `
  -Path "90 OBSIDIAN/obsidian.system.map.md" `
  -Title "Obsidian System Map" `
  -Namespace "obsidian.system.map" `
  -Folder "90 OBSIDIAN" `
  -Tag "obsidian"

$projectsIndex = @'
---
title: Projects Map
type: map
scope: vault
project:
domain: projects
artifact: index
kind: map
namespace: devnotes.projects.map
status: active
authority: source-of-truth
parent:
depends_on:
  - "[[obsidian.contracts.naming-standard]]"
  - "[[obsidian.contracts.property-schema]]"
supersedes: []
tags:
  - projects
  - maps/vault
  - status/active
---

# Projects Map

## Project Maps

~~~dataview
TABLE project, status, authority
FROM "10 PROJECTS"
WHERE type = "map" AND scope = "project"
SORT project ASC
~~~

## Active Contracts

~~~dataview
TABLE project, domain, artifact, kind, status
FROM "10 PROJECTS"
WHERE type = "contract" AND status = "active"
SORT project ASC, domain ASC, artifact ASC
~~~

## Draft Contracts

~~~dataview
TABLE project, domain, artifact, kind, file.mtime AS Modified
FROM "10 PROJECTS"
WHERE type = "contract" AND status = "draft"
SORT file.mtime DESC
~~~

## Agent Ops

~~~dataview
LIST
FROM "10 PROJECTS"
WHERE contains(file.path, "50 AGENT OPS")
SORT file.mtime DESC
~~~
'@

Write-Note "10 PROJECTS/projects.map.md" $projectsIndex

New-ProjectMap -Project "RateLtd" -Slug "rateltd"
New-ProjectMap -Project "Vouch" -Slug "vouch"
New-ProjectMap -Project "CtrlPlus" -Slug "ctrlplus"
New-ProjectMap -Project "MeatHarness" -Slug "meatharness"
New-ProjectMap -Project "BorderPulse" -Slug "borderpulse"
New-ProjectMap -Project "CodependentCoding" -Slug "codependentcoding"

$home = @'
---
title: DevNotes Home
type: map
scope: vault
project:
domain: vault
artifact: home
kind: map
namespace: devnotes.home
status: active
authority: source-of-truth
parent:
depends_on:
  - "[[devnotes.projects.map]]"
  - "[[obsidian.system.map]]"
supersedes: []
tags:
  - devnotes
  - maps/vault
  - status/active
---

# DevNotes Home

## Primary Maps

- [[devnotes.projects.map]]
- [[devnotes.zettelkasten.map]]
- [[devnotes.documentation.map]]
- [[devnotes.deep-research.map]]
- [[devnotes.tech-stack.map]]
- [[devnotes.regrets-cigarettes-neural-nets.map]]
- [[obsidian.system.map]]
- [[obsidian.dashboard.contracts]]

## Active Source-of-Truth Notes

~~~dataview
TABLE type, project, domain, artifact, status
FROM ""
WHERE authority = "source-of-truth"
SORT project ASC, domain ASC, artifact ASC
~~~

## Recently Modified

~~~dataview
TABLE file.folder AS Folder, file.mtime AS Modified
FROM ""
SORT file.mtime DESC
LIMIT 25
~~~

## Operating Rule

Capture messy notes quickly. Promote durable rules into contracts. Keep project truth discoverable through maps.
'@

Write-Note "devnotes.home.md" $home

Write-Host ""
Write-Host "PASS 3C COMPLETE" -ForegroundColor Green
git status --short
