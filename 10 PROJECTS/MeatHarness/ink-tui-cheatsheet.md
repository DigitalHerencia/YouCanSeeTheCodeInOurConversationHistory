# Ink / TUI Architecture Cheat Sheet for MeatHarness

This source is a practical working guide for building and reviewing Ink-based terminal UI code in MeatHarness.

## Mental model

Ink renders React components to a terminal, not to the DOM.

Design every UI decision around:

- finite terminal width/height
- keyboard-driven interaction
- process lifecycle
- stdout/stderr behavior
- async command state
- readable output under constraint

Avoid browser habits unless they directly map to Ink.

## Core Ink primitives

Common building blocks:

- `render(<App />)` starts the TUI.
- `Box` handles layout using Yoga-style flexbox semantics.
- `Text` renders terminal text.
- `useInput(handler, options?)` handles keyboard input.
- `useApp()` gives access to app-level controls such as exit behavior.
- `useStdout()` and `useStdin()` expose terminal streams and dimensions/state where supported.
- `Static` can preserve output items instead of re-rendering everything.
- `Transform` can transform text output.
- `Newline` and `Spacer` are useful for terminal formatting.

Confirm the exact installed Ink version from `package.json` / `pnpm-lock.yaml` before relying on version-specific APIs.

## Recommended MeatHarness component hierarchy

Preferred flow:

```txt
src/cli.ts
  -> src/app.tsx
    -> controller/state hook
      -> AppFrame
        -> Banner
        -> NavigationTabs
        -> AppScreens
          -> OpsDeckScreen
          -> WriterScreen
          -> OutputScreen
          -> RepoLauncher
        -> StatusBar
        -> ConfirmDialog / AgentHelpModal
```

Keep entrypoint, state, screens, and presentational components separate.

## Input routing

Input bugs are the most common TUI architecture failure.

Preferred priority order:

1. Text entry / prompt mode
2. Confirm dialog / modal
3. Screen-local shortcuts
4. Global navigation shortcuts
5. Global quit/help shortcuts

Rules:

- Do not let global shortcuts fire while the user is typing.
- Do not scatter conflicting `useInput` hooks across leaf components.
- Prefer a central input router once behavior grows.
- Make modal priority explicit.
- Use named actions instead of directly mutating state inside many handlers.
- Keep destructive actions behind confirmation.

Useful state shape:

```ts
type InputMode =
  | { kind: "navigation" }
  | { kind: "text-entry"; field: "query" | "profileName"; value: string }
  | { kind: "confirm"; actionId: string; message: string }
  | { kind: "help" };
```

## Navigation state

Prefer explicit screen unions:

```ts
type AppScreen = "ops" | "writer" | "output" | "repo" | "help";
```

For more complex screens:

```ts
type ScreenState =
  | { kind: "ops" }
  | { kind: "writer"; draftId?: string }
  | { kind: "output"; selectedRunId?: string }
  | { kind: "repo"; selectedRepoPath?: string };
```

Avoid storing navigation as arbitrary strings.

## Async command lifecycle

Represent command state explicitly:

```ts
type CommandState =
  | { kind: "idle" }
  | { kind: "running"; commandId: string; label: string; startedAt: string }
  | { kind: "succeeded"; commandId: string; label: string; output: string; completedAt: string }
  | { kind: "failed"; commandId: string; label: string; error: string; completedAt: string };
```

Rules:

- Every long-running action needs visible pending state.
- Capture stdout/stderr intentionally.
- Prevent stale async results from overwriting newer state.
- Consider cancellation or ignore-after-navigation guards.
- Never silently swallow process errors.

## Layout rules

Use `Box` deliberately:

```tsx
<Box flexDirection="column" gap={1}>
  <Header />
  <Box flexDirection="row">
    <Sidebar />
    <MainPanel />
  </Box>
  <StatusBar />
</Box>
```

Practical rules:

- Keep rows short.
- Use labels.
- Avoid fragile spacing that breaks on narrow terminals.
- Prefer panels/sections for scannability.
- Show empty states clearly.
- Show errors close to the action that caused them.
- Keep status information consistent.

## Terminal-safe UX states

Every screen should handle:

- empty
- loading/running
- ready
- success
- warning
- error
- disabled/unavailable

Example:

```ts
type Loadable<T> =
  | { kind: "idle" }
  | { kind: "loading" }
  | { kind: "ready"; data: T }
  | { kind: "error"; message: string };
```

## TypeScript patterns

Prefer:

```ts
type Result<T> =
  | { ok: true; value: T }
  | { ok: false; error: string };
```

Avoid:

```ts
// Too vague
async function loadThing(): Promise<any> {}
```

Use `unknown` at unsafe boundaries and narrow:

```ts
function toErrorMessage(error: unknown): string {
  return error instanceof Error ? error.message : String(error);
}
```

## Utility boundaries

Filesystem/repo/script utilities should not know about Ink components.

Good utility names:

- `findRepoRoot`
- `readProfiles`
- `writeProfile`
- `listPackageScripts`
- `formatMarkdownForTerminal`
- `runPackageScript`

Good return shape:

```ts
type RepoRootResult =
  | { ok: true; path: string }
  | { ok: false; reason: "not_found" | "permission_denied"; message: string };
```

## Controller patterns

A controller hook should expose state and named actions:

```ts
type MeatHarnessController = {
  state: MeatHarnessState;
  actions: {
    navigate(screen: AppScreen): void;
    openHelp(): void;
    closeModal(): void;
    confirm(actionId: string): void;
    runScript(scriptName: string): Promise<void>;
  };
};
```

Keep action names meaningful. Avoid leaking raw setters everywhere.

## Error handling

For terminal tools, error output must be useful.

Include:

- what failed
- likely reason
- target file/path/command when relevant
- next action

Avoid dumping huge stack traces into the main UI unless debug mode is active.

## Windows / PowerShell friendliness

MeatHarness should remain comfortable on Windows.

Rules:

- Avoid POSIX-only shell assumptions.
- Use Node path utilities instead of manual slash logic.
- Treat spaces in paths as normal.
- Prefer package scripts over shell-specific chained commands.
- Test command strings with PowerShell expectations in mind.

## Review checklist

Before approving TUI code:

- Does input routing have clear priority?
- Can a modal accidentally trigger global shortcuts?
- Are screen names typed?
- Are async states explicit?
- Are errors visible and useful?
- Are long-running commands represented as running/succeeded/failed?
- Is layout readable at narrow terminal widths?
- Are side effects isolated outside presentational components?
- Did the change avoid `any`?
- Did validation use actual repo scripts?

## Common patch targets

For behavior changes:

- `src/state/useMeatHarnessController.ts`
- `src/state/appNavigation.ts`
- `src/state/appTypes.ts`
- `src/components/AppScreens.tsx`

For layout/presentation:

- `src/components/AppFrame.tsx`
- `src/components/Panel.tsx`
- `src/components/NavigationTabs.tsx`
- screen components

For repo/process/filesystem behavior:

- `src/utils/repo.ts`
- `src/utils/packageScripts.ts`
- `src/utils/profiles.ts`
- `src/commands/search.ts`

For app boot behavior:

- `src/cli.ts`
- `src/app.tsx`
