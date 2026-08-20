---
title: Codependent Coding Simples Dashboard
type: dashboard
scope: project
project: Codependent Coding
domain: simples
artifact: dashboard
kind: dashboard
namespace: codependentcoding.simples.dashboard
status: active
authority: derived
parent: "[[codependentcoding.webapp-architecture.master.source-document]]"
depends_on:
  - "[[codependentcoding.simples.canonicalization.workflow]]"
supersedes: []
tags:
  - codependent-coding/simples
  - dashboard/simples
  - status/active
created: 2026-08-18
updated: 2026-08-18
---
# Simples Dashboard

> [!info]
> Derived operating view over file-level Simple records in `10.PROJECTS.CODEPENDENTCODING.Simples`. Edit the Simple notes, not this dashboard's generated results.

## All Simples

```dataview
TABLE
  simple_type AS "Type",
  domain AS "Domain",
  source_path AS "Source",
  canonicalization_status AS "Canonical",
  public_implementation_status AS "Public",
  hardened_implementation_status AS "Hardened",
  generation_status AS "Generation",
  owner_approval AS "Approval"
FROM "10 PROJECTS/10.PROJECTS.CODEPENDENTCODING/10.PROJECTS.CODEPENDENTCODING.Simples"
WHERE type = "simple"
SORT simple_type ASC, source_path ASC
```

## Canonicalization Queue

```dataview
TABLE
  simple_type AS "Type",
  source_path AS "Source",
  canonicalization_status AS "State",
  owner_approval AS "Approval"
FROM "10 PROJECTS/10.PROJECTS.CODEPENDENTCODING/10.PROJECTS.CODEPENDENTCODING.Simples"
WHERE type = "simple" AND (canonicalization_status != "canonical" OR owner_approval != "approved")
SORT canonicalization_status ASC, source_path ASC
```

## Public vs Hardened

```dataview
TABLE
  source_path AS "Source",
  public_implementation_status AS "Public",
  hardened_implementation_status AS "Hardened",
  variants AS "Variants"
FROM "10 PROJECTS/10.PROJECTS.CODEPENDENTCODING/10.PROJECTS.CODEPENDENTCODING.Simples"
WHERE type = "simple"
SORT hardened_implementation_status ASC, source_path ASC
```

## Generation Readiness

```dataview
TABLE
  simple_type AS "Type",
  source_path AS "Source",
  generation_status AS "Generation",
  requires AS "Requires"
FROM "10 PROJECTS/10.PROJECTS.CODEPENDENTCODING/10.PROJECTS.CODEPENDENTCODING.Simples"
WHERE type = "simple"
SORT generation_status ASC, source_path ASC
```

## By Simple Type

```dataview
TABLE WITHOUT ID
  simple_type AS "Simple Type",
  length(rows) AS "Count"
FROM "10 PROJECTS/10.PROJECTS.CODEPENDENTCODING/10.PROJECTS.CODEPENDENTCODING.Simples"
WHERE type = "simple"
GROUP BY simple_type
SORT simple_type ASC
```

## Database Reference Slice

```dataview
TABLE
  simple_type AS "Type",
  layer AS "Layer",
  source_path AS "Source",
  canonicalization_status AS "Canonical",
  hardened_implementation_status AS "Hardened"
FROM "10 PROJECTS/10.PROJECTS.CODEPENDENTCODING/10.PROJECTS.CODEPENDENTCODING.Simples"
WHERE parent = link("codependentcoding.simples.database.map")
SORT source_path ASC
```

## Simples With Prohibited Relationships

```dataview
TABLE
  simple_type AS "Type",
  source_path AS "Source",
  prohibits AS "Prohibits"
FROM "10 PROJECTS/10.PROJECTS.CODEPENDENTCODING/10.PROJECTS.CODEPENDENTCODING.Simples"
WHERE type = "simple" AND length(prohibits) > 0
SORT simple_type ASC, source_path ASC
```

## Ontology Membership

```dataview
TABLE
  simple_type AS "Type",
  source_path AS "Source",
  ontologies AS "Ontologies"
FROM "10 PROJECTS/10.PROJECTS.CODEPENDENTCODING/10.PROJECTS.CODEPENDENTCODING.Simples"
WHERE type = "simple" AND length(ontologies) > 0
SORT source_path ASC
```

## Orphans / Incomplete Metadata

```dataview
TABLE
  simple_type AS "Type",
  source_path AS "Source",
  parent AS "Parent",
  source_mirror AS "Mirror"
FROM "10 PROJECTS/10.PROJECTS.CODEPENDENTCODING/10.PROJECTS.CODEPENDENTCODING.Simples"
WHERE type = "simple" AND (!simple_type OR !source_path OR !source_mirror)
SORT file.name ASC
```

## Navigation

- [[codependentcoding.simples.canonicalization.workflow]]
- [[codependentcoding.simples.workbench.contract]]
- [[codependentcoding.simples.database.map]]
- [[70.TODO.CODEPENDENTCODING.2.Consolidation|Codependent Coding Consolidation]]
