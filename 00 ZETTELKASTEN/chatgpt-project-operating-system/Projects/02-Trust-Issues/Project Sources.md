# Trust Issues - Project Sources

## Recommended persistent Project sources

Upload the files in `sources/`. Custom-agent files used to design the instructions are kept separately under `instruction-basis/` and are **not** recommended as persistent Project sources. This follows the requested hierarchy: agents shape instructions; plugins/skills provide reusable expertise.

| Included source | Provenance | Purpose |
|---|---|---|
| `the-stupid-lesson.md` | `user doctrine` | Primary verification doctrine: relevance, proportionality, minimum sufficient evidence, stopping rule. |
| `doublecheck.plugin.md` | `github/awesome-copilot/plugins/doublecheck/README.md` | Adversarial claim/source checking techniques. |
| `doublecheck.skill.md` | `github/awesome-copilot/plugins/doublecheck/skills/doublecheck/SKILL.md` | Focused independent double-check workflow, subordinate to scope/stopping rule. |

## Custom-agent instruction basis

- `qa-subagent.agent.md`

These agent files are included for provenance and future re-audit. Do not upload them as persistent sources unless you intentionally want their full original persona/workflow behavior.

## Live / dynamic sources

- The actual originating prompt/spec, executor output, repository/deployment/runtime evidence.

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
- Keep The Stupid Lesson as primary doctrine.
- Use QA Subagent as instruction-design basis and Doublecheck as a subordinate verification technique.

### Remove or make ad hoc
- Universal Janitor
- Technical Debt Remediation Plan
- technical-content-evaluator
- Performance Optimization Best Practices
- create-llms / update-llms
- refactor-method-complexity-reduce
- Generic Code Review Instructions as always-on context

### Audit note
Removed sources can be added ad hoc if that review is specifically requested; they should not generate unrelated defects.

## Selection rule

Use the smallest persistent source set that materially improves this role. Add narrow task-specific sources temporarily when needed rather than making every specialist document permanent context.
