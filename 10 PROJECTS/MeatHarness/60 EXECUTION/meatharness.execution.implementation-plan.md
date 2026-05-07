### Phase 0 — Trust hardening before UX overhaul

Files likely changed:

```txt
src/utils/markdown.ts
src/utils/runSession.ts
src/commands/runner.ts
src/commands/search.ts
src/commands/pnpm.ts
src/commands/files.ts
src/utils/repo.ts
src/app.tsx
src/meatharness.test.ts
```

Work:

```txt
1. Fix /meat verify to run pnpm verify + git status.
2. Make unsupported HarnessOps actions fail visibly.
3. Wire /meat paste-run to clipboard command intake.
4. Wire /meat paste-write to file writer intake.
5. Gate global shortcuts during input/palette screens.
6. Add runCommandArgs for safe rg/search execution.
7. Hide unavailable validation commands based on target package.json.
8. Refresh repo metadata after commands and writes.
9. Stop creating sidecar .bak files; move backups to centralized .agent-backups.
```

Reason: this prevents the new UX from sitting on untruthful command behavior.

### Phase 1 — Extract app state and navigation

Files likely added:

```txt
src/state/screens.ts
src/state/appActions.ts
src/state/sessionState.ts
src/components/Launcher.tsx
src/components/Dashboard.tsx
src/components/NavigationShell.tsx
```

Work:

```txt
1. Replace "main" as startup screen with "launcher".
2. Define real nav screens:
   - launcher
   - home
   - workflows
   - files
   - sessions
   - clipboard
   - settings
   - help
   - palette
   - command-output
3. Move main menu behavior into Dashboard action cards.
4. Convert existing NavigationTabs into real navigation or replace with static breadcrumb.
5. Keep App as orchestration only; do not put persistence/business logic in components.
```

### Phase 2 — Durable workspace sessions

Files likely added:

```txt
src/utils/workspaceSessions.ts
src/utils/settings.ts
src/types/session.ts
src/components/SessionLauncher.tsx
src/components/SessionList.tsx
src/components/SessionSummary.tsx
```

Work:

```txt
1. Add versioned settings parser.
2. Add session index read/write.
3. Add create/load/update workspace session utilities.
4. Persist run-session JSON under active workspace session.
5. Persist file-write and clipboard events.
6. Add recent sessions to launcher.
7. Add load session flow.
```

### Phase 3 — Dashboard and GUI-style panels

Files likely added/changed:

```txt
src/components/Dashboard.tsx
src/components/ActionCardGrid.tsx
src/components/RepoSummaryPanel.tsx
src/components/RunOutputPanel.tsx
src/components/FailureFocusPanel.tsx
src/components/ClipboardPanel.tsx
src/components/SettingsPanel.tsx
src/components/StructuredTable.tsx
```

Work:

```txt
1. Dashboard shows repo/session status, not command lists.
2. Primary operations become action cards.
3. Command output gets structured panels.
4. Sessions screen shows workspace history + run history.
5. Clipboard screen centralizes ChatGPT intake flows.
6. Settings screen edits durable preferences.
```

### Phase 4 — Streaming command execution

Files likely changed:

```txt
src/commands/runner.ts
src/utils/runSession.ts
src/app.tsx
src/components/RunSessionPanel.tsx
src/components/RunOutputPanel.tsx
```

Work:

```txt
1. Add streamCommand API.
2. Add timeout support.
3. Add cancellation.
4. Preserve partial output.
5. Update run session live as chunks arrive.
6. Render stdout/stderr incrementally.
```

### Phase 5 — Profiles and repo modes

Files likely added:

```txt
src/utils/profiles.ts
src/utils/packageScripts.ts
src/types/profile.ts
```

Work:

```txt
1. Detect repo mode:
   - node repo
   - git repo
   - folder
2. Detect profile:
   - meatharness
   - next
   - vouch
   - generic
3. Use profile roots for search.
4. Show only runnable package scripts.
5. Keep Vouch-specific gates under Vouch profile only.
```

## Priority order

Do not start with visual polish. Start here:

```txt
1. Truthful macros.
2. Real /meat verify.
3. Clipboard aliases wired to actual flows.
4. Input-safe keybindings.
5. No fake tabs.
6. No source-side backup pollution.
7. Durable workspace sessions.
8. Dashboard UX.
9. Streaming output.
10. Settings/profile system.
```

## First implementation slice I recommend

Smallest high-value slice:

```txt
Files changed:
- src/utils/markdown.ts
- src/utils/runSession.ts
- src/commands/files.ts
- src/app.tsx
- src/meatharness.test.ts

What it does:
- Fixes /meat verify.
- Makes unsupported macro actions fail visibly.
- Makes /meat paste-run and /meat paste-write open real intake flows.
- Stops q from quitting inside input/palette.
- Replaces source-side .bak backups with centralized .agent-backups.
```

Then run:

```harnessops
version: 1
name: meatharness-verify
risk: safe
steps:
  - run: pnpm verify
  - git: status
```

That gives us a trust-hardened base before cutting the app into the new session-first dashboard architecture.