# MeatHarness ChatGPT Project Packet

Use these files to configure a ChatGPT Project for `DigitalHerencia/MeatHarness`.

## Files

1. `PROJECT_INSTRUCTIONS.md`
   - Paste this into the ChatGPT Project Instructions field.

2. `meatharness-ai-contract.yaml`
   - Upload as a Project Source.
   - This is the alignment contract for architecture, boundaries, and response behavior.

3. `execution-state.template.json`
   - Upload as a Project Source.
   - Treat this as the execution layer. During work turns, the assistant should provide a replacement JSON object reflecting current tasks, decisions, blockers, validation, and next actions.

4. `ink-tui-cheatsheet.md`
   - Upload as a Project Source.
   - Practical Ink/TUI architecture reference for implementation and review.

## Suggested first prompt inside the project

```txt
Read the Project Instructions and all Project Sources. Then inspect the connected GitHub repo `DigitalHerencia/MeatHarness`, starting with `package.json`, `src/cli.ts`, `src/app.tsx`, and `src/state/useMeatHarnessController.ts`. Summarize the current architecture, identify the primary control flow, and update the execution-state JSON.
```

## Usage rule

The sources are designed to force repo-aware work. The assistant should not claim knowledge of unread file contents. It should inspect files first, then produce implementation-ready work.
