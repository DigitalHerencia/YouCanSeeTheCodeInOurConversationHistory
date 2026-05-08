# Codex Work Packages

Use these packages as ordered Codex prompts. Each package should preserve existing behavior unless the task explicitly migrates it.

## Global Constraints

- Keep TypeScript strict.
- Do not introduce unjustified `any`.
- Keep CLI/App/Controller/Screen/UI/Utility boundaries clean.
- Do not scatter `useInput` handlers across unrelated leaf components.
- Do not run unsafe PowerShell commands.
- Do not replace TypeScript core orchestration with PowerShell.
- Do not remove existing functionality without replacement.
- Do not make broad rewrites without compile checks.
- Do not claim validation passed unless commands were run.
- Use RateLtd naming with capital `L` and lowercase `td`.
- Prefer one small coherent patch at a time.
- Use File Writer JSON for generated files.

## Package 1 - Repo Inventory

### Objective

Inspect the current repo and produce an implementation map.

### Tasks

- Read package and lock files.
- Read CLI entrypoint.
- Read app root.
- Read controller/state files.
- Read screen components.
- Read command utilities.
- Read logging/event files.
- List current screens.
- List current commands.
- List current validation scripts.
- Identify architectural drift.

### Done When

- Current architecture is mapped.
- Target files for first implementation patch are known.
- No repo-specific claims are made without inspection.

## Package 2 - Brand Constants

### Objective

Create a clean RateLtd brand layer without breaking existing runtime behavior.

### Tasks

- Add brand constants.
- Normalize display names.
- Keep internal IDs stable where needed.
- Update visible labels.
- Update banner/title copy.
- Add migration notes.

### Done When

- User-facing UI says RateLtd.
- Names use correct `Ltd` casing.
- Existing app still launches.

## Package 3 - Screen Registry

### Objective

Introduce typed screens and stable navigation metadata.

### Tasks

- Add screen ID union.
- Add display-name mapping.
- Add navigation order.
- Add screen metadata.
- Map old screens to new RateLtd modules.

### Done When

- Navigation is typed.
- Display names are centralized.
- Existing navigation still works.

## Package 4 - Input Router

### Objective

Make keyboard routing explicit and safe.

### Tasks

- Define input modes.
- Define input priority.
- Route modal input before screen input.
- Prevent global shortcuts during text entry.
- Keep quit/help behavior predictable.

### Done When

- Input behavior is centralized or deliberately scoped.
- Destructive actions require confirmation.
- Existing shortcuts still work.

## Package 5 - Command Registry

### Objective

Create the shared command registry used by CommanderLtd and global command palette.

### Tasks

- Define command descriptor type.
- Define command risk type.
- Define enabled/disabled predicates.
- Define command handler contract.
- Register existing commands.
- Add result notifications.

### Done When

- Existing commands can be represented as typed descriptors.
- Command risk is visible.
- Command execution remains logged.

## Package 6 - termcn Wrapper Layer

### Objective

Add termcn wrappers without immediately rewriting every screen.

### Tasks

- Verify packages and compatibility.
- Add wrapper directory.
- Wrap core layout and feedback components.
- Add theme tokens.
- Add Vercel theme.
- Preserve matrix theme.
- Add fallback mode.

### Done When

- New screens can import local wrappers.
- Existing screens do not break.
- Wrapper layer prevents direct vendor lock-in.

## Package 7 - App Shell Migration

### Objective

Move the root layout toward the RateLtd shell.

### Tasks

- Add persistent header.
- Add target status strip.
- Add breadcrumbs.
- Add status bar.
- Add active job indicator.
- Add notification surface.
- Preserve existing screen rendering.

### Done When

- App shell matches RateLtd module model.
- Existing screens remain accessible.

## Package 8 - LauncherLtd

### Objective

Build the target repo and session launcher.

### Tasks

- Add repo picker flow.
- Add recent targets.
- Add recent sessions.
- Add workspace validation.
- Add profile/package/Git detection.
- Add monorepo/workspace detection.
- Persist selected target.

### Done When

- User can select and persist target repo.
- Workspace summary is reliable.
- Failure states are visible.

## Package 9 - RateLtd Dashboard

### Objective

Build the operational dashboard.

### Tasks

- Add repo summary.
- Add Git summary.
- Add last run summary.
- Add clipboard status.
- Add recommended actions.
- Add quick action cards.
- Add active job status.
- Add warning engine.

### Done When

- Dashboard gives a useful overview.
- Actions route to correct modules.
- Empty/error states are handled.

## Package 10 - LoggerLtd

### Objective

Make sessions, logs, and command results first-class.

### Tasks

- Define log schema.
- Preserve events JSONL.
- Add session/run stores.
- Add run history screen.
- Add failed step focus.
- Add output copy/export.
- Add retention and redaction.

### Done When

- Recent runs are inspectable.
- Failed commands are easy to diagnose.
- Logs remain machine-readable.

## Package 11 - CommanderLtd

### Objective

Build the command execution module.

### Tasks

- Add command catalog UI.
- Add command search.
- Add package script provider.
- Add Git provider.
- Add risk labels.
- Add confirmation gates.
- Add streaming output.
- Add cancellation.

### Done When

- Commands can be browsed, selected, run, logged, and reviewed.

## Package 12 - PowerShell Provider

### Objective

Wrap PowerShell scripts as typed command providers.

### Tasks

- Inventory scripts.
- Build manifest.
- Classify risk.
- Extract metadata.
- Add allowlist.
- Capture streams.
- Add timeout/cancel.
- Add trust and elevation warnings.

### Done When

- PowerShell commands are available safely through CommanderLtd.
- Unreviewed scripts do not run silently.

## Package 13 - DifferLtd

### Objective

Build the diff review workflow.

### Tasks

- Add changed files list.
- Add staged/unstaged views.
- Add split diff.
- Add unified diff fallback.
- Add hunk navigation.
- Add stage/unstage/revert.
- Add AI write diff.
- Add PR diff later.

### Done When

- User can inspect and act on repo changes from the TUI.

## Package 14 - EditorLtd

### Objective

Build the editor adapter and file preview/edit workflow.

### Tasks

- Add file preview.
- Add edit buffer.
- Add dirty tracking.
- Add save/revert.
- Add external editor support.
- Add Monaco companion adapter if selected.
- Add diagnostics.
- Add AI file-change integration.

### Done When

- User can inspect and edit files reliably.
- Monaco path is supported through an adapter, not forced into Ink.

## Package 15 - PreferLtd

### Objective

Build settings and preferences.

### Tasks

- Add settings schema.
- Add versioned store.
- Add defaults.
- Add validation.
- Add migration.
- Add theme setting.
- Add command safety settings.
- Add editor/diff/PowerShell settings.

### Done When

- Settings are reliable, recoverable, and versioned.

## Package 16 - Diagnostics and HelpLtd

### Objective

Build troubleshooting and help surfaces.

### Tasks

- Add health checks.
- Add dependency checks.
- Add config checks.
- Add logs/session checks.
- Add safe/recovery mode.
- Add crash boundary.
- Add contextual help.

### Done When

- User can diagnose broken setup without leaving RateLtd.

## Package 17 - GitHub Workflow

### Objective

Add GitHub-aware repo operations.

### Tasks

- Detect GitHub remote.
- Detect GitHub CLI/auth.
- Show PR/check status.
- Generate PR descriptions.
- Generate commit messages.
- Create branches.
- Commit staged changes.
- Push with confirmation.
- Open PR.

### Done When

- RateLtd supports a practical local GitHub workflow.

## Package 18 - Release and Hardening

### Objective

Prepare RateLtd for regular local use.

### Tasks

- Add validation gates.
- Add release scripts.
- Add packaging decisions.
- Add changelog.
- Add migration notes.
- Add documentation.
- Smoke test core flows.

### Done When

- RateLtd can be run, tested, iterated, and shipped safely.


---

Yes. Best move: **copy MeatHarness → RateLtd, then run Codex in ordered high-yield patches**, not one mega-prompt. The docs already say RateLtd is an Ink/TypeScript TUI expanded from the existing harness, with termcn wrapped locally, PowerShell/Monaco/git-split-diffs as adapters, and no direct Monaco-in-Ink fantasy.

## Codex Rate-Limit Strategy

Use **one 5-hour limit** as:

1. **Inventory + migration spine**
    
2. **Brand + shell + screen registry**
    
3. **termcn wrapper layer**
    
4. **functional CommanderLtd / LoggerLtd / DifferLtd / EditorLtd foundations**
    
5. **PowerShell provider + validation hardening**
    

Do **not** ask Codex to “build the whole dream app” in one shot. That wastes tokens. Feed it these prompts sequentially.

---

