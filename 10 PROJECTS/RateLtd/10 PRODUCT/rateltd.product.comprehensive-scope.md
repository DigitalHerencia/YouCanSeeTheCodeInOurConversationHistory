## 0. Core vision

You want to turn the existing Ink/TypeScript TUI harness into a branded, full-capability local operator console called **RateLtd**, using:

- **termcn** as the UI component/design system foundation.
    
- Existing local downloaded repos in `D:\SadDull` as source material.
    
- The renamed existing TUI codebase as the implementation target.
    
- Codex as the heavy implementation worker once the scaffold and mega prompt are ready.
    
- A modular screen/function naming system:
    
    - `LauncherLtd`
        
    - `RateLtd`
        
    - `EditorLtd`
        
    - `CommanderLTD`
        
    - `DifferLTD`
        
    - `LoggerLTD`
        
    - `PreferLTD`
        

The goal is not a small CLI. The goal is a **repo-agnostic terminal command center** for coding, editing, command execution, file management, Git/GitHub workflows, logs, diagnostics, and agent-assisted repo operations.

The project sources already define this as a TypeScript/Ink terminal UI harness using pnpm, and they require clean separation across CLI, app composition, controller/state, screens, reusable components, and utilities. The existing TUI guidance also specifically calls out keyboard-driven interaction, process lifecycle, async command state, stdout/stderr behavior, and terminal layout constraints as first-class concerns.

---

## 1. Brand and product rename scope

- Rename visible UI labels from MeatHarness to RateLtd.
    
- Rename banner/logo copy.
    
- Update README, package metadata, CLI help, terminal title, and splash screens.
    
- Add brand constants:
    
    - product name
        
    - version label
        
    - display title
        
    - command name
        
    - tagline
        
    - default theme
        
    - workspace config folder name
        

### Naming convention mapping

Your proposed naming map becomes the product taxonomy:

| Name           | Intended role                                                  |
| -------------- | -------------------------------------------------------------- |
| `LauncherLtd`  | file tree / workspace launcher / target repo selector          |
| `RateLtd`      | main dashboard / home / operational overview                   |
| `EditorLtd`    | editor surface, likely Monaco-backed or editor-adapter-backed  |
| `CommanderLtd` | PowerShell command runner / command catalog / execution engine |
| `DifferLtd`    | Git diff / split diff / writer review flow                     |
| `LoggerLtd`    | logs, run history, sessions, telemetry, debug trail            |
| `PreferLtd`    | settings, preferences, profiles, theme/config                  |

### Follow up tasks

- Create `src/brand/rateLtd.ts` or similar.
    
- Create route/screen IDs that are stable and typed:
    
    - `launcher`
        
    - `dashboard`
        
    - `editor`
        
    - `commander`
        
    - `differ`
        
    - `logger`
        
    - `prefer`
        
- Keep display names separate from internal screen IDs.
    
- Create a migration layer from old screen names to new screen names.
    

---

## 2. termcn adoption scope

Use termcn UI components to redesign screens and make the original mockups real.

You listed termcn docs for:

- installation
    
- Vercel theme
    
- app shell
    
- bullet list
    
- help screen
    
- info box
    
- login flow
    
- setup flow
    
- splash screen
    
- usage monitor
    
- welcome screen
    
- aspect ratio
    
- markdown
    
- box
    
- center
    
- columns
    
- divider
    
- grid
    
- scroll view
    
- spacer
    
- stack
    
- code blocks
    
- diff view
    
- directory tree
    
- git status
    
- JSON
    
- command palette
    
- tabs
    
- menu
    
- multiselect
    
- select
    
- checkbox
    
- data grid
    
- status message
    
- alert
    
- banner
    
- multi progress
    
- progress bar
    
- clipboard
    
- log
    
- panel
    
- embedded terminal
    
- error boundary
    
- file change
    
- streaming text
    
- chat thread
    
- keyboard shortcuts
    
- clock
    
- wizard
    
- confirm
    
- file picker
    
- tooltip
    
- notification center
    
- dialog
    
- modal
    
- drawer
    

### termcn installation and compatibility

- Inspect current `package.json`.
    
- Identify current Ink version.
    
- Verify termcn package names and peer dependencies.
    
- Add termcn packages.
    
- Add any required React/Ink dependencies.
    
- Confirm whether termcn components are pure Ink, OpenTUI, or mixed.
    
- Separate Ink-compatible components from OpenTUI-only templates.
    
- Build an adapter layer if termcn APIs do not match the current app shape.
    

### termcn theme adoption

- Add Vercel theme as a named theme.
    
- Preserve or replace existing matrix theme.
    
- Add theme registry:
    
    - `matrix`
        
    - `vercel`
        
    - possible future themes
        
- Store theme selection in settings.
    
- Allow theme switching from `PreferLTD`.
    
- Make theme tokens available to all components:
    
    - border colors
        
    - accent colors
        
    - danger/warning/success/info
        
    - muted text
        
    - panel title colors
        
    - selected state
        
    - focused state
        
    - disabled state
        

### termcn component wrappers

Create local wrappers instead of scattering vendor imports everywhere:

```txt
src/ui/termcn/
  AppShell.tsx
  Box.tsx
  Panel.tsx
  Tabs.tsx
  Menu.tsx
  CommandPalette.tsx
  DirectoryTree.tsx
  DiffView.tsx
  DataGrid.tsx
  GitStatus.tsx
  Markdown.tsx
  CodeBlock.tsx
  StatusMessage.tsx
  Alert.tsx
  Banner.tsx
  ProgressBar.tsx
  MultiProgress.tsx
  Clipboard.tsx
  LogView.tsx
  EmbeddedTerminal.tsx
  ErrorBoundary.tsx
  FileChange.tsx
  StreamingText.tsx
  ChatThread.tsx
  KeyboardShortcuts.tsx
  Clock.tsx
  Wizard.tsx
  Confirm.tsx
  FilePicker.tsx
  Modal.tsx
  Dialog.tsx
  Drawer.tsx
  NotificationCenter.tsx
```

### Component-by-component adoption

Use termcn components for:

- top-level app shell
    
- layout grid
    
- dashboard panels
    
- selectable menus
    
- command palette
    
- file tree
    
- diff viewer
    
- code preview
    
- log viewer
    
- progress states
    
- forms/wizards
    
- settings sections
    
- modal confirmations
    
- help overlay
    
- notifications
    
- command output streaming
    
- AI file change preview
    

### Follow-up tasks

- Determine which current custom components become obsolete.
    
- Deprecate old `Panel`, `Banner`, `NavigationTabs`, etc. only after termcn wrappers are stable.
    
- Avoid direct dependency lock-in by creating wrapper components.
    
- Add snapshot/demo screens for each termcn component.
    
- Add a `termcn-lab` or dev-only screen to test components quickly.
    
- Validate narrow terminal behavior.
    
- Validate Windows Terminal rendering.
    
- Validate PowerShell glyph/icon behavior.
    
- Add fallback ASCII mode for broken glyph environments.
    

---

## 3. App shell redesign scope

Redesign screens based on user flows for:

- code editing
    
- running commands
    
- GitHub and diffs
    
- file system management
    
- TUI housekeeping
    
- troubleshooting
    

### Persistent global shell

Every screen should share:

- RateLtd banner / logo
    
- target repo strip
    
- package manager/node version strip
    
- Git branch/status strip
    
- current screen breadcrumbs
    
- command palette hint
    
- help hint
    
- status indicator
    
- version label
    
- active job indicator
    
- notifications
    

### Top-level navigation

Likely screens:

```txt
LauncherLtd / RateLtd / EditorLtd / CommanderLTD / DifferLTD / LoggerLTD / PreferLTD / Help
```

### Global keyboard layer

- Arrow navigation
    
- Tab/shift-tab area switching
    
- Enter/select
    
- Escape/back
    
- Ctrl+P command palette
    
- `?` help
    
- `q` quit
    
- screen shortcuts
    
- modal priority
    
- text-entry priority
    
- command cancellation
    
- destructive-action confirmation
    

The project TUI guide specifically warns that input bugs are the most common TUI architecture failure and recommends a central priority order for text entry, modals, screen shortcuts, global navigation, and quit/help.

### Responsive terminal layout

- Wide layout: multi-column dashboard.
    
- Medium layout: two-column layout.
    
- Narrow layout: single-column stacked cards.
    
- Scrollable panels where needed.
    
- Consistent truncation.
    
- No layout dependent on browser CSS assumptions.
    
- Preserve usability in Windows Terminal.
    

---

## 4. Architecture refactor scope

Fix architecture of TUI using a modern folder structure optimized for TypeScript.

### Expanded architecture goal

Move toward a clean layered structure:

```txt
src/
  cli/
  app/
  brand/
  config/
  controller/
  state/
  screens/
  features/
  components/
  ui/
  commands/
  services/
  adapters/
  integrations/
  utils/
  types/
  schemas/
  workflows/
  persistence/
  telemetry/
  test/
```

Possible concrete structure:

```txt
src/
  cli/
    main.ts
    parseArgs.ts
    boot.ts

  app/
    App.tsx
    AppProviders.tsx
    AppShell.tsx

  brand/
    rateLtd.ts
    asciiLogo.ts
    themes.ts

  state/
    appTypes.ts
    appReducer.ts
    appActions.ts
    appSelectors.ts
    inputModes.ts
    navigation.ts

  controller/
    useRateLtdController.ts
    inputRouter.ts
    commandController.ts
    sessionController.ts

  screens/
    LauncherLtd/
    RateLtd/
    EditorLtd/
    CommanderLTD/
    DifferLTD/
    LoggerLTD/
    PreferLTD/
    HelpLtd/

  features/
    workspace/
    files/
    git/
    github/
    powershell/
    editor/
    diff/
    writer/
    sessions/
    clipboard/
    diagnostics/
    settings/
    notifications/

  integrations/
    termcn/
    monaco/
    powershell/
    gitSplitDiffs/
    github/
    codex/

  services/
    processRunner.ts
    fileSystemService.ts
    gitService.ts
    packageManagerService.ts
    powershellService.ts
    sessionService.ts
    loggingService.ts
    settingsService.ts

  persistence/
    settingsStore.ts
    sessionStore.ts
    recentTargetsStore.ts
    logStore.ts

  ui/
    primitives/
    termcn/
    layout/
    feedback/
    data/
    forms/
```

### Architecture tasks

- Rename old MeatHarness types to RateLtd types.
    
- Introduce a typed screen registry.
    
- Introduce typed command registry.
    
- Introduce typed workflow registry.
    
- Replace loose boolean UI state with discriminated unions.
    
- Centralize input routing.
    
- Centralize command execution lifecycle.
    
- Centralize session/log persistence.
    
- Separate presentational components from file/process side effects.
    
- Create adapter interfaces for external projects:
    
    - termcn
        
    - PowerShell scripts
        
    - Monaco
        
    - git-split-diffs
        
- Add typed result contracts:
    
    - `Result<T>`
        
    - `CommandResult`
        
    - `WorkspaceResult`
        
    - `FileOperationResult`
        
    - `GitOperationResult`
        
    - `EditorOperationResult`
        
- Add validation schemas where JSON/config/clipboard payloads are involved.
    

---

## 5. LauncherLtd scope



`LauncherLtd - termcn filetree`

## Primary role

Workspace launcher, target repo browser, recent targets, session picker.

## Features

- File picker for selecting target repo.
    
- Directory tree browsing.
    
- Recent repo list.
    
- Recent session list.
    
- Last target quick start.
    
- Manual path entry.
    
- Workspace validation.
    
- Profile detection.
    
- Package manager detection.
    
- Git repo detection.
    
- Node/pnpm version detection.
    
- “Open target” flow.
    
- “Create session” flow.
    
- “Continue previous session” flow.
    

## termcn components likely involved

- App shell
    
- Directory tree
    
- File picker
    
- Select
    
- Menu
    
- Data grid
    
- Info box
    
- Status message
    
- Alert
    
- Wizard
    
- Confirm
    
- Scroll view
    

## Hidden tasks

- Path normalization for Windows.
    
- UNC/path-with-spaces support.
    
- Root boundary protection.
    
- Permission error handling.
    
- Missing repo state.
    
- Non-Node repo support.
    
- Static/docs profile support.
    
- Multi-profile support.
    
- Persist recent targets.
    
- Persist recent sessions.
    
- Detect monorepos.
    
- Detect workspaces:
    
    - pnpm workspace
        
    - npm workspace
        
    - yarn workspace
        
    - turborepo
        
    - nx
        
- Detect package scripts.
    
- Detect Git root separately from selected folder.
    
- Detect dirty state.
    
- Add workspace health score.
    

---

# 6. RateLtd dashboard scope



`RateLtd - dashboard`

## Primary role

The main home screen / operational overview.

## Features

- Target repo summary.
    
- Git status summary.
    
- Last verification result.
    
- Last command result.
    
- Recent sessions.
    
- Clipboard intake state.
    
- Recommended next actions.
    
- Quick action cards.
    
- Active job status.
    
- Notifications.
    
- Environment strip:
    
    - node
        
    - pnpm
        
    - package name
        
    - branch
        
    - dirty/clean state
        
    - target path
        

## Dashboard action cards

- Verify workspace.
    
- Open LauncherLtd.
    
- Open EditorLtd.
    
- Open CommanderLTD.
    
- Open DifferLTD.
    
- Open LoggerLTD.
    
- Open PreferLTD.
    
- Paste/parse clipboard.
    
- Run command palette.
    
- Open help.
    

## Hidden tasks

- Dashboard data aggregation service.
    
- Derived state selectors.
    
- Empty state for no target selected.
    
- Error state if repo unreadable.
    
- Stale data refresh.
    
- Background refresh cadence.
    
- Manual refresh action.
    
- Job state integration.
    
- Health score.
    
- Warnings:
    
    - dirty repo
        
    - missing dependencies
        
    - outdated lockfile
        
    - package manager mismatch
        
    - failing tests
        
    - uncommitted generated files
        
    - unsupported Node version
        
- “Recommended next action” engine.
    

---

# 7. EditorLtd scope



`EditorLtd - monaco`

You want a new text editor using Monaco, “maybe.”

## Reality of integration

Monaco is a browser editor. Ink is a terminal React renderer. It is not directly plug-and-play inside a pure terminal UI.

## Expanded implementation options

### Option A — external Monaco companion app

- TUI launches local web editor.
    
- Monaco runs in browser/Electron/Tauri/webview.
    
- TUI controls target file/session.
    
- Editor saves files back to repo.
    
- TUI displays status and previews.
    

### Option B — embedded terminal editor fallback

- Use terminal-native editor behavior:
    
    - text preview
        
    - line-based editing
        
    - patch editing
        
    - open in external editor
        
- Monaco is not embedded, but TUI can orchestrate it.
    

### Option C — hybrid

- TUI has preview/write workflow.
    
- Monaco opens when full editing is needed.
    
- TUI remains command center.
    

## EditorLtd features

- File open.
    
- File preview.
    
- Syntax-highlighted code blocks.
    
- Search within file.
    
- Edit buffer.
    
- Unsaved changes state.
    
- Save file.
    
- Save as.
    
- Open in external editor.
    
- Open in Monaco companion.
    
- Show diagnostics.
    
- Show file metadata.
    
- Show recent files.
    
- Show AI proposed changes.
    
- Apply patch.
    
- Revert file.
    
- Compare current buffer to disk.
    
- Detect external changes.
    
- Prevent overwrite conflicts.
    

## Hidden tasks

- Editor adapter interface.
    
- File buffer model.
    
- Dirty buffer tracking.
    
- Encoding handling.
    
- Large file handling.
    
- Binary file detection.
    
- Readonly files.
    
- Symlink handling.
    
- File watcher.
    
- Save conflict resolution.
    
- External editor command config.
    
- Monaco dev server or static web app.
    
- Secure local server binding.
    
- Workspace trust model.
    
- Cross-platform open command.
    
- Editor command registry.
    
- AI write preview integration.
    

---

# 8. CommanderLTD scope



`CommanderLTD - powershell`

Use the robust library of `lazywinadmin/PowerShell` commands to supercharge the TUI, maybe replacing all internal commands.

## Primary role

Command execution, PowerShell task catalog, workflow runner, shell integration.

## Important distinction

The PowerShell repo should not blindly replace all internal commands. The better architecture is:

- keep RateLtd core orchestration in TypeScript
    
- expose PowerShell scripts as command providers
    
- wrap scripts in typed command definitions
    
- classify risk
    
- capture stdout/stderr/exit code
    
- present results in TUI
    

## Features

- Command catalog.
    
- Script discovery.
    
- PowerShell module/script index.
    
- Command search.
    
- Run selected command.
    
- Run package scripts.
    
- Run Git commands.
    
- Run verification workflow.
    
- Run custom macros.
    
- Run shell command with confirmation.
    
- Streaming output.
    
- Cancel command.
    
- Save output log.
    
- Copy output.
    
- Retry command.
    
- View command history.
    
- Mark commands safe/medium/destructive.
    
- Command dry-run/preview where possible.
    

## PowerShell-specific tasks

- Inventory downloaded `lazywinadmin/PowerShell` scripts.
    
- Classify scripts:
    
    - safe read-only
        
    - local system read
        
    - file mutation
        
    - network/system mutation
        
    - destructive/admin
        
- Extract script metadata:
    
    - name
        
    - description
        
    - parameters
        
    - examples
        
    - required modules
        
    - admin requirement
        
    - output type
        
- Build a PowerShell command manifest.
    
- Add script sandbox/allowlist.
    
- Add execution policy handling.
    
- Use `pwsh` first, fallback to Windows PowerShell if needed.
    
- Handle quoted paths.
    
- Handle long-running commands.
    
- Handle prompts/interactivity.
    
- Handle credentials securely.
    
- Capture streams:
    
    - stdout
        
    - stderr
        
    - warning
        
    - verbose
        
    - debug
        
    - information
        
- Normalize output into structured results when possible.
    
- Add timeout support.
    
- Add cancellation via child process kill.
    
- Add command transcript logging.
    

## Hidden tasks

- Security/risk gate.
    
- Confirmation for destructive commands.
    
- Admin elevation detection.
    
- “Cannot elevate inside TUI” handling.
    
- PowerShell availability check.
    
- Version check.
    
- Module dependency check.
    
- Script signing/trust warning.
    
- Profile isolation.
    
- Prevent random downloaded scripts from running without review.
    
- Add `CommanderLTD` provider interface:
    
    - package scripts provider
        
    - git provider
        
    - powershell provider
        
    - custom macro provider
        
    - codex/agent provider later
        

---

# 9. DifferLTD scope



`DifferLTD - git-split-diffs`

Add git diff with `git-split-diffs`, better diff for writer/GitHub workflow.

## Primary role

Diff review, patch inspection, Git change management, AI write review.

## Features

- Git status.
    
- Changed files list.
    
- Staged/unstaged tabs.
    
- File diff preview.
    
- Split diff view.
    
- Unified diff fallback.
    
- Word-level diff.
    
- Hunk navigation.
    
- Stage file.
    
- Unstage file.
    
- Stage hunk if feasible.
    
- Revert file.
    
- Copy diff.
    
- Save patch.
    
- Compare branches.
    
- Compare commits.
    
- Preview AI file changes.
    
- Accept/reject AI changes.
    
- Open diff from Writer/Editor.
    
- Open PR diff.
    
- Show GitHub PR diff if connected.
    

## Integration reality

`git-split-diffs` may be reusable as logic, CLI behavior, or inspiration. It may not be a drop-in Ink component. The TUI can either:

- call it as an external command,
    
- reuse parsing/rendering concepts,
    
- rewrite a terminal-native split diff,
    
- or wrap termcn `DiffView`.
    

## Hidden tasks

- Inspect license.
    
- Inspect code architecture.
    
- Identify reusable diff parser/rendering logic.
    
- Normalize Git diff output.
    
- Handle large diffs.
    
- Handle binary files.
    
- Handle renamed files.
    
- Handle deleted files.
    
- Handle new files.
    
- Handle CRLF/LF noise.
    
- Add ignore whitespace toggle.
    
- Add staged/unstaged mode.
    
- Add branch compare mode.
    
- Add PR compare mode.
    
- Add diff search.
    
- Add hunk copy.
    
- Add patch application path.
    
- Add conflict display.
    
- Add merge/rebase conflict helper later.
    

---

# 10. GitHub workflow scope



User flows for GitHub and diffs.

## Expanded features

- Detect GitHub remote.
    
- Show current branch.
    
- Show upstream branch.
    
- Show dirty status.
    
- Show ahead/behind.
    
- Show recent commits.
    
- Show open PR for current branch.
    
- Show PR checks.
    
- Show CI status.
    
- Create branch.
    
- Commit staged changes.
    
- Push branch.
    
- Open PR.
    
- Copy PR summary.
    
- Pull latest.
    
- Fetch.
    
- Compare with main.
    
- Show changed files.
    
- Show GitHub issue/PR links.
    
- Generate PR description from diff.
    
- Generate commit message from staged diff.
    
- Review changed files before commit.
    
- Warn before committing dirty generated/log files.
    

## Hidden tasks

- GitHub CLI detection.
    
- GitHub auth status detection.
    
- Remote parsing.
    
- Repository metadata.
    
- Branch protection awareness.
    
- GitHub API adapter or CLI adapter.
    
- PR template detection.
    
- CI status adapter.
    
- Safe push confirmation.
    
- Prevent accidental commit on wrong branch.
    
- Branch naming helper.
    
- Conventional commit helper.
    

---

# 11. File system management scope



User flows for file system management.

## Features

- File tree.
    
- Search files.
    
- Preview file.
    
- Recent files.
    
- Create file.
    
- Create folder.
    
- Rename file/folder.
    
- Move file/folder.
    
- Delete file/folder with confirmation.
    
- Copy path.
    
- Copy relative path.
    
- Open in external editor.
    
- Open in Explorer.
    
- Filter by extension.
    
- Ignore node_modules/build artifacts.
    
- Show file metadata.
    
- Show file size.
    
- Show modified time.
    
- Detect generated files.
    
- Detect binary files.
    
- Detect large files.
    

## Hidden tasks

- Safe root boundary.
    
- Prevent deleting outside target repo.
    
- Trash vs permanent delete.
    
- Windows path handling.
    
- Symlink handling.
    
- Permission errors.
    
- File watcher integration.
    
- Debounced refresh.
    
- `.gitignore` awareness.
    
- Search index.
    
- Fuzzy finder.
    
- Ripgrep integration.
    
- Path mode input.
    
- Directory tree virtualization for large repos.
    

---

# 12. Writer / AI file-change workflow scope



Better diff when using the writer; termcn file-change and streaming-text components listed.

## Features

- Clipboard intake.
    
- AI command intake.
    
- File payload intake.
    
- Markdown/prompt parsing.
    
- Strict JSON macro parsing.
    
- Preview proposed writes.
    
- Show file changes.
    
- Show patch diff.
    
- Apply changes.
    
- Reject changes.
    
- Save draft.
    
- Export handoff.
    
- Copy command summary.
    
- Generate Codex prompt.
    
- Generate GitHub issue/PR plan.
    
- Validate changed files after write.
    
- Show “before/after” preview.
    
- Integrate with DifferLTD.
    

## Hidden tasks

- Clipboard parser.
    
- Payload schema.
    
- Safe write planner.
    
- File operation planner.
    
- Apply engine.
    
- Rollback engine.
    
- Backup before write.
    
- Patch parser.
    
- Markdown fence stripping.
    
- Suspicious prose warning.
    
- Multi-file transaction support.
    
- Partial apply.
    
- Write audit log.
    
- Generated patch session.
    
- Conflict detection.
    
- Codex handoff format.
    

---

# 13. LoggerLTD scope



`LoggerLTD - logging`

## Primary role

Logs, sessions, operational history, command output, debug events.

## Features

- Session list.
    
- Run history.
    
- Command history.
    
- Failed step focus.
    
- View stdout/stderr.
    
- Copy step output.
    
- Copy full session.
    
- Save session.
    
- Export handoff.
    
- Filter logs.
    
- Search logs.
    
- Open latest failure.
    
- View active run.
    
- View command timeline.
    
- View clipboard parse events.
    
- View file write events.
    
- View Git events.
    
- View settings changes.
    
- View app errors.
    

## Hidden tasks

- Define log event schema.
    
- Preserve existing `.agent-logs/events.jsonl` behavior unless intentionally changed; the project contract explicitly treats this as append-oriented operational history.
    
- Add session store.
    
- Add run store.
    
- Add log compaction/retention.
    
- Add export formats:
    
    - markdown
        
    - JSON
        
    - JSONL
        
    - patch bundle
        
    - Codex handoff
        
- Add privacy/sensitive output redaction.
    
- Add max log size handling.
    
- Add log rotation.
    
- Add debug mode.
    
- Add user-facing logs separate from internal logs.
    

---

# 14. PreferLTD scope



`PreferLTD - settings`

## Primary role

Settings, preferences, profiles, safety, appearance, command behavior.

## Features

- Startup screen setting.
    
- Copy mode.
    
- Theme.
    
- Save logs automatically.
    
- Confirmation for risky commands.
    
- Centralized backups.
    
- Default target root.
    
- Session retention.
    
- Profile detection summary.
    
- PowerShell settings.
    
- Git settings.
    
- Editor settings.
    
- Diff settings.
    
- AI/write settings.
    
- Keyboard shortcut settings.
    
- Appearance settings.
    
- Notification settings.
    

## Hidden tasks

- Settings schema.
    
- Versioned settings file.
    
- Migration from old settings.
    
- Default settings.
    
- Settings validation.
    
- Broken settings recovery.
    
- Export/import settings.
    
- Reset category.
    
- Reset all.
    
- Per-workspace overrides.
    
- Global vs local settings.
    
- Environment variable overrides.
    
- Secret handling.
    
- Config file path decision:
    
    - old `.meatharness`
        
    - new `.rateltd`
        
    - migration bridge
        

---

# 15. TUI housekeeping and troubleshooting scope



User flows for TUI housekeeping and troubleshooting.

## Features

- Health check screen.
    
- Dependency check.
    
- Node version check.
    
- pnpm version check.
    
- Git availability check.
    
- PowerShell availability check.
    
- GitHub auth check.
    
- termcn component availability check.
    
- Config file check.
    
- Session/log storage check.
    
- File permissions check.
    
- Workspace validation.
    
- Package scripts validation.
    
- Clear cache.
    
- Clear sessions.
    
- Clear logs.
    
- Reset settings.
    
- Repair settings.
    
- Rebuild index.
    
- Export diagnostic bundle.
    
- Show app version/environment.
    

## Hidden tasks

- Diagnostics service.
    
- Health check registry.
    
- Severity levels:
    
    - info
        
    - warning
        
    - error
        
    - fatal
        
- Fix actions per diagnostic.
    
- Troubleshooting recommendations.
    
- “Copy diagnostics” action.
    
- “Open logs” action.
    
- Safe mode startup.
    
- Recovery mode startup.
    
- Crash boundary.
    
- Error reporting screen.
    
- Terminal capability detection.
    
- Glyph support test.
    
- Width/height warnings.
    

---

# 16. Command palette scope



termcn command palette is listed.

## Features

- Global Ctrl+P.
    
- Search commands.
    
- Search files.
    
- Search workflows.
    
- Search settings.
    
- Search recent sessions.
    
- Search PowerShell scripts.
    
- Search package scripts.
    
- Search Git actions.
    
- Execute command.
    
- Open screen.
    
- Jump to file.
    
- Run macro.
    
- Copy command.
    
- Preview command risk.
    

## Hidden tasks

- Command registry.
    
- Command metadata:
    
    - id
        
    - title
        
    - description
        
    - category
        
    - shortcut
        
    - risk level
        
    - enabled/disabled predicate
        
    - handler
        
- Fuzzy search.
    
- Keyboard navigation.
    
- Recently used ranking.
    
- Context-aware commands.
    
- Disabled reason.
    
- Confirmation flow.
    
- Result notifications.
    

---

# 17. Workflow system scope



Screens and user flows for running commands and repo operations.

## Expanded workflow model

A workflow is a sequence of typed actions:

- verify workspace
    
- install dependencies
    
- typecheck
    
- test
    
- lint
    
- build
    
- git status
    
- generate summary
    
- apply file changes
    
- run PowerShell script
    
- export logs
    
- create PR
    

## Features

- Workflow list.
    
- Workflow details.
    
- Workflow steps.
    
- Step safety classification.
    
- Step progress.
    
- Step stdout/stderr.
    
- Step retry.
    
- Step skip.
    
- Step cancellation.
    
- Workflow templates.
    
- Custom macros.
    
- JSON workflow intake.
    
- Clipboard workflow intake.
    
- Save workflow.
    
- Duplicate workflow.
    
- Delete workflow.
    
- Export workflow.
    
- Import workflow.
    

## Hidden tasks

- Workflow schema.
    
- Step registry.
    
- Runner engine.
    
- Sequential execution.
    
- Parallel execution later.
    
- Timeout per step.
    
- Cancellation.
    
- Failure policy:
    
    - stop on fail
        
    - continue on warning
        
    - ask user
        
- Rollback hooks where possible.
    
- Progress events.
    
- Persist run results.
    
- UI integration with LoggerLTD.
    

---

# 18. Setup / onboarding flow scope



termcn setup flow, splash screen, welcome screen, login flow listed.

## Features

- First-run welcome.
    
- Splash screen.
    
- Setup wizard.
    
- Choose default target root.
    
- Choose theme.
    
- Detect PowerShell.
    
- Detect Git.
    
- Detect GitHub CLI.
    
- Detect Node/pnpm.
    
- Configure log retention.
    
- Configure safety confirmations.
    
- Create settings file.
    
- Import old MeatHarness settings.
    
- Quick start into LauncherLtd.
    

## Hidden tasks

- First-run detection.
    
- Setup completion marker.
    
- Safe setup retry.
    
- Migration summary.
    
- Optional GitHub auth detection.
    
- Optional Codex handoff config.
    
- Terminal compatibility check.
    
- Theme preview.
    
- Sample workspace session.
    

---

# 19. Usage monitor scope



termcn usage monitor listed.

## Features

- Command runtime tracking.
    
- Workflow duration tracking.
    
- Session count.
    
- Failed runs.
    
- Passed runs.
    
- Files changed.
    
- Diffs reviewed.
    
- Clipboard payloads parsed.
    
- Logs size.
    
- Command frequency.
    
- Current active process elapsed time.
    
- CPU/memory optional.
    
- Repo activity summary.
    

## Hidden tasks

- Metrics schema.
    
- Local-only telemetry.
    
- Aggregate session stats.
    
- Daily/weekly view.
    
- Storage limits.
    
- Privacy controls.
    
- Export metrics.
    
- Reset metrics.
    

---

# 20. Notifications / overlays scope



termcn notification center, dialog, modal, drawer, tooltip listed.

## Features

- Toast-style notifications.
    
- Persistent notification center.
    
- Confirmation modals.
    
- Help drawer.
    
- Settings drawer.
    
- Command details modal.
    
- Diff detail modal.
    
- Error detail modal.
    
- Tooltip/help hints.
    
- Destructive action dialog.
    
- Long-running command drawer.
    

## Hidden tasks

- Overlay state machine.
    
- Modal priority in input router.
    
- Notification queue.
    
- Notification persistence optional.
    
- Auto-dismiss behavior.
    
- Copy details action.
    
- Error expansion/collapse.
    

---

# 21. Markdown / code rendering scope



termcn markdown parsing and code blocks listed.

## Features

- Render README.
    
- Render generated plans.
    
- Render command output summaries.
    
- Render Codex prompts.
    
- Render handoff docs.
    
- Render markdown clipboard payloads.
    
- Syntax-highlight code blocks.
    
- Truncate large markdown.
    
- Scroll markdown.
    
- Copy markdown.
    
- Preview markdown before write.
    

## Hidden tasks

- Markdown sanitization.
    
- Terminal-safe markdown renderer.
    
- Code language detection.
    
- ANSI handling.
    
- Long line wrapping.
    
- Tables.
    
- Links.
    
- Heading navigation.
    
- Search within markdown.
    
- Export markdown.
    

---

# 22. JSON / data grid scope



termcn JSON and data grid components listed.

## Features

- Inspect JSON config.
    
- Inspect package.json.
    
- Inspect tsconfig.
    
- Inspect workflow payloads.
    
- Inspect parsed clipboard payloads.
    
- Inspect logs.
    
- Show tabular results:
    
    - files
        
    - scripts
        
    - sessions
        
    - commands
        
    - diagnostics
        
    - Git changes
        
    - PowerShell scripts
        

## Hidden tasks

- JSON safe parse.
    
- Collapsible tree.
    
- Large JSON handling.
    
- Copy JSON path.
    
- Copy value.
    
- Validate JSON schema.
    
- Data grid selection.
    
- Sort/filter.
    
- Column widths.
    
- Row virtualization if needed.
    

---

# 23. Embedded terminal scope



termcn embedded terminal listed.

## Features

- Run shell commands inside a panel.
    
- Stream stdout/stderr.
    
- Support active command view.
    
- Cancel process.
    
- Save output.
    
- Copy output.
    
- Show command metadata.
    
- Show elapsed time.
    
- Show current step.
    
- Show partial output if timed out.
    

## Hidden tasks

- PTY vs child process decision.
    
- Use node-pty or child_process.
    
- Windows PTY support.
    
- Raw mode handling.
    
- Process cleanup on exit.
    
- Prevent orphaned processes.
    
- Command queue.
    
- Command concurrency guard.
    
- Environment injection.
    
- Working directory selection.
    
- Shell selection:
    
    - pwsh
        
    - powershell.exe
        
    - cmd
        
    - bash if available
        
- ANSI rendering.
    

---

# 24. Clipboard intake scope



Clipboard management already visible in mockups; termcn clipboard listed.

## Features

- Paste and parse.
    
- Detect AI command.
    
- Detect macro JSON.
    
- Detect file payload.
    
- Detect patch.
    
- Detect markdown.
    
- Detect plain shell command.
    
- Validate payload.
    
- Show warnings.
    
- Preview payload.
    
- Apply payload.
    
- Copy summary.
    
- Clear clipboard state.
    

## Hidden tasks

- Clipboard access package.
    
- Windows clipboard support.
    
- Parser modes:
    
    - auto
        
    - strict JSON
        
    - heuristic
        
    - markdown
        
    - patch
        
- Suspicious prose detection.
    
- Markdown fence stripping.
    
- File path extraction.
    
- Safety classification.
    
- Payload persistence.
    
- Retry parse mode.
    
- Import from file alternative.
    

---

# 25. Codex handoff / mega prompt scope



You want to scaffold and then mega prompt Codex to build the “wet dream TUI.”

## Deliverables needed before Codex

- Full scope inventory.
    
- Architecture target.
    
- File tree target.
    
- Component map.
    
- Screen map.
    
- State model.
    
- Input routing model.
    
- Command registry model.
    
- Adapter model.
    
- Migration plan.
    
- Acceptance gates.
    
- Codex implementation prompt.
    
- Codex task batches.
    
- Validation commands.
    
- Rollback strategy.
    
- “Do not break existing behavior” constraints.
    

## Hidden tasks

- Create `docs/rateltd-scope.md`.
    
- Create `docs/rateltd-architecture.md`.
    
- Create `docs/rateltd-screen-map.md`.
    
- Create `docs/rateltd-codex-plan.md`.
    
- Create `docs/rateltd-component-inventory.md`.
    
- Create `docs/rateltd-migration-plan.md`.
    
- Create `.agents/rateltd-execution-state.json`.
    
- Create Codex-safe ordered work packages:
    
    1. rename/display brand constants
        
    2. screen registry
        
    3. termcn wrapper layer
        
    4. shell/layout migration
        
    5. LauncherLtd
        
    6. RateLtd dashboard
        
    7. CommanderLTD command registry
        
    8. LoggerLTD sessions/logs
        
    9. DifferLTD diff adapter
        
    10. EditorLtd editor adapter
        
    11. PreferLTD settings
        
    12. diagnostics and cleanup
        
- Create “stop conditions” for Codex:
    
    - no broad rewrites without compile
        
    - no `any`
        
    - no broken imports
        
    - no removing existing functionality without replacement
        
    - no direct PowerShell script execution without safety registry
        

---

# 26. Local repo scavenging scope: `D:\SadDull`



Use repos already downloaded in `D:\SadDull`.

## Repos mentioned

- termcn docs / likely installed source or package docs
    
- `lazywinadmin/PowerShell`
    
- `banga/git-split-diffs`
    
- `microsoft/monaco-editor`
    
- renamed TUI RateLtd / formerly MeatHarness
    

## Expanded tasks

### Inventory

- List folders under `D:\SadDull`.
    
- Identify repo roots.
    
- Capture package/license info.
    
- Identify reusable source files.
    
- Identify CLIs.
    
- Identify examples.
    
- Identify build requirements.
    
- Identify incompatible tech.
    

### Scavenging map

For each repo:

```txt
source repo
  what to steal
  what to wrap
  what to rewrite
  what to ignore
  license risk
  integration difficulty
  target RateLtd module
```

### Hidden tasks

- Check licenses before copying.
    
- Prefer adapters and inspiration over blind copy.
    
- Avoid vendoring huge repos.
    
- Create `vendor-notes.md`.
    
- Create local `research/` notes.
    
- Extract minimal patterns.
    
- Keep source attribution where required.
    
- Avoid Monaco bloat inside core TUI bundle.
    
- Avoid running random PowerShell scripts without classification.
    

---

# 27. Plug-and-play assessment scope

## Your question

Are you wrong to assume this can be plug-and-play?

## Clean answer

Partly.

### Likely close to plug-and-play

- termcn Ink components, assuming package compatibility.
    
- Some termcn templates after adaptation.
    
- PowerShell script execution as external commands.
    
- Git commands through shell wrappers.
    
- Some diff rendering through termcn `DiffView`.
    

### Not plug-and-play

- Monaco directly inside Ink.
    
- git-split-diffs as an Ink-native split diff without adaptation.
    
- Replacing all internal TypeScript commands with PowerShell.
    
- OpenTUI templates inside an Ink app without compatibility work.
    
- Arbitrary downloaded PowerShell scripts as safe internal commands.
    
- Full file editor behavior inside terminal without a separate editor model.
    

### Best approach

Use **adapter-first integration**:

```txt
RateLtd core stays TypeScript/Ink.
External repos become providers/adapters.
Only stable, useful parts get wrapped or rewritten.
```

That does not shrink the vision. It makes the vision buildable without turning the codebase into duct tape.

---

# 28. Safety / risk system scope

## Why it matters

You want powerful local repo/system operations. That requires risk labeling so speed does not become accidental destruction.

## Features

- Risk levels:
    
    - safe
        
    - medium
        
    - destructive
        
    - admin
        
    - network
        
    - secret-sensitive
        
- Confirmation for risky commands.
    
- Preview before mutation.
    
- Dry-run where possible.
    
- Backups before file writes.
    
- Logs for all mutations.
    
- Clear destructive-action labels.
    
- Require typed command descriptors.
    

## Hidden tasks

- Command allowlist.
    
- Command denylist.
    
- Dangerous pattern detector:
    
    - `Remove-Item -Recurse`
        
    - `rm -rf`
        
    - force push
        
    - reset hard
        
    - clean -fd
        
    - deleting outside repo
        
    - writing outside repo
        
- Path boundary enforcement.
    
- Session rollback support.
    
- Command cancellation.
    
- Admin/elevation warning.
    

---

# 29. Testing and validation scope

## Needed validation

- TypeScript compile.
    
- Unit tests.
    
- Component smoke tests.
    
- Controller reducer tests.
    
- Input router tests.
    
- Command runner tests.
    
- PowerShell adapter tests.
    
- File system service tests.
    
- Git service tests.
    
- Diff parser tests.
    
- Settings migration tests.
    
- Manual TUI smoke test.
    
- Windows Terminal test.
    
- Narrow terminal layout test.
    
- No orphan process test.
    
- No global shortcut during text input test.
    

## Hidden tasks

- Update package scripts.
    
- Add test fixtures.
    
- Add fake repos for tests.
    
- Add fake command runner.
    
- Add mock file system.
    
- Add snapshot-free TUI component testing where possible.
    
- Add CI workflow.
    
- Add lint/typecheck/test gate.
    
- Add release check.
    

---

# 30. Documentation scope

## Docs to create/update

- README
    
- installation guide
    
- command reference
    
- screen reference
    
- keyboard shortcuts
    
- settings reference
    
- PowerShell integration guide
    
- Git/GitHub workflow guide
    
- editor integration guide
    
- diff workflow guide
    
- troubleshooting guide
    
- architecture guide
    
- Codex handoff guide
    
- migration notes from MeatHarness to RateLtd
    

## Hidden docs

- ADRs:
    
    - why adapter-first
        
    - why Monaco companion instead of direct embed
        
    - why PowerShell scripts are providers, not core replacement
        
    - why termcn wrapper layer exists
        
    - why screen IDs differ from display names
        
- Contribution notes for future agents.
    
- Repo scavenging notes.
    
- License notes.
    

---

# 31. Release / packaging scope

## Features

- CLI binary.
    
- Version display.
    
- Build output.
    
- Local install.
    
- Global install.
    
- Dev mode.
    
- Production mode.
    
- Safe mode.
    
- Debug mode.
    
- Config migration.
    
- Changelog.
    

## Hidden tasks

- Package name decision.
    
- npm binary name.
    
- ESM/CJS posture.
    
- Node engine.
    
- pnpm version.
    
- Bundle strategy.
    
- External dependency strategy.
    
- Large dependency warning for Monaco.
    
- Optional peer deps for editor companion.
    
- Release scripts.
    
- Tagging.
    
- GitHub release notes.
    

---

# 32. Full feature inventory by module

## LauncherLtd

- workspace launcher
    
- repo picker
    
- file tree
    
- recent targets
    
- recent sessions
    
- profile detection
    
- package manager detection
    
- Git detection
    
- manual path entry
    
- setup quick start
    
- target validation
    

## RateLtd

- dashboard
    
- repo summary
    
- health summary
    
- next actions
    
- command cards
    
- active job
    
- clipboard status
    
- latest run
    
- latest failure
    
- environment strip
    

## EditorLtd

- file preview
    
- file editing model
    
- Monaco companion option
    
- external editor launch
    
- dirty buffer tracking
    
- AI file change preview
    
- save/revert
    
- diagnostics
    
- recent files
    

## CommanderLTD

- command palette
    
- package scripts
    
- PowerShell command catalog
    
- workflow runner
    
- streaming output
    
- cancellation
    
- command history
    
- risk labels
    
- confirmation gates
    

## DifferLTD

- Git status
    
- split diff
    
- unified diff
    
- staged/unstaged
    
- hunk navigation
    
- stage/unstage/revert
    
- PR diff
    
- AI write diff
    
- copy/export patch
    

## LoggerLTD

- session history
    
- command logs
    
- run history
    
- failed step focus
    
- stdout/stderr viewer
    
- export handoff
    
- log search/filter
    
- retention
    

## PreferLTD

- settings
    
- theme
    
- startup screen
    
- default target root
    
- copy mode
    
- confirmations
    
- retention
    
- profiles
    
- command preferences
    
- editor preferences
    
- diff preferences
    
- PowerShell preferences
    

## HelpLtd

- keyboard shortcuts
    
- screen help
    
- command help
    
- troubleshooting
    
- docs viewer
    
- onboarding guide
    

---

# 33. The practical build sequence implied by the scope

Not implementation yet, just the implied order:

1. **Scope and architecture documents**
    
2. **Repo inventory**
    
3. **Rename/display brand constants**
    
4. **Typed screen registry**
    
5. **Input router**
    
6. **termcn wrapper layer**
    
7. **App shell migration**
    
8. **LauncherLtd**
    
9. **RateLtd dashboard**
    
10. **LoggerLTD session/log foundation**
    
11. **CommanderLTD command registry**
    
12. **PowerShell provider**
    
13. **DifferLTD diff provider**
    
14. **EditorLtd editor adapter**
    
15. **PreferLTD settings**
    
16. **Diagnostics/troubleshooting**
    
17. **Codex mega prompt**
    
18. **Validation and hardening**
    

---

# 34. What I should produce next

The next useful artifact is probably one of these:

1. **`RATELTD_SCOPE.md`** — clean project scope document.
    
2. **`RATELTD_ARCHITECTURE.md`** — target architecture and folder structure.
    
3. **`RATELTD_CODEX_MEGA_PROMPT.md`** — implementation prompt for Codex.
    
4. **`RATELTD_TASK_MATRIX.md`** — sequenced work packages with acceptance criteria.
    

For your current request, the core answer is:

**Yes, I understand. You want the complete feature universe extracted, expanded, and organized before we touch code. The scope is RateLtd as a full local TUI operating console, not just a visual refresh.**

```json
{
  "schema_version": "1.0",
  "source_kind": "execution_state",
  "project": {
    "name": "RateLtd",
    "repository": "DigitalHerencia/MeatHarness",
    "primary_stack": [
      "Node.js",
      "TypeScript",
      "Ink",
      "React",
      "pnpm",
      "termcn"
    ]
  },
  "turn_index": 1,
  "last_updated": "2026-05-05",
  "active_goal": "Expand the user's RateLtd vision into a comprehensive scope inventory before implementation.",
  "operating_mode": "scope_planning",
  "tasks": [
    {
      "id": "RL-0001",
      "title": "Extract full RateLtd scope from user prompt",
      "status": "done",
      "priority": "high",
      "acceptance_criteria": [
        "List all explicit feature requests from the prompt.",
        "Expand each feature into supporting implementation tasks.",
        "Avoid making repo-specific file claims without inspection.",
        "Do not begin implementation."
      ],
      "file_targets": [],
      "notes": [
        "Scope includes termcn redesign, RateLtd rename, modular screens, PowerShell provider, Monaco editor strategy, git-split-diffs integration, GitHub workflow, filesystem management, logging, settings, diagnostics, and Codex handoff."
      ]
    },
    {
      "id": "RL-0002",
      "title": "Create RateLtd scope document",
      "status": "todo",
      "priority": "high",
      "acceptance_criteria": [
        "Produce a markdown scope document suitable for repo inclusion.",
        "Separate explicit user goals from expanded implementation tasks.",
        "Include module-by-module feature inventory."
      ],
      "file_targets": [
        "docs/RATELTD_SCOPE.md"
      ],
      "notes": []
    },
    {
      "id": "RL-0003",
      "title": "Prepare Codex implementation handoff",
      "status": "todo",
      "priority": "high",
      "acceptance_criteria": [
        "Convert scope into ordered Codex work packages.",
        "Include target architecture, file targets, constraints, and validation gates.",
        "Avoid requiring Codex to infer high-level architecture from scratch."
      ],
      "file_targets": [
        "docs/RATELTD_CODEX_MEGA_PROMPT.md",
        "docs/RATELTD_TASK_MATRIX.md"
      ],
      "notes": []
    }
  ],
  "decisions": [
    {
      "id": "DEC-0001",
      "summary": "Treat RateLtd as the new product brand replacing MeatHarness in user-facing surfaces.",
      "status": "accepted",
      "rationale": "User explicitly stated the MeatHarness name is being replaced with the RateLtd brand."
    },
    {
      "id": "DEC-0002",
      "summary": "Use adapter-first integration for termcn, PowerShell scripts, Monaco, and git-split-diffs.",
      "status": "accepted",
      "rationale": "The user wants to use downloaded repos aggressively, but direct plug-and-play is not guaranteed across Ink, browser editor, PowerShell scripts, and diff tooling."
    }
  ],
  "blockers": [
    {
      "id": "BLK-0001",
      "summary": "Current repository contents have not been inspected in this turn.",
      "status": "blocked",
      "required_resolution": "Inspect package.json and core src files before making exact file-level implementation claims."
    },
    {
      "id": "BLK-0002",
      "summary": "Downloaded local repositories in D:\\SadDull are not accessible from this chat unless inspected through a connected environment or pasted/uploaded.",
      "status": "blocked",
      "required_resolution": "User or agent environment must provide directory listings/file contents before exact scavenging decisions."
    }
  ],
  "assumptions": [
    {
      "id": "ASM-0001",
      "summary": "termcn components are intended as the primary UI foundation for the redesign.",
      "risk": "Some listed templates may be OpenTUI-specific rather than Ink-compatible."
    },
    {
      "id": "ASM-0002",
      "summary": "Monaco requires a companion browser/webview/editor integration rather than direct rendering inside Ink.",
      "risk": "A pure terminal implementation cannot host Monaco without an external surface."
    }
  ],
  "verified_facts": [
    {
      "id": "FACT-0001",
      "summary": "The user wants MeatHarness renamed/rebranded as RateLtd."
    },
    {
      "id": "FACT-0002",
      "summary": "The user wants modules named LauncherLtd, RateLtd, EditorLtd, CommanderLTD, DifferLTD, LoggerLTD, and PreferLTD."
    },
    {
      "id": "FACT-0003",
      "summary": "The user wants termcn used for screen redesign and listed specific termcn templates/components."
    },
    {
      "id": "FACT-0004",
      "summary": "The user wants to evaluate lazywinadmin/PowerShell, banga/git-split-diffs, and microsoft/monaco-editor as source material."
    }
  ],
  "file_targets": [
    "docs/RATELTD_SCOPE.md",
    "docs/RATELTD_ARCHITECTURE.md",
    "docs/RATELTD_TASK_MATRIX.md",
    "docs/RATELTD_CODEX_MEGA_PROMPT.md"
  ],
  "validation": {
    "commands_run": [],
    "commands_to_run_next": [],
    "status": "not_run",
    "notes": [
      "No code was changed.",
      "No repo validation was run."
    ]
  },
  "risks": [
    {
      "id": "RISK-0001",
      "summary": "Blindly replacing internal TypeScript commands with PowerShell scripts could damage portability, safety, and testability.",
      "mitigation": "Use PowerShell as a typed command provider, not as a wholesale replacement for core orchestration."
    },
    {
      "id": "RISK-0002",
      "summary": "Monaco is browser-based and cannot be directly rendered inside a pure Ink terminal UI.",
      "mitigation": "Use an EditorLtd adapter with external/companion editor support."
    },
    {
      "id": "RISK-0003",
      "summary": "Copying code from downloaded repos may create license or maintenance issues.",
      "mitigation": "Inventory licenses and prefer wrappers/adapters or rewrites where appropriate."
    }
  ],
  "next_actions": [
    {
      "id": "NEXT-0001",
      "summary": "Convert this scope inventory into a clean RATELTD_SCOPE.md artifact."
    },
    {
      "id": "NEXT-0002",
      "summary": "Inspect the actual repo before generating file-specific implementation patches."
    }
  ]
}
```