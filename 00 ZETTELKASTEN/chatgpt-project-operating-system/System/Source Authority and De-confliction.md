# Source Authority and De-confliction

## Global authority order

1. Current explicit user instruction.
2. Project-specific instructions.
3. For repository work, target repository AGENTS/instructions/specs/contracts and actual live state.
4. User-owned canonical doctrine for the domain (Codependent Coding, Loaded Vibes, DevNotes contracts) when applicable.
5. Persistent Project sources.
6. Awesome Copilot agents/plugins/skills as techniques.
7. General model knowledge.

## Upstream-agent rule

A custom agent file is not recursively installed by uploading it as a source. Its persona, original tool declarations, and mandatory workflow language do not override the Project's own instructions. This package deliberately extracts useful expertise while de-conflicting incompatible behaviors.

Examples of rules intentionally not imported:
- Prompt Engineer's request for visible `<reasoning>` / chain-of-thought.
- Prompt Builder's mandatory research and Prompt Tester cycles.
- Broad DevOps agents' "automate/measure/document everything" tendencies.
- Generic security/performance/code-review instructions that create work unrelated to the request.
- Database agents that insist on live-database inspection for conceptual design.

## Current-state rule

Static reference files do not prove current product state. Use current official documentation or the connected system itself for version-sensitive behavior.

## Stopping rule

If a source suggests additional work, ask what concrete failure or requirement it addresses. If it adds no decision-relevant information, do not add the work.
