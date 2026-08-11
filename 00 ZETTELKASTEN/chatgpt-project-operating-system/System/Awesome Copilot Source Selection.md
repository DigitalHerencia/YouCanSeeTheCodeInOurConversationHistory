# Awesome Copilot Source Selection

Upstream: `github/awesome-copilot`
Uploaded snapshot: `awesome-copilot-main.zip`
Upstream HEAD verified during this review: `35b7b9b0ece5ef92fd0f4c91944f56be9ab8b675`
Verified date: 2026-08-11

## Selection policy

The user's preferred order was applied:
1. custom agents for instruction design
2. plugins for persistent sources
3. skills for persistent sources
4. standalone instructions only where no stronger artifact exists

This is a preference, not a quota. Custom-agent files that materially informed an instruction set are stored under each Project's `instruction-basis/` directory for provenance, not uploaded as persistent Project sources by default. Persistent `sources/` prefer plugins, then skills. No weak or irrelevant source was added merely to satisfy the hierarchy.

## Important exclusions

- `agents/prompt-builder.agent.md`: strong content, but mandatory research + Prompt Tester cycles conflict with Prömpter's lean operating model.
- `agents/software-engineer-agent-v1.agent.md`: too ceremonial/autonomous for Execution's proportional Issue-to-PR workflow.
- generic Janitor / technical-debt / performance / llms sources from Trust Issues: they encourage unrelated defect hunting.
- generic DBA agent as Data Modeler's controlling source: it overemphasizes live DB inspection instead of conceptual/domain modeling.
- Salesforce/task-planner artifacts for Fuck You Pay Me or Chief of Staff: no clean role fit; live ChatGPT business/personal connectors are more relevant.
- agent-governance as an always-on source: useful as a review lens, but persistent inclusion would recreate the governance expansion the system is explicitly trying to avoid.

## Governance review result

The provided governance material was used as a meta-check: review existing controls first, use the minimum necessary controls, and avoid over-engineering. It was not installed into every Project.
