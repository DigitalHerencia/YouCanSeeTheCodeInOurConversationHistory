---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\fabric-lakehouse\references\getdata.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\fabric-lakehouse\references\getdata.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.fabric-lakehouse.references.getdata.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\fabric-lakehouse\references\getdata.md'
source_file: 'getdata.md'
source_sha256: '8a67d5278a85d8f5a2ef2074caa13309c5afebfd7539ccd0aa6d40eae0a35e62'
generated: true
---

# `getdata.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\fabric-lakehouse\references\getdata.md`
> SHA-256: `8a67d5278a85d8f5a2ef2074caa13309c5afebfd7539ccd0aa6d40eae0a35e62`

````markdown
### Data Factory Integration

Microsoft Fabric includes Data Factory for ETL/ELT orchestration:

- **180+ connectors** for data sources
- **Copy activity** for data movement
- **Dataflow Gen2** for transformations
- **Notebook activity** for Spark processing
- **Scheduling** and triggers

### Pipeline Activities

| Activity | Description |
|----------|-------------|
| Copy Data | Move data between sources and Lakehouse |
| Notebook | Execute Spark notebooks |
| Dataflow | Run Dataflow Gen2 transformations |
| Stored Procedure | Execute SQL procedures |
| ForEach | Loop over items |
| If Condition | Conditional branching |
| Get Metadata | Retrieve file/folder metadata |
| Lakehouse Maintenance | Optimize and vacuum Delta tables |

### Orchestration Patterns

```
Pipeline: Daily_ETL_Pipeline
├── Get Metadata (check for new files)
├── ForEach (process each file)
│   ├── Copy Data (bronze layer)
│   └── Notebook (silver transformation)
├── Notebook (gold aggregation)
└── Lakehouse Maintenance (optimize tables)
```

---
````