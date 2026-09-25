# Hearth Codex Canonical Template Pack

These definitions are the source templates Codex must materialize under 2.AREAS/SYSTEM/Templates. They are operational templates, not headings-only scaffolds.

## Daily.template.md

Frontmatter:
- type: daily
- id: DLY-YYYY-MM-DD
- tags: type/daily
- created: current date

Body:
# YYYY-MM-DD

Generated regions:
1. Yesterday — completed TaskNotes tasks from prior day, project/phase context, completion timestamp, explicit output/evidence links.
2. Today — active project/milestone/phase, bounded focus projection of up to 3 tasks, due work, next executable action, link to full queue.
3. Blockers — explicit project/task blockers.
4. Deadlines & Reviews — overdue, due soon, phase/milestone reviews and gates.
5. Cadence — meetings actually scheduled for this day.
6. Current Work — focus, project health, progress, recent project/document/evidence activity.
7. Code Lab — current module, lesson, next applied drill, mastery/review state.

Human regions:
- Notes
- Decisions
- Reflection
- Shutdown

Refresh markers must isolate generated sections from human sections.

## Project.template.md

Frontmatter:
- type: project
- id
- title
- project_type
- starter_ontology
- project_code
- status
- priority
- target_start
- target_end
- current_focus
- blocker
- codelab_enabled
- created
- updated
- tags: type/project

Body:
# Project title

Purpose
Success Criteria

Charter:
- Context
- Why Now
- Constraints
- Decisions
- Inputs
- Outputs
- Downstream Consumers

Generated Current State:
- milestone
- phase
- progress
- health
- next action

Generated Milestones

Execution: Active Project Tasks Base
Documents: Active Project Documents Base
Evidence: Active Project Evidence Base
Resources: Active Project Resources Base
Code Lab: generated current module/lesson/evidence state

Meta Bind controls only the human-controlled Project properties.

## Milestone.template.md

Frontmatter:
- type: milestone
- id
- project
- number
- title
- status
- objective
- start
- end
- risk

Body:
# Milestone title

Objective
Entry Criteria
Exit Criteria
Generated Phases
Review

A milestone is a card on Board.md.

## Phase.template.md

Frontmatter:
- type: phase
- id
- project
- milestone
- number
- title
- status
- sprint
- risk
- start
- end

Body:
# Phase title

Goal
Entry Criteria
Exit Criteria

Execution: Active Project Tasks Base

Review:
- What changed?
- What was validated?
- What remains?
- What advances next?

## Board.template.md

Frontmatter:
- type: kanban
- project
- created
- updated
- tags: type/kanban

Board semantics:
Backlog → Ready → In Progress → Blocked → Review → Done

Each Kanban card represents a milestone. The card exposes/links its phases. TaskNotes remains execution truth.

## PRD.template.md

Sections:
1. Problem
2. Users and Actors
3. Outcome
4. Scope
5. User Journeys
6. Functional Requirements
7. Non-Functional Requirements
8. Risks and Assumptions
9. Acceptance Criteria
10. Traceability

Functional requirement rows use PRD-NNN.FR-NNN.
Non-functional rows use PRD-NNN.NFR-NNN.

## Technical Requirements.template.md

Sections:
- Technical Outcome
- Architecture Constraints
- Runtime and Platform
- Data Model
- Security
- Performance
- Observability
- Test Requirements
- Acceptance Gates

## Architecture Specification.template.md

Sections:
- Responsibility Boundary
- System Topology
- Route → Feature → Workflow Flow
- Data Flow
- Authorization Boundary
- Tenant/RLS Boundary
- Integration Boundary
- Failure and Recovery
- Performance Boundaries
- Observability
- Alternatives Considered
- Validation Gates

## ADR.template.md

Sections:
- Context
- Decision
- Alternatives table
- Consequences
- Invariants
- Evidence
- Status

## Implementation Plan.template.md

Sections:
- Objective
- Requirement → implementation unit → validation traceability table
- Work Packages
- Dependencies
- Sequence
- Risk Controls
- Evidence Plan
- Exit Criteria

## Test Plan.template.md

Sections:
- Scope
- Unit Tests
- Integration Tests
- E2E Tests
- Architecture Checks
- Security Checks
- Failure Cases
- Evidence capture table with command, revision, environment, result, limits

## Security Review.template.md

Sections:
- Threat Surface
- Authentication
- Authorization
- Tenant Isolation
- Validation
- Secrets
- Webhooks
- Logging and PII
- Findings table
- Exit Criteria

## Validation Report.template.md

Sections:
- Scope
- Commands Executed table
- Findings
- Acceptance Mapping
- Result

## Resource.template.md

Frontmatter includes:
- type: resource
- id
- resource_type
- resource_state
- source_kind
- authority
- resource_role
- source_url
- creator
- published
- accessed
- version
- license
- project_links
- knowledge_links
- codelab_links
- related_patterns
- last_verified
- review_due
- superseded_by
- capture_source

Body:
Source
Why Retained
Key Claims
Useful Notes
Linked Knowledge
Applied To
Verification

## Zettel Workbench.template.md

Frontmatter:
- type: zettel-workbench
- state: inbox|fleeting|literature|web-clipping|ai-thread
- capture_source

Body:
Capture
Smallest Useful Claim
Why It Matters
Candidate Links
Processing decision

Processed durable material is moved/created under 3.RESOURCES.

## AI Thread.template.md

Sections:
- Question
- Conversation Material
- Claims Worth Keeping
- Decisions
- Evidence Needed
- Processing Destination

## Web Clipping.template.md

Sections:
- Source URL/Author/Published
- Capture
- Claims
- Notes
- Processing Destination

## Fleeting Note.template.md

Sections:
- Thought
- Context
- Next Handling

## Code Lab Module.template.md

Frontmatter:
- type: codelab
- codelab_kind: module
- id
- ontology
- project
- status
- mastery
- confidence

Body:
Ontology
Primary Surfaces
Shared Foundation
Generated Lessons
Assessment
Evidence

## Code Lab Lesson.template.md

Frontmatter:
- type: codelab
- codelab_kind: lesson
- id
- module
- devcycle
- project
- status
- mastery_state
- mastery
- confidence

Body:
DevCycle
Objective
Applied Context
Patterns
Acceptance Criteria
Applied Drill
Evidence
Reflection
Mastery

## Drill Evidence.template.md

Frontmatter:
- type: evidence
- evidence_kind: codelab
- id
- task
- lesson
- project
- result

Body:
What Was Executed?
Command / Action
Result
Artifact
Interpretation
Limits

## Pattern.template.md

Sections:
- Problem
- Pattern
- Why
- Example
- Anti-pattern
- Evidence
- Applied In
- Learned From

## Meeting templates

Daily Standup:
- Yesterday
- Today
- Blockers
- Action Items

Engineering Meeting:
- Stretch
- Tasks table: owner, task, why, testing plan, success criteria
- Questions
- Notes

Design Meeting:
- Goals / Agenda
- Discussion Notes
- Action Items

Operations Meeting:
- Progress Updates
- Metrics Dashboard Review: KPIs, Financials
- Topics to Discuss: problem/options/decision
- Other Actions
- Notes
- Follow-up Actions

Weekly Sync:
- What Happened Last Week?
- What Are We Doing This Week?
- Potential Blockers
- Action Items

Sprint Planning:
- Sprint Goal
- Sprint Backlog
- Team & Roles
- Notes

Post-mortem:
- User Facing Impact
- Timeline
- Relevant Metrics
- Cause Analysis
- Resolution
- Future Work
- Action Items

## Template rules

Every template must:
- create valid frontmatter
- inherit current context when launched from a project/phase/task/resource
- generate stable IDs where required
- expose only human-controlled properties through Meta Bind
- separate generated regions from human regions
- include starter prose and useful prompts
- include acceptance criteria or review criteria where applicable
- preserve provenance
- be idempotent when refreshed
- never duplicate authoritative TaskNotes/project data
