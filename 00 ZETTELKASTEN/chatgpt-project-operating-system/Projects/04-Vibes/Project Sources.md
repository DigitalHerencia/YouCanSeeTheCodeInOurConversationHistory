# Vibes - Project Sources

## Recommended persistent Project sources

Upload the files in `sources/`. Custom-agent files used to design the instructions are kept separately under `instruction-basis/` and are **not** recommended as persistent Project sources. This follows the requested hierarchy: agents shape instructions; plugins/skills provide reusable expertise.

| Included source | Provenance | Purpose |
|---|---|---|
| `software-engineering-team.plugin.md` | `github/awesome-copilot/plugins/software-engineering-team/README.md` | Engineering specialist toolbox. |
| `context-engineering.plugin.md` | `github/awesome-copilot/plugins/context-engineering/README.md` | Repository/system context mapping. |
| `project-planning.plugin.md` | `github/awesome-copilot/plugins/project-planning/README.md` | Governance/project design techniques when Vibes is asked to design a repository operating model. |
| `github-issues.skill.md` | `github/awesome-copilot/skills/github-issues/SKILL.md` | GitHub work-management mechanics. |

## Custom-agent instruction basis

- `devops-expert.agent.md`
- `se-gitops-ci-specialist.agent.md`
- `github-actions-expert.agent.md`

These agent files are included for provenance and future re-audit. Do not upload them as persistent sources unless you intentionally want their full original persona/workflow behavior.

## Live / dynamic sources

- Target repository plus DigitalHerencia/CodependentCoding and DigitalHerencia/LoadedVibes.
- Vercel, Neon, Stripe, GitHub and framework primary sources/connectors when they are the system of record.
- DigitalHerencia/Vouch and DigitalHerencia/CtrlPlus as implementation references, not universal doctrine.

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
- Keep user-specific architecture/doctrine as higher authority than generic DevOps references.
- Keep focused GitHub/context/planning references.

### Remove or make ad hoc
- Generic security/performance/documentation instructions as always-on mandates; load them only for tasks that need them.

### Audit note
Vibes is the technical operating-system expert, not merely a GitHub project manager.

## Selection rule

Use the smallest persistent source set that materially improves this role. Add narrow task-specific sources temporarily when needed rather than making every specialist document permanent context.
