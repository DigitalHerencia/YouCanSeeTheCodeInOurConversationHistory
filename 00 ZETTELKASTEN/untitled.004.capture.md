Prompt
# Prompt


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


## Prompt 1 — Brand Spine

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
- oldConfigDi
- newConfigDir

2. Add src/brand/asciiLogo.ts if banner/logo text currently lives inline.
3. Replace visible MeatHarness strings in UI with RateLtd equivalents.
4. Update terminal title and CLI help if present.
5. Add migration comments/doc where old config paths remain supported.

## Typed Screen Registry

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
1. Map existing screens:
- launcher/home -> LauncherLtd or RateLtd as appropriate
- workflows/commands -> CommanderLtd
- files -> EditorLtd
- sessions/logs/output -> LoggerLtd
- clipboard/writer -> CommanderLtd or DifferLtd integration path
- settings -> PreferLtd
- help -> HelpLtd

1. Update breadcrumbs and nav rendering to use registry.
2. Keep existing screen components rendering.

Input Router

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


## termcn Wrapper Layer

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
1. Add a dev-only termcn lab screen if low-risk.

App Shell Migration

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

1. Use local termcn wrappers where available.
2. Ensure every current screen renders inside shell.
3. Add empty state if no target repo exists.

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

1. Log all command results to existing .agent-logs/events.jsonl or current log store.

## LoggerLtd Real Sessions

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
- clipboard.arse
- git.operation
- app.error
1. Add LoggerLtd screen:
- sessions list
- run history
- command history
- selected run detail
- stdout/stderr viewer
- failed step focus
- copy/export handoff

6. Add retention settings hook if settings already exist.

DifferLtd Git Diff Workflow

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
1. Add src/features/diff parser/helpers as needed.
2. Add split diff renderer using termcn DiffView wrapper or local Ink fallback.
3. Add DifferLtd screen:
- changed files list
- staged/unstaged tabs
- selected file diff
- hunk navigation if feasible
- copy diff
- save patch
- stage/unstage/revert actions
1. Inspect local git-split-diffs repo if available. Use it only as reference/provider after checking license. Do not blindly vendor large code.

EditorLtd Real File Workflow

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
1. Add src/services/fileSystemService.ts:
- read file
- write file
- metadata
- safe root check
- binary detection
- large file guard
1. Add src/integrations/monaco/monacoAdapter.ts:
- adapter interface only
- external/companion launch command support
- no direct Ink render assumption
1. Add src/integrations/editor/externalEditorAdapter.ts.
2. Add EditorLtd screen:
- file search/list
- file preview
- edit buffer
- save/revert
- dirty state
- open external editor
- open Monaco companion when configured
1. Integrate file changes with DifferLtd.



This matches the documented decision that Monaco should be external/companion/adapter-based, not directly embedded in Ink.

## PowerShell Provider

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
 extracts comment-based help where possible
- does not execute scripts

5. Add CommanderLtd provider:
- list allowlisted scripts
- show metadata
- run only allowlisted scripts
- confirmation for medium/destructive/admin/network
1. Log all executions.


PowerShell must be a provider, not the app runtime, per the project decisions and risk register.

Prompt 11 — PreferLtd Settings + Migration

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
1. Add PreferLtd screen:
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
1. Wire theme setting into shell/theme registry.

## GitHub Workflow

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
1. Add GitHub panel to DifferLtd or CommanderLtd.
2. Add safety confirmations:
- commit
- push

- branch delete if ever added

- force push must be blocked unless explicitly enabled

## Diagnostics + HelpLtd

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


Implement:

1. Add src/services/diagnosticsService.ts.
2. Add health check registry.
3. Add HelpLtd screen:
- shortcuts
- screen guide
- troubleshooting
- command examples
- diagnostics link
1. Add diagnostics screen or HelpLtd diagnostics tab.
2. Add copy diagnostics action with redaction.

## Release Hardening

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

1. Add migration notes from MeatHarness to RateLtd.
2. Add vendor-notes.md:
- termcn
- lazywinadmin/PowerShell
- git-split-diffs
- monaco-editor
- license/usage decision
1. Run validation:
- pnpm typecheck
- pnpm test
- pnpm build if availabl
- pnpm verify if available
1. Fix failures that are in scope.

Deliver:

- final changed file list
- validation results
- known limitations
- next work package