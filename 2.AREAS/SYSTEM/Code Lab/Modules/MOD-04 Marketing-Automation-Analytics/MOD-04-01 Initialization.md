---
type: lesson
id: LESS-004.01
module: "[[Module]]"
project: "[[1.PROJECTS/ENG-M1-P1.2-CONFIG Project-Configuration/Project]]"
mastery_state: not-started
mastery: 0
confidence: 0
next_review: null
created: 2026-09-26
updated: 2026-09-26
tags: [type/codelab]
lesson: "Initialization"
mastery_state: not-started
mastery: 0
confidence: 0
last_attempted: ""
next_review: ""
---
# Initialization

## Doctrine
Apply this DevCycle to its real Maximal Template surface. Record actual changed paths, checks, evidence, and remaining constraints.

## DevCycle source
[[3.RESOURCES/Digital Herencia/SOPs/Dev 2dba4e63bf23803aafc0c58095ec268f.md#Initialization DevCycle Instructions]]

These instructions define the **Initialization** phase. This phase bootstraps the development environment, audits the workspace, and prepares the framework for predictable execution.

Initialization is language-agnostic and framework-agnostic. It does not generate code. It prepares the world model.

## 1. Purpose

- Establish the environment state.
- Validate the PRD + TechReq.
- Detect available tools, extensions, and MCP servers.
- Verify the workspace structure.
- Produce an “environment readiness” report.

## 2. Responsibilities

### 2.1 Audit VS Code Environment

Detect and document:
- Installed VS Code extensions
- User/workspace settings
- Configurations relevant to development workflow

### 2.2 Audit MCP Environment

Using #tool:mcp, detect and list all MCP servers:
- Filesystem
- Memory
- Sequential Thinking
- GitHub
- Prisma / database
- Clerk or auth tooling
- Any additional configured servers

### 2.3 Audit Workspace Structure

Check for the existence of:
- `global.instructions.md`
- `.github/copilot-instructions.md`
- `extensions.json`
- `mcp.json`
- `settings.json`
- `/prompts` directory
- `/instructions` directory
- `/toolsets` directory

### 2.4 Validate PRD + TechReq

- Ensure both are present.
- Ensure required sections exist:
    - Architecture
    - Data modeling
    - Services
    - Features
    - Branding
    - Roadmap
    - Security
    - Testing
    - Observability
    - Deployment
    - Updates
- Normalize formats if needed.

### 2.5 Detect Tool Availability

- Determine which tools the agent may use during subsequent cycles.
- Map them into a preliminary toolset definition.

## 3. Inputs

- PRD
- TechReq
- Workspace state
- Extensions
- MCP config
- Global instructions

## 4. Outputs

- Environment readiness summary
- Normalized PRD + TechReq
- Initial toolset inventory
- List of missing or invalid configuration

## 5. Success Criteria

The Initialization phase is complete when:
- All audits have been performed
- Required artifacts are present
- PRD + TechReq are validated
- Toolset availability is detected
- Human approves the environment readiness report

## 6. Error Handling

Initialization MUST:
- Stop on missing or malformed PRD/TechReq
- Report missing instructions files
- Report missing MCP servers
- Report extension mismatches
- Provide steps to correct missing infrastructure

These instructions define the complete behavior of the Initialization DevCycle.


## Applied drill
Link the TaskNotes task that implements this DevCycle.

## Human controls
Mastery: `INPUT[number:mastery]` · Confidence: `INPUT[number:confidence]` · State: `INPUT[select(option(not-started), option(in-progress), option(in-review), option(mastered)):mastery_state]` · Review: `INPUT[date:next_review]`




