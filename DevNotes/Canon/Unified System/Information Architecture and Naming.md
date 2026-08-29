---
title: Information Architecture and Naming
role: DevNotes
system: DevNotes
workspace:
type: contract
status: Active
authority: Source of Truth
created: 2026-08-28
updated: 2026-08-28
tags:
  - information-architecture
  - naming
  - retrieval
---

# Information Architecture and Naming

## Principle

DevNotes names things for humans and classifies them through the knowledge system.

A filename is a readable identity, not a serialized metadata record.

## Filenames

Use short, ordinary, descriptive filenames. Spaces, familiar abbreviations, and established document names are allowed when they make the vault easier to read.

Examples:

- `Project Home.md`
- `PRD.md`
- `Architecture.md`
- `Research.md`
- `Verification Evidence.md`
- `ChatGPT Project Instructions.md`
- `Role Manifest Specification.md`

Do **not** generate semantic dot-notation filenames or encode role, project, domain, taxonomy, type, authority, status, or lifecycle as dot-separated filename segments.

Machine artifacts may use filenames required by a tool or format. That is an implementation requirement, not a DevNotes semantic naming convention.

## Placement and classification

Use the role folder for primary responsibility ownership.

Use project/workspace and system/doctrine as facets rather than creating competing root filing systems.

Use Properties, tags, links, typed relationships, and Bases for independent classification and retrieval.

## Relationships

Internal durable relationships use wikilinks and backlinks. Typed relationships are added only where the edge itself carries meaning.

## Migration rule

Do not rename historical or protected material merely to make it visually conform. New and actively governed material follows this contract. Active governance files should be migrated away from obsolete machine-like names when their references can be updated safely.

## Protected areas

Do not apply naming cleanup to `ZETTLECASTEN/` or `CIGARETTES, REGRETS, & NEURAL NETS/` without a separate explicit request.
