# Prömpter - Project Sources

## Recommended persistent Project sources

Upload the files in `sources/`. Custom-agent files used to design the instructions are kept separately under `instruction-basis/` and are **not** recommended as persistent Project sources. This follows the requested hierarchy: agents shape instructions; plugins/skills provide reusable expertise.

| Included source | Provenance | Purpose |
|---|---|---|
| `prompt-builder.skill.md` | `github/awesome-copilot/skills/prompt-builder/SKILL.md` | Prompt construction techniques without importing mandatory Prompt Tester cycles. |
| `prompt.instructions.md` | `github/awesome-copilot/instructions/prompt.instructions.md` | Portable prompt structure/clarity guidance; used because no clean prompt plugin exists. |
| `openai-projects-current-reference.md` | `generated current OpenAI reference` | Current Projects/custom-instructions facts and live-authority rule. |

## Custom-agent instruction basis

- `prompt-engineer.agent.md`

These agent files are included for provenance and future re-audit. Do not upload them as persistent sources unless you intentionally want their full original persona/workflow behavior.

## Live / dynamic sources

- Current official OpenAI documentation when prompt behavior depends on ChatGPT/Work/Codex/Tasks/Projects/agents.

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
- Keep useful prompt-specific OpenAI references only when they materially help.
- Replace legacy `prompt-builder.agent.md` as a controlling source with this leaner set.

### Remove or make ad hoc
- `prompt-builder.agent.md` as persistent authority: mandatory research + Prompt Tester cycles conflict with the desired workflow.
- `ai-prompt-engineering-safety-best-practices.instructions.md` unless a specific prompt-security task needs it.

### Audit note
Static product docs age; verify official OpenAI docs whenever live behavior matters.

## Selection rule

Use the smallest persistent source set that materially improves this role. Add narrow task-specific sources temporarily when needed rather than making every specialist document permanent context.
