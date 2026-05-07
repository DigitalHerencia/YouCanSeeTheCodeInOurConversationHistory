# Integration Plan

RateLtd should use external projects aggressively but safely. The integration strategy is adapter-first: use external code as packages, providers, references, or wrappers instead of blindly copying large systems into the core TUI.

## termcn

### Goal

Use termcn as the primary UI component foundation for RateLtd screens.

### Tasks

- Inspect current `package.json`.
- Identify current Ink version.
- Verify termcn package names.
- Verify peer dependencies.
- Add compatible packages.
- Separate Ink components from OpenTUI-only templates.
- Wrap termcn imports behind local UI components.
- Add Vercel theme.
- Preserve or migrate matrix theme.
- Add theme registry.
- Add theme selection in PreferLtd.
- Test component rendering in Windows Terminal.
- Test narrow terminal layouts.
- Add ASCII fallback mode.
- Add termcn lab/demo screen.

### Local Wrapper Target

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

## PowerShell

### Goal

Use the lazywinadmin PowerShell library to supercharge CommanderLtd without replacing the TypeScript core.

### Tasks

- Inventory scripts from `D:\MeatHarness`.
- Capture license and source metadata.
- Classify scripts by risk.
- Build a PowerShell command manifest.
- Extract metadata from script comments where possible.
- Add allowlist/sandbox.
- Prefer `pwsh`.
- Fall back to Windows PowerShell if needed.
- Capture stdout, stderr, warning, verbose, debug, and information streams.
- Add timeout/cancellation.
- Handle quoted Windows paths.
- Detect elevation requirements.
- Detect module dependencies.
- Warn for untrusted/unsigned scripts.
- Prevent random downloaded scripts from running without explicit review.

### Provider Model

PowerShell becomes a CommanderLtd provider, not the main app runtime.

## Monaco

### Goal

Add a serious editor story through EditorLtd.

### Integration Reality

Monaco is browser-based and cannot be rendered directly inside a pure Ink terminal UI.

### Options

1. External Monaco companion app.
2. Terminal-native file preview/editing fallback.
3. Hybrid model where RateLtd owns file workflow and launches Monaco for full editing.

### Tasks

- Create editor adapter interface.
- Add file buffer model.
- Add dirty tracking.
- Add external editor command support.
- Investigate local Monaco companion.
- Secure local server binding if companion app is used.
- Add workspace trust model.
- Handle file save conflicts.
- Integrate AI file-change preview with DifferLtd.

## git-split-diffs

### Goal

Improve DifferLtd with split-diff behavior and better writer/GitHub review flows.

### Tasks

- Inspect license.
- Inspect code architecture.
- Identify reusable parser/rendering logic.
- Decide between:
  - external command wrapper
  - reusable logic extraction
  - terminal-native rewrite
  - termcn DiffView wrapper
- Normalize Git diff output.
- Handle binary, renamed, deleted, new, and large files.
- Add whitespace toggles.
- Add staged/unstaged views.
- Add branch/PR compare modes.
- Add hunk navigation and copy.
- Add conflict display.

## GitHub

### Goal

Support efficient local GitHub workflows from the TUI.

### Tasks

- Detect GitHub remote.
- Detect GitHub CLI availability.
- Detect GitHub auth status.
- Parse repo metadata.
- Show open PR for current branch.
- Show PR checks.
- Show CI status.
- Generate PR description from diff.
- Generate commit message from staged diff.
- Create branches.
- Commit staged changes.
- Push branch.
- Open PR.
- Prevent accidental commit/push on wrong branch.
- Add safe push confirmation.

## Local Repo Scavenging

### Goal

Use downloaded repos in `D:\MeatHarness` as source material without losing control of RateLtd architecture.

### Tasks

- List folders under `D:\MeatHarness`.
- Identify repo roots.
- Capture package info.
- Capture license info.
- Identify reusable files.
- Identify CLIs.
- Identify examples.
- Identify build requirements.
- Identify incompatible tech.
- Create `vendor-notes.md`.
- Create local research notes.
- Extract minimal patterns.
- Keep attribution where required.
- Avoid vendoring large repos unless intentionally approved.
- Avoid Monaco bloat in the core TUI bundle.
- Avoid running unreviewed PowerShell scripts.
