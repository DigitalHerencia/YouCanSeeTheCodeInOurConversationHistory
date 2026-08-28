# Prompt 0 — Copy and Rename Harness

```text
You are working locally on Windows.

Objective:
Create RateLtd by copying the existing MeatHarness repo, preserving runtime behavior, then begin a safe user-facing rename.

Source repo:
D:\MeatHarness

Target repo:
D:\RateLtd

Rules:
- Do not delete D:\MeatHarness.
- Copy the repo first.
- Work only inside D:\RateLtd after copy.
- Preserve git history if possible; if not possible, clearly state why.
- Do not run destructive commands.
- Do not mock features.
- Do not remove existing MeatHarness behavior until equivalent RateLtd behavior exists.
- Use pnpm.
- Keep TypeScript strict.
- Do not introduce any unless unavoidable and documented.

Steps:
1. Copy D:\MeatHarness to D:\RateLtd.
2. Inspect package.json, pnpm-lock.yaml, tsconfig.json, README.md, src entrypoints, controller/state files, screen components, commands, utilities, and .agent-logs/events.jsonl.
3. Produce an inventory:
   - current scripts
   - current screens
   - current commands
   - current services/utilities
   - current persistence/log files
   - current validation commands
4. Identify the smallest safe first patch for RateLtd migration.
5. Do not make large edits yet unless required to make the copied repo launch.

Validation:
- pnpm install if needed
- pnpm typecheck if available
- pnpm test if available
- pnpm build if available
- pnpm dev or current launch command only if safe

Deliver:
- changed files
- commands run
- validation results
- next exact patch target
```

---

# Prompt 1 — Brand Spine

```text
Objective:
Create the RateLtd brand layer and migrate user-facing labels from MeatHarness to RateLtd without breaking runtime behavior.

Use this naming exactly:
- RateLtd
- LauncherLtd
- EditorLtd
- CommanderLtd
- DifferLtd
- LoggerLtd
- PreferLtd
- HelpLtd

Rules:
- Keep internal IDs stable if changing them risks breakage.
- Separate display names from internal screen IDs.
- Add compatibility notes for old .meatharness config/session paths.
- Do not rename files broadly unless necessary.
- Do not break existing launch/write/output/session flows.

Implement:
1. Add src/brand/rateLtd.ts with product constants:
   - productName
   - displayTitle
   - commandName
   - tagline
   - versionLabel
   - defaultTheme
   - oldConfigDir
   - newConfigDir
2. Add src/brand/asciiLogo.ts if banner/logo text currently lives inline.
3. Replace visible MeatHarness strings in UI with RateLtd equivalents.
4. Update terminal title and CLI help if present.
5. Add migration comments/doc where old config paths remain supported.

Validation:
- pnpm typecheck
- pnpm test if available
- launch smoke test if available

Deliver:
- file list
- exact visible rename coverage
- compatibility risks
```

---

# Prompt 2 — Typed Screen Registry

```text
Objective:
Introduce a typed RateLtd screen registry and map existing screens to RateLtd modules.

Architecture rules:
- Screen display names must be centralized.
- Do not use stringly typed screen names where a union can enforce valid values.
- Do not scatter navigation logic.
- Preserve current keyboard navigation.

Implement:
1. Add or update src/state/navigation.ts or src/state/appNavigation.ts.
2. Define:
   - ScreenId union
   - ScreenDisplayName map
   - navigation order
   - old-to-new screen alias map if needed
   - screen metadata: id, displayName, shortcut, description
3. Map existing screens:
   - launcher/home -> LauncherLtd or RateLtd as appropriate
   - workflows/commands -> CommanderLtd
   - files -> EditorLtd
   - sessions/logs/output -> LoggerLtd
   - clipboard/writer -> CommanderLtd or DifferLtd integration path
   - settings -> PreferLtd
   - help -> HelpLtd
4. Update breadcrumbs and nav rendering to use registry.
5. Keep existing screen components rendering.

Validation:
- pnpm typecheck
- existing nav tests if any
- manual launch smoke if possible

Deliver:
- changed files
- registry shape
- old/new route mapping
```

---

# Prompt 3 — Input Router

```text
Objective:
Centralize keyboard/input routing so RateLtd can safely support text entry, modals, command palette, destructive confirmations, and screen shortcuts.

Required priority:
1. Text-entry mode
2. Confirm dialog or modal
3. Screen-local shortcuts
4. Global navigation shortcuts
5. Global quit/help shortcuts

Rules:
- Global shortcuts must not fire while typing.
- Modal shortcuts override screen shortcuts.
- Destructive actions require confirmation.
- Escape/back behavior must be predictable.
- Long-running commands must support cancellation or safe ignore-after-navigation behavior.
- Avoid scattered useInput handlers in leaf components.

Implement:
1. Add src/state/inputModes.ts if missing.
2. Add src/controller/inputRouter.ts.
3. Define typed InputMode and InputRouteResult.
4. Move obvious global keyboard handling into inputRouter.
5. Preserve existing shortcuts:
   - arrows navigation
   - tab/shift-tab or left/right switching
   - Enter select
   - Ctrl+P command palette
   - ? help
   - q quit
   - cancel active command
6. Add tests for:
   - q ignored during text entry
   - modal receives Enter/Escape first
   - global help works outside input mode
   - destructive action requires confirm state

Validation:
- pnpm typecheck
- pnpm test

Deliver:
- changed files
- input priority implementation
- tests added
```

---

# Prompt 4 — termcn Wrapper Layer

```text
Objective:
Adopt termcn through a local wrapper layer without rewriting every screen immediately.

Rules:
- Inspect current Ink version and package.json first.
- Verify termcn package names and compatibility before installing.
- Some termcn templates may target OpenTUI; do not assume drop-in compatibility.
- Wrap termcn imports locally.
- Existing screens must not break.
- Preserve matrix theme.
- Add Vercel theme.
- Add fallback ASCII mode.

Implement:
1. Inspect termcn docs/packages already available locally or online only if accessible.
2. Add dependencies only after confirming compatibility.
3. Add src/ui/termcn/ with wrappers:
   - AppShell.tsx
   - Panel.tsx
   - Tabs.tsx
   - Menu.tsx
   - CommandPalette.tsx
   - DirectoryTree.tsx
   - DiffView.tsx
   - DataGrid.tsx
   - StatusMessage.tsx
   - Alert.tsx
   - Banner.tsx
   - ProgressBar.tsx
   - Confirm.tsx
   - Modal.tsx
   - NotificationCenter.tsx
4. If a termcn component is not Ink-compatible, implement a local Ink-compatible wrapper with the same local API and add a comment noting why.
5. Add src/brand/themes.ts with:
   - matrix
   - vercel
   - fallbackAscii
6. Add a dev-only termcn lab screen if low-risk.

Validation:
- pnpm install if package changes
- pnpm typecheck
- pnpm test
- launch smoke test

Deliver:
- dependency changes
- wrapper list
- compatibility notes
- screens touched
```

Termcn belongs behind wrappers because the project plan explicitly warns against direct dependency lock-in and OpenTUI/Ink compatibility assumptions.

---

# Prompt 5 — App Shell Migration

```text
Objective:
Move the root layout to a persistent RateLtd shell matching the mockups while preserving current screen rendering.

Required shell:
- RateLtd banner/logo
- target repo strip
- package manager/node version strip
- Git branch/status strip
- breadcrumbs
- active job indicator
- notifications
- command palette hint
- help hint
- version label
- status bar

Rules:
- App composition wires the tree only.
- Controller owns state and derived UI state.
- Reusable components are presentational.
- No filesystem/process side effects inside presentational components.
- Keep narrow terminal fallback.

Implement:
1. Add/update src/app/AppShell.tsx.
2. Move shell metadata into selectors where appropriate.
3. Add responsive layout mode:
   - wide
   - medium
   - narrow
4. Use local termcn wrappers where available.
5. Ensure every current screen renders inside shell.
6. Add empty state if no target repo exists.

Validation:
- pnpm typecheck
- launch smoke
- test narrow width if possible

Deliver:
- changed files
- shell data source
- responsive behavior
```

---

# Prompt 6 — CommanderLtd Functional Core

```text
Objective:
Build CommanderLtd as the command execution module with real package-script, Git, shell, and workflow command execution.

Rules:
- No mocked commands.
- Use typed command descriptors.
- Every run must produce command lifecycle state.
- Every run must log result metadata.
- Risk labels required.
- Destructive/admin/network/secret-sensitive commands require confirmation.
- Prevent orphaned processes.
- Support cancellation.

Implement:
1. Add src/types/commands.ts:
   - CommandRisk
   - CommandLifecycleState
   - CommandDescriptor
   - CommandResult
2. Add src/services/processRunner.ts:
   - child process execution
   - cwd
   - stdout/stderr streaming
   - timeout
   - cancellation
   - exit code
   - duration
3. Add package script provider from package.json.
4. Add Git provider:
   - git status
   - git diff --stat
   - git branch
5. Add shell command provider with confirmation.
6. Add CommanderLtd screen:
   - command catalog
   - search/filter
   - risk labels
   - selected command detail
   - run/cancel/retry
   - streaming output panel
7. Log all command results to existing .agent-logs/events.jsonl or current log store.

Validation:
- pnpm typecheck
- unit tests for processRunner using safe echo/node commands
- manual run of safe package script

Deliver:
- changed files
- command providers
- safety behavior
- validation output
```

---

# Prompt 7 — LoggerLtd Real Sessions

```text
Objective:
Make LoggerLtd the first-class screen for sessions, command history, run history, stdout/stderr, failed step focus, and export handoff.

Rules:
- Preserve .agent-logs/events.jsonl.
- Logs stay machine-readable.
- Add redaction for secrets.
- Do not expose raw secrets in handoffs.
- Do not delete old logs.

Implement:
1. Add log event schema.
2. Add src/services/loggingService.ts.
3. Add src/persistence/logStore.ts and sessionStore.ts if missing.
4. Support event types:
   - command.started
   - command.output
   - command.finished
   - command.failed
   - file.write
   - clipboard.parse
   - git.operation
   - app.error
5. Add LoggerLtd screen:
   - sessions list
   - run history
   - command history
   - selected run detail
   - stdout/stderr viewer
   - failed step focus
   - copy/export handoff
6. Add retention settings hook if settings already exist.

Validation:
- pnpm typecheck
- tests for append/read JSONL
- tests for redaction

Deliver:
- changed files
- log schema
- compatibility notes
```

---

# Prompt 8 — DifferLtd Git Diff Workflow

```text
Objective:
Build DifferLtd with real Git status, changed files, staged/unstaged views, split diff, unified fallback, stage/unstage/revert, and patch export.

Rules:
- Do not mock Git output.
- Use git CLI through typed service.
- Handle non-git repos gracefully.
- Handle binary/new/deleted/renamed/large files.
- Revert requires confirmation.
- Stage/unstage must log operations.

Implement:
1. Add src/services/gitService.ts:
   - status porcelain parser
   - branch info
   - changed files
   - diff by file
   - staged diff
   - unstaged diff
   - stage file
   - unstage file
   - revert file with confirmation
2. Add src/features/diff parser/helpers as needed.
3. Add split diff renderer using termcn DiffView wrapper or local Ink fallback.
4. Add DifferLtd screen:
   - changed files list
   - staged/unstaged tabs
   - selected file diff
   - hunk navigation if feasible
   - copy diff
   - save patch
   - stage/unstage/revert actions
5. Inspect local git-split-diffs repo if available. Use it only as reference/provider after checking license. Do not blindly vendor large code.

Validation:
- pnpm typecheck
- tests for status parser/diff parser
- manual smoke in a test repo with changed files

Deliver:
- changed files
- Git commands used
- edge cases handled
```

---

# Prompt 9 — EditorLtd Real File Workflow

```text
Objective:
Build EditorLtd as a real file preview/edit workflow with external editor and Monaco companion adapter path.

Important:
Monaco is browser-based and cannot render directly inside pure Ink. Implement an adapter-based workflow:
- terminal-native preview/edit fallback
- external editor launch
- optional Monaco companion command/path

Rules:
- No fake Monaco panel.
- Do not bundle Monaco into core TUI unless explicitly selected.
- Enforce safe root boundaries.
- Detect binary/large/read-only files.
- Track dirty buffers.
- Prevent overwrite conflicts.

Implement:
1. Add src/types/editor.ts:
   - EditorBuffer
   - EditorAdapter
   - EditorOpenResult
   - SaveConflict
2. Add src/services/fileSystemService.ts:
   - read file
   - write file
   - metadata
   - safe root check
   - binary detection
   - large file guard
3. Add src/integrations/monaco/monacoAdapter.ts:
   - adapter interface only
   - external/companion launch command support
   - no direct Ink render assumption
4. Add src/integrations/editor/externalEditorAdapter.ts.
5. Add EditorLtd screen:
   - file search/list
   - file preview
   - edit buffer
   - save/revert
   - dirty state
   - open external editor
   - open Monaco companion when configured
6. Integrate file changes with DifferLtd.

Validation:
- pnpm typecheck
- tests for safe root and save conflict
- manual open/read/write on test file

Deliver:
- changed files
- editor adapter design
- Monaco limitation handled
```

This matches the documented decision that Monaco should be external/companion/adapter-based, not directly embedded in Ink.

---

# Prompt 10 — PowerShell Provider

```text
Objective:
Add PowerShell provider for CommanderLtd using downloaded lazywinadmin PowerShell scripts safely.

Local source material:
D:\SadDull
D:\MeatHarness
Any downloaded lazywinadmin/PowerShell repo under those roots

Rules:
- Do not run unreviewed downloaded scripts.
- Inventory first.
- Capture license/source metadata.
- Classify risk.
- Add allowlist.
- Prefer pwsh.
- Fall back to powershell.exe only when needed.
- Capture stdout, stderr, warning, verbose, debug, and information streams where possible.
- Detect admin/elevation requirement.
- Detect module dependencies.
- Long-running commands need timeout/cancel.
- No arbitrary script execution without explicit review.

Implement:
1. Add src/integrations/powershell/scriptInventory.ts.
2. Add src/services/powershellService.ts.
3. Add PowerShell command manifest schema:
   - id
   - name
   - sourcePath
   - description
   - parameters
   - examples
   - requiredModules
   - requiresAdmin
   - risk
   - allowlisted
   - license/source
4. Add script inventory command:
   - scans configured vendor folders
   - extracts comment-based help where possible
   - does not execute scripts
5. Add CommanderLtd provider:
   - list allowlisted scripts
   - show metadata
   - run only allowlisted scripts
   - confirmation for medium/destructive/admin/network
6. Log all executions.

Validation:
- pnpm typecheck
- tests for metadata extraction
- safe PowerShell version command only:
  pwsh -NoProfile -Command "$PSVersionTable.PSVersion"

Deliver:
- changed files
- manifest format
- safety gates
- scripts inventoried count
```

PowerShell must be a provider, not the app runtime, per the project decisions and risk register.

---

# Prompt 11 — PreferLtd Settings + Migration

```text
Objective:
Build PreferLtd settings with versioned .rateltd config and migration bridge from .meatharness.

Rules:
- Do not break old settings.
- Validate settings.
- Recover broken settings.
- Support global/local/workspace overrides where current architecture allows.
- Store theme, safety, editor, diff, PowerShell, logs, startup screen.

Implement:
1. Add src/schemas/settings.ts.
2. Add src/types/settings.ts.
3. Add src/services/settingsService.ts.
4. Add src/persistence/settingsStore.ts.
5. Support:
   - .rateltd/settings.json
   - migration from .meatharness/settings.json
   - version field
   - defaults
   - validation
   - broken settings recovery
6. Add PreferLtd screen:
   - General
   - Sessions
   - Clipboard
   - Safety
   - Appearance
   - Profiles
   - PowerShell
   - Git
   - Editor
   - Diff
7. Wire theme setting into shell/theme registry.

Validation:
- pnpm typecheck
- settings migration tests
- invalid JSON recovery test

Deliver:
- changed files
- settings schema
- migration behavior
```

---

# Prompt 12 — GitHub Workflow

```text
Objective:
Add practical GitHub workflow support through GitHub CLI/API adapter.

Rules:
- Detect GitHub remote first.
- Detect gh availability.
- Detect gh auth status.
- Do not push/commit without confirmation.
- Prevent wrong-branch commit/push.
- Do not expose secrets.
- Log operations.

Implement:
1. Add src/services/githubService.ts or src/integrations/github/githubCliAdapter.ts.
2. Support:
   - detect remote
   - parse owner/repo
   - gh auth status
   - current branch PR
   - PR checks
   - CI status if available
   - generate PR description from diff
   - generate commit message from staged diff
   - create branch
   - commit staged changes
   - push branch with confirmation
   - open PR
3. Add GitHub panel to DifferLtd or CommanderLtd.
4. Add safety confirmations:
   - commit
   - push
   - branch delete if ever added
   - force push must be blocked unless explicitly enabled

Validation:
- pnpm typecheck
- adapter tests using mocked process runner
- safe gh --version command only if gh installed

Deliver:
- changed files
- GitHub commands implemented
- safety behavior
```

---

# Prompt 13 — Diagnostics + HelpLtd

```text
Objective:
Build diagnostics and HelpLtd surfaces so broken setup can be fixed inside RateLtd.

Implement real checks:
- Node version
- pnpm version
- Git availability
- PowerShell availability
- GitHub CLI availability
- termcn package availability
- config file validity
- session/log storage
- target repo permissions
- terminal width/height
- glyph support fallback
- package scripts
- workspace validation

Rules:
- No fake green checks.
- Every diagnostic returns typed severity:
  info | warning | error | fatal
- Include fix actions where safe.
- Safe mode and recovery mode must be represented in startup args or settings if feasible.

Implement:
1. Add src/services/diagnosticsService.ts.
2. Add health check registry.
3. Add HelpLtd screen:
   - shortcuts
   - screen guide
   - troubleshooting
   - command examples
   - diagnostics link
4. Add diagnostics screen or HelpLtd diagnostics tab.
5. Add copy diagnostics action with redaction.

Validation:
- pnpm typecheck
- diagnostics tests with mocked dependencies
- manual diagnostics run

Deliver:
- changed files
- checks implemented
- false-positive risks
```

---

# Prompt 14 — Release Hardening

```text
Objective:
Harden RateLtd for daily local use.

Rules:
- No claims of passing validation unless commands were actually run.
- Do not skip failing tests silently.
- Preserve all implemented functionality.
- Fix type/lint/test failures caused by current work.
- Do not start broad rewrites.

Implement:
1. Ensure scripts exist:
   - typecheck
   - test
   - lint if configured
   - build if configured
   - verify
2. Add or update README:
   - install
   - run
   - screens
   - keyboard shortcuts
   - settings
   - PowerShell provider safety
   - Monaco adapter reality
   - Git/GitHub workflow
3. Add migration notes from MeatHarness to RateLtd.
4. Add vendor-notes.md:
   - termcn
   - lazywinadmin/PowerShell
   - git-split-diffs
   - monaco-editor
   - license/usage decision
5. Run validation:
   - pnpm typecheck
   - pnpm test
   - pnpm build if available
   - pnpm verify if available
6. Fix failures that are in scope.

Deliver:
- final changed file list
- validation results
- known limitations
- next work package
```

---

## One-Shot Mega Prompt, only if you insist

Use this only after copying `D:\MeatHarness` to `D:\RateLtd`.

```text
You are Codex working in D:\RateLtd.

Build RateLtd from the existing MeatHarness Ink/TypeScript TUI.

RateLtd is a full local operator console, not a mock CLI. It must remain TypeScript/Node/Ink with pnpm. Use termcn through local wrappers. Use PowerShell, Monaco, git-split-diffs, and GitHub through adapters/providers. Do not replace the TypeScript core with PowerShell. Do not pretend Monaco renders inside Ink; support external/companion/adapter workflows.

Required product modules:
- LauncherLtd: workspace launcher, target repo picker, recent targets/sessions
- RateLtd: dashboard and operational overview
- EditorLtd: file preview/edit, external editor, Monaco companion adapter
- CommanderLtd: package scripts, Git commands, PowerShell provider, command runner
- DifferLtd: Git diff, split diff, staged/unstaged review, patch/writer review
- LoggerLtd: sessions, run history, command logs, stdout/stderr, exports
- PreferLtd: settings, profiles, themes, safety config
- HelpLtd: shortcuts, troubleshooting, docs, diagnostics

Hard rules:
- No mocked/simulated features.
- No unsafe destructive commands without confirmation.
- No unreviewed PowerShell script execution.
- No global shortcuts while typing.
- Preserve old .meatharness compatibility while adding .rateltd.
- Preserve existing behavior unless replacing it with working RateLtd behavior.
- Use discriminated unions for screens, input modes, command lifecycle, modal state, workflow state, result state.
- Use typed result objects.
- Keep CLI/App/Controller/Screen/UI/Service boundaries clean.
- Do not scatter useInput handlers.
- Log command/file/git/settings/clipboard events.
- Redact secrets in exported logs.
- Validate after every coherent patch.

Execution order:
1. Inventory repo.
2. Add brand constants and visible RateLtd rename.
3. Add typed screen registry.
4. Add input router.
5. Add termcn wrapper layer and theme registry.
6. Migrate app shell.
7. Implement CommanderLtd command registry and process runner.
8. Implement LoggerLtd sessions/logs.
9. Implement DifferLtd Git/diff workflow.
10. Implement EditorLtd file workflow and editor adapters.
11. Implement PowerShell provider inventory/manifest/allowlist/execution.
12. Implement PreferLtd settings/migration.
13. Implement diagnostics and HelpLtd.
14. Add GitHub CLI adapter.
15. Harden README, vendor notes, validation scripts.

At each step:
- inspect files before editing
- make smallest safe patch
- run available validation
- report changed files and commands
- stop if blocked by missing dependency, incompatible package, or failing validation that needs user decision
```

The full feature universe is huge, but it is already sequenced into phases/work packages, so Codex should build it as an ordered system instead of improvising.