---
type: lesson
id: LESS-004.05
module: "[[Module]]"
project: "[[1.PROJECTS/ENG-M1-P1.2-CONFIG Project-Configuration/Project]]"
mastery_state: not-started
mastery: 0
confidence: 0
next_review: null
created: 2026-09-26
updated: 2026-09-26
tags: [type/codelab]
lesson: "Data"
mastery_state: not-started
mastery: 0
confidence: 0
last_attempted: ""
next_review: ""
---
# Data

## Doctrine
Apply this DevCycle to its real Maximal Template surface. Record actual changed paths, checks, evidence, and remaining constraints.

## DevCycle source
[[3.RESOURCES/Digital Herencia/SOPs/Dev 2dba4e63bf23803aafc0c58095ec268f.md#Data DevCycle Instructions]]

The **Data** DevCycle establishes the project’s data layer in a language-agnostic, framework-agnostic way. The stack-specific agent performs implementation based on these universal rules.

## 1. Purpose

- Translate PRD + TechReq data models into a structured, validated schema.
- Define migrations, data contracts, and seed data requirements.
- Ensure the data layer supports all planned application features.

## 2. Responsibilities

### 2.1 Interpret PRD + TechReq Data Requirements

- Extract all entities, relationships, constraints, and rules.
- Identify required identifiers, enums, metadata fields, and business rules.
- Validate completeness of the PRD’s data modeling section.

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


## Applied drill
Link the TaskNotes task that implements this DevCycle.

## Human controls
Mastery: `INPUT[number:mastery]` · Confidence: `INPUT[number:confidence]` · State: `INPUT[select(option(not-started), option(in-progress), option(in-review), option(mastered)):mastery_state]` · Review: `INPUT[date:next_review]`




