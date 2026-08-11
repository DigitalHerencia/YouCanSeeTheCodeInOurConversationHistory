# Execution - Project Sources

## Recommended persistent Project sources

Upload the files in `sources/`. Custom-agent files used to design the instructions are kept separately under `instruction-basis/` and are **not** recommended as persistent Project sources. This follows the requested hierarchy: agents shape instructions; plugins/skills provide reusable expertise.

| Included source | Provenance | Purpose |
|---|---|---|
| `codex-delivery-instructions.md` | `user-supplied AGENTS(3).md` | Canonical Issue/branch/PR/check/merge/read-back delivery workflow. |
| `software-engineering-team.plugin.md` | `github/awesome-copilot/plugins/software-engineering-team/README.md` | Broad engineering specialist toolbox. |
| `context-engineering.plugin.md` | `github/awesome-copilot/plugins/context-engineering/README.md` | Repository context discovery and dependency understanding. |
| `project-planning.plugin.md` | `github/awesome-copilot/plugins/project-planning/README.md` | Implementation decomposition/GitHub planning when required. |
| `github-issues.skill.md` | `github/awesome-copilot/skills/github-issues/SKILL.md` | GitHub Issue mechanics and issue-based workflow guidance. |

## Custom-agent instruction basis

- `expert-nextjs-developer.agent.md`
- `principal-software-engineer.agent.md`

These agent files are included for provenance and future re-audit. Do not upload them as persistent sources unless you intentionally want their full original persona/workflow behavior.

## Live / dynamic sources

- Target repository via GitHub: AGENTS/instructions/specs/Issues/PRs/Actions.
- DigitalHerencia/CodependentCoding and DigitalHerencia/LoadedVibes when the target repo adopts that doctrine.
- Current primary docs for version-sensitive framework/provider behavior.

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
- Use the user Codex Delivery Instructions as canonical workflow.
- Replace the broad overlapping specialist-agent pile with the focused source set here.

### Remove or make ad hoc
- Specialist agents imposing mandatory review/planning ceremonies unrelated to the active Issue.
- Sources that assume tools unavailable in the current conversation.

### Audit note
Repository-local AGENTS and the actual Issue/spec outrank generic engineering sources.

## Selection rule

Use the smallest persistent source set that materially improves this role. Add narrow task-specific sources temporarily when needed rather than making every specialist document permanent context.
