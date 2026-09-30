# CodeSpace — Technical Implementation Specification

## 1. Purpose

CodeSpace is the code-editing layer of the Obsidian development environment.

It provides an in-vault editing surface for source code stored in mounted repositories, allowing implementation work to happen without opening a separate IDE.

CodeSpace operates on actual source files. It does not define the project hierarchy, manage tasks, classify reusable programming knowledge, manage Git history, or provide the project dashboard.

The implementation boundary is:

**Code Lab defines how code is understood.  
Project Management defines why the code is being built.  
CodeSpace edits the code.  
Git records changes to the codebase.**

---

## 2. Architectural Position

```text
Project
│
├── Milestone
│   └── Phase
│       └── Task
│           └── Code Artifact
│
├── Project Documentation
│
└── Codebase Reference
        │
        ▼
2.AREAS/SYSTEM/_mounts/
        │
        ▼
Mounted Repository
        │
        ▼
CodeSpace
        │
        ▼
Source Files
        │
        ▼
Git
```

Code Lab provides the reusable implementation knowledge surrounding the code:

```text
Domain
  ↓
Dev Cycle
  ↓
Standard
  ↓
Pattern
  ↓
Code Artifact
```

The actual implementation occurs in the mounted repository through CodeSpace.

---

## 3. Storage Contract

CodeSpace operates against repositories mounted beneath:

```text
2.AREAS/SYSTEM/_mounts/
```

The `_mounts` directory is the integration boundary between the Obsidian vault and external code repositories.

The mounted repository remains the actual codebase. The vault does not become a second copy of the repository.

Example:

```text
2.AREAS/SYSTEM/_mounts/
└── ProjectRepository/
    ├── src/
    ├── tests/
    ├── package.json
    ├── README.md
    └── ...
```

Code Lab knowledge remains separate:

```text
2.AREAS/CODE/
├── Domains/
├── Cycles/
├── Standards/
└── Patterns/
```

Project documentation remains inside the project:

```text
1.PROJECTS/
└── Project Name/
    ├── Project.md
    ├── Board.md
    ├── ...
    └── Codebase.md
```

The separation is intentional:

|Layer|Responsibility|
|---|---|
|Project folder|Project-specific planning and documentation|
|`_mounts`|Mounted source repositories|
|CodeSpace|Editing source files|
|Code Lab|Reusable implementation knowledge|
|TaskNotes|Executable project tasks|
|Git|Version history and repository state|
|Hearth|Navigation and presentation|

---

## 4. Core Object Model

CodeSpace works with four primary objects.

### Project

The project requesting or containing the implementation work.

```text
Project → Project ID
```

### Codebase

The repository associated with the project.

```text
Project → Codebase → Mounted Repository
```

### Code Artifact

An actual source file or implementation unit in the repository.

```text
Codebase → Code Artifact
```

### Code Lab Pattern

The reusable implementation pattern informing the artifact.

```text
Domain → Dev Cycle → Standard → Pattern → Code Artifact
```

These objects must remain distinct.

A Code Lab Pattern is not a source file.

A source file is not a task.

A mounted repository is not a project note.

CodeSpace is the editing surface connecting the documentation model to the actual code.

---

# 5. Workflow Contracts

## 5.1 Mount Repository Workflow

### Purpose

Make an external repository available inside the vault for CodeSpace editing.

### Trigger

A repository needs to be edited through the vault.

### Context

The repository must have a defined relationship to a project or development activity.

### Inputs

- Repository
    
- Mount location
    
- Associated project
    
- Repository identity

### Target

```text
2.AREAS/SYSTEM/_mounts/<repository>
```

### Mutation

The repository becomes available through the vault's `_mounts` integration boundary.

### Side Effects

The vault gains access to the repository's working files.

### Consumers

- CodeSpace
    
- Project documentation
    
- Code Lab workflows
    
- Git

### Failure Behavior

If the repository cannot be mounted or accessed, implementation does not proceed through CodeSpace.

The system must not silently substitute another repository or create a duplicate source tree.

---

## 5.2 Select Project and Codebase Workflow

### Purpose

Establish which project and repository the implementation work belongs to.

### Trigger

Beginning implementation work.

### Inputs

- Project
    
- Project ID
    
- Codebase
    
- Mounted repository

### Target

Project documentation and the corresponding mounted repository.

### Mutation

No source-code mutation occurs.

The workflow establishes working context.

### Side Effects

Subsequent implementation work can be associated with the correct project and codebase.

### Consumers

- CodeSpace
    
- TaskNotes
    
- Code Lab
    
- Hearth

### Failure Behavior

If project-to-codebase association is ambiguous, implementation must stop until the association is resolved.

---

## 5.3 Open Code Artifact Workflow

### Purpose

Open an actual source file for implementation.

### Trigger

A task, code review, debugging activity, or direct implementation request identifies a file that requires editing.

### Inputs

- Mounted repository
    
- File path
    
- Optional task context
    
- Optional Code Lab pattern

### Target

An actual file inside the mounted repository.

### Mutation

None on open.

### Side Effects

The selected source artifact becomes the active implementation target.

### Consumers

- CodeSpace
    
- Developer
    
- TaskNotes context

### Failure Behavior

If the file does not exist, the workflow must not silently create a replacement unless creation is explicitly requested.

---

## 5.4 Edit Code Workflow

### Purpose

Modify source code within the mounted repository.

### Trigger

An implementation task requires source changes.

### Inputs

- Source file
    
- Implementation requirements
    
- Relevant Code Lab pattern
    
- Existing repository context

### Target

Actual source code in the mounted repository.

### Mutation

CodeSpace modifies the selected source file.

### Side Effects

The repository working tree changes.

Git can subsequently detect the modification.

### Consumers

- Git
    
- Tests
    
- Validation workflows
    
- Project documentation

### Failure Behavior

Changes must not be represented as complete until the file has been successfully saved.

---

## 5.5 Save and Persist Workflow

### Purpose

Persist source-code changes to the mounted repository.

### Trigger

An implementation edit is complete or reaches a meaningful checkpoint.

### Inputs

- Modified source file
    
- Mounted repository

### Target

The corresponding source file on disk.

### Mutation

The current editor contents are persisted to the repository.

### Side Effects

The working tree may become modified according to Git.

### Consumers

- Git
    
- Test/validation workflows
    
- Future implementation work

### Failure Behavior

A failed save must not be treated as a completed implementation step.

---

## 5.6 Code Lab Pattern Implementation Workflow

### Purpose

Use the Code Lab knowledge system to guide implementation of an actual code artifact.

### Trigger

A code artifact is being implemented according to an established pattern.

### Context

```text
Domain
  ↓
Dev Cycle
  ↓
Standard
  ↓
Pattern
  ↓
Code Artifact
```

### Inputs

- Domain
    
- Dev Cycle
    
- Standard
    
- Pattern
    
- Project
    
- Task
    
- Code artifact

### Target

The source artifact in the mounted repository.

### Mutation

CodeSpace edits the actual implementation.

The Code Lab note itself is not automatically rewritten merely because the pattern was used.

### Side Effects

The implementation establishes a concrete application of reusable knowledge.

### Consumers

- Project
    
- Task
    
- Code review
    
- Future Code Lab refinement

### Failure Behavior

If the implementation materially contradicts the selected pattern, the discrepancy must be reviewed rather than silently changing the pattern classification.

---

## 5.7 Task-to-Code Workflow

### Purpose

Connect an executable project task to the source code it requires.

### Trigger

A TaskNotes task requires implementation work.

### Inputs

- `task_id`
    
- `project_id`
    
- Project
    
- Task deliverable
    
- Code artifact
    
- Mounted repository

### Target

The source artifact associated with the task.

### Relationship

```text
Task
  ↓
Deliverable
  ↓
Code Artifact
  ↓
Mounted Repository
```

### Mutation

The source code changes through CodeSpace.

The task record is not duplicated inside the source file.

### Side Effects

The task may move through its normal TaskNotes lifecycle as implementation progresses.

### Consumers

- TaskNotes
    
- Project Command Center
    
- CodeSpace
    
- Git

### Failure Behavior

A source-code change must not automatically mark the task complete.

Task completion remains an explicit project-management action.

---

## 5.8 Review and Validation Workflow

### Purpose

Verify that an implementation satisfies its intended requirements.

### Trigger

A code change reaches a review or validation checkpoint.

### Inputs

- Changed source files
    
- Task requirements
    
- Project requirements
    
- Relevant Code Lab pattern
    
- Repository validation mechanisms

### Target

The modified implementation.

### Process

```text
Edit
  ↓
Save
  ↓
Review
  ↓
Validate
  ↓
Resolve Issues
  ↓
Complete Task / Continue Work
```

### Mutation

Source code may be modified again when validation identifies defects.

### Side Effects

Task status or project documentation may be updated separately.

### Boundary

CodeSpace is the editing surface.

It should not be assumed to own test execution, build execution, deployment, or CI/CD unless a specific configured capability provides that behavior.

### Failure Behavior

Failed validation leaves the implementation in an incomplete state.

---

## 5.9 Git Workflow Boundary

### Purpose

Define the relationship between CodeSpace and version control.

### Trigger

Source files are changed.

### Inputs

- Mounted repository
    
- Modified files

### Target

Git working tree.

### Contract

```text
CodeSpace
    ↓
Edit / Save
    ↓
Working Tree
    ↓
Git
    ↓
Commit / Branch / Push
```

CodeSpace edits files.

Git tracks repository state.

The two responsibilities must not be conflated.

### Boundary

CodeSpace must not be treated as the Git history model.

Unless explicitly configured and documented, CodeSpace does not own:

- Branch strategy
    
- Commit policy
    
- Commit messages
    
- Pull requests
    
- Remote synchronization
    
- Release management

Those remain Git/repository workflows.

---

## 5.10 Project Command Center Integration Workflow

### Purpose

Expose relevant implementation context without turning the dashboard into a second code editor.

### Trigger

A project is selected in the Project Command Center.

### Inputs

- Project
    
- Codebase
    
- Active tasks
    
- Code artifacts
    
- Repository reference

### Target

Project Command Center.

### Display

The Command Center may provide:

- Project codebase reference
    
- Mounted repository reference
    
- Active implementation tasks
    
- Relevant code artifacts
    
- Links to Code Lab documentation
    
- Links into the mounted repository

### Boundary

Hearth presents the implementation context.

CodeSpace performs the editing.

The Command Center must not duplicate the repository's source-code contents as a separate project database.

---

## 5.11 Unmount / Repository Lifecycle Workflow

### Purpose

Remove a repository from active vault editing without destroying its project history.

### Trigger

A repository is no longer part of active implementation work.

### Inputs

- Repository
    
- Associated project
    
- Mount reference

### Target

Mounted repository integration.

### Mutation

The repository is removed from active mounted access according to the configured mount mechanism.

### Side Effects

CodeSpace can no longer edit the repository through the vault.

### Boundary

Unmounting a repository must not automatically archive the project.

Project lifecycle and repository lifecycle are separate concerns.

---

# 6. CodeSpace and Code Lab Boundary

Code Lab answers:

> How should this kind of code be understood and implemented?

CodeSpace answers:

> Where do I edit the actual implementation?

Example:

```text
CRM / Pipeline Tracker
        ↓
Features Cycle
        ↓
Implementation Standard
        ↓
Feature Pattern
        ↓
Customer Pipeline Feature
        ↓
src/features/pipeline/
        ↓
CodeSpace
```

The Code Lab classification provides implementation context.

CodeSpace provides the editing environment.

The actual source remains in the mounted repository.

---

# 7. CodeSpace and Project Management Boundary

The project hierarchy remains:

```text
Project
  ↓
Milestone
  ↓
Phase
  ↓
Task
  ↓
Code Artifact
```

CodeSpace does not replace this hierarchy.

A coding session does not constitute a project task by itself.

A source file does not become a task merely because it is edited.

A completed code edit does not automatically constitute a completed project deliverable.

The project system records the work.

CodeSpace performs the source-code editing.

---

# 8. CodeSpace and TaskNotes Boundary

TaskNotes manages:

- Task identity
    
- Project association
    
- Task status
    
- Dependencies
    
- Deliverables

CodeSpace manages:

- Opening source files
    
- Editing source files
    
- Saving source files

Relationship:

```text
TaskNotes Task
      │
      ├── task_id
      ├── project_id
      └── deliverable
              │
              ▼
        Code Artifact
              │
              ▼
          CodeSpace
```

CodeSpace must not create a parallel task-management system inside the repository or editor.

---

# 9. CodeSpace and Git Boundary

The working repository is the shared boundary.

```text
                 ┌──────────────┐
                 │   CodeSpace  │
                 │ edit / save  │
                 └──────┬───────┘
                        │
                        ▼
                 ┌──────────────┐
                 │ Working Tree │
                 └──────┬───────┘
                        │
                        ▼
                 ┌──────────────┐
                 │     Git      │
                 └──────────────┘
```

Git remains responsible for repository history.

CodeSpace remains responsible for editing.

Neither system should silently assume the other's responsibilities.

---

# 10. File and Security Contract

Mounted repositories may contain files that should not be casually modified or exposed.

Implementation workflows must distinguish between:

- Source code
    
- Configuration
    
- Documentation
    
- Tests
    
- Generated files
    
- Build artifacts
    
- Dependency directories
    
- Environment/secrets files

Sensitive configuration must not be copied into vault documentation merely because it is visible through a mounted repository.

The vault should reference configuration requirements rather than duplicating credentials or secrets.

Files such as environment configuration should be treated according to the repository's existing security conventions.

---

# 11. Automation Contract

CodeSpace automation should remain conservative.

Automation may:

- Open a known repository
    
- Navigate to a known file
    
- Provide implementation context
    
- Link a project task to a code artifact
    
- Open the relevant Code Lab documentation
    
- Return the user to the project context

Automation should not silently:

- Rewrite arbitrary source files
    
- Mark tasks complete
    
- Change project hierarchy
    
- Modify Code Lab patterns
    
- Commit code
    
- Push code
    
- Deploy code
    
- Archive projects
    
- Replace repository contents

Any such workflow requires an explicit implementation contract.

---

# 12. Failure Conditions

The following conditions require explicit handling:

### Repository unavailable

The implementation cannot proceed against an unavailable mount.

### File missing

The system must distinguish between a missing expected file and a request to create a new file.

### Save failure

The implementation must not be considered persisted.

### Wrong repository

Work must stop rather than being written to a similarly named repository.

### Wrong project

The code artifact must not silently inherit unrelated project context.

### Pattern mismatch

A discrepancy between the implementation and its Code Lab classification requires review.

### Validation failure

The task remains incomplete until the relevant issue is resolved or explicitly accepted.

### Git conflict

Repository state must be resolved through the normal Git workflow rather than hidden by the editing layer.

---

# 13. Automation Readiness Criteria

CodeSpace workflows are ready for automation only when:

1. The mounted repository location is stable.
    
2. Project-to-repository relationships are defined.
    
3. Code artifact references have a consistent format.
    
4. Task-to-code relationships are defined.
    
5. Code Lab classification is stable.
    
6. File creation versus file editing behavior is explicit.
    
7. Git responsibilities remain separate from editing responsibilities.
    
8. Sensitive files are excluded from inappropriate documentation workflows.
    
9. Failure behavior is defined.
    
10. No workflow silently mutates project state beyond its documented responsibility.

---

# 14. Canonical Workflow

The complete implementation path is:

```text
Select Project
    ↓
Identify Task
    ↓
Identify Codebase
    ↓
Locate Mounted Repository
    ↓
Identify Code Artifact
    ↓
Identify Domain
    ↓
Identify Dev Cycle
    ↓
Identify Standard
    ↓
Identify Pattern
    ↓
Open Artifact in CodeSpace
    ↓
Implement
    ↓
Save
    ↓
Review
    ↓
Validate
    ↓
Update Task
    ↓
Git Workflow
    ↓
Update Project / Code Lab knowledge when required
```

The important separation is:

```text
Project system
    = work definition

Code Lab
    = implementation knowledge

CodeSpace
    = implementation environment

Git
    = version control

Hearth
    = navigation and presentation
```

This separation prevents CodeSpace from becoming an accidental replacement for the project system, Code Lab, Git, or Hearth.