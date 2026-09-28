---
type: lesson
id: LESS-004.17
module: "[[Module]]"
project: "[[1.PROJECTS/ENG-M1-P1.2-CONFIG Project-Configuration/Project]]"
mastery_state: not-started
mastery: 0
confidence: 0
next_review: null
created: 2026-09-26
updated: 2026-09-26
tags: [type/codelab]
lesson: "Updates"
mastery_state: not-started
mastery: 0
confidence: 0
last_attempted: ""
next_review: ""
---
# Updates

## Doctrine
Apply this DevCycle to its real Maximal Template surface. Record actual changed paths, checks, evidence, and remaining constraints.

## DevCycle source
[[3.RESOURCES/Digital Herencia/SOPs/Dev 2dba4e63bf23803aafc0c58095ec268f.md#Updates DevCycle Instructions]]

The **Updates** DevCycle governs post-launch maintenance, incremental improvements, small feature additions, and quality-of-life changes. This phase ensures that ongoing development remains structured, traceable, and aligned with the PRD + TechReq.

This DevCycle is universal and stack-agnostic.

## 1. Purpose

- Maintain and refine the product after deployment.
- Apply patches, bug fixes, enhancements, and small features.
- Keep documentation, tasks, and changelogs in sync with changes.

## 2. Responsibilities

### 2.1 Identify Post-Launch Needs

The agent MUST:
- Review bug reports
- Review user feedback (if provided)
- Review backlog items derived from earlier DevCycles
- Detect refactor opportunities

### 2.2 Apply Updates

Updates may include:
- Bug fixes
- Minor feature enhancements
- UI/UX improvements
- Documentation improvements
- Performance refinements
- Dependency updates

### 2.3 Maintain Specification Alignment

The agent MUST:
- Reconcile changes with PRD + TechReq
- Update specifications if scope changes
- Flag when major feature updates require new DevCycles

### 2.4 Regenerate Artifacts When Needed

If PRD or TechReq changes:
- Regenerate impacted issues
- Regenerate documentation
- Regenerate templates if necessary

### 2.5 Enforce Constraints

The agent MUST:
- Use only tools defined in the Updates toolset
- Follow global and DevCycle instructions
- Follow stack-specific agent rules

## 3. Inputs

- PRD
- TechReq
- Deployment notes
- Bug reports and feedback
- Toolset for Updates phase

## 4. Outputs

- Updated files
- Patch notes
- Updated PRD/TechReq (if scope changes)
- Updated documentation and templates
- Tasks marked as completed
- Changelog entries for each update

## 5. Success Criteria

Updates DevCycle is complete when:
- Identified work is implemented
- Documentation and specs are aligned
- All relevant tasks are updated
- Human approves the changes

## 6. Error Handling

The agent MUST:
- Halt if update conflicts with PRD/TechReq
- Detect regressions introduced by fixes
- Flag incompatible dependency updates
- Provide corrective steps

These instructions define the complete behavior of the Updates DevCycle.


## Applied drill
Link the TaskNotes task that implements this DevCycle.

## Human controls
Mastery: `INPUT[number:mastery]` · Confidence: `INPUT[number:confidence]` · State: `INPUT[select(option(not-started), option(in-progress), option(in-review), option(mastered)):mastery_state]` · Review: `INPUT[date:next_review]`




