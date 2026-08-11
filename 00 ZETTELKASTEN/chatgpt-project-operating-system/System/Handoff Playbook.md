# Handoff Playbook

## Minimum handoff package

A cross-Project handoff should contain only what the receiving role needs:

- objective / originating prompt or spec
- current artifact or repository reference
- relevant constraints and invariants
- current state / what has already happened
- unresolved question or next action
- evidence that materially affects the next decision

## Common handoffs

### Prömpter -> Execution
Reusable implementation prompt/spec with objective acceptance criteria and explicit scope.

### Prömpter -> Data Modeler
Domain/modeling question with product semantics and constraints, before implementation syntax.

### Data Modeler -> Execution
Approved entities/relations/states/invariants, schema/migration plan, query/DTO/transaction contracts, and focused acceptance criteria.

### Vibes -> Execution
Architecture/governance or root-cause decision plus the bounded implementation change required.

### Execution -> Trust Issues
Originating requirements, merged/produced artifact, exact completion claims, checks actually run, and known limitations.

### Trust Issues -> Execution
Only confirmed defect(s), supporting evidence and required correction. Do not invent a new backlog.

### Any Project -> DevNotes
Only durable decisions, specifications, reference knowledge or handoffs whose future recovery value justifies persistence.

### Any Project -> Chief of Staff
A future commitment with a concrete trigger/time/cadence and useful next action.

### Fuck You Pay Me -> Chief of Staff
Follow-up dates, payment deadlines, outreach reminders or external waiting conditions.
