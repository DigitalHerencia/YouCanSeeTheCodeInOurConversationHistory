---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\templates\devcycle_data.template.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\templates\devcycle_data.template.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.templates.devcycle-data.template.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\templates\devcycle_data.template.md'
source_file: 'devcycle_data.template.md'
source_sha256: 'a37b621e6973853d5c77396b3b6b9fcdccb6084526af5127de6f97058f95dc7b'
generated: true
---

# `devcycle_data.template.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\templates\devcycle_data.template.md`
> SHA-256: `a37b621e6973853d5c77396b3b6b9fcdccb6084526af5127de6f97058f95dc7b`

```markdown
---
name: data.instructions
applyTo: "**"
description: Instructions for the Data DevCycle.
---

# Data DevCycle Instructions

The **Data** DevCycle establishes the project's data layer in a language-agnostic, framework-agnostic way. The stack-specific agent performs implementation based on these universal rules.

## 1. Purpose
- Translate PRD + TechReq data models into a structured, validated schema.
- Define migrations, data contracts, and seed data requirements.
- Ensure the data layer supports all planned application features.

## 2. Responsibilities
### 2.1 Interpret PRD + TechReq Data Requirements
- Extract all entities, relationships, constraints, and rules.
- Identify required identifiers, enums, metadata fields, and business rules.
- Validate completeness of the PRD's data modeling section.

### 2.2 Define Schema Requirements
The agent MUST define schema specifications such as:
- Entities / models
- Fields and field types
- Relationships
- Validation rules
- Indexes or query patterns when relevant
- Constraints and lifecycle events

### 2.3 Generate Migration Plan
- Define the list of migrations required to initialize the database.
- Ensure migration safety:
  - No destructive operations unless explicitly required.
  - Support for up/down migrations.

### 2.4 Define Seed Data Requirements
- Extract seed scenarios from the PRD.
- Define seed dataset:
  - Required baseline records
  - Example user accounts
  - Minimum viable dataset for testing and development

### 2.5 Enforce Constraints
- Schema must align perfectly with PRD + TechReq.
- Inconsistencies must stop the cycle.
- Agent must surface questions to the human when unclear.

## 3. Inputs
- PRD
- TechReq
- Verification summary
- Toolset for the Data phase

## 4. Outputs
- Data schema specification (agnostic)
- Migration plan summary
- Seed data specification
- Tasks added to `todo.md`
- Changelog entry summarizing data layer work

## 5. Success Criteria
The Data DevCycle is complete when:
- Schema requirements are fully defined
- Migrations are logically consistent
- Seed data requirements are documented
- All PRD-model-to-schema mappings are validated
- Human approves the data specification

## 6. Error Handling
The agent MUST:
- Halt if PRD + TechReq data definitions are incomplete
- Surface ambiguous entity relationships
- Flag conflicting field types or rules
- Provide corrective recommendations

These instructions define the complete behavior of the Data DevCycle.


```