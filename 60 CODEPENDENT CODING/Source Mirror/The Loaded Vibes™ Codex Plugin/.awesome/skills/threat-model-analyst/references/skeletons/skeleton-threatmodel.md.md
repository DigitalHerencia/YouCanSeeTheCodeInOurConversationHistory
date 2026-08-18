---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\threat-model-analyst\references\skeletons\skeleton-threatmodel.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\threat-model-analyst\references\skeletons\skeleton-threatmodel.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.threat-model-analyst.references.skeletons.skeleton-threatmodel.md'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-loaded-vibes-codex-plugin
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\threat-model-analyst\references\skeletons\skeleton-threatmodel.md'
source_file: 'skeleton-threatmodel.md'
source_sha256: 'b47b4862e87777a929256fd7906ed308bcf2214745ccdfe66959445e69b39196'
generated: true
---

# `skeleton-threatmodel.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\threat-model-analyst\references\skeletons\skeleton-threatmodel.md`
> SHA-256: `b47b4862e87777a929256fd7906ed308bcf2214745ccdfe66959445e69b39196`

`````markdown
# Skeleton: 1-threatmodel.md

> **⛔ Copy the template content below VERBATIM (excluding the outer code fence). Replace `[FILL]` placeholders. Diagram in `.md` and `.mmd` must be IDENTICAL.**
> **⛔ Data Flow Table columns: `ID | Source | Target | Protocol | Description`. DO NOT rename `Target` to `Destination`. DO NOT reorder columns.**
> **⛔ Trust Boundary Table columns: `Boundary | Description | Contains` (3 columns). DO NOT add a `Name` column or rename `Contains` to `Components Inside`.**

---

````markdown
# Threat Model

## Data Flow Diagram

```mermaid
[FILL: Copy EXACT content from 1.1-threatmodel.mmd]
```

## Element Table

| Element | Type | TMT Category | Description | Trust Boundary |
|---------|------|--------------|-------------|----------------|
[CONDITIONAL: For K8s apps with sidecars, add a `Co-located Sidecars` column after Trust Boundary]
[REPEAT: one row per element]
| [FILL] | [FILL: Process / External Interactor / Data Store] | [FILL: SE.P.TMCore.* / SE.EI.TMCore.* / SE.DS.TMCore.*] | [FILL] | [FILL] |
[END-REPEAT]

## Data Flow Table

| ID | Source | Target | Protocol | Description |
|----|--------|--------|----------|-------------|
[REPEAT: one row per data flow]
| [FILL: DF##] | [FILL] | [FILL] | [FILL] | [FILL] |
[END-REPEAT]

## Trust Boundary Table

| Boundary | Description | Contains |
|----------|-------------|----------|
[REPEAT: one row per trust boundary]
| [FILL] | [FILL] | [FILL: comma-separated component list] |
[END-REPEAT]

[CONDITIONAL: Include ONLY if summary diagram was generated (elements > 15 OR boundaries > 4)]

## Summary View

```mermaid
[FILL: Copy EXACT content from 1.2-threatmodel-summary.mmd]
```

## Summary to Detailed Mapping

| Summary Element | Contains | Summary Flows | Maps to Detailed Flows |
|-----------------|----------|---------------|------------------------|
[REPEAT]
| [FILL] | [FILL] | [FILL: SDF##] | [FILL: DF##, DF##] |
[END-REPEAT]

[END-CONDITIONAL]
````

**Fixed rules:**
- Use `DF01`, `DF02` for detailed flows; `SDF01`, `SDF02` for summary flows
- Element Type: exactly `Process`, `External Interactor`, or `Data Store`
- TMT Category: must be a specific ID from tmt-element-taxonomy.md (e.g., `SE.P.TMCore.WebSvc`)

`````