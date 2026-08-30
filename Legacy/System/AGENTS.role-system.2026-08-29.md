# DevNotes Agent Instructions

## Purpose

DevNotes is a private, source-controlled Obsidian knowledge and project-management system. Treat it as an institutional-memory and execution interface, not as a generic software repository or a filing exercise.

The governing UX principle is:

> **You should only have to mean something once.**

Before asking the user to reconstruct context, inspect the live repository, available Project context, durable handoffs, files, and connected evidence.

## Controlling authority

The controlling human specification is:

`DevNotes/Canon/Unified System/Role Manifest Specification.md`

Machine registries under `system/` are projections of that human contract. Obsidian dashboards and ChatGPT Project launchers are rendered projections of the same role manifest.

Derivation is one-way:

**Role Manifest Specification → machine role registry → Hearth dashboard + ChatGPT Project launcher**

Do not independently redefine role semantics in a machine registry, dashboard, Project instruction file, or template.

## Responsibility model

```text
Chief of Staff   Organization & Lifecycle
Trust Issues     Epistemology & Evidence
Execution        Function & Implementation
Vibes            Architecture & Topology
DevNotes         Knowledge & Classification
Schemes          Ontology & Modeling
Prömpter         Language & Semantics
Fuck You Pay Me  Domain & External Reality
```

Canonical ownership does not imply exclusive use. One role owns universal meaning; other roles consume it.

Role determines primary ownership. Project/workspace and reusable system/doctrine are facets.

## Operating loop

**Human intent → structured knowledge → specification → orchestration → implementation → verification → durable context**

Use the interaction mode implied by the request:

- **Conversation** → low cognitive load.
- **Research** → retrieve, source, distinguish evidence from inference.
- **Execution** → act, validate, and report evidence.
- **Artifact** → create the reusable deliverable.

Do not replace requested execution with advice or another approval loop when intent is already explicit.

## Naming

Use normal human-readable filenames.

Do **not** generate semantic dot-notation filenames. Do not encode role, project, domain, taxonomy, type, authority, lifecycle, or other classification into a dotted filename.

Classification belongs in folders, Properties, tags, wikilinks, typed relationships, Bases, and other retrieval surfaces.

Use established artifact names such as `PRD.md`, `Architecture.md`, `Specification.md`, `Product.yaml`, `Decision.json`, and `Handoff.json` where applicable.

## Metadata

Properties exist primarily for useful mutable state. Tags classify. Callouts communicate semantics. Links preserve durable relationships.

### Authority

Use only:

- `Source of Truth`
- `Working`
- `Reference`
- `Derived`
- `Historical`

Do not generate the discarded values `canonical`, `supporting`, `implementation-evidence`, `project-specific`, or `operational`. They are not aliases of the active authority vocabulary.

### Knowledge lifecycle

`Draft → Review → Active → Superseded → Archived`

### Work lifecycle

`Backlog → Ready → In Progress → Blocked → Done / Cancelled`

### Project health

`On Track / At Risk / Blocked / Paused`

### Typed relationships

Use only when edge semantics matter:

`part_of`, `depends_on`, `implements`, `refines`, `validates`, `evidence_for`, `derived_from`, `supersedes`, `governed_by`, `connects_to`

Canonical traceability is:

**source → claim → decision → specification → artifact → validation → evidence**

## Artifact format roles

- **Markdown** explains and supports human governance/working artifacts.
- **YAML** constrains machine-readable contracts.
- **JSON** records execution state, decisions, handoffs, and progress.

Templates instantiate shared doctrine for a concrete project. Do not copy universal doctrine into every project document.

## Obsidian interaction layer

- Hearth composes the operating shell and dashboards.
- Bases retrieves and projects.
- Meta Bind changes mutable state.
- Note Toolbar performs context-sensitive actions.
- Callout Studio supplies semantic visual language.
- Templater creates deterministic artifact shapes.
- QuickAdd exposes convenient creation flows.
- TaskNotes owns task lifecycle, Kanban, calendar, and agenda views.
- Code Space is the live implementation/repository surface.
- Canvas supports spatial ontology/topology/model reasoning.
- Iconic supplies semantic wayfinding.
- Git supplies provenance/version history.
- Web Clipper handles external capture/reference intake.
- Linter performs safe structural cleanup only.
- Obsidian CLI supports environment automation.

Routine workflow must not require manually editing YAML.

## Live authority

Use the strongest current authority for volatile facts:

- live repository source for actual implementation behavior;
- GitHub Projects v2 / GitHub for repository delivery state;
- deployment platform for deployment state;
- financial provider for financial state;
- mail/calendar provider for those systems;
- executed evidence for validation results;
- DevNotes for durable institutional memory.

Do not copy volatile live state into durable notes when a live link or evidence reference is sufficient.

## Repository operations

Inspect current state before editing. Make the smallest useful change consistent with the user’s request. Preserve unrelated work. Do not create branches, PRs, Issues, migrations, dashboards, taxonomies, or plugin changes unless requested or genuinely required.

When the user asks for analysis only, do not modify the repository. When the user asks for changes, execute them rather than substituting recommendations.

Report exactly what changed and what was actually verified.

## Protected content boundary

Do not rename, reorganize, rewrite, migrate, clean, normalize, or delete material under:

- `ZETTLECASTEN/`
- `CIGARETTES, REGRETS, & NEURAL NETS/`

This prohibition applies to governance refactors and cleanup passes. Work inside those areas requires a separate explicit user request.

Historical conventions found there are non-authoritative for new governance.

## Final rule

DevNotes succeeds when important context is durable, correctly owned, recoverable, connected to evidence, and cheap for humans or agents to reuse. The system is an execution interface, not a filing cabinet.
