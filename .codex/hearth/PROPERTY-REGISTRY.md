# Hearth Property Registry

Meta Bind is the user-facing control surface.

Human-controlled Project state:
status, priority, target_start, target_end, current_focus, blocker, codelab_enabled.

Human-controlled Milestone state:
status, objective, start, end, risk.

Human-controlled Phase state:
status, sprint, risk.

Human-controlled Task state:
status, priority, due, scheduled, estimate, blocker, mastery, confidence.

Human-controlled Resource state:
resource_state, authority, resource_role, review_due, superseded_by.

Human-controlled Code Lab state:
mastery_state, mastery, confidence, last_attempted, next_review.

Machine-managed state:
id, type, project_code, task_code, project, milestone, phase, cycle, sprint, created, updated, completed_at, progress, health, next_action, counts, provenance, source, linked_outputs, linked_evidence, archive metadata, derived review state.

Rules:
- Machine-managed state is never a routine manual bookkeeping task.
- Progress is derived.
- Health is derived.
- Next action is a derived pointer, not a task.
- Relations and IDs are generated/reconciled.
- Tags remain semantic discovery facets.
