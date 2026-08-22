---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\copilot-thought-logging.instructions.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\copilot-thought-logging.instructions.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.instructions.copilot-thought-logging.instructions.md'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-loaded-vibes-codex-plugin
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\copilot-thought-logging.instructions.md'
source_file: 'copilot-thought-logging.instructions.md'
source_sha256: '148c0c2bb4a72c9b2e477949342087ba784dd03d74698cb0f66b9d5b86a62e5e'
generated: true
---

# `copilot-thought-logging.instructions.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\instructions\copilot-thought-logging.instructions.md`
> SHA-256: `148c0c2bb4a72c9b2e477949342087ba784dd03d74698cb0f66b9d5b86a62e5e`

```markdown
---
applyTo: '**'
description: 'See process Copilot is following where you can edit this to reshape the interaction or save when follow up may be needed'
---

# Copilot Process tracking Instructions

**ABSOLUTE MANDATORY RULES:**
- You must review these instructions in full before executing any steps to understand the full instructions guidelines.
- You must follow these instructions exactly as specified without deviation.
- Do not keep repeating status updates while processing or explanations unless explicitly required. This is bad and will flood Copilot session context.
- NO phase announcements (no "# Phase X" headers in output)
- Phases must be executed one at a time and in the exact order specified.
- NO combining of phases in one response
- NO skipping of phases
- NO verbose explanations or commentary
- Only output the exact text specified in phase instructions

# Phase 1: Initialization

- Create file `./Copilot-Processing.md` in workspace root
- Populate `./Copilot-Processing.md` with user request details
- Work silently without announcements until complete.
- When this phase is complete keep mental note of this that <Phase 1> is done and does not need to be repeated.

# Phase 2: Planning

- Generate an action plan into the `./Copilot-Processing.md` file.
- Generate detailed and granular task specific action items to be used for tracking each action plan item with todo/complete status in the file `./Copilot-Processing.md`.
- This should include:
  - Specific tasks for each action item in the action plan as a phase.
  - Clear descriptions of what needs to be done
  - Any dependencies or prerequisites for each task
  - Ensure tasks are granular enough to be executed one at a time
- Work silently without announcements until complete.
- When this phase is complete keep mental note of this that <Phase 2> is done and does not need to be repeated.

# Phase 3: Execution

- Execute action items from the action plan in logical groupings/phases
- Work silently without announcements until complete.
- Update file `./Copilot-Processing.md` and mark the action item(s) as complete in the tracking.
- When a phase is complete keep mental note of this that the specific phase from `./Copilot-Processing.md` is done and does not need to be repeated.
- Repeat this pattern until all action items are complete

# Phase 4: Summary

- Add summary to `./Copilot-Processing.md`
- Work silently without announcements until complete.
- Execute only when ALL actions complete
- Inform user: "Added final summary to `./Copilot-Processing.md`."
- Remind user to review the summary and confirm completion of the process then to remove the file when done so it is not added to the repository.

**ENFORCEMENT RULES:**
- NEVER write "# Phase X" headers in responses
- NEVER repeat the word "Phase" in output unless explicitly required
- NEVER provide explanations beyond the exact text specified
- NEVER combine multiple phases in one response
- NEVER continue past current phase without user input
- If you catch yourself being verbose, STOP and provide only required output
- If you catch yourself about to skip a phase, STOP and go back to the correct phase
- If you catch yourself combining phases, STOP and perform only the current phase

```