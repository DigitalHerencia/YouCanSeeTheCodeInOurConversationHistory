# Template Quality Contract

Every canonical template must be a useful document on first creation.

Required qualities:

- Valid frontmatter.
- Stable ID generation where the entity has an ID.
- Context inheritance when created from a project/phase/task/resource.
- Concrete starter prose.
- Useful tables and prompts.
- Explicit acceptance criteria.
- Provenance fields/links.
- Generated sections for source-derived state.
- Dedicated human-authored sections.
- Meta Bind controls only for human-controlled properties.
- No repeated copies of authoritative task/project data.
- No empty “fill this in” scaffolding where the system can derive the content.

## Required template families

### Execution
Project, Milestone, Phase, Board, Task bridge, Daily, Weekly Review, Cycle, Sprint.

### Meetings
Daily Standup, Engineering, Design, Operations, Weekly Sync, Sprint Planning, Post-mortem.

### Engineering documents
PRD, Technical Requirements, Architecture Spec, ADR, Implementation Plan, Test Plan, Security Review, Validation Report, Verification Report, Runbook, SOP, Post-mortem.

### Knowledge/resource
Zettelkasten Workbench, Fleeting, Literature, Web Clipping, AI Thread, Resource, Evergreen, Pattern.

### Code Lab
Module, Lesson, Applied Drill, Drill Evidence, Lesson Test, Module Assessment, Learning Journal.


## Materialization requirement

The implementation MUST materialize every required family named in this contract. If a human-facing template and a generated context bridge serve different responsibilities, both must exist. No family may be silently omitted because a plugin creates a related note automatically.
