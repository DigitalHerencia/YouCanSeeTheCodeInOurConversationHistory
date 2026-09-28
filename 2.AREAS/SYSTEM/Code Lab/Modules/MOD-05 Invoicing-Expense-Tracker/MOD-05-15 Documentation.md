---
type: lesson
id: LESS-005.15
module: "[[Module]]"
project: "[[1.PROJECTS/ENG-M1-P1.2-CONFIG Project-Configuration/Project]]"
mastery_state: not-started
mastery: 0
confidence: 0
next_review: null
created: 2026-09-26
updated: 2026-09-26
tags: [type/codelab]
lesson: "Documentation"
mastery_state: not-started
mastery: 0
confidence: 0
last_attempted: ""
next_review: ""
---
# Documentation

## Doctrine
Apply this DevCycle to its real Maximal Template surface. Record actual changed paths, checks, evidence, and remaining constraints.

## DevCycle source
[[3.RESOURCES/Digital Herencia/SOPs/Dev 2dba4e63bf23803aafc0c58095ec268f.md#Documentation DevCycle Instructions]]

The **Documentation** DevCycle formalizes how project information is externalized for human understanding. This includes automatically generating README files, contributor guides, templates, and project metadata based on validated PRD + TechReq.

This DevCycle is fully agnostic of programming language and technology stack.

## 1. Purpose

- Produce human-readable documentation that reflects the current state of the project.
- Generate standardized GitHub repository files.
- Ensure documentation aligns with PRD + TechReq and completed DevCycles.

## 2. Responsibilities

### 2.1 Generate Core Project Documentation

The agent MUST generate or update:
- `README.md`
- `CONTRIBUTING.md`
- `SECURITY.md`
- `SUPPORT.md`
- `CODEOWNERS`
- `CODE_OF_CONDUCT.md`

### 2.2 Generate GitHub Templates

The agent MUST generate:
- Issue templates
- Pull request templates
- PRD template
- TechReq template

Each template MUST:
- Follow consistent formatting
- Support the established workflow
- Reference DevCycles where appropriate

### 2.3 Ensure Documentation Accuracy

The agent MUST:
- Use verified PRD + TechReq as the main source of truth
- Incorporate decisions from DevCycle outputs
- Reflect any changes validated during Code Review

### 2.4 Maintain Documentation Structure

The agent MUST:
- Keep documentation modular and comprehensible
- Use consistent headings, formatting, and tone
- Reference other files using correct relative links

### 2.5 Provide AI-Assistance Visibility

Documentation SHOULD:
- Clearly state where automation assists development
- Include overview of DevCycle-based workflow
- Clarify the role of the agent and human-in-the-loop

## 3. Inputs

- PRD
- TechReq
- Outputs from all DevCycles
- Toolset for Documentation phase

## 4. Outputs

- Complete set of repo documentation files
- GitHub templates for issues and PRs
- Updated contributor materials
- Tasks added to `todo.md`
- Changelog entry summarizing documentation updates

## 5. Success Criteria

Documentation DevCycle is complete when:
- All required documentation files exist
- Files accurately reflect the project
- Templates support the workflow
- Human approves the generated documentation

## 6. Error Handling

The agent MUST:
- Halt if documentation conflicts with PRD + TechReq
- Flag unclear or incomplete sections
- Detect missing links or metadata
- Provide corrective actions

These instructions define the complete behavior of the Documentation DevCycle.


## Applied drill
Link the TaskNotes task that implements this DevCycle.

## Human controls
Mastery: `INPUT[number:mastery]` · Confidence: `INPUT[number:confidence]` · State: `INPUT[select(option(not-started), option(in-progress), option(in-review), option(mastered)):mastery_state]` · Review: `INPUT[date:next_review]`




