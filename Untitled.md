Yep. **This is the direction I’d standardize around.** Planning only—no edits.

Your existing governance already gives us a strong canonical vocabulary: **PRD, Technical Requirement, Architecture Contract, Design Contract, Validation Contract, Specification, Decision/ADR, Issue, Acceptance Criterion, Progress Record, and Handoff Record.** So I would build the UX around those instead of inventing another document taxonomy.

# 1. Proposed project structure

```text
10 PROJECTS/
└── <PROJECT>/
    ├── <project>.home.md
    │
    ├── GOVERNANCE/
    │   ├── <project>.product.prd.md
    │   ├── <project>.technical.requirements.md
    │   ├── <project>.architecture.md
    │   ├── <project>.design.md
    │   ├── <project>.security.auth.md
    │   ├── <project>.knowledge-model.md
    │   └── <project>.validation.md
    │
    ├── SPECS/
    │   └── *.spec.md
    │
    ├── DECISIONS/
    │   └── *.adr.md
    │
    ├── EXECUTION/
    │   ├── Tasks/
    │   ├── Work Packages/
    │   ├── Handoffs/
    │   └── Progress/
    │
    ├── RESEARCH/
    │   └── *.research.md
    │
    ├── SOURCES/
    │   ├── References/
    │   └── Source Mirror/
    │
    ├── ASSETS/
    │   ├── Images/
    │   ├── Diagrams/
    │   └── PDFs/
    │
    └── ARCHIVE/
```

**Important:** I would _not_ create subfolders for every ontology concept or every kind of document. That creates navigation hell.

The project root becomes a **workspace**, not an encyclopedia.

---

# 2. Automatically created when you create a software project

Creating **New Software Project** should scaffold this entire canonical pack automatically:

|Template|Authority|Created automatically?|
|---|---|--:|
|Project Home|source-of-truth/navigation|Yes|
|PRD|source-of-truth|Yes|
|Technical Requirements|source-of-truth|Yes|
|Architecture|source-of-truth|Yes|
|Design|source-of-truth|Yes|
|Auth & Security|source-of-truth|Yes|
|Knowledge Model|source-of-truth|Yes|
|Validation & Conformance|source-of-truth|Yes|
|Specifications folder|operational|Yes|
|Decisions folder|operational → durable|Yes|
|Execution folders|operational|Yes|
|Research folder|supporting|Yes|
|Sources|reference|Yes|
|Assets|supporting|Yes|

So you don't sit there creating twelve goddamn files.

**One command: `New Software Project`.**

Project name → folder + governance + dashboard + properties + backlinks + Bases membership.

---

# 3. Project Home template

This is the **cockpit**, not documentation.

### Properties exposed through Meta Bind

```text
Status          [ Planning ▾ ]
Priority        [ High ▾ ]
Health          [ On Track ▾ ]
Phase           [ Architecture ▾ ]
Progress        [ ███████░░░ 70% ]
Target          [ 2026-09-01 ]
Repository      [ GitHub ↗ ]
```

### Sections

```text
# Project

> Project identity / one-sentence description

## Current State
## Next Action
## Current Milestone
## Blockers
## Decisions Needed

## Governance
- PRD
- Technical Requirements
- Architecture
- Design
- Auth & Security
- Knowledge Model
- Validation

## Active Specifications
![[project.specifications.base]]

## Work
![[project.tasks.base]]

## Recent Decisions
![[project.decisions.base]]

## Research
![[project.research.base]]

## Code / Repository
## Assets
## Recent Activity
```

No giant manually maintained index.

Most sections are **live Bases**.

---

# 4. PRD template

Your current Maximal Template PRD already establishes a strong pattern: definition, goal, positioning, capabilities, shared foundation, non-goals and success criteria.

### Standard sections

```text
# Product Requirements

## Product Definition
## Problem / Opportunity
## Product Goal
## Users / Actors
## User Needs
## Primary Use Cases
## Capabilities
## Scope
### In Scope
### Out of Scope

## Product Constraints
## Dependencies / Integrations
## User Experience Requirements
## Security / Privacy Requirements
## Non-Goals
## Success Criteria
## Acceptance Criteria
## Open Questions
## Related Decisions
```

### Meta Bind controls

```text
Status       [ Draft | Review | Active | Superseded ]
Authority    [ Working | Source of Truth ]
Product Type [ SaaS | Tool | Library | Website | … ]
```

---

# 5. Technical Requirements template

Your existing technical requirements document already covers baseline, runtime boundaries, persistence, validation, types, auth, providers, environment, validation and destructive operations.

### Standard sections

```text
# Technical Requirements

## Scope
## Technical Baseline
## Runtime / Platform
## Repository Structure
## Framework Requirements
## Data Requirements
## Persistence
## Runtime Validation
## Type Contracts
## Authentication
## Authorization
## Integrations / Providers
## API / HTTP Requirements
## Webhooks / Events
## Caching
## Environment / Configuration
## Observability
## Performance
## Accessibility
## Security
## Testing
## Validation Commands
## Deployment Requirements
## Destructive / Live Operation Rules
## Technical Non-Goals
```

---

# 6. Architecture template

Your current architecture source already contains most of the model we want: architectural identity, canonical vocabulary, ownership boundaries, layers, route grammar, classifiers, persistence, auth/authz, workflows, integrations, anti-patterns and reference implementation.

### Standard sections

```text
# Architecture

## Architectural Identity
## Governing Principles
## System Context
## Canonical Vocabulary

## System Boundaries
## Responsibility Ownership

## Layer Model
## Dependency Direction

## Application Structure
## Route / Interface Topology
## Presentation Architecture
## Domain / Feature Architecture

## Data Architecture
## Persistence Architecture

## Authentication Architecture
## Authorization Architecture

## Integration Architecture
## Event / Webhook Architecture

## Workflow Architecture
## Cache Architecture

## Runtime Flow
## Deployment Topology

## Architectural Invariants
## Explicit Anti-Patterns
## Reference / Golden Vertical Slice

## Architecture Diagram
## Related ADRs
```

---

# 7. Design template

Your current design contract already has a very clean foundation: objective, theme, visual language, tokens, primitives, blocks, layout, motion, accessibility, responsiveness and copy.

### Standard sections

```text
# Design

## Design Objective
## Product Character
## Visual Language
## Theme Policy

## Design Tokens
### Color
### Typography
### Spacing
### Radius
### Borders
### Shadows
### Motion

## Primitive System
## Component System
## Layout System
## Navigation
## Forms
## Tables / Dense Data
## Empty / Loading / Error States

## Responsive Behavior
## Accessibility
## Interaction Design
## Motion
## Content / Copy

## Visual References
## Screenshots
## Moodboard
## Design Decisions
```

This is one place where **images should be everywhere**.

---

# 8. Auth & Security template

Your existing auth governance cleanly separates identity, application identity, authentication, authorization, tenancy, RLS, protected reads/writes, failure semantics and secrets.

### Standard sections

```text
# Authentication & Security

## Purpose
## Trust Model

## Identity Provider
## Sign-In / Sign-Up
## Session Model
## Local Application Identity

## Authentication
## Authorization
### Roles
### Capabilities
### RBAC
### ABAC
### Resource Policies

## Tenant / Ownership Model
## Protected Read Path
## Protected Mutation Path

## Database Security
## Row-Level Security

## API Security
## Webhook Security
## Provider Security

## Secrets
## Environment Boundaries

## Failure Semantics
## Administrative Access

## Threats / Abuse Cases
## Security Invariants
## Security Validation
```

---

# 9. The Knowledge Model template

**This is where I'd put your computer-science ontology stack.**

Not sixteen separate documents by default.

One canonical **Project Knowledge Model** with standardized sections.

Your Codependent Coding knowledge model already explicitly defines this stack.

### Sections

```text
# Project Knowledge Model

## Epistemology
How do we know?

## Ontology
What exists?

## Terminology
What do we call it?

## Taxonomy
How is it classified?

## Typology
What recurring kinds exist?

## Mereology
What is part of what?

## Topology
How are things connected?

## Nomenclature
How are artifacts named?

## Semantics
What does structure mean?

## Schema
What shapes are valid?

## Metadata
How are instances described?

## Folksonomy
What informal labels may be used?

## Faceted Classification
Which independent classification axes exist?

## Information Architecture
How is information organized and retrieved?

## Domain Model
How is domain meaning represented?

## Knowledge Graph
How are concepts, evidence, decisions and artifacts connected?
```

And importantly:

**you don't fill this out from scratch manually.**

The project bootstrap produces the skeleton. ChatGPT/agents progressively maintain it as real knowledge becomes available.

---

# 10. Validation & Conformance template

Your canonical model already distinguishes tooling by what it _actually proves_ and separates fast, CI and release gates.

### Sections

```text
# Validation & Conformance

## Validation Philosophy
## Quality Gates

## Formatting
## Static Analysis
## Type Safety
## Runtime Validation

## Unit Testing
## Integration Testing
## Database Testing
## Security Testing
## E2E Testing
## Accessibility Testing

## Architecture Validation
## Contract Validation

## Build Validation
## Deployment Validation
## Smoke Testing

## Fast Gate
## CI Gate
## Release Gate

## Evidence Semantics
### Executed
### Failed
### Skipped
### Blocked
### Inferred

## High-Risk Validation
## Acceptance Criteria
## Definition of Done
```

---

# 11. Specification template

Specs are **bounded pieces of change**.

Your ontology already says a Specification refines one or more Technical Requirements.

Folder:

```text
<Project>/SPECS/
```

Every new note here automatically gets the Spec template.

### Sections

```text
# Specification

## Objective
## Context
## Problem
## Scope

## Requirements
## Functional Behavior
## Technical Behavior

## Files / Components Affected
## Interfaces / Contracts

## Data Changes
## Security Considerations
## UI / UX Requirements

## Edge Cases
## Failure Behavior

## Dependencies
## Non-Goals

## Acceptance Criteria
## Validation
## Definition of Done

## Related Requirements
## Related ADRs
```

---

# 12. ADR / Decision template

Folder:

```text
<Project>/DECISIONS/
```

Automatic template.

### Sections

```text
# Architecture Decision

## Decision
## Status

## Context
## Problem

## Options Considered

### Option A
### Option B
### Option C

## Selected Approach
## Rationale

## Consequences
### Positive
### Negative
### Risks

## Dependencies
## Supersedes
## Related Decisions
```

Meta Bind:

```text
Status
[ Proposed | Accepted | Rejected | Superseded ]

Impact
[ Low | Medium | High | Critical ]
```

---

# 13. Research template

Folder:

```text
<Project>/RESEARCH/
30 DEEP RESEARCH/
```

### Sections

```text
# Research

## Question
## Why It Matters
## Scope

## Sources
## Evidence

## Findings
## Contradictions
## Unknowns

## Analysis
## Implications

## Recommendations

## Related Projects
## Related Decisions
## Follow-Up
```

Controls:

```text
Status       [ Exploring | Synthesized | Complete ]
Confidence   [ Low | Medium | High ]
Disposition  [ Reference | Decision Input | Promote ]
```

---

# 14. Work Package template

Folder:

```text
<Project>/EXECUTION/Work Packages/
```

### Sections

```text
# Work Package

## Objective
## Context
## Scope

## Inputs
## Requirements
## Constraints

## Files / Systems Affected

## Tasks
## Acceptance Criteria
## Validation

## Completion Evidence
## Result
## Follow-Up
```

---

# 15. Handoff template

Folder:

```text
<Project>/EXECUTION/Handoffs/
```

### Sections

```text
# Handoff

## From
## To
## Objective

## Current State
## Completed
## In Progress
## Remaining

## Decisions
## Constraints
## Blockers

## Relevant Files
## Relevant Notes
## Relevant Code

## Exact Next Action
```

---

# 16. Progress template

Folder:

```text
<Project>/EXECUTION/Progress/
```

### Sections

```text
# Progress Update

## Current State
## Completed
## Changed
## Blocked
## Next
## Evidence
```

These should probably be short-lived operational notes rather than elaborate documentation.

---

# 17. Capture template

Folder:

```text
00 ZETTELKASTEN/
```

Creating a note there should immediately produce:

```text
# Capture

[ Keep ] [ Promote ] [ Attach to Project ] [ Archive ]

## Capture

## Context

## Related
```

That's it.

No sixteen-field interrogation.

---

# 18. Source / reference template

Folders:

```text
20 DOCUMENTATION/
<Project>/SOURCES/References/
```

### Sections

```text
# Reference

## Source
## What It Is
## Why It Matters

## Key Information
## Relevant Concepts

## Project Relevance
## Related Notes
```

---

# 19. Folder → automatic template mapping

This is the rule set I'd actually configure.

|Folder|Automatic template|
|---|---|
|`00 ZETTELKASTEN`|Capture|
|`SPECS`|Specification|
|`DECISIONS`|ADR|
|`EXECUTION/Tasks`|TaskNote|
|`EXECUTION/Work Packages`|Work Package|
|`EXECUTION/Handoffs`|Handoff|
|`EXECUTION/Progress`|Progress|
|`RESEARCH`|Research|
|`30 DEEP RESEARCH`|Deep Research|
|`SOURCES/References`|Reference|
|`20 DOCUMENTATION`|Reference|
|`50 … NEURAL NETS`|Writing|
|`ARCHIVE`|**nothing** — preserve existing note|
|`ASSETS`|none|

**Governance is different.**

You don't create random blank notes in `GOVERNANCE`.

The **New Project automation creates the canonical governance pack itself.**

---

# 20. Things you should never have to manually touch

This is the UX contract I would set for DevNotes 2.0:

- no manually typing `status`
    
- no manually changing `authority`
    
- no manually entering dates
    
- no manually constructing namespaces
    
- no manually remembering filenames
    
- no manually creating backlinks to the project
    
- no manually applying templates
    
- no manually creating the governance pack
    
- no manually updating dashboards
    
- no manually looking through folders to determine what needs attention
    
- no manually remembering which template to use
    
- no manually digging into Properties view for routine changes

**Meta Bind handles state.**

**Templater handles structure.**

**QuickAdd/Note Toolbar handles creation.**

**Bases handles collections.**

**Hearth handles navigation.**

---

# 21. Standard interactive properties

Rather than exposing your entire schema everywhere, the visible controls should depend on note type.

### Project

```text
Status
Priority
Health
Phase
Progress
Target
Next Action
```

### Governance

```text
Status
Authority
Review State
```

### Spec

```text
Status
Priority
Implementation State
Validation State
```

### Decision

```text
Status
Impact
Decision Date
```

### Research

```text
Status
Confidence
Disposition
```

### Task

```text
Status
Priority
Due
Scheduled
Project
Blocked By
```

### Writing

```text
Stage
Publish Status
```

Everything else can still exist underneath for agents and structured queries.

---

# 22. Standard status vocabulary

I would aggressively reduce the number of things you have to remember.

### Knowledge lifecycle

```text
Draft
Review
Active
Superseded
Archived
```

### Work lifecycle

```text
Backlog
Ready
In Progress
Blocked
Done
Cancelled
```

### Project health

```text
On Track
At Risk
Blocked
Paused
```

### Authority

```text
Source of Truth
Working
Reference
Derived
Historical
```

And Meta Bind renders these as dropdowns/buttons so **you don't need to remember the vocabulary anyway**.

---

# 23. Standard Callout Studio vocabulary

Small, meaningful set:

|Callout|Meaning|
|---|---|
|`truth`|canonical rule / source of truth|
|`decision`|consequential decision|
|`requirement`|requirement that must hold|
|`working`|unresolved / evolving material|
|`risk`|material risk|
|`blocked`|blocked execution|
|`evidence`|proof / validation|
|`handoff`|context transfer|
|`spark`|creative idea|
|`deprecated`|superseded/historical|

That becomes your visual grammar.

You see one and know what it means instantly.

---

# 24. Standard Note Toolbar

Every note gets:

```text
⌂ HOME   ← BACK   PROJECT   + CREATE   RELATED   MORE
```

Then contextual tools appear.

### Project

```text
OVERVIEW
WORK
SPECS
RESEARCH
DECISIONS
CODE
ASSETS
HANDOFF
```

### Governance

```text
PROJECT
RELATED CONTRACTS
DECISIONS
EDIT STATUS
VALIDATE
```

### Research

```text
PROJECT
SOURCES
RELATED
PROMOTE
DECISION
```

### Writing

```text
STUDIO
REFERENCES
ASSETS
FOCUS
PREVIEW
```

---

# 25. Hearth Home Screen

I'd make the default dashboard roughly:

```text
DEVNOTES
────────────────────────────────────────────────────

NOW
[ Next Action ] [ Blocked ] [ Due Soon ]

ACTIVE PROJECTS
[ Codependent Coding ] [ RateLtd ] [ … ]

RESUME
Recently edited / recently opened

WORK
My Tasks | Today | This Week

CAPTURE
+ Note
+ Research
+ Decision
+ Project
+ Spec

INBOX
Zettelkasten captures needing processing

STUDIO
Writing | Images | Canvas | Ideas

RESEARCH
Recent | Unresolved | Ready to Promote

VAULT HEALTH
Orphans | Stale Notes | Broken Links | Old Captures

ACTIVITY
Git | Recent Changes | Agent Activity
```

And I want **big visual project cards** with project covers/screenshots rather than twelve tiny lines of metadata.

---

# 26. The easiest possible workflow

### You have an idea

```text
Ctrl+something
→ Capture
→ type
→ done
```

### You start a project

```text
New Project
→ Name
→ Software / Research / Creative / Business
→ Done
```

Then automatically:

```text
Project folder
Governance pack
Home
Bases
Properties
Backlinks
Toolbar
Dashboard card
```

### You need a spec

```text
Project Toolbar
→ + Spec
→ title
→ done
```

### You make a decision

```text
→ + Decision
→ template appears
→ status = Proposed
→ fill it out
→ click Accept
```

### Change project status

Don't open YAML.

Click:

```text
Status: [ In Progress ▾ ]
```

### Can't remember where something is?

Don't remember.

Go Home.

Search.

Or open the Project cockpit.

---

## The important design principle

Your existing DevNotes contracts were built to make notes **correctly classifiable and machine-understandable**. The redesign should preserve that underneath. Your live repository explicitly still treats properties, authority, status, wikilinks, projects and durable identity as core infrastructure.

But **you should stop being the machine that operates the schema**.

The interface should operate it for you.

That is the version I would build.