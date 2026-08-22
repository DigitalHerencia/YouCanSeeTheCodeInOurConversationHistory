---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\azure-pricing\references\REGIONS.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\azure-pricing\references\REGIONS.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.azure-pricing.references.regions.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\azure-pricing\references\REGIONS.md'
source_file: 'REGIONS.md'
source_sha256: 'c0125df101ab525177a7c84fc49f11ae78cde538599c10b07df1de894946dfff'
generated: true
---

# `REGIONS.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\azure-pricing\references\REGIONS.md`
> SHA-256: `c0125df101ab525177a7c84fc49f11ae78cde538599c10b07df1de894946dfff`

```markdown
# Azure Region Names Reference

The Azure Retail Prices API requires `armRegionName` values in lowercase with no spaces. Use this table to map common region names to their API values.

## Region Mapping

| Display Name | armRegionName |
|-------------|---------------|
| East US | `eastus` |
| East US 2 | `eastus2` |
| Central US | `centralus` |
| North Central US | `northcentralus` |
| South Central US | `southcentralus` |
| West Central US | `westcentralus` |
| West US | `westus` |
| West US 2 | `westus2` |
| West US 3 | `westus3` |
| Canada Central | `canadacentral` |
| Canada East | `canadaeast` |
| Brazil South | `brazilsouth` |
| North Europe | `northeurope` |
| West Europe | `westeurope` |
| UK South | `uksouth` |
| UK West | `ukwest` |
| France Central | `francecentral` |
| France South | `francesouth` |
| Germany West Central | `germanywestcentral` |
| Germany North | `germanynorth` |
| Switzerland North | `switzerlandnorth` |
| Switzerland West | `switzerlandwest` |
| Norway East | `norwayeast` |
| Norway West | `norwaywest` |
| Sweden Central | `swedencentral` |
| Italy North | `italynorth` |
| Poland Central | `polandcentral` |
| Spain Central | `spaincentral` |
| East Asia | `eastasia` |
| Southeast Asia | `southeastasia` |
| Japan East | `japaneast` |
| Japan West | `japanwest` |
| Australia East | `australiaeast` |
| Australia Southeast | `australiasoutheast` |
| Australia Central | `australiacentral` |
| Korea Central | `koreacentral` |
| Korea South | `koreasouth` |
| Central India | `centralindia` |
| South India | `southindia` |
| West India | `westindia` |
| UAE North | `uaenorth` |
| UAE Central | `uaecentral` |
| South Africa North | `southafricanorth` |
| South Africa West | `southafricawest` |
| Qatar Central | `qatarcentral` |

## Conversion Rules

1. Remove all spaces
2. Convert to lowercase
3. Examples:
   - "East US" → `eastus`
   - "West Europe" → `westeurope`
   - "Southeast Asia" → `southeastasia`
   - "South Central US" → `southcentralus`

## Common Aliases

Users may refer to regions informally. Map these to the correct `armRegionName`:

| User Says | Maps To |
|-----------|---------|
| "US East", "Virginia" | `eastus` |
| "US West", "California" | `westus` |
| "Europe", "EU" | `westeurope` (default) |
| "UK", "London" | `uksouth` |
| "Asia", "Singapore" | `southeastasia` |
| "Japan", "Tokyo" | `japaneast` |
| "Australia", "Sydney" | `australiaeast` |
| "India", "Mumbai" | `centralindia` |
| "Korea", "Seoul" | `koreacentral` |
| "Brazil", "São Paulo" | `brazilsouth` |
| "Canada", "Toronto" | `canadacentral` |
| "Germany", "Frankfurt" | `germanywestcentral` |
| "France", "Paris" | `francecentral` |
| "Sweden", "Stockholm" | `swedencentral` |

```