---
type: resource
resource_state: processed
authority: source
resource_role: operating-model
---
# Notion SOP Semantics

## Execution ontology
Portfolio → Milestone → Phase → Project → Task. Hearth applies the authorized vault simplification Project → Milestone → Phase → Task, with TaskNotes as execution truth and the project Board tracking milestone cards.

## Ownership and lifecycle
The source Cycles SOP defines strict responsibility boundaries for Operations, Product, Design, Engineering, and Marketing and three milestones: Foundation/Pre-Production, MVP Launch, and Expansion/Hardening. Projects retain source team, milestone, phase, inputs, outputs, and downstream-consumer semantics when present. No future ticket catalog is mass-created from SOP examples.

## Operational semantics
The source Dev SOP defines DevCycle inputs, outputs, validation, and human gates. Procedures, Teams, Tech Stack, Ticketing, and Cycles sources remain available intact through [[3.RESOURCES/Library/Notion Source Map]]. Exported meeting occurrences remain historical evidence; cadence definitions are represented once and meetings are generated on demand.

## Migration integrity
Only source-provided values are migrated. Task-to-project relations are absent from the CSV and remain unresolved; no task relation is derived from names or ticket codes. See [[2.AREAS/SYSTEM/Reports/Migration Repair Queue]].
