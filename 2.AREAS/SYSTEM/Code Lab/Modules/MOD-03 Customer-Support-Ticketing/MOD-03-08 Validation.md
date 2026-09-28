---
type: lesson
id: LESS-003.08
module: "[[Module]]"
project: "[[1.PROJECTS/ENG-M1-P1.2-CONFIG Project-Configuration/Project]]"
mastery_state: not-started
mastery: 0
confidence: 0
next_review: null
created: 2026-09-26
updated: 2026-09-26
tags: [type/codelab]
lesson: "Validation"
mastery_state: not-started
mastery: 0
confidence: 0
last_attempted: ""
next_review: ""
---
# Validation

## Doctrine
Apply this DevCycle to its real Maximal Template surface. Record actual changed paths, checks, evidence, and remaining constraints.

## DevCycle source
[[3.RESOURCES/Digital Herencia/SOPs/Dev 2dba4e63bf23803aafc0c58095ec268f.md#Validation DevCycle Instructions]]

The **Validation** DevCycle ensures that the system’s behavior matches the intent, logic, UX, and business rules defined in the PRD + TechReq. This phase is distinct from Verification: Verification checks structure and configuration; Validation checks correctness of behavior.

Validation is universal, stack-agnostic, and does not generate code. It evaluates implementation quality and alignment.

## 1. Purpose

- Validate that all previous DevCycles resulted in behavior aligned with PRD + TechReq.
- Identify mismatches in business logic, UX flows, data flow, and permissions.
- Ensure cross-domain correctness.

## 2. Responsibilities

### 2.1 Validate Business Logic

The agent MUST:
- Compare implemented logic against PRD requirements.
- Detect logic deviations, missing rules, or contradictory flows.
- Check for unhandled edge cases or undefined conditions.

### 2.2 Validate UX and User Journeys

The agent MUST:
- Compare UX flows against PRD user journey descriptions.
- Validate screen order, navigation paths, and required user actions.
- Identify broken flows, missing screens, or incorrect branching.

### 2.3 Validate Auth & Permissions

The agent MUST:
- Validate that roles, permissions, and access rules implemented match the Auth DevCycle definitions.
- Check that protected features remain protected.
- Ensure no privilege escalation or access mismatch exists.

### 2.4 Validate Data Contracts

The agent MUST:
- Compare input/output shapes for data operations with PRD specifications.
- Validate against schema definitions from the Data DevCycle.
- Detect missing fields, mismatched types, or incomplete contracts.

### 2.5 Validate Feature Integration

The agent evaluates whether:
- Features depend correctly on data and auth layers.
- Workflows correctly use underlying logic.
- No circular or broken dependencies exist.

## 3. Inputs

- PRD
- TechReq
- Testing DevCycle outputs
- Auth DevCycle outputs
- Data DevCycle outputs
- Toolset for Validation phase

## 4. Outputs

- Validation report
- List of mismatches and required corrections
- Tasks added to `todo.md`
- Changelog entry summarizing validation results

## 5. Success Criteria

Validation is complete when:
- All mismatches have been documented
- No critical misalignment exists between implementation and PRD/TechReq
- Human approves the validation report

## 6. Error Handling

The agent MUST:
- Halt if critical validation failures are detected
- Identify missing logic, incorrect assumptions, or broken UX flows
- Provide clear requirements for fixes

These instructions define the complete behavior of the Validation DevCycle.


## Applied drill
Link the TaskNotes task that implements this DevCycle.

## Human controls
Mastery: `INPUT[number:mastery]` · Confidence: `INPUT[number:confidence]` · State: `INPUT[select(option(not-started), option(in-progress), option(in-review), option(mastered)):mastery_state]` · Review: `INPUT[date:next_review]`




