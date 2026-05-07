# Decisions and Risks

## Decisions

### DEC-001 - Product Name

Use RateLtd as the product name.

Use capital `L` and lowercase `td` everywhere:

- RateLtd
- LauncherLtd
- EditorLtd
- CommanderLtd
- DifferLtd
- LoggerLtd
- PreferLtd
- HelpLtd

### DEC-002 - Architecture Strategy

RateLtd remains a TypeScript/Ink application.

External systems become adapters or providers. They do not replace the core architecture.

### DEC-003 - termcn Strategy

Use termcn as the primary UI component foundation, but wrap termcn imports locally to avoid direct dependency lock-in.

### DEC-004 - PowerShell Strategy

Use PowerShell scripts to supercharge CommanderLtd through a typed provider model.

Do not replace the TypeScript core command orchestration with arbitrary PowerShell scripts.

### DEC-005 - Monaco Strategy

Monaco is not directly embedded inside Ink.

Use EditorLtd as an adapter-based editor workflow with one or more of:

- external editor launch
- Monaco companion app
- terminal-native preview/edit fallback
- hybrid workflow

### DEC-006 - git-split-diffs Strategy

Use git-split-diffs as source material, external command, or inspiration after inspection.

Do not assume it is an Ink-native drop-in component.

### DEC-007 - File Writer Workflow

Generated repository files should be delivered as File Writer JSON:

    {
      "files": [
        {
          "path": "repo-relative/path.md",
          "content": "full file contents\\n"
        }
      ]
    }

### DEC-008 - Command Safety

PowerShell commands should be explicit, narrow, and path-specific.

Avoid broad destructive commands unless explicitly requested and confirmed.

## Risks

### RISK-001 - Blind PowerShell Replacement

Replacing internal TypeScript command orchestration with PowerShell scripts would damage portability, testability, and safety.

Mitigation:

- Keep TypeScript as the core.
- Wrap PowerShell as a command provider.
- Classify risk.
- Log execution.
- Require confirmation for destructive actions.

### RISK-002 - Monaco Integration Assumption

Monaco is browser-based and cannot directly render inside a pure Ink terminal UI.

Mitigation:

- Use an EditorLtd adapter.
- Support external/companion editor flow.
- Keep terminal-native preview/edit fallback.

### RISK-003 - License and Vendoring Risk

Copying code from downloaded repos may create license and maintenance issues.

Mitigation:

- Inspect licenses.
- Prefer adapters/wrappers.
- Keep attribution where required.
- Avoid vendoring huge repos unless intentionally approved.

### RISK-004 - Input Routing Drift

Scattered keyboard handlers can create unpredictable behavior.

Mitigation:

- Centralize input routing.
- Define input modes.
- Make modal priority explicit.
- Prevent global shortcuts during text entry.

### RISK-005 - Destructive Local Commands

RateLtd can run powerful local commands that may delete files or mutate Git history.

Mitigation:

- Risk classification.
- Dangerous command detector.
- Confirmation gates.
- Path boundary checks.
- Explicit command preview.
- Logs for all mutations.

### RISK-006 - Large Scope Drift

The product vision is intentionally broad and can become hard to implement if not sequenced.

Mitigation:

- Preserve the full feature inventory.
- Build in ordered work packages.
- Keep patches small.
- Validate after each package.
- Do not delete ideas just because they are not immediate.

### RISK-007 - OpenTUI vs Ink Compatibility

Some termcn templates may target OpenTUI rather than Ink.

Mitigation:

- Verify component compatibility before adoption.
- Separate Ink-compatible components from OpenTUI-only examples.
- Adapt or rewrite templates where needed.

### RISK-008 - Logs and Secrets

Command output may contain secrets.

Mitigation:

- Add output redaction.
- Separate user-facing logs from internal logs.
- Add export controls.
- Avoid exposing secrets in generated handoffs.

### RISK-009 - Absolute Path Writes

File writing outside the selected repo can be useful but dangerous.

Mitigation:

- Prefer repo-relative writes.
- Require explicit confirmation for absolute writes.
- Enforce safe root boundaries for repo operations.
