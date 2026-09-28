---
type: lesson
id: LESS-009.11
module: "[[Module]]"
project: "[[1.PROJECTS/ENG-M1-P1.2-CONFIG Project-Configuration/Project]]"
mastery_state: not-started
mastery: 0
confidence: 0
next_review: null
created: 2026-09-26
updated: 2026-09-26
tags: [type/codelab]
lesson: "Performance"
mastery_state: not-started
mastery: 0
confidence: 0
last_attempted: ""
next_review: ""
---
# Performance

## Doctrine
Apply this DevCycle to its real Maximal Template surface. Record actual changed paths, checks, evidence, and remaining constraints.

## DevCycle source
[[3.RESOURCES/Digital Herencia/SOPs/Dev 2dba4e63bf23803aafc0c58095ec268f.md#Performance DevCycle Instructions]]

The **Performance** DevCycle ensures that the system operates efficiently, meets performance expectations, and avoids technical degradation. This phase is stack-agnostic at the instruction level.

## 1. Purpose

- Optimize system performance across all layers.
- Identify and remediate bottlenecks.
- Ensure the system meets performance expectations from the PRD + TechReq.
- Audit dependencies and eliminate inefficiencies.

## 2. Responsibilities

### 2.1 Analyze Application Performance

The agent MUST:
- Review performance-related requirements from PRD + TechReq.
- Identify modules or workflows that may degrade system performance.
- Detect inefficient logic or patterns.

### 2.2 Optimize Code Paths

- Improve algorithmic efficiency where applicable.
- Refactor inefficient logic.
- Surface opportunities for caching or memoization.
- Reduce unnecessary operations.

### 2.3 Audit Dependencies

The agent MUST:
- Identify outdated or vulnerable packages.
- Identify unused dependencies.
- Surface heavy or unnecessary libraries.
- Recommend replacements or removal.

### 2.4 Memory & Resource Optimization

- Detect leaks or unnecessary allocations.
- Identify redundant computations.
- Recommend resource-efficient alternatives.

### 2.5 Enforce Constraints

The agent MUST:
- Use only tools defined in the Performance toolset.
- Follow global instructions.
- Follow stack-specific agent rules.
- Document all improvements.

## 3. Inputs

- Feature implementation
- Testing DevCycle outputs
- Debug DevCycle outputs
- Toolset for Performance phase
- PRD + TechReq performance requirements

## 4. Outputs

- Performance optimization report
- Dependency audit summary
- Refactored logic or recommendations
- Tasks added to `todo.md`
- Changelog entry summarizing performance changes

## 5. Success Criteria

Performance DevCycle is complete when:
- Known bottlenecks are resolved
- Dependency list is clean and up-to-date
- Performance meets PRD/TechReq requirements
- Human approves optimization report

## 6. Error Handling

The agent MUST:
- Halt if performance degradation is detected during optimization
- Detect contradictory requirements
- Flag dependency conflicts
- Surface detailed fixes

These instructions define the complete behavior of the Performance DevCycle.


## Applied drill
Link the TaskNotes task that implements this DevCycle.

## Human controls
Mastery: `INPUT[number:mastery]` · Confidence: `INPUT[number:confidence]` · State: `INPUT[select(option(not-started), option(in-progress), option(in-review), option(mastered)):mastery_state]` · Review: `INPUT[date:next_review]`




