# DevNotes

DevNotes is a private, Git-backed Obsidian knowledge and project-management system. It is the durable operating environment for knowledge, specifications, project state, research, evidence, coordination, creative work, and live implementation access.

The governing UX principle is:

> **You should only have to mean something once.**

## Unified system

DevNotes operates with three other mutually constituting surfaces:

- **TypeScripture™** — canonical doctrine and engineering knowledge.
- **Codependent Coding™** — the engineering system that realizes that doctrine.
- **Obsidian / DevNotes** — durable human-and-machine operating environment.
- **ChatGPT Projects + Codex** — specialized active agent team.

The common loop is:

**Human intent → structured knowledge → specification → orchestration → implementation → verification → durable context**

The controlling role and interaction specification is:

`DevNotes/Canon/Unified System/Role Manifest Specification.md`

## Responsibility roots

```text
Chief of Staff/   Organization & Lifecycle
Trust Issues/     Epistemology & Evidence
Execution/        Function & Implementation
Vibes/            Architecture & Topology
DevNotes/         Knowledge & Classification
Schemes/          Ontology & Modeling
Prömpter/         Language & Semantics
Fuck You Pay Me/  Domain & External Reality
```

Role determines primary ownership. A workspace/project is a facet of the work, not a competing filing root.

## Support surfaces

The live repository uses:

```text
system/       machine-readable contracts, schemas, registries, authority, provenance, and state
obsidian/     Bases, templates, controls, canvases, reference material, and interface assets
ops/          focused maintenance and verification material
mounts/       live/local implementation surfaces where configured
assets/       shared media and support assets
```

Do not recreate obsolete dotted support paths such as `.system/` merely because older material references them.

## Naming

Use normal human-readable filenames.

Do **not** generate semantic dot-notation filenames or encode role, project, taxonomy, type, authority, or lifecycle into filenames. Classification belongs in folders, Properties, tags, links, and retrieval surfaces.

Canonical artifact names include familiar forms such as `PRD.md`, `Architecture.md`, `Specification.md`, `Product.yaml`, `Decision.json`, and `Handoff.json`.

## Metadata

### Properties represent useful mutable state

Routine state changes should occur through Meta Bind or another appropriate interface rather than manual YAML editing.

Authority values are:

- `Source of Truth`
- `Working`
- `Reference`
- `Derived`
- `Historical`

Knowledge lifecycle:

`Draft → Review → Active → Superseded → Archived`

Work lifecycle:

`Backlog → Ready → In Progress → Blocked → Done / Cancelled`

Project health:

`On Track / At Risk / Blocked / Paused`

### Tags classify

Tags describe kind, subject, semantic facet, and relevant concepts. Tags do not determine canonical ownership.

### Links preserve relationships

Use wikilinks and backlinks for durable internal relationships. Use typed relationships only when the edge itself carries useful semantics:

`part_of`, `depends_on`, `implements`, `refines`, `validates`, `evidence_for`, `derived_from`, `supersedes`, `governed_by`, `connects_to`

The canonical traceability path is:

**source → claim → decision → specification → artifact → validation → evidence**

## Obsidian interaction model

```text
Hearth         operating shell and dashboards
Bases          retrieval, facets, projections, lists, tables, cards, health views
Meta Bind      mutable state controls
Note Toolbar   context-sensitive actions
Callout Studio semantic visual language
Templater      deterministic artifact creation
QuickAdd       friendly creation commands and macros
TaskNotes      task lifecycle, Kanban, calendar, agenda
Code Space     live implementation/repository surface
Canvas         spatial ontology/topology/model reasoning
Iconic         semantic wayfinding
Git            provenance and durable version history
Web Clipper    external capture/reference intake
Linter         safe structural cleanup only
Obsidian CLI   environment automation
```

**Note Toolbar performs actions. Meta Bind changes state. Templater creates deterministic artifact shapes. QuickAdd exposes those creation flows. Bases retrieves. Hearth composes the interface.**

## Authority of live systems

- User intent and genuine decisions → user
- Doctrine → accepted TypeScripture / Codependent Coding canon
- Durable institutional memory → DevNotes
- Actual implementation behavior → live repository source
- Repository issue/PR execution state → GitHub Projects v2 / GitHub
- Deployment state → deployment platform
- Financial state → financial provider
- Mail/calendar state → corresponding live system
- Validation result → executed evidence

## Protected content

Governance work does **not** rename, reorganize, rewrite, or clean:

- `ZETTLECASTEN/`
- `CIGARETTES, REGRETS, & NEURAL NETS/`

Those areas remain untouched unless the user explicitly requests work inside them.

## Synchronization

`DigitalHerencia/DevNotes` is the remote source of truth for the vault. Git synchronization keeps the local Obsidian vault aligned with `origin/master`.
