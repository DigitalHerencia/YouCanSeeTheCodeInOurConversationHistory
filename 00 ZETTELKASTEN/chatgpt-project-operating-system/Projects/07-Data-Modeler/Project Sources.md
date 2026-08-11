# Data Modeler - Project Sources

## Recommended persistent Project sources

Upload the files in `sources/`. Custom-agent files used to design the instructions are kept separately under `instruction-basis/` and are **not** recommended as persistent Project sources. This follows the requested hierarchy: agents shape instructions; plugins/skills provide reusable expertise.

| Included source | Provenance | Purpose |
|---|---|---|
| `database-data-management.plugin.md` | `github/awesome-copilot/plugins/database-data-management/README.md` | Database specialist plugin overview. |
| `postgresql-code-review.skill.md` | `github/awesome-copilot/plugins/database-data-management/skills/postgresql-code-review/SKILL.md` | PostgreSQL correctness/review guidance. |
| `postgresql-optimization.skill.md` | `github/awesome-copilot/plugins/database-data-management/skills/postgresql-optimization/SKILL.md` | Performance/index guidance only when relevant. |
| `codependentcoding-data-contract-patterns.md` | `DigitalHerencia/CodependentCoding live-source synthesis` | User-specific Select/DTO/Schema/Type boundary patterns. |
| `codependentcoding-transaction-helper.md` | `DigitalHerencia/CodependentCoding live-source synthesis` | User-specific transaction-helper contract. |

## Custom-agent instruction basis

- `neon-migration-specialist.agent.md`

These agent files are included for provenance and future re-audit. Do not upload them as persistent sources unless you intentionally want their full original persona/workflow behavior.

## Live / dynamic sources

- Target repository schema/migrations/data layer; DigitalHerencia/CodependentCoding; Neon/Postgres/Prisma primary docs or connected tools.

## Source authority and de-confliction

1. Current user instruction and explicit decisions.
2. These Project instructions.
3. For repository work, target-repository live AGENTS/instructions/specifications and actual state.
4. User-specific canonical doctrine (Codependent Coding / Loaded Vibes / DevNotes) when applicable.
5. Persistent Project source files.
6. Generic Awesome Copilot techniques.
7. General model knowledge.

A source does not import its original tool list, persona, mandatory ceremony, or conflicting `always`/`never` rules into this Project. Tool declarations in upstream agents describe their original environment, not guaranteed ChatGPT capabilities.

## Existing-source disposition

### Keep / replace with
- New Project: use Codependent Coding data patterns plus focused PostgreSQL techniques.

### Remove or make ad hoc
- Generic DBA agent that insists on inspecting live databases for every conceptual modeling discussion.
- Performance optimization unless the actual model/query workload makes it relevant.

### Audit note
Conceptual/logical model comes before Prisma syntax; Neon migration agent was used to shape safe migration boundaries, not installed as persistent authority.

## Selection rule

Use the smallest persistent source set that materially improves this role. Add narrow task-specific sources temporarily when needed rather than making every specialist document permanent context.
