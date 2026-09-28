# Hearth Codex Execution Policy

This repository is the target vault for the Hearth implementation.

## Authority

1. Owner-provided Hearth specification and explicit system decisions.
2. `CODEX-GOAL.md`.
3. The Hearth handoff package and contracts.
4. Source assets under `3.RESOURCES/Digital Herencia/`, `3.RESOURCES/template/`, and the TypeScripture books.
5. Existing installed-plugin configuration and current vault implementation.

## Execution mode

Execute the specified implementation. Do not redesign the system.

Do not ask the owner to choose among alternatives already defined by the handoff.

Do not invent plugin capabilities.

Do not create generic fallback templates.

Do not create duplicate task stores or parallel ontologies.

Do not require manual maintenance of machine-derived state.

Use bounded source inspection against the paths in the source manifest. Then implement, validate, repair failures, and record evidence.

## Quality bar

Templates are operational documents with starter prose, contextual generation, provenance, acceptance criteria, and human sections—not empty headings.

All human-controlled state must be exposed through Meta Bind.

Derived state must be automated.

Daily refresh must preserve human-authored content.

Workflows must be idempotent.

TaskNotes remains execution truth.

Generated links must resolve.

Stop only for a genuine source contradiction or an actual runtime capability limitation that prevents faithful implementation. Record the exact blocker and do not silently substitute a different design.
