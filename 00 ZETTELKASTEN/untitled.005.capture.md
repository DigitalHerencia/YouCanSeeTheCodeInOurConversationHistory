---
title: Untitled
type:
scope:
project:
domain:
artifact:
kind:
namespace:
authority:
parent:
depends_on:
supersedes:
tags: []
created: 05/07/2026
updated:
---
# Section 01: Root Config + Startup Path

Started the context map from the **root/runtime entry section** because it tells us how the app launches, builds, tests, and hydrates repo state.

## Section 1: Root config + startup path

### `package.json`

**Purpose:** Defines RateLtd package metadata, CLI binaries, scripts, dependencies, and module/import behavior. It exposes both `rateltd` and legacy `meatharness` binaries pointing to `./dist/cli.js`.

**How it works:**

* `dev` / `tui` run `tsx src/cli.ts`.
* `start` runs compiled `dist/cli.js`.
* `typecheck`, `build`, `test`, and `verify` are the validation path.
* Node engine is `>=20.19.0`.
* App is ESM via `"type": "module"`.

**Issues / notes:**

* Legacy `meatharness` bin remains. This may be intentional for backward compatibility, but eventually we should decide whether to keep it or remove it.
* Dependencies include `shadcn`, `lucide-react`, `class-variance-authority`, `tailwind-merge`, and `tw-animate-css`. Those look web/shadcn-oriented, not obviously necessary for an Ink TUI. Do not remove yet; mark for dedupe audit.
* `imports` defines `#components`, `#lib`, and `#hooks`, but this app may not actually use all of them. Mark for later alias cleanup.

---

### `tsconfig.json`

**Purpose:** TypeScript compiler configuration for building `src` into `dist`.

**How it works:**

* Target: `ES2022`.
* Module: `NodeNext`.
* Root directory: `src`.
* Output directory: `dist`.
* Strict type checking enabled.
* Source maps enabled.

**Issues / notes:**

* There is a syntax error in the fetched file: missing comma after `"resolvePackageJsonImports": true`.
* That should normally break `pnpm typecheck` / `pnpm build`.
* `module` is `NodeNext`, but `moduleResolution` is `bundler`. That pairing is suspicious. For Node ESM CLI output, `moduleResolution: "NodeNext"` would usually be expected unless there is a specific reason.
* This conflicts with Codex’s reported validation pass. Either the connected repo has drift, the fetched file is stale/corrupted, or TypeScript somehow is not reading this exact file. This needs immediate local verification.

**Priority:** High. Verify locally with `pnpm typecheck`.

---

### `vitest.config.ts`

**Purpose:** Test runner config.

**How it works:**

* Uses Node environment.
* Includes `src/**/*.test.ts`.
* Restores/clears mocks.

**Issues / notes:**

* Looks fine.
* No TSX test include. That is okay if intentional, but UI component tests would need `src/**/*.test.tsx` later.

---

### `src/cli.ts`

**Purpose:** CLI entrypoint. It resolves harness root/target root, loads repo info, and renders the Ink `App`.

**How it works:**

* Uses `process.cwd()` as `harnessRoot`.
* Resolves target via `resolveTargetRoot`.
* Loads metadata via `loadRepoInfo`.
* Renders `<App repo={repo} />`.
* On startup error, renders a red Ink error message and sets `process.exitCode = 1`.

**Issues / notes:**

* Good simple entrypoint.
* It uses `render()` even on preflight failure, which is okay for Ink.
* It does not parse a formal CLI command system; target parsing is delegated to `resolveTargetRoot`.
* There are mixed CRLF/LF line endings in the fetched content. Not a functional bug, but worth normalizing later.

---

### `src/app.tsx`

**Purpose:** Top-level React/Ink application composition.

**How it works:**

* Calls `useMeatHarnessController(initialRepo)` to hydrate app state and actions.
* Wraps screen content in `AppFrame`.
* Renders routed screen content through `AppScreens`.

**Issues / notes:**

* Structurally clean.
* The controller hook is still named `useMeatHarnessController`. That is legacy naming debt. Not a bug, but it weakens RateLtd naming consistency.
* This file confirms the app architecture is: `cli.ts → App → controller hook → AppFrame + AppScreens`.

---

### `src/theme.ts`

**Purpose:** Defines active terminal theme colors.

**How it works:**

* Exports `Theme` type and `activeTheme`.
* Theme is hardcoded to `"matrix"`.
* Provides primary/secondary/accent/muted/danger/warning/background/gradient.

**Issues / notes:**

* `Theme.name` is typed only as `"matrix"`, but the settings model previously included multiple themes. This could block real theme switching if components depend on this type.
* Theme is a static singleton, so `PreferLtd` theme switching may update settings without actually changing rendered theme unless another theme registry is used elsewhere.
* Mark for theme-system audit.

---

### `src/utils/repo.ts`

**Purpose:** Target resolution, repo/folder metadata loading, path safety, and local config target discovery.

**How it works:**

* `assertInsideRepoPath` prevents path escape from target root.
* `resolveTargetRoot` checks CLI args, env vars, local config files, then falls back to harness root.
* Supports both `--repo` and `--target`.
* Supports env vars `RATELTD_TARGET_REPO` and legacy `MEATHARNESS_TARGET_REPO`.
* Reads `.rateltd` and legacy `.meatharness` local settings.
* `loadRepoInfo` now supports generic folders and Git repos.
* It detects Git via `git rev-parse --is-inside-work-tree`.
* It detects package metadata from `package.json`.
* It probes Node and pnpm versions.

**Issues / notes:**

* Good protocol alignment: generic folders are now first-class.
* `readLocalTargetRoot` directly `JSON.parse`s config files without try/catch. A malformed local config could crash startup.
* `loadRepoInfo` uses `safeExec` for Node/pnpm/git, so missing tools degrade gracefully.
* Naming still says `RepoInfo`, `targetRoot`, `targetPackageName`; for protocol purity, later we may rename toward `TargetInfo`, but this is not urgent.
* `safeExec` has no timeout. Most calls are low-risk version/status probes, but a stuck process could theoretically hang startup.

---

## Immediate findings

### Real bug candidate

`tsconfig.json` appears invalid because of a missing comma after `resolvePackageJsonImports`. This is the first thing to verify locally. If local `pnpm typecheck` passes, then the connected repo view and local state disagree somehow.

### Structural debt

The app still has MeatHarness naming in core controller names and binary alias. That is not breaking functionality, but it is cleanup debt.

### Dedupe candidates

Likely candidates for later dependency/file cleanup:

* legacy `meatharness` bin alias
* unused web/shadcn-ish dependencies
* `#hooks/*` alias if no hooks folder exists
* static `theme.ts` vs settings-driven theme registry
* compiled `dist/` in repo if we decide the remote should source-only

---

## Current context map for startup

`package.json` defines scripts and CLI bin → `src/cli.ts` resolves target → `src/utils/repo.ts` loads local target metadata → `src/app.tsx` creates controller and shell → `AppFrame` renders layout → `AppScreens` routes feature screens.

## Next section to read

**Controller + input routing**, because that determines whether the visible protocol controls actually do what the screens claim.

# Section 02: State Navigation + Input Routing

## Files read in this section

* `src/state/appTypes.ts`
* `src/state/screens.ts`
* `src/state/navigation.ts`
* `src/state/inputModes.ts`
* `src/controller/inputRouter.ts`
* `src/controller/inputRouter.test.ts`
* `src/state/appNavigation.ts`

---

## `src/state/appTypes.ts`

**Purpose:**
Defines the central TypeScript contract for the app controller and the major state shapes shared across screens.

**How it works:**

* Imports domain types from command runner, file writing, repo metadata, run sessions, screens, Git service, settings, diagnostics, logs, and command risk.
* Defines `LiveCommandOutput`, `Pending`, `RepoTreeEntry`, `LauncherStats`, `WritePlan`, `WriteOutcome`, and `OpsDeckItem`.
* Defines the large `MeatHarnessController` type that every screen consumes.
* The controller type exposes:

  * target/repo metadata
  * current screen
  * status message
  * running state
  * live output/result/session/log state
  * launcher tree state/actions
  * clipboard writer state/actions
  * ops macro state/actions
  * git/diff state/actions
  * editor file/preview state/actions
  * settings state/actions
  * diagnostics and handoff packet actions
  * output copy/save/cancel actions
  * input state placeholders

**Issues / notes:**

* The type is still named `MeatHarnessController`. That is legacy naming debt and should eventually become `RateLtdController`.
* This is currently a large “god controller” interface. That is not automatically wrong for an Ink TUI, but structurally it may become hard to reason about as screens grow.
* Good sign: protocol concepts are now represented directly: `handoffPacket`, `copyHandoffPacket`, `available`, `unavailableReason`, `risk`, and grouped `OpsDeckItem`.
* `inputLabel`, `inputValue`, `setInputValue`, and `inputSubmit` exist in the contract, but from the routing files alone it looks like text-entry is not yet fully wired into real manual path/search flows. Mark for controller audit.

**Potential cleanup later:**

* Split controller type into feature slices:

  * `LauncherController`
  * `WriterController`
  * `OpsController`
  * `DifferController`
  * `EditorController`
  * `LoggerController`
  * `SettingsController`
* Keep the combined `RateLtdController` as an intersection/composed type if screens still need the whole object.

---

## `src/state/screens.ts`

**Purpose:**
Thin compatibility/re-export module for screen helpers from `navigation.ts`.

**How it works:**

* Re-exports:

  * `normalizeScreen`
  * `primaryScreens`
  * `screenDisplayName`
  * `screenMetadata`
  * `ScreenId` as `Screen`

**Issues / notes:**

* This file is simple and safe.
* It may be unnecessary indirection unless other files depend on `./screens.js` as a stable import boundary.
* No functional issue found.

**Potential cleanup later:**

* Keep it if it prevents broad import churn.
* Remove only if dedupe pass confirms imports can use `navigation.ts` directly without creating churn.

---

## `src/state/navigation.ts`

**Purpose:**
Defines all valid screens, screen metadata, navigation order, old screen aliases, and screen normalization.

**How it works:**

* Defines `ScreenId` union:

  * `launcher`
  * `rate`
  * `editor`
  * `write`
  * `ops`
  * `differ`
  * `output`
  * `prefer`
  * `confirm`
  * `input`
  * `file-preview`
  * `agent-help`
* Defines metadata for each screen: display name, module name, shortcut, description, badge, subtitle.
* Defines primary/top-level screen arrays.
* Defines legacy aliases like `home`, `clipboard`, `commander`, `diff`, `logger`, `help`, etc.
* `normalizeScreen()` maps unknown strings to `launcher`.

**Issues / notes:**

* Several descriptions still say “repository” when the product now supports generic folders as active targets. Example: Launcher says “Choose and inspect the active target repository.” Dashboard says “current target repository.” This is language drift after the generic-folder protocol change.
* `file-preview` and `input` exist as screen IDs, but we need to verify whether they are actually routed/rendered or just future scaffolding.
* `write` and `ops` both display as `CommanderLtd`, which is correct conceptually, but the UI may need mode labels: “Clipboard” vs “Ops.”
* Alias map is useful and not too heavy.

**Recommended cleanup:**

* Replace “repository” with “target” where the screen can handle generic folders.
* Clarify CommanderLtd subtitles:

  * `write`: clipboard intake / writes / AI commands
  * `ops`: macro cockpit / command execution
* During later dedupe, verify if `file-preview` is dead scaffolding.

---

## `src/state/inputModes.ts`

**Purpose:**
Defines coarse input mode state for normal mode, text entry, and modal mode.

**How it works:**

* `InputMode` can be:

  * `{ kind: "normal" }`
  * `{ kind: "text-entry"; label?: string }`
  * `{ kind: "modal"; modal: "confirm" | "help" }`
* Exports `normalInputMode`.
* Exports `isTextEntryMode()`.

**Issues / notes:**

* Simple and clean.
* `modal: "help"` exists, but current input routing treats modal mode generically. Need verify whether help ever uses modal mode or only the `agent-help` screen.
* `isTextEntryMode()` may be unused. Mark for later search/dedupe.
* Text-entry support exists at the type level, but the actual manual path/search feature appears unfinished.

---

## `src/controller/inputRouter.ts`

**Purpose:**
Pure input-to-action routing layer. It converts Ink key/input events into semantic screen/global actions.

**How it works:**

* Defines low-level `RouterKey` shape.
* Defines `InputRouteContext`.
* Defines all `ScreenAction` and `GlobalAction` strings.
* `routeInput()` prioritizes:

  1. text-entry mode
  2. modal/confirm mode
  3. screen-specific routes
  4. global shortcuts
  5. ignored/unmapped
* Screen-specific routes include:

  * Launcher: up/down/enter/left/R/O
  * Writer: up/down/enter/P/Esc
  * Ops: up/down/enter/C/X
  * Editor: up/down/enter/E/R
  * Differ: up/down/S/U/X/P
  * Prefer: S/T
  * Help: C/R/D/H/Esc
  * Output: C/S/H/X
* Global routes include:

  * `?` help
  * `q` quit
  * number keys 1–8
  * control-P palette open

**Issues / notes:**

* Important possible bug: when `hasConfirmDialog` is true, `routeInput()` returns `modal.confirm` / `modal.cancel`, but in the controller code previously seen, those modal route results appeared to be ignored. If `ConfirmDialog` owns its own `useInput`, this is okay. If not, Enter/Escape on confirm may route but not execute. Needs direct `ConfirmDialog.tsx` + controller audit.
* Launcher has left-arrow collapse but no right-arrow expand action. Earlier product expectation included left/right expand/collapse. Currently Enter selects/open target, left collapses. Need decide whether right arrow should expand/open selected folder.
* Text-entry mode returns `text-entry.input`, but from this file alone it does not carry the typed character/value. This suggests text-entry support is only a guard against global shortcuts, not a complete input system.
* The `agent-help` route block appears twice: first for Escape/C, later for R/D/H. This works because the first block only returns for Escape or C, but it should be consolidated for clarity.
* `palette.open` maps to `\u0010` Ctrl-P, but we need verify whether there is an actual command palette screen. If not, this may just route to Ops.

**Recommended fixes later:**

* Verify confirm behavior.
* Add right-arrow launcher expand/open behavior if consistent with product requirements.
* Consolidate `agent-help` routing.
* Add tests for `handoff.copy`, `ops.copy-command`, launcher refresh/open-explorer, and output cancel/copy/save.
* Do not build manual path entry until text-entry mode is fully modeled.

---

## `src/controller/inputRouter.test.ts`

**Purpose:**
Unit tests for the pure input router.

**How it works:**

* Tests that text-entry mode ignores global quit.
* Tests modal Enter/Escape routing.
* Tests global help from normal mode.
* Tests risky Ops Enter routes to confirmation action.

**Issues / notes:**

* Test coverage is very thin but useful.
* It does not test most new protocol controls:

  * Launcher refresh
  * Launcher open explorer
  * Ops copy command
  * Output handoff copy
  * Help diagnostics copy
  * Help handoff copy
  * Differ patch actions
  * Prefer save/theme
* It tests that modal routes are returned, but not that the controller or `ConfirmDialog` actually executes them.

**Recommended next test additions:**

* Add router tests for every visible keybinding shown in the screen action panels.
* Add integration-ish tests only after reading `ConfirmDialog.tsx` and controller input handling.

---

## `src/state/appNavigation.ts`

**Purpose:**
Builds launcher tree entries, launcher stats, known roots, package script discovery, and Ops macro catalog items.

**How it works:**

* Defines blocked directories:

  * `.agent-backups`, `.agent-logs`, `.git`, `.next`, `.turbo`, `build`, `coverage`, `dist`, `node_modules`
* Defines visible config/root files:

  * `.editorconfig`, `.gitignore`, `package.json`, `pnpm-lock.yaml`, `README.md`, `tsconfig.json`, `vitest.config.ts`
* `buildRepoTreeEntries()` builds the LauncherLtd tree from the active root.
* `collectLauncherStats()` counts files/folders/repos and discovers package scripts.
* `isRepoRoot()` detects Git repos by checking for `.git`.
* `discoverPackageScripts()` reads `package.json` scripts.
* `buildOpsDeckItems()` combines:

  * package ops
  * git ops
  * search ops
  * PowerShell ops
* Package ops include required canonical scripts: `verify`, `typecheck`, `test`, `build`.
* Git ops include status, diff, staged diff, log, remote, add, disabled commit, push.
* Search ops include file listing and TODO/FIXME scan.
* PowerShell ops scan vendor roots and expose allowlist-gated script commands.

**Issues / notes:**

* Good protocol alignment: Ops is now grouped by Package/Git/Search/PowerShell and includes availability + risk.
* `knownLaunchRoots()` has machine-specific hardcoded paths:

  * `D:\`
  * `D:\RateLtd`
  * `D:\MeatHarness`
  * `D:\Vouch`
  * `D:\Vouch\vouch-server`
    This should eventually move to settings, recent targets, or local-only config.
* `buildPowerShellOps()` also has hardcoded vendor roots:

  * `<harnessRoot>\sources`
  * `D:\SadDull`
  * `D:\MeatHarness`
    This is useful for Ivan’s current workstation but should not be permanent product structure.
* `isRepoRoot()` only checks `.git`. That is fine for normal repos, but Git worktrees or subfolders inside a repo may not show as repo roots even though `git rev-parse` could work there.
* `discoverPackageScripts()` uses a cache that does not appear to invalidate when `package.json` changes. A long-running TUI may show stale package macros after package script edits.
* `collectLauncherStats()` uses `findFirstRepo(root)` when the selected root is not a repo. For generic folder targets, this may make stats reflect the first repo child rather than the selected folder itself.
* PowerShell scan runs as part of Ops item building. Depending on vendor root size, this could become expensive. It is limited to 8 manifests here, which helps.

**Recommended cleanup / structural changes:**

* Move hardcoded Windows paths into local settings or `.rateltd.local.json`.
* Add cache invalidation for package script discovery, probably keyed by `package.json` mtime.
* Clarify whether generic folder stats should count the folder itself or first nested repo.
* Consider splitting this file later:

  * `launcherTree.ts`
  * `launcherStats.ts`
  * `opsCatalog.ts`
  * `packageScripts.ts`
  * `gitOps.ts`
  * `powershellOps.ts`

---

# Section 02 Findings

## Confirmed working structure

The codebase now has a clear state/navigation layer:

`navigation.ts` defines screens → `inputRouter.ts` maps keys to semantic actions → `appTypes.ts` defines the controller contract consumed by screens → `appNavigation.ts` builds launcher tree and macro catalogs.

That is a good architecture for an Ink TUI because screen components can remain display-focused while controller/actions handle behavior.

## Highest-priority issues found

1. **Potential confirm-dialog routing gap**
   The router returns modal confirm/cancel actions, but we need to verify whether those actions actually run or are ignored in the controller. Read `ConfirmDialog.tsx` and the full input-handling part of `useMeatHarnessController.ts` next.
2. **Hardcoded local Windows paths**
   `appNavigation.ts` contains machine-specific roots and vendor roots. This is acceptable during local MVP, but should move into settings/local config before this becomes portable.
3. **Launcher right-arrow behavior missing**
   Launcher has left collapse but no right-arrow expand/open route, even though the product expectation included arrow-based expand/collapse.
4. **Text-entry is incomplete at the routing layer**
   Text-entry mode protects against global shortcuts, but does not appear to carry typed input through the router. That matches the remaining gap around manual target path and search input.
5. **Navigation language still says repository**
   Now that generic folders are valid targets, screen descriptions should use “target” instead of “repository” where appropriate.

## Dedupe candidates from this section

* `screens.ts` may be unnecessary re-export indirection.
* `isTextEntryMode()` may be unused.
* Hardcoded path arrays should move out of source.
* `appNavigation.ts` may be too broad and should eventually split.
* `MeatHarnessController` name should eventually become `RateLtdController`.RateLtd Context Map — Section 03: Screen Router + Confirmation Execution Path

  * sky Ops commands.

# Section 03: Screen Router + Confirmation Execution Path

## Files read in this section

* `src/components/AppScreens.tsx`
* `src/components/ConfirmDialog.tsx`
* `src/state/useMeatHarnessController.ts` — connector output is large and truncated after the command/session path, so this section only maps the portion actually visible in the fetched content.

---

## `src/components/AppScreens.tsx`

**Purpose:**
Central screen switchboard. It maps the normalized controller screen state to the actual screen component that renders inside `AppFrame`.

**How it works:**

* Imports all screen components:

  * `RepoLauncher`
  * `RateDashboardScreen`
  * `EditorLtdScreen`
  * `WriterScreen`
  * `OpsDeckScreen`
  * `DifferLtdScreen`
  * `OutputScreen`
  * `PreferLtdScreen`
  * `AgentHelpModal`
  * `ConfirmDialog`
* Calls `normalizeScreen(controller.screen)`.
* If screen is `confirm` and `controller.pending` exists, it renders `ConfirmDialog`.
* If screen is `agent-help`, it renders `AgentHelpModal`.
* Otherwise it routes known screen IDs to their screen components.
* Any unmatched/remaining screen falls through to `OutputScreen`.

**Issues / notes:**

* Structurally clean and easy to reason about.
* `confirm` is handled before the normal screen routes, which is correct.
* The confirm route depends on `controller.pending` existing. If screen is `confirm` but `pending` is undefined, it falls through to `OutputScreen`. That is safe but could be confusing; a better fallback might route back to `write` or `ops` with a message.
* `file-preview` and `input` are valid screen IDs in navigation, but this router does not explicitly render either one. They currently fall through to `OutputScreen`. That means those screen IDs are either dead/future scaffolding or incomplete implementation.

**Potential structural change:**

* Add explicit cases for `input` and `file-preview`, or remove those screen IDs until implemented.
* Add a safer fallback for `confirm` without pending.

---

## `src/components/ConfirmDialog.tsx`

**Purpose:**
Reusable confirmation modal/screen for risky actions.

**How it works:**

* Accepts:

  * `title`
  * `body`
  * `onConfirm`
  * `onCancel`
* Maintains local `choice` state: `"yes"` or `"no"`.
* Default choice is `"no"`.
* Left/right arrows toggle choice.
* `y` selects yes.
* `n` selects no.
* Escape calls `onCancel`.
* Enter calls `onConfirm` only when current choice is `"yes"`; otherwise it cancels.
* Renders a double-bordered Ink panel with warning color and clipped body text.

**Issues / notes:**

* Good safety default: destructive confirmation defaults to **NO**.
* The component owns its own `useInput`, which means the controller ignoring `modal.confirm` / `modal.cancel` route results is not necessarily a bug.
* There may be two active `useInput` listeners while confirm is open: one in the controller and one in `ConfirmDialog`. The controller intentionally ignores modal results, while `ConfirmDialog` handles them. This is acceptable if Ink event ordering behaves consistently.
* The dialog body is clipped to 12 lines and 96 columns. That is good for terminal safety, but large file-write diffs may not be fully reviewable inside the modal. The preview screen must remain the real review surface.
* `onConfirm` is typed as `() => void`, but `pending.run()` is async and called through `void controller.pending?.run()` in `AppScreens`. This intentionally fire-and-forgets the async confirmation action.

**Potential issue to verify manually:**

* Confirm Enter behavior should be smoke-tested:

  * risky Ops command → confirmation screen → choose YES → Enter → command runs.
  * risky Ops command → default NO → Enter → returns/cancels.
  * file-write payload → confirmation screen → choose YES → Enter → write applies.

**Potential structural change:**

* Consider typing `onConfirm` as `() => void | Promise<void>` for honesty.
* Consider adding a visible footer line that says “Preview was shown on previous screen; this modal is final approval only.”

---

## `src/state/useMeatHarnessController.ts`

**Purpose:**
Main controller hook for RateLtd. This is the runtime brain of the TUI.

**How it works from the visible fetched content:**

### Imports / dependencies

The controller pulls together:

* `agentHelpInstructions`
* React state/effects/memo
* Ink `useApp` and `useInput`
* repo loading
* clipboard read/copy
* logging/formatting/saving run output
* run session creation/finish
* process runner
* markdown command extraction
* file-write planning/apply
* app navigation builders
* input router
* git service
* file system service
* settings service
* diagnostics service
* log store/handoff export
* external editor adapter
* Windows Explorer opener

This confirms it is currently the central orchestration layer.

---

### State owned by the controller

Visible state includes:

* `repo`
* `screen`
* `message`
* latest `result`
* `liveOutput`
* `activeAbortController`
* `sessions`
* `activeSession`
* `pending`
* launcher root/selection/refresh token
* writer selection/write plan/write outcome
* ops selection
* placeholder input state
* running flag
* git summary/diff selection/diff text
* editor files/selection/preview
* settings/settings path
* diagnostics
* log events

This confirms the earlier structural concern: it is a single large controller, not slice-based.

---

### Derived state

The controller derives:

* `editorFileRows` using `getFileMetadata`
* `selectedWriterAction`
* `launcherEntries`
* `launcherStats`
* `opsItems`

`opsItems` are built from `buildOpsDeckItems(repo, settings)`, so Ops macros react to both target state and PowerShell allowlist/settings state.

---

### Effects

The visible effects do the following:

* On target change: refresh Git, editor files, diagnostics, and logs.
* On diff selection / Git summary change: refresh selected diff text.
* On editor selection change: refresh editor preview.
* On TUI startup: append `tui_started` log.
* On launcher root/entries change: select active launcher entry if present.
* On launcher entry count change: clamp selected index.

**Issues / notes:**

* The startup log effect uses `initialRepo.targetRoot`, not current `repo.targetRoot`, which is probably correct for “started” event.
* There is a visible indentation typo in the startup log object around `message: "RateLtd TUI started."` This is cosmetic, not functional.
* Effects call functions declared later in the hook. That works because function declarations are hoisted.
* Refresh-on-target-change is good protocol behavior.

---

### Input handling

The controller registers a global `useInput` and delegates to `routeInput`.

Behavior:

* Text-entry inputs are ignored by the global controller route.
* Modal route results are ignored by the controller.
* Global route results go to `handleGlobalInputAction`.
* Screen route results go to `handleScreenInputAction`.

This confirms that `ConfirmDialog` is expected to handle its own modal input. The controller is deliberately standing down when modal routes are active.

---

### Global actions

Visible global actions:

* open help
* close help
* copy help instructions
* quit app with log
* navigate to screens 1–8
* Ctrl-P opens Ops as command catalog

**Issue / note:**

* `palette.open` does not open a real command palette; it routes to Ops. That is acceptable if intended, but the naming is slightly misleading.

---

### Screen actions

Visible screen actions include:

* launcher movement/open/collapse/refresh/open explorer
* writer movement/plan/confirm/clear
* ops movement/run/confirm/copy/cancel
* editor movement/open external/refresh
* differ movement/stage/unstage/revert/export patch
* prefer save/toggle theme
* diagnostics refresh/copy
* handoff copy
* output copy/save

This shows the controller now has semantic action handling for the major protocol controls.

---

### Launcher functions

Visible launcher behavior:

* `moveLauncherSelection` clamps selection.
* `setSelectedRepoAsTarget` now accepts folders and Git repos, rejecting only files and parent rows.
* `collapseLauncherSelection` moves launcher root to parent.
* `refreshLauncherTree` refreshes token, repo metadata, git, diagnostics, and message.
* `openSelectedPathInExplorer` opens selected path or target root in Explorer.
* `chooseTargetRepo` loads repo info for selected target, sets repo, resets result/session, logs target selection, and keeps screen on launcher.

**Issues / notes:**

* Message still says “Target repo set” even though generic folders are now valid. Naming/message drift.
* `collapseLauncherSelection` is not true tree collapse; it changes the launcher root to the selected path’s parent. That may be acceptable behavior, but the UI language “collapse” could mislead.
* There is still no right-arrow expand behavior in this visible portion.
* Selecting a new target resets `activeSession` but does not reset `sessions`. Need read rest of controller to confirm whether sessions are intentionally global/in-memory or target-specific.

---

### Clipboard writer functions

Visible writer behavior:

* `planClipboardFileWrite` reads clipboard, calls `planFileWrites`, stores diff/body/payload, and reports planned outcome.
* On invalid file-write JSON, it shows error state and logs `file_write_plan_failed`.
* `planClipboardAiCommand` extracts supported shell commands from clipboard.
* If no runnable command exists, it sets error state and logs `command_plan_failed`.
* If commands exist, it creates a planned command recipe and logs `command_planned`.
* `openWriteConfirmation` creates a `pending` confirmation with title/body/run callback and switches to `confirm`.
* `confirmWriteOrCommand` applies file writes or runs command recipe after confirmation.
* `clearWritePlan` resets plan/outcome/pending and logs.

**Issues / notes:**

* File-write planning has real preview-before-write behavior.
* File writes call `applyWrites(repo.targetRoot, writePlan.payload)`, so path safety depends on `commands/files.ts`; read that next before judging mutation safety.
* Running command recipes after confirmation uses existing command execution path.
* Warning handling exists for command extraction but file-write planning stores `warnings: []`; if `planFileWrites` produces warnings internally, they are not visible here unless included in thrown errors. Need read `commands/files.ts`.

---

### Ops command functions

Visible Ops behavior:

* `runSelectedOp` refuses unavailable macros, sets message, logs `command_unavailable`, and returns.
* Available macros run via `executeCommand`.
* `openOpsConfirmation` refuses unavailable macros and otherwise creates a confirmation pending callback.
* `copySelectedOpCommand` copies command text to clipboard and logs.

**Issues / notes:**

* Good unavailable-control behavior.
* Good copy-command receipt behavior.
* Risky commands rely on input router’s `selectedCommandRequiresConfirmation` check. If a command is risky but does not have `requiresConfirmation`, it can run directly. That means `buildOpsDeckItems` risk/confirmation mapping is critical.
* No separate guard in `runSelectedOp` checks `selected.requiresConfirmation`. The controller assumes routing prevented direct run. This is okay for keyboard flow, but programmatic calls to `runSelectedOp` could bypass confirmation. Safer design: `runSelectedOp` should also refuse/redirect confirmation when `requiresConfirmation` is true.

---

### Command execution/session path

Visible execution behavior:

* `executeCommand` logs `command_requested`, then runs command.
* `executeCommandRecipe` logs recipe request and delegates.
* `runRecipeAndShow`:

  * creates abort controller
  * creates run session
  * sets live output bootstrap
  * stores active session
  * switches screen to `output`
  * logs `command_started`
  * loops through commands
  * streams stdout/stderr through `streamCommandLine`
  * stores each step result in session
  * stops on nonzero exit
  * finalizes session as passed/failed/cancelled
  * prepends session to in-memory session list
  * creates final `liveOutput`
  * logs `command_finished` with stdout/stderr tails
  * refreshes repo metadata
  * clears abort/running state

**Issues / notes:**

* This is the core protocol feedback loop and it is real.
* Output capture is first-class.
* Cancellation uses AbortController and depends on `streamCommandLine` respecting it.
* Session history is in memory here. Persistent session logs are likely handled by logger utilities; need read `utils/logger.ts` and `persistence/sessionStore.ts` later.
* The command recipe stops on first failing command, which is sane.
* `setScreen("output")` before yielding gives the operator immediate feedback, good TUI behavior.

---

## Section 03 findings

### Confirmed behavior

The confirmation system is real. `AppScreens` renders `ConfirmDialog` when the controller has `screen === "confirm"` and a pending action. `ConfirmDialog` owns confirmation input and defaults to NO. Controller modal route results are ignored intentionally, so my previous concern is mostly resolved.

### Highest-priority issues found

1. `** and **`** screens are defined but not routed.**
   `AppScreens` does not explicitly render them. They fall through to `OutputScreen`. Either implement or remove/defer them.
2. **Risky Ops execution should guard twice.**
   The input router sends risky commands to confirmation, but `runSelectedOp()` itself does not appear to enforce confirmation. Add a second guard there for safety.
3. **Launcher wording still says repo.**
   Messages like “No repo selected” and “Target repo set” should say target/folder/repo.
4. **Collapse behavior may not match UI wording.**
   `collapseLauncherSelection()` changes the root to the parent path. That is navigation, not simple tree collapse.
5. **God-controller pressure is real.**
   `useMeatHarnessController.ts` owns almost every domain. It is functional, but later should be split into smaller hooks or service controllers.
6. **Full controller still needs second-half audit.**
   The connector output truncated after the start of `copyFullOutput`, so remaining functions must be read in another pass or through narrower file/function access.

## Dedupe / cleanup candidates from this section

* Rename `useMeatHarnessController` to `useRateLtdController`.
* Rename `MeatHarnessController` type to `RateLtdController`.
* Remove or implement `input` and `file-preview` screens.
* Tighten Launcher messaging from repo-specific to target-generic.
* Rename `collapseLauncherSelection` if it remains “navigate parent.”
* Add controller-level confirmation enforcement for risky Ops commands.

# Section 04: Mutation + Command Safety Path

## Files read in this section

* `src/commands/files.ts`
* `src/commands/runner.ts`
* `src/services/processRunner.ts`
* `src/utils/markdown.ts`
* `src/utils/clipboard.ts`
* `src/types/commands.ts`

---

## `src/commands/files.ts`

**Purpose:**
Handles ChatGPT file-write JSON parsing, dry-run diff preview, target-bound path validation, file application, and file-write logging.

**How it works:**

* Defines `FileWritePayload` as `{ files: [{ path, content }] }`.
* `parseFileWritePayload()`:

  * unwraps a whole fenced JSON block if present.
  * parses JSON.
  * requires `files` array.
  * requires each file to have string `path` and `content`.
  * rejects absolute paths.
  * rejects paths that normalize outside the target root.
  * rejects duplicate normalized paths.
* `planFileWrites()`:

  * parses payload.
  * builds file paths list.
  * generates preview diff.
  * logs `file_write_planned`.
* `previewWrites()`:

  * uses `assertInsideRepoPath()`.
  * reads existing file content if the target exists.
  * uses `createTwoFilesPatch()` from `diff` to create unified diff.
* `applyWrites()`:

  * resolves each target path safely.
  * detects created/updated/unchanged.
  * creates parent directories.
  * writes file content.
  * logs `file_write_applied`.

**Issues / notes:**

* Good: target-bound path safety exists in both parsing and actual write application.
* Good: preview-before-write exists.
* Good: duplicate path detection exists.
* Potential bug: files marked `unchanged` are still written with `writeFileSync()`. That can change file modification times even when content did not change.
* Potential bug: `previewWrites()` reads existing files as UTF-8 with no binary guard. If a payload targets an existing binary file, preview could fail or produce unusable output.
* Potential missing guard: no maximum file count, max payload size, or max per-file content size. A giant pasted payload could freeze the TUI or generate a massive diff.
* Potential privacy/logging issue: the `files` array logged by `applyWrites()` includes `absolutePath`. This may be okay locally, but handoff/export redaction must be verified later.

**Recommended fixes later:**

* Skip `writeFileSync()` for unchanged files.
* Add file count/content size/diff size guardrails.
* Add binary-existing-target detection before preview.
* Consider logging repo-relative paths only unless absolute paths are needed.

---

## `src/commands/runner.ts`

**Purpose:**
Runs shell commands, streams stdout/stderr, detects simple command risk, supports timeout and cancellation, and returns structured command results.

**How it works:**

* Defines `RiskLevel`: `safe | medium | destructive`.
* Defines `CommandResult`.
* `detectCommandRisk()`:

  * classifies `rg`-style safe commands first.
  * flags destructive commands like `git reset`, `git clean`, force push, `Remove-Item`, `rm`, `del`, DB reset, etc.
  * flags medium-risk commands like `git add`, `git commit`, `git push`, `git pull`, `pnpm build`, `pnpm test`, `pnpm dev`, etc.
  * defaults to safe.
* `streamCommandLine()`:

  * chooses platform shell.
  * on Windows, runs through `pwsh.exe -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -Command`.
  * on non-Windows, runs `/bin/sh -c`.
* `streamCommand()`:

  * uses `spawn`.
  * captures stdout/stderr.
  * calls streaming callbacks.
  * supports `AbortSignal`.
  * kills child on abort.
  * kills child on timeout.
  * resolves with command, cwd, timestamp, exit code, stdout, stderr, duration.
* Default timeout is 20 minutes.

**Issues / notes:**

* Good: streaming output and cancellation are real.
* Good: timeout exists.
* Good: command result shape is model-usable.
* Potential issue: `child.kill()` may not kill detached grandchildren spawned by a shell command. This is common and was already noted by Codex.
* Potential issue: risk detection here only returns `safe | medium | destructive`, while `src/types/commands.ts` supports broader risks: `low`, `admin`, `network`, `secret-sensitive`. This is a type/domain mismatch.
* Potential issue: `detectCommandRisk()` is not the enforcement layer for Ops macros; Ops uses explicit `requiresConfirmation` from catalog. That is okay, but the codebase now has two risk systems.
* Potential issue: on Windows, `runCommandArgs()` converts executable/args back into a shell command string instead of spawning args directly. That can reintroduce shell quoting risk.
* Potential issue: all commands inherit full `process.env`. That is normal, but exported logs/handoffs must not leak env output if a command prints it.
* Potential issue: timeout exit code is `1`, same as ordinary failure. The higher-level command lifecycle has `timed-out`, but this runner does not encode timeout separately.

**Recommended fixes later:**

* Unify risk type with `CommandRisk`.
* Add result metadata for `cancelled` and `timedOut`, instead of only `exitCode: 1`.
* Consider process-tree kill strategy on Windows if cancellation matters for long-running child processes.
* Consider direct spawn args on Windows for `runCommandArgs()` where possible.

---

## `src/services/processRunner.ts`

**Purpose:**
Service-layer re-export for command runner primitives.

**How it works:**

* Imports from `../commands/runner.js`.
* Re-exports:

  * `detectCommandRisk`
  * `runCommand`
  * `streamCommand`
  * `streamCommandLine`
  * related types.

**Issues / notes:**

* This file is pure indirection.
* It creates a service boundary, which can be useful if components/controller should import from `services` instead of `commands`.
* No functional bug.
* Dedupe question: decide whether command execution belongs under `commands/runner.ts` or `services/processRunner.ts`. Both existing together is okay, but the boundary should be intentional.

**Recommended cleanup later:**

* Either keep this as the public boundary and prevent controller imports from `commands/runner.ts`, or remove it and import runner directly everywhere.
* Current direction seems to prefer services as controller-facing boundaries, so keep it.

---

## `src/utils/markdown.ts`

**Purpose:**
Extracts runnable shell/PowerShell commands from pasted ChatGPT/markdown text.

**How it works:**

* `extractPowerShellCommands()`:

  * strips fenced command blocks if present.
  * splits into lines.
  * trims empty lines and comments.
  * splits semicolon command chains outside quotes.
  * accepts lines matching known command starts:

    * `pnpm`, `npm`, `node`, `npx`, `tsx`, `git`, `rg`, `pwsh`, `powershell`, `cmd`
    * PowerShell verbs like `Get-`, `Set-`, `New-`, `Remove-`, etc.
    * `$`, `cd`, `mkdir`, `code`
  * ignores likely prose and records warning.
  * warns on destructive command detection.
  * warns on absolute Windows paths or parent path segments.
* `extractFencedCommandSource()` strips markdown code fences for command-ish languages.
* `splitCommandChain()` splits semicolon chains.
* `splitOutsideQuotes()` handles quoted semicolons and PowerShell backtick escapes.

**Issues / notes:**

* Good: prose filtering exists.
* Good: destructive command warnings exist.
* Good: path scope warnings exist.
* Potential issue: warnings do not block execution. A destructive command from clipboard can still become a planned command; safety depends on later confirmation flow.
* Potential issue: the extractor name says `extractPowerShellCommands`, but it extracts general shell commands too.
* Potential issue: accepts `Remove-` commands into command list and only warns if `detectCommandRisk()` classifies destructive. Confirmation depends on the writer confirmation flow, not risk-specific handling.
* Potential issue: command chain splitting only splits semicolons, not `&&` or `||`. That is safer but may surprise users pasting shell commands.
* Potential issue: all fenced command blocks are concatenated. If ChatGPT includes separate alternative blocks, this could create an unintended recipe.
* Potential issue: `if (` and `$` are accepted starts, which may allow partial PowerShell snippets that are not complete commands.

**Recommended fixes later:**

* Rename to `extractShellCommands` or `extractRunnableCommands`.
* Add risk level into returned command metadata, not just warnings.
* For clipboard commands, consider blocking destructive commands unless an explicit second confirmation is accepted.
* Add tests for fenced multi-block behavior, semicolon splitting, quoted semicolon, destructive warnings, and prose filtering.

---

## `src/utils/clipboard.ts`

**Purpose:**
Thin wrapper around `clipboardy`.

**How it works:**

* `copyToClipboard(value)` writes string to clipboard.
* `readClipboard()` reads string from clipboard.

**Issues / notes:**

* No functional issue.
* No error handling at this layer; callers must handle clipboard failures.
* Since clipboard access can fail in some terminals/remote shells, higher-level UI should show a useful error if copy/read fails.

**Recommended cleanup later:**

* Add safe wrapper or caller-level try/catch for clipboard read/copy actions.
* Consider logging clipboard failures as `clipboard_read_failed` / `clipboard_write_failed`.

---

## `src/types/commands.ts`

**Purpose:**
Defines broader command-domain types beyond the low-level runner.

**How it works:**

* Imports runner `CommandResult`.
* Defines broad `CommandRisk`:

  * `safe`
  * `low`
  * `medium`
  * `destructive`
  * `admin`
  * `network`
  * `secret-sensitive`
* Defines `CommandLifecycleState`.
* Defines `CommandDescriptor`.
* Defines extended `CommandResult` with lifecycle state and risk.

**Issues / notes:**

* This is a more complete domain model than `commands/runner.ts`.
* Potential structural mismatch: `commands/runner.ts` has its own `RiskLevel` with only three states.
* Potential dead/underused type: `CommandDescriptor` may be intended for future macro catalog work, but the current Ops catalog uses `OpsDeckItem` instead.
* Potential type-name conflict: this exports `CommandResult`, while runner also exports `CommandResult`. It aliases runner result internally, but imports elsewhere could get confusing.

**Recommended cleanup later:**

* Make `CommandRisk` the single source of truth for risk.
* Either move runner risk detection to return `CommandRisk`, or map runner risk to command-domain risk at the service boundary.
* Decide whether `CommandDescriptor` should replace or inform `OpsDeckItem`.

---

# Section 04 Findings

## Confirmed working structure

The mutation/execution path is real:

Clipboard text → command/file parser → preview/write plan → confirmation → `applyWrites()` or `streamCommandLine()` → command result/session/log output.

That supports the core RateLtd protocol.

## Highest-priority issues found

1. **Unchanged file writes still write to disk.**
   `applyWrites()` marks unchanged files but still calls `writeFileSync()`. This should be fixed to preserve mtimes and avoid meaningless file touches.
2. **Risk model is split.**
   `commands/runner.ts` uses `RiskLevel = safe | medium | destructive`, while `types/commands.ts` defines the richer `CommandRisk`. This should be unified.
3. **Clipboard destructive commands warn but do not hard-block.**
   The command extractor records warnings for destructive commands, but execution safety relies on the general confirmation flow. Consider stricter handling for destructive clipboard commands.
4. **No payload size guardrails.**
   File-write planning has no max files/content/diff size guard. Large clipboard payloads could degrade TUI responsiveness.
5. **Timeout/cancel results are flattened into exit code 1.**
   Runner supports timeout/cancel, but result metadata does not distinguish ordinary failure vs timeout vs cancellation.
6. **Process cancellation may not kill child process trees.**
   `child.kill()` kills the shell process, but not necessarily descendant processes. This matters for long-running dev servers or scripts.

## Dedupe / cleanup candidates from this section

* Rename `extractPowerShellCommands` to `extractShellCommands`.
* Collapse `RiskLevel` and `CommandRisk` into one model.
* Decide whether `processRunner.ts` is the public boundary and enforce imports accordingly.
* Decide whether `CommandDescriptor` should replace duplicated macro descriptor shapes.
* Add clipboard error handling boundary.

## Recommended small bugfix pass from this section

1. In `applyWrites()`, skip writing unchanged files.
2. Add file-write guard constants:

   * max files per payload
   * max bytes per file
   * max total bytes
   * max diff preview bytes
3. Add `timedOut?: boolean` and `cancelled?: boolean` to runner result or lifecycle wrapper.
4. Make `detectCommandRisk()` return the shared `CommandRisk`.
5. Add tests for file-write path escape, duplicate paths, unchanged no-write, fenced JSON parsing, destructive command warning, and runner timeout metadata.

# Section 05: Logging, Session Storage + Handoff Export

## Files read in this section

- `src/utils/logger.ts`
- `src/utils/runSession.ts`
- `src/persistence/logStore.ts`
- `src/persistence/sessionStore.ts`
- `src/services/loggingService.ts`

---

## `src/utils/logger.ts`

**Purpose:**  
Core local logging utility. It formats command results, saves command/session logs, appends JSONL event logs, and redacts sensitive data before writing or exporting.

**How it works:**

- Defines `AgentLogEvent` with:
    - `timestamp`
    - `level`
    - `event`
    - `repoRoot`
    - `screen`
    - `message`
    - `data`
- Writes logs under `<repoRoot>/.agent-logs`.
- `formatCommandResult()` redacts command, cwd, stdout, and stderr before creating a text log.
- `saveCommandResult()` writes a `.command.log.txt` file and appends a `command_result_saved` event.
- `formatRunSession()` formats a multi-step run session using `summarizeRunSession()` plus per-step command output.
- `saveRunSession()` writes a `.run.log.txt` file and appends a `run_session_saved` event.
- `appendAgentLog()` writes redacted JSON records to `.agent-logs/events.jsonl`.
- `redactForLog()` recursively redacts:
    - sensitive-looking keys
    - sensitive-looking string values
    - long strings over `6000` chars

**Issues / notes:**

- Good: redaction happens before JSONL write.
- Good: stdout/stderr tails are limited for event records.
- Good: command/session text logs are redacted too.
- Potential bug: `appendAgentLog()` uses sync filesystem writes without try/catch. If `.agent-logs` cannot be created or written, app actions that log may crash.
- Potential issue: redaction patterns are useful but incomplete by nature. They cover common Stripe/GitHub/Postgres/Bearer patterns, but cannot guarantee every secret shape.
- Potential issue: `repoRoot`, `cwd`, and `filePath` are not redacted by key unless their values match a sensitive pattern. Handoff packets may expose local absolute paths. That may be acceptable for Ivan’s local protocol, but it should be an intentional choice.
- Potential bug: `saveRunSession()` uses `safeLogName(session.name)` in the filename. Since session name can be a full command string, very long commands can produce long filenames and fail on Windows path-length limits.
- Potential issue: `redactForLog()` does not guard against circular objects. Logging simple JSON-like event data is fine, but a circular object would recurse until failure.
- Potential issue: `safeLogName()` replaces unsafe filename characters but does not trim length.

**Recommended fixes later:**

- Wrap log writes in safe logging helpers so failed logging does not crash command execution.
- Truncate saved session filenames.
- Consider redacting or relativizing absolute paths in handoff export mode.
- Add tests for redaction, long command filenames, and logging write failure behavior.

---

## `src/utils/runSession.ts`

**Purpose:**  
Defines the in-memory command run session model and summarization helpers.

**How it works:**

- `RunSessionStatus` can be:
    - `running`
    - `passed`
    - `failed`
    - `cancelled`
- `RunSession` includes:
    - `id`
    - `name`
    - `targetRoot`
    - `startedAt`
    - optional `finishedAt`
    - `status`
    - `steps`
- `createRunSession()` builds a running session with timestamp-based ID.
- `finishRunSession()`:
    - sets `finishedAt`
    - uses explicit status if provided
    - otherwise marks session `passed` if every step has `exitCode === 0`
    - otherwise marks session `failed`
- `summarizeRunSession()` produces a compact text summary with target, timestamps, step counts, and total duration.

**Issues / notes:**

- Simple and readable.
- Timestamp-based ID is probably fine locally, but not collision-proof.
- Empty sessions can become `passed` if `finishRunSession()` is called without explicit status because `[].every(...)` returns true. The current controller usually prevents empty command execution, but this helper itself allows it.
- No `timed-out` status, even though command runner supports timeouts. Timeout currently becomes an ordinary failed step.
- Session stores full `CommandResult` steps, so memory usage can grow if a command prints huge stdout/stderr. Controller caps session list to 50, but individual session output can still be large.

**Recommended fixes later:**

- Add `timed-out` to session status after runner metadata is improved.
- Make empty sessions finish as `failed` or `cancelled` unless explicitly passed.
- Add optional output truncation or max retained stdout/stderr per step for in-memory sessions.

---

## `src/persistence/logStore.ts`

**Purpose:**  
Reads JSONL event logs and exports model-usable handoff packets.

**How it works:**

- `readLogEvents()`:
    - reads `<repoRoot>/.agent-logs/events.jsonl`
    - returns latest `limit` parsed events
    - ignores malformed lines
    - redacts parsed event records again
- `exportHandoff()`:
    - reads last 100 events
    - selects recent command started/finished events
    - finds latest failure or command receipt
    - reads Git summary
    - builds a Markdown packet with:
        - generated timestamp
        - target path
        - target summary
        - Git status / diff stat
        - recent commands
        - latest failure / receipt
        - JSON log tail
    - redacts the final packet before returning
- `parseEvent()`:
    - parses one JSONL line
    - validates required fields
    - normalizes timestamp and level
    - redacts parsed event

**Issues / notes:**

- Good: malformed log lines do not crash the UI.
- Good: handoff packet exists and is Markdown/model-friendly.
- Good: handoff supports non-git targets with explicit unavailable message.
- Potential issue: latest failure logic is too broad:
    - it searches for `event.level === "error" || event.event === "command_finished"`.
    - That means a successful `command_finished` can be reported under “Latest Failure / Receipt.”
    - The heading says “Failure / Receipt,” so this may be intentional, but it is semantically muddy.
- Potential issue: handoff packet includes raw `Target: ${repoRoot}` and JSON event tail. Redaction may not remove normal local paths.
- Potential issue: `latestFailure.data` is stringified inside Markdown. If data is large, the handoff can balloon.
- Potential issue: `readLogEvents()` reads the entire JSONL file before slicing. Large event logs may slow down handoff generation.
- Potential issue: `getGitSummary(repoRoot)` is called during handoff export and may run sync Git commands depending on implementation. Need check `gitService.ts`.

**Recommended fixes later:**

- Rename “Latest Failure / Receipt” or split into:
    - Latest Failure
    - Latest Command Receipt
- Limit serialized `latestFailure.data`.
- Tail-read JSONL instead of reading entire file.
- Add handoff options/toggles later, as Codex already listed.

---

## `src/persistence/sessionStore.ts`

**Purpose:**  
Reads saved `.run.log.txt` session files from `.agent-logs`.

**How it works:**

- Looks under `<repoRoot>/.agent-logs`.
- Returns up to `limit` run log files.
- For each file, returns:
    - `filePath`
    - `name`
    - `updatedAt`
    - first 800 chars as `preview`
- Sorts newest first by filename.

**Issues / notes:**

- Simple and useful.
- `updatedAt` is derived from the first 19 characters of the filename, not actual file metadata.
- Reads preview from each file synchronously. Fine for 50 small logs, but could be slow with many large logs.
- Preview is not re-redacted here. The saved logs should already be redacted by `saveRunSession()`, but direct/manual files in `.agent-logs` would not be sanitized.
- This file does not appear in the visible controller imports from the fetched controller section. It may be unused or intended for later LoggerLtd session history.

**Recommended fixes later:**

- Use `statSync(filePath).mtime` for `updatedAt`.
- Redact preview defensively.
- Confirm usage. If unused, either wire it into LoggerLtd or remove it.

---

## `src/services/loggingService.ts`

**Purpose:**  
Service-layer boundary for logging utilities.

**How it works:**

- Imports logger utilities from `utils/logger.ts`.
- Defines `LogEventType` union:
    - `command.started`
    - `command.output`
    - `command.finished`
    - `command.failed`
    - `file.write`
    - `clipboard.parse`
    - `git.operation`
    - `app.error`
- Exposes `logRateLtdEvent()` as a wrapper around `appendAgentLog()`.
- Re-exports logger functions and types.

**Issues / notes:**

- This is mostly a pass-through boundary.
- `LogEventType` uses dot-style event names, while the actual logged events elsewhere use snake_case names like `command_started`, `file_write_planned`, `run_session_saved`, etc.
- That makes `LogEventType` currently inconsistent with real log events.
- It may be unused or future-facing.
- This is the same boundary pattern as `services/processRunner.ts`: service files wrap lower-level utilities.

**Recommended cleanup later:**

- Either standardize event naming to dot-style or remove/update `LogEventType`.
- Decide whether controller should import logging only from `services/loggingService.ts` instead of `utils/logger.ts`.
- If keeping `LogEventType`, make `AgentLogEvent.event` use it or a broader known-event union.

---

# Section 05 Findings

## Confirmed working structure

The logging/handoff path is real and protocol-aligned:

command/file actions → `appendAgentLog()` → `.agent-logs/events.jsonl` → `readLogEvents()` → `exportHandoff()` → model-ready Markdown handoff packet.

This directly supports the RateLtd loop: local execution becomes reusable ChatGPT context.

## Highest-priority issues found

1. **Logging failures can crash app flows.**  
    Most logging uses sync filesystem writes without local try/catch. If `.agent-logs` is unavailable, normal operations may fail unnecessarily.
2. **Long command names can create unsafe log filenames.**  
    `saveRunSession()` uses the full session name in the filename after character replacement, but does not truncate. Long command recipes can exceed Windows path limits.
3. **Session status lacks timeout distinction.**  
    Runner supports timeouts, but session status only supports `running | passed | failed | cancelled`. Timeout is collapsed into failed.
4. **Handoff can include too much raw event data.**  
    `latestFailure.data` and the JSON log tail are useful, but can become verbose. The packet needs size discipline.
5. **`LogEventType` does not match real event names.**  
    `loggingService.ts` defines dot-style events, but actual events are snake_case. This is structural drift.
6. **`sessionStore.ts` may be underused.**  
    It reads saved run logs, but the previously visible controller section did not import it. Verify when reading `OutputScreen.tsx`.

## Dedupe / cleanup candidates from this section

- Consolidate logging imports behind `services/loggingService.ts`.
- Align or remove `LogEventType`.
- Decide whether `.agent-logs` belongs in each target root or in a central RateLtd storage directory.
- Wire `sessionStore.ts` into LoggerLtd or remove it.
- Add a shared log filename helper with length truncation.

## Recommended small bugfix pass from this section

1. Add `safeAppendAgentLog()` or make `appendAgentLog()` fail-soft.
2. Truncate run-session filenames.
3. Add `timed-out` status after runner metadata supports it.
4. Limit handoff packet size.
5. Defensively redact session previews.
6. Align log event naming.

