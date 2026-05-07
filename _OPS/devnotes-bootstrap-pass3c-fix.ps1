Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if (-not (Test-Path ".obsidian")) {
  throw "Run this from the DevNotes vault root."
}

$homeNote = @'
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
  - "[[obsidian.dashboard.contracts]]"
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

## Contract Templates

~~~dataview
LIST
FROM "90 OBSIDIAN/OB-Templates/Contracts"
SORT file.name ASC
~~~

## Operating Rule

Capture messy notes quickly. Promote durable rules into contracts. Keep project truth discoverable through maps.
'@

if (Test-Path -LiteralPath "devnotes.home.md") {
  Write-Host "SKIP exists: devnotes.home.md" -ForegroundColor Yellow
} else {
  $homeNote | Set-Content -LiteralPath "devnotes.home.md" -Encoding UTF8
  Write-Host "WRITE devnotes.home.md" -ForegroundColor Cyan
}

Write-Host ""
Write-Host "PASS 3C FIX COMPLETE" -ForegroundColor Green
git status --short