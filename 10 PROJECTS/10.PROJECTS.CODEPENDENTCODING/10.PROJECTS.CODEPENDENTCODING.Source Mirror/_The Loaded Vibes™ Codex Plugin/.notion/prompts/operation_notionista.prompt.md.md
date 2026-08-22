---
title: 'The Loaded Vibes™ Codex Plugin\.notion\prompts\operation_notionista.prompt.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\prompts\operation_notionista.prompt.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.prompts.operation-notionista.prompt.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\prompts\operation_notionista.prompt.md'
source_file: 'operation_notionista.prompt.md'
source_sha256: '264f7468050e03e2c59b3056f1ea3a34da4c352ba5487fd537118b7b215cb87d'
generated: true
---

# `operation_notionista.prompt.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\prompts\operation_notionista.prompt.md`
> SHA-256: `264f7468050e03e2c59b3056f1ea3a34da4c352ba5487fd537118b7b215cb87d`

```markdown
Plan of Action — Notionista extension plumbing fixes

Summary

This document captures the verified diagnosis and an actionable implementation plan to fix the VS Code extension lifecycle, chat registration, webview mounting, and error handling issues discovered during inspection.

Findings (verified)

1. activationEvents too narrow
   - Evidence: `package.json` currently activates only on `onCommand:notionista.startChat`.
   - Impact: invoking other contributed commands won't reliably activate the extension.

2. Missing chat participant registration
   - Evidence: `src/extension.ts` creates a ChatParticipant instance but never registers it with the VS Code chat API/host.
   - Impact: `@notionista` and host chat integrations won't work.

3. Webview HTML created but not guarded/mounted robustly
   - Evidence: startChat creates webview but some flows call executeCommand programmatically; errors are swallowed.
   - Impact: panel may not appear or messages may be lost.

4. Errors are swallowed in many places
   - Evidence: `catch { /* ignore */ }` patterns in `src/notion/manager.ts`, `src/extension.ts`, and discovery code.
   - Impact: failures are silent and hard to debug.

5. Engine pin is risky
   - Evidence: `package.json` sets `"engines.vscode": "1.108.0"`.
   - Impact: may exclude compatible hosts; prefer relaxed bound + runtime guards.

Proposed Code/Config Changes (minimal)

A. package.json

- Add activation events for all contributed commands and `onStartupFinished`.
  - Add: `onCommand:notionista.validateNotion`, `onCommand:notionista.bootstrapNotion`, `onCommand:notionista.init`, `onCommand:notionista.checkMcp`, `onCommand:notionista.checkNotion`, `onCommand:notionista.atCommand`, `onCommand:notionista.slashCommand`, `onStartupFinished`.
- Relax engines.vscode to a compatible minimum (e.g. `">=1.70.0"`) and document feature requirements in README.

B. src/extension.ts

- Add `safeRun` helper that wraps async calls, logs to an OutputChannel, shows an error toast in dev, and re-throws or returns undefined for non-fatal flows.
- Register chat participant defensively if a host API is available. Push disposable to `context.subscriptions`.
- Ensure `startChat` command always creates/mounts the webview inside a try/catch and pushes panel disposable.
- Replace empty catches around critical flows (capabilityReport, validateRegistry, discovery) to log via `OutputChannel`.
- Keep `autoOpenOnActivation` behavior, but call via `safeRun` and retry once on failure.

C. src/notion/manager.ts

- Replace empty catches in discovery/fetch paths with logging; for fatal createDataSource fallback, throw an error (so user sees it) or return explicit failure with logs.

D. src/chatController.ts

- Verify `attachPanel` flushes `lastStatus` and `lastReview`; add small message queue and flush logic if missing.

Implementation Plan (ordered)

1. Edit `package.json` activationEvents (fast)
   - Files: `package.json`
   - Commands: `pnpm run check:ts`
   - Validate: invoking `notionista.validateNotion` activates extension in dev host.

2. Add `safeRun` and OutputChannel (low risk)
   - Files: `src/extension.ts` (+ small exports if needed)
   - Commands: `pnpm run check:ts && pnpm run lint`
   - Verify: logs appear in Notionista Output channel on errors; unit tests unchanged.

3. Register chat participant defensively (medium risk)
   - Files: `src/extension.ts`
   - Commands: `pnpm run check:ts && pnpm run lint`
   - Verify: logs show registration attempt; when host supports chat registration, `@notionista` participant becomes available.

4. Harden webview creation and lifecycle (medium risk)
   - Files: `src/extension.ts`, `src/chatController.ts`
   - Commands: `pnpm run check:ts && pnpm run lint && pnpm run test`
   - Verify: panel opens when autoOpenOnActivation=true; panel disposables pushed; postStatus/postReview replay works.

5. Improve logging in `src/notion/manager.ts` (low risk)
   - Files: `src/notion/manager.ts`
   - Commands: `pnpm run check:ts && pnpm run lint && pnpm run test`
   - Verify: discovery errors are logged to Notionista output instead of silently ignored.

6. Relax engines and update README (low risk)
   - Files: `package.json`, `README.md`
   - Commands: `pnpm run check:ts`

7. Run tests & smoke (all checks)
   - Commands:
     - `pnpm run check:ts`
     - `pnpm run lint`
     - `pnpm run test`
     - `pnpm run test:e2e`
     - Manual: Open workspace in VS Code and F5. Use Command Palette to invoke commands and observe Output channel and Developer Tools console.

Verification checklist

- TypeScript compile succeeds
- Lint passes (no new errors)
- Unit tests pass
- E2E tests pass (where applicable)
- Running the Extension Host (F5):
  - Panel auto-opens (if configured)
  - Command `notionista.validateNotion` activates extension if invoked
  - `@notionista` participant is available when host supports chat participants
  - Discovery publish (manifest or discovered payload) appears in panel
  - Apply helper runs and writes audit log entry

Rollback / Risk notes

- All changes are reversible by restoring original file(s) from git. Keep each change in a single commit and run tests after commit; revert commit to rollback.
- Logging changes are low risk but may add noise; if too verbose revert to fewer log lines.
- Chat participant registration is environment-sensitive; guard with capability checks and fall back gracefully.

Estimates

- Edit package.json and run checks: 10 minutes
- Add safeRun & output channel: 20–30 minutes
- Register chat participant: 20 minutes
- Harden webview lifecycle: 30 minutes
- Update notion manager logging: 15 minutes
- Run tests and manual smoke: 30 minutes

Confidence: 86%

---

Copy this file into an untitled editor for refinement (you requested an untitled prompt). If you want I can now apply the code changes incrementally (I recommend starting with activationEvents + safeRun/logging).

```