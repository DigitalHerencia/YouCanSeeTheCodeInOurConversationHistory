---
title: "codebase-context-2026-05-08"
type: reference
scope: vault
project:
domain: inbox
artifact: codebase.context.2026.05.08
kind: source-note
namespace: inbox.source.codebase.context.2026.05.08
status: review
authority: archive
parent: "[[devnotes.zettelkasten.map]]"
depends_on: []
supersedes: []
tags:
  - inbox
  - imports/source-note
  - status/review
created: 2026-05-27
updated: 2026-05-27
source_file: "00 ZETTELKASTEN/INBOX/codebase-context-2026-05-08.md"
source_hash: "BDBEE636EDD5F67D49446EE5E732670D251F763118CEBC307FA14671E24F7B25"
---
# codebase-context-2026-05-08

# Codebase Context

## Executive Summary

- **Total Files:** 118
- **Languages:** plaintext, markdown, json, typescript, tsx, css
- **Generated:** 5/7/2026, 8:37:35 PM

### File Types

- **ts:** 53 files
- **tsx:** 36 files
- **md:** 11 files
- **png:** 8 files
- **json:** 4 files
- **jsonl:** 1 files
- **yml:** 1 files
- **css:** 1 files
- **editorconfig:** 1 files
- **gitignore:** 1 files
- **yaml:** 1 files

### Directory Structure

- **RateLtd:** 118 files

## Architecture Overview

### RateLtd/.agent-logs

- RateLtd/.agent-logs/events.jsonl

### RateLtd/.codex/contracts

- RateLtd/.codex/contracts/navigation.yml

### RateLtd/.codex/docs

- RateLtd/.codex/docs/rateltd.codex.prompts.md
- RateLtd/.codex/docs/rateltd.architecture.plan.md
- RateLtd/.codex/docs/repo-inventory.md
- RateLtd/.codex/docs/rateltd.execution.task-matrix.md
- RateLtd/.codex/docs/rateltd.features.inventory.md
- RateLtd/.codex/docs/vendor-notes.md
- RateLtd/.codex/docs/rateltd.modules.specifications.contract.md
- RateLtd/.codex/docs/rateltd.integrations.plan.contract.md
- RateLtd/.codex/docs/rateltd.decisions-and-risks.md
- RateLtd/.codex/docs/rateltd.codex.work-packages.md

### RateLtd/.codex/execution

- RateLtd/.codex/execution/progress.json

### RateLtd/.codex/mockups

- RateLtd/.codex/mockups/ChatGPT Image May 4, 2026, 02_02_14 AM (1).png
- RateLtd/.codex/mockups/ChatGPT Image May 4, 2026, 02_02_15 AM (3).png
- RateLtd/.codex/mockups/ChatGPT Image May 4, 2026, 02_02_14 AM (2).png
- RateLtd/.codex/mockups/ChatGPT Image May 4, 2026, 02_02_16 AM (6).png
- RateLtd/.codex/mockups/ChatGPT Image May 4, 2026, 02_02_15 AM (5).png
- RateLtd/.codex/mockups/ChatGPT Image May 4, 2026, 02_02_15 AM (4).png
- RateLtd/.codex/mockups/ChatGPT Image May 4, 2026, 02_02_16 AM (8).png
- RateLtd/.codex/mockups/ChatGPT Image May 4, 2026, 02_02_16 AM (7).png

### RateLtd/src/brand

- RateLtd/src/brand/asciiLogo.ts
    - Imports: react, ink, ./rateLtd.js
- RateLtd/src/brand/themes.ts
- RateLtd/src/brand/rateLtd.ts

### RateLtd/src/commands

- RateLtd/src/commands/files.ts
    - Imports: node:fs, node:path, diff, ../utils/repo.js, ../utils/logger.js
- RateLtd/src/commands/git.ts
- RateLtd/src/commands/pnpm.ts
- RateLtd/src/commands/search.ts
- RateLtd/src/commands/runner.ts
    - Imports: node:child_process, node:perf_hooks

### RateLtd/src/components

- RateLtd/src/components/AgentHelpModal.tsx
    - Imports: react, ink, ../state/appTypes.js, ../theme.js, ./Panel.js, ../utils/terminalText.js, ../utils/layout.js
- RateLtd/src/components/AppScreens.tsx
    - Imports: react, ./ConfirmDialog.js, ./RepoLauncher.js, ./WriterScreen.js, ./OpsDeckScreen.js, ./OutputScreen.js, ./AgentHelpModal.js, ./RateDashboardScreen.js, ./EditorLtdScreen.js, ./DifferLtdScreen.js, ./PreferLtdScreen.js, ../state/appTypes.js, ../state/screens.js, ../utils/layout.js
- RateLtd/src/components/Banner.tsx
    - Imports: react, ../brand/asciiLogo.js
- RateLtd/src/components/ConfirmDialog.tsx
    - Imports: react, ink, ../theme.js, ../utils/terminalText.js
- RateLtd/src/components/DifferLtdScreen.tsx
    - Imports: react, ink, ../state/appTypes.js, ../utils/layout.js, ./Panel.js, ../theme.js, ../utils/terminalText.js
- RateLtd/src/components/CommandOutputPanel.tsx
    - Imports: react, ink, ../utils/terminalText.js
- RateLtd/src/components/EditorLtdScreen.tsx
    - Imports: react, ink, ../state/appTypes.js, ../utils/layout.js, ./Panel.js, ../theme.js, ../utils/terminalText.js
- RateLtd/src/components/AppFrame.tsx
    - Imports: react, ink, ../utils/repo.js, ../theme.js, ../utils/terminalSize.js, ./Banner.js, ../utils/layout.js, ./NavigationTabs.js, ../state/navigation.js
- RateLtd/src/components/NavigationTabs.tsx
    - Imports: react, ink, ../theme.js, ../state/navigation.js
- RateLtd/src/components/Menu.tsx
    - Imports: react, ink, ../theme.js
- RateLtd/src/components/OutputScreen.tsx
    - Imports: react, ink, ../state/appTypes.js, ../theme.js, ./Panel.js, ../utils/terminalText.js, ../utils/layout.js
- RateLtd/src/components/PreferLtdScreen.tsx
    - Imports: react, ink, ../state/appTypes.js, ../utils/layout.js, ./Panel.js, ../theme.js
- RateLtd/src/components/OpsDeckScreen.tsx
    - Imports: react, ink, ../state/appTypes.js, ../theme.js, ./Panel.js, ../utils/terminalText.js, ../utils/layout.js
- RateLtd/src/components/RateDashboardScreen.tsx
    - Imports: react, ink, ../state/appTypes.js, ../utils/layout.js, ../theme.js, ./Panel.js
- RateLtd/src/components/Panel.tsx
    - Imports: react, ink, ../theme.js, ../utils/terminalText.js
- RateLtd/src/components/RepoLauncher.tsx
    - Imports: react, ink, ../state/appTypes.js, ../theme.js, ./Panel.js, ../utils/terminalText.js, ../utils/layout.js
- RateLtd/src/components/StatusBar.tsx
    - Imports: react, ink, ../utils/repo.js, ../theme.js, ../utils/terminalText.js
- RateLtd/src/components/StructuredTable.tsx
    - Imports: react, ink, ../utils/terminalText.js
- RateLtd/src/components/WriterScreen.tsx
    - Imports: react, ink, ../state/appTypes.js, ../theme.js, ./Panel.js, ../utils/terminalText.js, ../utils/layout.js

### RateLtd/src/controller

- RateLtd/src/controller/inputRouter.test.ts
    - Imports: vitest, ./inputRouter.js
- RateLtd/src/controller/inputRouter.ts
    - Imports: ../state/navigation.js, ../state/inputModes.js

### RateLtd/src/integrations/editor

- RateLtd/src/integrations/editor/externalEditorAdapter.ts
    - Imports: ../../types/editor.js, ../../services/processRunner.js

### RateLtd/src/integrations/monaco

- RateLtd/src/integrations/monaco/monacoAdapter.ts
    - Imports: ../../types/editor.js, ../../services/processRunner.js

### RateLtd/src/integrations/powershell

- RateLtd/src/integrations/powershell/scriptInventory.ts
    - Imports: node:fs, node:path, ../../types/commands.js

### RateLtd/src/lib/terminal-themes

- RateLtd/src/lib/terminal-themes/vercel.ts
    - Imports: @/components/ui/theme-provider

### RateLtd/src/lib

- RateLtd/src/lib/utils.ts
    - Imports: clsx, tailwind-merge

### RateLtd/src/persistence

- RateLtd/src/persistence/logStore.ts
    - Imports: node:fs, node:path, ../utils/logger.js, ../services/gitService.js
- RateLtd/src/persistence/settingsStore.ts
    - Imports: node:fs, node:path, ../schemas/settings.js, ../types/settings.js
- RateLtd/src/persistence/sessionStore.ts
    - Imports: node:fs, node:path

### RateLtd/src/schemas

- RateLtd/src/schemas/settings.ts
    - Imports: ../types/settings.js

### RateLtd/src/services

- RateLtd/src/services/diagnosticsService.ts
    - Imports: node:fs, node:child_process, node:path, ./settingsService.js
- RateLtd/src/services/fileSystemService.ts
    - Imports: node:fs, node:path, ../utils/repo.js
- RateLtd/src/services/githubService.ts
    - Imports: node:child_process
- RateLtd/src/services/loggingService.ts
    - Imports: ../utils/logger.js
- RateLtd/src/services/gitService.ts
    - Imports: node:child_process
- RateLtd/src/services/powershellService.ts
    - Imports: ../integrations/powershell/scriptInventory.js, ./processRunner.js
- RateLtd/src/services/settingsService.ts
- RateLtd/src/services/processRunner.ts
    - Imports: ../commands/runner.js

### RateLtd/src/state

- RateLtd/src/state/appNavigation.ts
    - Imports: node:fs, node:path, ../utils/repo.js, ./appTypes.js, ../types/settings.js, ../integrations/powershell/scriptInventory.js
- RateLtd/src/state/inputModes.ts
- RateLtd/src/state/appTypes.ts
    - Imports: ../commands/runner.js, ../commands/files.js, ../utils/repo.js, ../utils/runSession.js, ./screens.js, ../services/gitService.js, ../types/settings.js, ../services/diagnosticsService.js, ../persistence/logStore.js, ../types/commands.js
- RateLtd/src/state/navigation.ts
- RateLtd/src/state/screens.ts
- RateLtd/src/state/useMeatHarnessController.ts
    - Imports: ../components/AgentHelpModal.js, react, node:path, ink, ../utils/repo.js, ../utils/clipboard.js, ../utils/logger.js, ../utils/runSession.js, ../services/processRunner.js, ../utils/markdown.js, ../commands/files.js, ./appTypes.js, ./appNavigation.js, ./inputModes.js, ../controller/inputRouter.js, ../services/gitService.js, ../services/fileSystemService.js, ../services/settingsService.js, ../services/diagnosticsService.js, ../persistence/logStore.js, ../integrations/editor/externalEditorAdapter.js, ../utils/explorer.js

### RateLtd/src/styles

- RateLtd/src/styles/globals.css

### RateLtd/src/types

- RateLtd/src/types/commands.ts
    - Imports: ../commands/runner.js
- RateLtd/src/types/diff.d.ts
- RateLtd/src/types/editor.ts
- RateLtd/src/types/profile.ts
- RateLtd/src/types/settings.ts

### RateLtd/src/ui/termcn

- RateLtd/src/ui/termcn/Alert.tsx
- RateLtd/src/ui/termcn/Banner.tsx
- RateLtd/src/ui/termcn/AppShell.tsx
- RateLtd/src/ui/termcn/CommandPalette.tsx
    - Imports: react, ink, ../../types/commands.js
- RateLtd/src/ui/termcn/Confirm.tsx
- RateLtd/src/ui/termcn/DataGrid.tsx
    - Imports: react, ink
- RateLtd/src/ui/termcn/DiffView.tsx
    - Imports: react, ink, ../../utils/terminalText.js
- RateLtd/src/ui/termcn/DirectoryTree.tsx
    - Imports: react, ink
- RateLtd/src/ui/termcn/index.ts
- RateLtd/src/ui/termcn/Menu.tsx
- RateLtd/src/ui/termcn/Panel.tsx
- RateLtd/src/ui/termcn/ProgressBar.tsx
    - Imports: react, ink
- RateLtd/src/ui/termcn/Modal.tsx
- RateLtd/src/ui/termcn/StatusMessage.tsx
    - Imports: react, ink, ../../theme.js
- RateLtd/src/ui/termcn/NotificationCenter.tsx
    - Imports: react, ink
- RateLtd/src/ui/termcn/Tabs.tsx

### RateLtd/src/utils

- RateLtd/src/utils/explorer.ts
    - Imports: node:child_process
- RateLtd/src/utils/layout.ts
- RateLtd/src/utils/clipboard.ts
    - Imports: clipboardy
- RateLtd/src/utils/markdown.ts
    - Imports: ../commands/runner.js
- RateLtd/src/utils/logger.ts
    - Imports: node:fs, node:path, ../commands/runner.js, ./runSession.js
- RateLtd/src/utils/packageScripts.ts
    - Imports: node:fs, node:path, ../types/profile.js
- RateLtd/src/utils/profiles.ts
    - Imports: node:fs, node:path, ../types/profile.js, ./packageScripts.js
- RateLtd/src/utils/terminalSize.ts
    - Imports: react
- RateLtd/src/utils/runSession.ts
    - Imports: ../commands/runner.js
- RateLtd/src/utils/repo.ts
    - Imports: node:fs, node:path, node:child_process, ../brand/rateLtd.js
- RateLtd/src/utils/terminalText.ts

### RateLtd/src

- RateLtd/src/.editorconfig
- RateLtd/src/cli.ts
    - Imports: react, ink, ./app.js, ./utils/repo.js, ./brand/rateLtd.js
- RateLtd/src/app.tsx
    - Imports: react, ./utils/repo.js, ./components/AppFrame.js, ./components/AppScreens.js, ./state/useMeatHarnessController.js
- RateLtd/src/theme.ts

### RateLtd

- RateLtd/.gitignore
- RateLtd/README.md
- RateLtd/tsconfig.json
- RateLtd/vitest.config.ts
    - Imports: vitest/config
- RateLtd/components.json
- RateLtd/package.json
- RateLtd/pnpm-lock.yaml
- RateLtd/theme-provider.tsx
    - Imports: react, /lib/terminal-themes/default

## File Types Summary

- jsonl: 1 files
- yml: 1 files
- md: 11 files
- json: 4 files
- png: 8 files
- ts: 53 files
- tsx: 36 files
- css: 1 files
- editorconfig: 1 files
- gitignore: 1 files
- yaml: 1 files

# Codebase Export

## RateLtd/src

### RateLtd/src/brand/

#### RateLtd/src/brand/asciiLogo.ts

```ts
import React from "react"
import { Text } from "ink"

import { rateLtdBrand } from "./rateLtd.js"

export function AsciiLogo() {
    return React.createElement(
        Text,
        { bold: true },
        React.createElement(Text, { color: "cyan" }, "RATE"),
        React.createElement(Text, { color: "magenta" }, "LTD"),
    )
}

export const asciiLogoText = rateLtdBrand.productName
```

#### RateLtd/src/brand/themes.ts

```ts
export type ThemeTokenSet = {
    name: "matrix" | "vercel" | "fallbackAscii"
    primary: string
    secondary: string
    accent: string
    muted: string
    danger: string
    warning: string
    background: string
    gradient: string[]
    asciiOnly: boolean
}

export const themes = {
    matrix: {
        name: "matrix",
        primary: "greenBright",
        secondary: "green",
        accent: "cyanBright",
        muted: "gray",
        danger: "redBright",
        warning: "yellowBright",
        background: "black",
        gradient: ["#00ff66", "#00d9ff", "#ff00aa"],
        asciiOnly: false,
    },
    vercel: {
        name: "vercel",
        primary: "white",
        secondary: "gray",
        accent: "cyanBright",
        muted: "gray",
        danger: "redBright",
        warning: "yellowBright",
        background: "black",
        gradient: ["#ffffff", "#888888", "#00d9ff"],
        asciiOnly: false,
    },
    fallbackAscii: {
        name: "fallbackAscii",
        primary: "white",
        secondary: "gray",
        accent: "cyan",
        muted: "gray",
        danger: "red",
        warning: "yellow",
        background: "black",
        gradient: ["white"],
        asciiOnly: true,
    },
} as const satisfies Record<string, ThemeTokenSet>
```

#### RateLtd/src/brand/rateLtd.ts

```ts
export const rateLtdBrand = {
    productName: "RateLtd",
    displayTitle: "RateLtd",
    commandName: "rateltd",
    tagline: "Repo-agnostic terminal operator console",
    versionLabel: "v0.2.0",
    defaultTheme: "matrix",
    oldConfigDir: ".meatharness",
    newConfigDir: ".rateltd",
} as const

export type RateLtdBrand = typeof rateLtdBrand
```

### RateLtd/src/commands/

#### RateLtd/src/commands/files.ts

```ts
import { existsSync, mkdirSync, readFileSync, writeFileSync } from "node:fs"
import path from "node:path"
import { createTwoFilesPatch } from "diff"
import { assertInsideRepoPath } from "../utils/repo.js"
import { appendAgentLog } from "../utils/logger.js"

export type FileWritePayload = {
    files: Array<{ path: string; content: string }>
}

export type FileWritePlan = {
    payload: FileWritePayload
    paths: string[]
    diff: string
}

export type AppliedFileWrite = {
    path: string
    absolutePath: string
    operation: "created" | "updated" | "unchanged"
    bytesWritten: number
}

export type ApplyWritesResult = {
    changed: string[]
    files: AppliedFileWrite[]
    created: number
    updated: number
    unchanged: number
    bytesWritten: number
    logPath: string
}

const markdownFence = "`".repeat(3)

export function parseFileWritePayload(input: string): FileWritePayload {
    const raw = unwrapWholeJsonFence(input)
    const parsed = JSON.parse(raw) as FileWritePayload

    if (!parsed || !Array.isArray(parsed.files)) {
        throw new Error("Payload must be JSON with a files array.")
    }

    const seenPaths = new Set<string>()

    for (const file of parsed.files) {
        if (typeof file.path !== "string" || typeof file.content !== "string") {
            throw new Error("Each file requires path and content strings.")
        }

        const normalizedPath = path.normalize(file.path)

        if (
            path.isAbsolute(normalizedPath) ||
            normalizedPath.startsWith("..")
        ) {
            throw new Error(
                `File path must stay inside target repo: ${file.path}`,
            )
        }

        if (seenPaths.has(normalizedPath)) {
            throw new Error(`Duplicate file write path: ${file.path}`)
        }

        seenPaths.add(normalizedPath)
    }

    return parsed
}

export function planFileWrites(repoRoot: string, input: string): FileWritePlan {
    const payload = parseFileWritePayload(input)
    const paths = payload.files.map((file) => file.path)
    const diff = previewWrites(repoRoot, payload)

    appendAgentLog({
        repoRoot,
        event: "file_write_planned",
        screen: "write",
        message: `Planned ${paths.length} file write(s).`,
        data: {
            paths,
            fileCount: paths.length,
            diffBytes: diff.length,
        },
    })

    return { payload, paths, diff }
}

export function previewWrites(
    repoRoot: string,
    payload: FileWritePayload,
): string {
    return payload.files
        .map((file) => {
            const target = assertInsideRepoPath(repoRoot, file.path)
            const current =
                existsSync(target) ? readFileSync(target, "utf8") : ""

            return createTwoFilesPatch(
                file.path,
                file.path,
                current,
                file.content,
                "current",
                "incoming",
            )
        })
        .join("\n")
}

export function applyWrites(
    repoRoot: string,
    payload: FileWritePayload,
): ApplyWritesResult {
    const files: AppliedFileWrite[] = []
    const changed: string[] = []

    for (const file of payload.files) {
        const target = assertInsideRepoPath(repoRoot, file.path)
        const existed = existsSync(target)
        const previous = existed ? readFileSync(target, "utf8") : undefined
        const operation: AppliedFileWrite["operation"] =
            previous === file.content ? "unchanged"
            : existed ? "updated"
            : "created"

        mkdirSync(path.dirname(target), { recursive: true })
        writeFileSync(target, file.content, "utf8")

        files.push({
            path: file.path,
            absolutePath: target,
            operation,
            bytesWritten: Buffer.byteLength(file.content, "utf8"),
        })

        if (operation !== "unchanged") {
            changed.push(target)
        }
    }

    const created = files.filter((file) => file.operation === "created").length
    const updated = files.filter((file) => file.operation === "updated").length
    const unchanged = files.filter(
        (file) => file.operation === "unchanged",
    ).length
    const bytesWritten = files.reduce(
        (total, file) => total + file.bytesWritten,
        0,
    )
    const logPath = appendAgentLog({
        repoRoot,
        event: "file_write_applied",
        screen: "write",
        message: `Applied ${files.length} file write(s): ${created} created, ${updated} updated, ${unchanged} unchanged.`,
        data: {
            fileCount: files.length,
            changedCount: changed.length,
            created,
            updated,
            unchanged,
            bytesWritten,
            files,
            backups: false,
        },
    })

    return {
        changed,
        files,
        created,
        updated,
        unchanged,
        bytesWritten,
        logPath,
    }
}

function unwrapWholeJsonFence(input: string): string {
    const trimmed = input.trim()

    if (!trimmed.startsWith(markdownFence)) {
        return input
    }

    const firstLineEnd = trimmed.indexOf("\n")

    if (firstLineEnd < 0) {
        return input
    }

    const openingFence = trimmed.slice(0, firstLineEnd).trim().toLowerCase()

    if (
        openingFence !== markdownFence &&
        openingFence !== `${markdownFence}json`
    ) {
        return input
    }

    const closingFenceStart = trimmed.lastIndexOf(markdownFence)

    if (closingFenceStart <= firstLineEnd) {
        return input
    }

    const trailingText = trimmed
        .slice(closingFenceStart + markdownFence.length)
        .trim()

    if (trailingText.length > 0) {
        return input
    }

    return trimmed.slice(firstLineEnd + 1, closingFenceStart).trim()
}
```

#### RateLtd/src/commands/git.ts

```ts
export type GitCommand = {
    id: string
    label: string
    command: string
    requiresConfirmation?: boolean
}

export const gitCommands: GitCommand[] = [
    {
        id: "git-status",
        label: "Status",
        command: "git status --short --branch",
    },
    {
        id: "git-diff-stat",
        label: "Diff stat",
        command: "git diff --stat",
    },
    {
        id: "git-diff",
        label: "Diff full",
        command: "git diff -- . ':!pnpm-lock.yaml' ':!tsconfig.tsbuildinfo'",
    },
    {
        id: "git-diff-staged",
        label: "Diff staged",
        command: "git diff --staged",
    },
    {
        id: "git-recent",
        label: "Recent commits",
        command: "git log --oneline --decorate -20",
    },
    {
        id: "git-remote",
        label: "Remotes",
        command: "git remote -v",
    },
    {
        id: "git-add-all",
        label: "Stage all",
        command: "git add .",
        requiresConfirmation: true,
    },
    {
        id: "git-commit-disabled",
        label: "Commit with message",
        command: 'git commit -m "<message>"',
        requiresConfirmation: true,
    },
    {
        id: "git-push",
        label: "Push branch",
        command: "git push",
        requiresConfirmation: true,
    },
]
```

#### RateLtd/src/commands/pnpm.ts

```ts
export type PackageScriptCommand = {
    id: string
    label: string
    command: string
    script: string
    available: boolean
    group: "package"
    requiresConfirmation?: boolean
}

export type ValidationCommand = {
    id: string
    label: string
    command: string
    requiresConfirmation?: boolean
}

const standardScriptLabels: Record<string, string> = {
    "validate:contracts": "Contract validate",
    "prisma:validate": "Prisma validate",
    typecheck: "TypeScript check",
    lint: "Lint",
    test: "Unit tests",
    build: "Build",
    validate: "Full validate",
    "test:e2e": "E2E tests",
    dev: "Dev server",
    start: "Start",
    verify: "Verify",
}

const mediumRiskScripts = new Set([
    "build",
    "dev",
    "start",
    "test",
    "test:e2e",
    "validate",
    "verify",
])

export const validationCommands: ValidationCommand[] = [
    {
        id: "validate-contracts",
        label: "Contract validate",
        command: "pnpm validate:contracts",
    },
    {
        id: "prisma-validate",
        label: "Prisma validate",
        command: "pnpm prisma:validate",
    },
    {
        id: "typecheck",
        label: "TypeScript check",
        command: "pnpm typecheck",
    },
    {
        id: "lint",
        label: "Lint",
        command: "pnpm lint",
    },
    {
        id: "test",
        label: "Unit tests",
        command: "pnpm test",
        requiresConfirmation: true,
    },
    {
        id: "build",
        label: "Build",
        command: "pnpm build",
        requiresConfirmation: true,
    },
    {
        id: "validate",
        label: "Full validate",
        command: "pnpm validate",
        requiresConfirmation: true,
    },
    {
        id: "test-e2e",
        label: "E2E tests",
        command: "pnpm test:e2e",
        requiresConfirmation: true,
    },
]

export function buildPackageScriptCommands(
    scripts: string[],
): PackageScriptCommand[] {
    const available = new Set(scripts)

    return Object.entries(standardScriptLabels)
        .filter(([script]) => available.has(script))
        .map(([script, label]) => ({
            id: `pnpm-${script.replace(/[^a-z0-9]+/gi, "-").toLowerCase()}`,
            label,
            command: `pnpm ${script}`,
            script,
            available: true,
            group: "package",
            requiresConfirmation: mediumRiskScripts.has(script),
        }))
}
```

#### RateLtd/src/commands/search.ts

```ts
export type SearchCommand = {
    id: string
    label: string
    command: string
    queryRequired?: boolean
    queryLabel?: string
    defaultScopes?: string[]
}

export type SearchProfile = "generic" | "meatharness" | "next" | "vouch"

export const searchCommands: SearchCommand[] = [
    {
        id: "find-files",
        label: "Find files",
        command: "rg --files",
    },
    {
        id: "route-inventory",
        label: "Route inventory",
        command: "rg --files app | sort",
    },
    {
        id: "source-inventory",
        label: "Source inventory",
        command:
            "rg --files app components features lib schemas types prisma tests .agents | sort",
    },
    {
        id: "search-content",
        label: "Search contents",
        command: 'rg -n "<query>" .',
        queryRequired: true,
        queryLabel: "Search query: ",
        defaultScopes: ["."],
    },
    {
        id: "search-stubs",
        label: "Search TODO/FIXME/stubs",
        command:
            'rg -n "TODO|FIXME|SCAFFOLD_NOT_IMPLEMENTED|throw new Error\\(|not implemented|placeholder" app components features lib schemas types prisma tests .agents -g "*.ts" -g "*.tsx" -g "*.md" -g "*.yaml" -g "*.json" -g "*.prisma"',
    },
    {
        id: "boundary-audit",
        label: "Boundary audit",
        command:
            'rg -n "@/lib/db|@/lib/integrations/stripe|@clerk/nextjs/server|prisma\\." app components features -g "*.ts" -g "*.tsx"',
    },
    {
        id: "payment-audit",
        label: "Payment audit",
        command:
            'rg -n "PaymentIntent|transfer|capture|refund|application_fee|applicationFee|Stripe|stripe|Connect|webhook" app lib features components schemas types prisma .agents -g "*.ts" -g "*.tsx" -g "*.prisma" -g "*.md" -g "*.yaml"',
    },
    {
        id: "vouch-lifecycle-audit",
        label: "Vouch lifecycle audit",
        command:
            'rg -n "confirm|presence|release|refund|void|capture|window|expired|payer|payee|merchant|customer" lib features components schemas types prisma .agents -g "*.ts" -g "*.tsx" -g "*.prisma" -g "*.md" -g "*.yaml"',
    },
    {
        id: "next-revalidate-audit",
        label: "Revalidate audit",
        command:
            'rg -n "revalidatePath\\(|revalidateTag\\(|updateTag\\(|cacheTag\\(|unstable_cache" app lib features -g "*.ts" -g "*.tsx"',
    },
    {
        id: "clerk-audit",
        label: "Clerk audit",
        command:
            'rg -n "@clerk|clerk|auth\\(|currentUser|getAuth|middleware|proxy" app lib features components proxy.ts middleware.ts -g "*.ts" -g "*.tsx"',
    },
    {
        id: "forbidden-product-audit",
        label: "Forbidden product audit",
        command:
            'rg -n "browse|provider directory|public profile|rating|review|message|chat|dispute|evidence|marketplace|category|search providers|force release|manual award" app components features lib schemas types prisma .agents -g "*.ts" -g "*.tsx" -g "*.prisma" -g "*.md" -g "*.yaml"',
    },
]

export function getSearchScopes(profile: SearchProfile): string[] {
    if (profile === "meatharness") return ["src"]
    if (profile === "vouch") {
        return [
            "app",
            "components",
            "features",
            "lib",
            "types",
            "schemas",
            "prisma",
            "tests",
            ".agents",
        ]
    }
    if (profile === "next") {
        return [
            "app",
            "components",
            "features",
            "lib",
            "types",
            "schemas",
            "prisma",
        ]
    }
    return ["."]
}

export function buildSearchCommand(
    command: SearchCommand,
    query?: string,
    scopes?: string[],
): string {
    if (!command.queryRequired) {
        return command.command
    }

    const normalizedQuery = query?.trim()

    if (!normalizedQuery) {
        throw new Error(`${command.label} requires a search query.`)
    }

    const activeScopes =
        scopes && scopes.length > 0 ? scopes : (command.defaultScopes ?? ["."])

    return ["rg", "-n", formatRgPattern(normalizedQuery), ...activeScopes].join(
        " ",
    )
}

function formatRgPattern(pattern: string): string {
    return `\"${pattern.replace(/\"/g, '\\\"')}\"`
}
```

#### RateLtd/src/commands/runner.ts

```ts
import { spawn } from "node:child_process"
import { performance } from "node:perf_hooks"

export type RiskLevel = "safe" | "medium" | "destructive"

export type CommandResult = {
    command: string
    cwd: string
    timestamp: string
    exitCode: number | null
    stdout: string
    stderr: string
    durationMs: number
}

export type ScriptEntry = {
    id: string
    label: string
    description: string
    command: string
    workingDirectory: string
    riskLevel: RiskLevel
    requiresConfirmation: boolean
}

export type StreamCommandOptions = {
    executable: string
    args: string[]
    cwd: string
    displayCommand?: string
    timeoutMs?: number
    signal?: AbortSignal
    onStdout?: (chunk: string) => void
    onStderr?: (chunk: string) => void
}

export type StreamCommandLineOptions = Omit<
    StreamCommandOptions,
    "executable" | "args" | "cwd" | "displayCommand"
>

const defaultCommandTimeoutMs = 1000 * 60 * 20

export function detectCommandRisk(command: string): RiskLevel {
    if (parseRgCommandArgs(command)) return "safe"

    const normalized = command.trim().toLowerCase()

    if (
        /\bgit\s+reset\b/.test(normalized) ||
        /\bgit\s+clean\b/.test(normalized) ||
        /\bgit\s+push\b[\s\S]*(--force|-f)\b/.test(normalized) ||
        /\bgit\s+checkout\b[\s\S]*\s-f\b/.test(normalized) ||
        /\bgit\s+restore\s+\./.test(normalized) ||
        /\bremove-item\b/.test(normalized) ||
        /\bdel\s+/.test(normalized) ||
        /\brm\s+/.test(normalized) ||
        /\bri\s+/.test(normalized) ||
        /\brmdir\b/.test(normalized) ||
        /\bdrop\s+database\b/.test(normalized) ||
        /\bpnpm\s+prisma\s+migrate\s+reset\b/.test(normalized) ||
        /\bpnpm\s+db:reset\b/.test(normalized) ||
        /\bcmd\s+\/c\s+del\b/.test(normalized)
    ) {
        return "destructive"
    }

    if (
        /\bgit\s+(add|commit|push|pull)\b/.test(normalized) ||
        /\bpnpm\s+(build|test|dev|start|validate|validate:all|test:e2e)\b/.test(
            normalized,
        ) ||
        /\bprisma\s+migrate\b/.test(normalized)
    ) {
        return "medium"
    }

    return "safe"
}

export async function runCommand(
    command: string,
    cwd: string,
): Promise<CommandResult> {
    return await streamCommandLine(command, cwd)
}

export async function streamCommandLine(
    command: string,
    cwd: string,
    options: StreamCommandLineOptions = {},
): Promise<CommandResult> {
    const shell = getPlatformShell(command)

    return await streamCommand({
        executable: shell.executable,
        args: shell.args,
        cwd,
        displayCommand: command,
        timeoutMs: options.timeoutMs ?? defaultCommandTimeoutMs,
        ...options,
    })
}

export async function runCommandArgs(
    executable: string,
    args: string[],
    cwd: string,
    displayCommand = formatCommandArgs(executable, args),
): Promise<CommandResult> {
    if (process.platform === "win32") {
        return await streamCommandLine(displayCommand, cwd)
    }

    return await streamCommand({
        executable,
        args,
        cwd,
        displayCommand,
        timeoutMs: defaultCommandTimeoutMs,
    })
}

export async function streamCommand(
    options: StreamCommandOptions,
): Promise<CommandResult> {
    const started = performance.now()
    const timestamp = new Date().toISOString()
    const displayCommand =
        options.displayCommand ??
        formatCommandArgs(options.executable, options.args)

    return await new Promise((resolve) => {
        let stdout = ""
        let stderr = ""
        let resolved = false
        let timeout: NodeJS.Timeout | undefined

        let child: ReturnType<typeof spawn>

        try {
            child = spawn(options.executable, options.args, {
                cwd: options.cwd,
                env: process.env,
                windowsHide: true,
            })
        } catch (error) {
            resolve({
                command: displayCommand,
                cwd: options.cwd,
                timestamp,
                exitCode: 1,
                stdout: "",
                stderr: error instanceof Error ? error.message : String(error),
                durationMs: Math.round(performance.now() - started),
            })
            return
        }

        const finalize = (exitCode: number | null, stderrSuffix = "") => {
            if (resolved) return
            resolved = true

            if (timeout) clearTimeout(timeout)

            options.signal?.removeEventListener("abort", abortHandler)

            if (stderrSuffix.length > 0) {
                stderr = appendLine(stderr, stderrSuffix)
            }

            resolve({
                command: displayCommand,
                cwd: options.cwd,
                timestamp,
                exitCode,
                stdout,
                stderr,
                durationMs: Math.round(performance.now() - started),
            })
        }

        const abortHandler = () => {
            child.kill()
            finalize(1, "Command cancelled.")
        }

        if (options.signal?.aborted) {
            abortHandler()
            return
        }

        options.signal?.addEventListener("abort", abortHandler, { once: true })

        timeout = setTimeout(() => {
            child.kill()
            finalize(
                1,
                `Command timed out after ${options.timeoutMs ?? defaultCommandTimeoutMs}ms.`,
            )
        }, options.timeoutMs ?? defaultCommandTimeoutMs)

        child.stdout?.on("data", (chunk: Buffer) => {
            const text = chunk.toString()
            stdout += text
            options.onStdout?.(text)
        })

        child.stderr?.on("data", (chunk: Buffer) => {
            const text = chunk.toString()
            stderr += text
            options.onStderr?.(text)
        })

        child.on("close", (exitCode) => finalize(exitCode))
        child.on("error", (error) => finalize(1, error.message))
    })
}

function getPlatformShell(command: string): {
    executable: string
    args: string[]
} {
    if (process.platform !== "win32") {
        return { executable: "/bin/sh", args: ["-c", command] }
    }

    return {
        executable: "pwsh.exe",
        args: [
            "-NoLogo",
            "-NoProfile",
            "-NonInteractive",
            "-ExecutionPolicy",
            "Bypass",
            "-Command",
            command,
        ],
    }
}

function parseRgCommandArgs(command: string): string[] | undefined {
    const trimmed = command.trim()

    if (trimmed === "rg --files") {
        return ["--files"]
    }

    const match = trimmed.match(/^rg\s+-n\s+"([\s\S]*)"\s+(.+)$/)

    if (!match) {
        return undefined
    }

    const [, rawPattern, rawScopes] = match
    const scopes = rawScopes.trim().split(/\s+/).filter(Boolean)

    if (scopes.length === 0) {
        return undefined
    }

    return ["-n", rawPattern.replace(/\\"/g, '"'), ...scopes]
}

function formatCommandArgs(executable: string, args: string[]): string {
    return [executable, ...args.map(formatArg)].join(" ")
}

function formatArg(arg: string): string {
    if (arg.length === 0) return '""'
    if (!/[\s";]/.test(arg)) return arg
    return `"${arg.replace(/"/g, '\\"')}"`
}

function appendLine(existing: string, next: string): string {
    if (existing.length === 0) return next
    return `${existing.trimEnd()}\n${next}`
}
```

### RateLtd/src/components

#### RateLtd/src/components/AgentHelpModal.tsx

```tsx
import React from "react"
import { Box, Text } from "ink"
import type { MeatHarnessController } from "../state/appTypes.js"
import { activeTheme } from "../theme.js"
import { Panel } from "./Panel.js"
import { clipTextLines } from "../utils/terminalText.js"
import type { AppViewport } from "../utils/layout.js"

export const agentHelpInstructions = `You are helping edit a local repository through the RateLtd TUI. The user will apply edits using CommanderLtd clipboard intake, run checks through CommanderLtd ops, inspect output through LoggerLtd, then commit/push when ready.

PRIMARY RULES
- Output complete file-write JSON only when asked for code edits.
- Do not output snippets unless the user explicitly asks for snippets.
- Do not ask the user to manually edit multiple scattered lines.
- Prefer whole-file replacement payloads for reliability.
- Keep patches small and focused.
- Include tests only when the user asks for tests.
- Do not add backup-file behavior.
- Assume writes are direct. The TUI logs events to .agent-logs/events.jsonl.

COMMANDERLTD FILE-WRITE JSON FORMAT
Paste JSON shaped like this into the clipboard, then use CommanderLtd clipboard intake:

{
  "files": [
    {
      "path": "src/path/to/file.ts",
      "content": "FULL FILE CONTENT HERE"
    }
  ]
}

RULES FOR FILE PAYLOADS
- "path" must be repo-relative.
- "content" must contain the full final file content.
- Escape JSON strings correctly.
- Preserve TypeScript imports and exports.
- Do not include markdown fences inside JSON content.
- Do not include REPLACE_ONLY instructions unless the user explicitly asks for manual edits.
- Prefer one to three files per patch unless the user asks for more.

TUI SCREENS
1 LAUNCHERLTD
- Selects the target repository.
- Enter sets the selected repo as the target.
- The target repo is the root for file writes and command execution.

2 RATELTD
- Shows target repo, Git state, log count, settings path, and diagnostics.

3 EDITORLTD
- Previews files and opens the configured external editor.

4 COMMANDERLTD CLIPBOARD
- Loads clipboard JSON or command text.
- Previews file-write diffs.
- Enter loads or confirms the pending action.
- Esc clears the current plan.
- Writes are direct and logged.

5 COMMANDERLTD OPS
- Runs built-in commands such as typecheck, build, tests, git status, rg searches.
- Enter runs the selected command.
- Output should stream to LoggerLtd.

6 DIFFERLTD
- Shows real Git status and diffs.
- S stages, U unstages, X reverts with confirmation, P copies patch.

7 LOGGERLTD
- Shows live command stdout/stderr and the latest command result.
- Reads .agent-logs/events.jsonl.
- C copies full output.
- S saves a log.
- X cancels a running command.

8 PREFERLTD
- Reads and writes .rateltd/settings.json.
- T cycles theme, S saves settings.

LOGGING
- Machine-readable agent/activity logs live in .agent-logs/events.jsonl.
- Logs should capture file writes, command starts, command finishes, errors, and copied/saved output events.
- Use logs to infer what happened instead of asking the user to paste everything.

RESPONSE STYLE FOR THIS WORKFLOW
- Be direct.
- Provide the exact file payload or exact file contents.
- Avoid long explanations unless diagnosing a failure.
- When fixing failures, identify the specific file and function causing the issue.
- Never claim a command passed unless the user shows it or logs prove it.`

export function AgentHelpModal({
    controller,
    viewport,
}: {
    controller: MeatHarnessController
    viewport: AppViewport
}) {
    const width = viewport.bodyColumns
    const height = viewport.bodyRows
    const textWidth = Math.max(1, width - 5)
    const diagnosticLines = Math.min(8, controller.diagnostics.length)
    const textLines = Math.max(
        3,
        Math.floor((height - diagnosticLines - 8) / 2),
    )
    const handoffLines = Math.max(3, height - textLines - diagnosticLines - 9)

    return (
        <Box
            width={width}
            height={height}
            overflow="hidden"
        >
            <Panel
                title="RATELTD INSTRUCTIONS"
                tone="warning"
                width={width}
                minHeight={height}
            >
                <Text>
                    {clipTextLines(agentHelpInstructions, {
                        maxLines: textLines,
                        maxColumns: textWidth,
                        startLine: 0,
                    })}
                </Text>

                <Text
                    color={activeTheme.primary}
                    bold
                >
                    SHORTCUTS / DIAGNOSTICS
                </Text>
                <Text color={activeTheme.muted}>
                    1 Launcher â€¢ 2 Dashboard â€¢ 3 Editor â€¢ 4 Clipboard â€¢ 5 Ops â€¢
                    6 Differ â€¢ 7 Logger â€¢ 8 Prefer â€¢ ? Help â€¢ q Quit
                </Text>
                <Text color={activeTheme.primary}>
                    C copy instructions â€¢ R rerun diagnostics â€¢ D copy
                    diagnostics â€¢ H copy sanitized handoff
                </Text>
                <Text />
                {controller.diagnostics
                    .slice(0, diagnosticLines)
                    .map((check) => (
                        <Text
                            key={check.id}
                            color={
                                check.status === "fail" ? activeTheme.danger
                                : check.status === "warn" ?
                                    activeTheme.warning
                                :   activeTheme.primary
                            }
                        >
                            {check.status.toUpperCase().padEnd(4)} {check.label}
                            : {check.detail}
                        </Text>
                    ))}
                <Text />
                <Text
                    color={activeTheme.primary}
                    bold
                >
                    HANDOFF GUIDANCE
                </Text>
                <Text color={activeTheme.muted}>
                    Sanitized packet includes target summary, Git status/diff
                    stat, recent commands, latest failure, and log tail.
                </Text>
                <Text>
                    {clipTextLines(controller.handoffPacket, {
                        maxLines: handoffLines,
                        maxColumns: textWidth,
                    })}
                </Text>
            </Panel>
        </Box>
    )
}
```

#### RateLtd/src/components/AppScreens.tsx

```tsx
import React from "react"
import { ConfirmDialog } from "./ConfirmDialog.js"
import { RepoLauncher } from "./RepoLauncher.js"
import { WriterScreen } from "./WriterScreen.js"
import { OpsDeckScreen } from "./OpsDeckScreen.js"
import { OutputScreen } from "./OutputScreen.js"
import { AgentHelpModal } from "./AgentHelpModal.js"
import { RateDashboardScreen } from "./RateDashboardScreen.js"
import { EditorLtdScreen } from "./EditorLtdScreen.js"
import { DifferLtdScreen } from "./DifferLtdScreen.js"
import { PreferLtdScreen } from "./PreferLtdScreen.js"
import type { MeatHarnessController } from "../state/appTypes.js"
import { normalizeScreen } from "../state/screens.js"
import type { AppViewport } from "../utils/layout.js"

export function AppScreens({
    controller,
    viewport,
}: {
    controller: MeatHarnessController
    viewport: AppViewport
}) {
    const screen = normalizeScreen(controller.screen)

    if (screen === "confirm" && controller.pending) {
        return (
            <ConfirmDialog
                title={controller.pending.title}
                body={controller.pending.body}
                onConfirm={() => void controller.pending?.run()}
                onCancel={() =>
                    controller.setScreen(
                        controller.pending?.cancelScreen ?? "write",
                    )
                }
            />
        )
    }

    if (screen === "agent-help") {
        return (
            <AgentHelpModal
                controller={controller}
                viewport={viewport}
            />
        )
    }

    if (screen === "launcher")
        return (
            <RepoLauncher
                controller={controller}
                viewport={viewport}
            />
        )
    if (screen === "rate")
        return (
            <RateDashboardScreen
                controller={controller}
                viewport={viewport}
            />
        )
    if (screen === "editor")
        return (
            <EditorLtdScreen
                controller={controller}
                viewport={viewport}
            />
        )
    if (screen === "write")
        return (
            <WriterScreen
                controller={controller}
                viewport={viewport}
            />
        )
    if (screen === "ops")
        return (
            <OpsDeckScreen
                controller={controller}
                viewport={viewport}
            />
        )
    if (screen === "differ")
        return (
            <DifferLtdScreen
                controller={controller}
                viewport={viewport}
            />
        )
    if (screen === "prefer")
        return (
            <PreferLtdScreen
                controller={controller}
                viewport={viewport}
            />
        )
    return (
        <OutputScreen
            controller={controller}
            viewport={viewport}
        />
    )
}
```

#### RateLtd/src/components/Banner.tsx

```tsx
import React from "react"
import { AsciiLogo } from "../brand/asciiLogo.js"

export function Banner() {
    return <AsciiLogo />
}
```

#### RateLtd/src/components/ConfirmDialog.tsx

```tsx
import React, { useState } from "react"
import { Box, Text, useInput } from "ink"
import { activeTheme } from "../theme.js"
import { clipTextLines } from "../utils/terminalText.js"

type ConfirmChoice = "yes" | "no"

export function ConfirmDialog({
    title,
    body,
    onConfirm,
    onCancel,
}: {
    title: string
    body: string
    onConfirm: () => void
    onCancel: () => void
}) {
    const [choice, setChoice] = useState<ConfirmChoice>("no")

    useInput((input, key) => {
        if (key.leftArrow || key.rightArrow) {
            setChoice((current) => (current === "yes" ? "no" : "yes"))
            return
        }

        if (input.toLowerCase() === "y") {
            setChoice("yes")
            return
        }

        if (input.toLowerCase() === "n") {
            setChoice("no")
            return
        }

        if (key.escape) {
            onCancel()
            return
        }

        if (key.return) {
            if (choice === "yes") onConfirm()
            else onCancel()
        }
    })

    return (
        <Box
            flexDirection="column"
            width="100%"
        >
            <Box
                borderStyle="double"
                borderColor={activeTheme.warning}
                paddingX={1}
                flexDirection="column"
                width="100%"
            >
                <Text
                    color={activeTheme.warning}
                    bold
                >
                    {title}
                </Text>

                <Text>
                    {clipTextLines(body, {
                        maxLines: 12,
                        maxColumns: 96,
                    })}
                </Text>

                <Text />

                <Box
                    flexDirection="row"
                    gap={2}
                >
                    <Choice
                        label="YES"
                        selected={choice === "yes"}
                    />
                    <Choice
                        label="NO"
                        selected={choice === "no"}
                    />
                </Box>

                <Text color={activeTheme.muted}>
                    â†/â†’ choose â€¢ Enter confirm â€¢ Esc cancel â€¢ default NO
                </Text>
            </Box>
        </Box>
    )
}

function Choice({ label, selected }: { label: string; selected: boolean }) {
    return (
        <Text
            color={selected ? "black" : activeTheme.muted}
            backgroundColor={selected ? activeTheme.primary : undefined}
            bold={selected}
        >
            {` [ ${label} ] `}
        </Text>
    )
}
```

#### RateLtd/src/components/DifferLtdScreen.tsx

```tsx
import React from "react"
import { Box, Text } from "ink"
import type { MeatHarnessController } from "../state/appTypes.js"
import type { AppViewport } from "../utils/layout.js"
import {
    createTwoColumnLayout,
    windowAroundSelection,
} from "../utils/layout.js"
import { Panel, FieldRow } from "./Panel.js"
import { activeTheme } from "../theme.js"
import { clipTextLines, truncateLine } from "../utils/terminalText.js"

export function DifferLtdScreen({
    controller,
    viewport,
}: {
    controller: MeatHarnessController
    viewport: AppViewport
}) {
    const layout = createTwoColumnLayout(viewport, 0.58, 44, 48)
    const selected =
        controller.gitSummary.changedFiles[controller.diffSelectedIndex]
    const rows = windowAroundSelection(
        controller.gitSummary.changedFiles,
        controller.diffSelectedIndex,
        Math.max(4, viewport.bodyRows - 10),
    )
    const counts = countKinds(controller.gitSummary.changedFiles)
    const diffText =
        controller.gitSummary.isGitRepo ?
            selected ? controller.selectedDiffText || "(no file diff output)"
            :   controller.gitSummary.diffStat ||
                controller.gitSummary.statusText ||
                "Clean working tree. Use CommanderLtd Ops for git log/remote/status macros."
        :   "Target is not a Git repository. Git status, diff, stage, unstage, and revert are unavailable for this folder target."

    return (
        <Box
            width={layout.totalWidth}
            height={viewport.bodyRows}
            flexDirection="row"
            gap={layout.gap}
            overflow="hidden"
        >
            <Panel
                title="DIFFERLTD GIT STATUS"
                tone="accent"
                width={layout.leftWidth}
                minHeight={viewport.bodyRows}
            >
                <FieldRow
                    label="branch"
                    value={controller.gitSummary.branch}
                />
                <FieldRow
                    label="repo"
                    value={
                        controller.gitSummary.isGitRepo ? "git repo" : "not git"
                    }
                />
                <FieldRow
                    label="changed"
                    value={String(controller.gitSummary.changedFiles.length)}
                />
                <FieldRow
                    label="counts"
                    value={`M ${counts.modified} A ${counts.added} D ${counts.deleted} R ${counts.renamed} U ${counts.untracked}`}
                />
                <Text />
                {rows.length > 0 ?
                    rows.map(({ item, index }) => (
                        <Text
                            key={`${item.path}:${index}`}
                            color={
                                index === controller.diffSelectedIndex ?
                                    activeTheme.primary
                                :   activeTheme.muted
                            }
                            bold={index === controller.diffSelectedIndex}
                        >
                            {index === controller.diffSelectedIndex ?
                                "> "
                            :   "  "}
                            {item.indexStatus}
                            {item.workTreeStatus}{" "}
                            {truncateLine(
                                item.path,
                                Math.max(12, layout.leftWidth - 10),
                            )}
                        </Text>
                    ))
                :   <Text
                        color={
                            controller.gitSummary.isGitRepo ?
                                activeTheme.primary
                            :   activeTheme.warning
                        }
                    >
                        {controller.gitSummary.isGitRepo ?
                            "Clean working tree."
                        :   "Git actions unavailable: target is a folder, not a Git repository."
                        }
                    </Text>
                }
                <Text />
                <Text color={activeTheme.muted}>
                    s stage â€¢ u unstage â€¢ x revert(confirm) â€¢ p copy patch
                </Text>
            </Panel>
            {layout.showRight && (
                <Panel
                    title={selected ? `DIFF ${selected.path}` : "DIFF"}
                    tone="primary"
                    width={layout.rightWidth}
                    minHeight={viewport.bodyRows}
                >
                    <Text>
                        {clipTextLines(diffText, {
                            maxLines: Math.max(4, viewport.bodyRows - 4),
                            maxColumns: Math.max(20, layout.rightWidth - 6),
                        })}
                    </Text>
                    <Text />
                    <Text color={activeTheme.muted}>
                        Modes available through real Git macros: file diff,
                        staged diff, stat diff.
                    </Text>
                    <Text color={activeTheme.warning}>
                        Revert requires confirmation. Stage/unstage are logged.
                    </Text>
                </Panel>
            )}
        </Box>
    )
}

function countKinds(
    files: MeatHarnessController["gitSummary"]["changedFiles"],
) {
    return {
        modified: files.filter((file) => file.kind === "modified").length,
        added: files.filter((file) => file.kind === "added").length,
        deleted: files.filter((file) => file.kind === "deleted").length,
        renamed: files.filter((file) => file.kind === "renamed").length,
        untracked: files.filter((file) => file.kind === "untracked").length,
    }
}
```

#### RateLtd/src/components/CommandOutputPanel.tsx

```tsx
import React from "react"
import { Text } from "ink"
import { clipTextLines } from "../utils/terminalText.js"

export function CommandOutputPanel({
    stdout,
    stderr,
    maxLines = 20,
}: {
    stdout: string
    stderr: string
    maxLines?: number
}) {
    return (
        <Text>
            {clipTextLines(
                [
                    "stdout:",
                    stdout || "(empty)",
                    "",
                    "stderr:",
                    stderr || "(empty)",
                ].join("\n"),
                { maxLines },
            )}
        </Text>
    )
}
```

#### RateLtd/src/components/EditorLtdScreen.tsx

```tsx
import React from "react"
import { Box, Text } from "ink"
import type { MeatHarnessController } from "../state/appTypes.js"
import type { AppViewport } from "../utils/layout.js"
import {
    createTwoColumnLayout,
    windowAroundSelection,
} from "../utils/layout.js"
import { Panel, FieldRow } from "./Panel.js"
import { activeTheme } from "../theme.js"
import { clipTextLines, truncateLine } from "../utils/terminalText.js"

export function EditorLtdScreen({
    controller,
    viewport,
}: {
    controller: MeatHarnessController
    viewport: AppViewport
}) {
    const layout = createTwoColumnLayout(viewport, 0.58, 44, 44)
    const selected = controller.editorFiles[controller.editorSelectedIndex]
    const selectedRow =
        controller.editorFileRows[controller.editorSelectedIndex]
    const rows = windowAroundSelection(
        controller.editorFileRows,
        controller.editorSelectedIndex,
        Math.max(4, viewport.bodyRows - 9),
    )

    return (
        <Box
            width={layout.totalWidth}
            height={viewport.bodyRows}
            flexDirection="row"
            gap={layout.gap}
            overflow="hidden"
        >
            <Panel
                title="FILE SEARCH / RESULTS"
                tone="accent"
                width={layout.leftWidth}
                minHeight={viewport.bodyRows}
            >
                <Text color={activeTheme.primary}>
                    Query: current target file index â€¢ Engine: local safe text
                    scan
                </Text>
                <Text />
                {rows.map(({ item, index }) => (
                    <Text
                        key={item.path}
                        color={
                            index === controller.editorSelectedIndex ?
                                activeTheme.primary
                            :   activeTheme.muted
                        }
                        bold={index === controller.editorSelectedIndex}
                    >
                        {index === controller.editorSelectedIndex ? "> " : "  "}
                        {truncateLine(
                            item.path,
                            Math.max(12, layout.leftWidth - 28),
                        ).padEnd(Math.max(12, layout.leftWidth - 28))}{" "}
                        {item.type.padEnd(6)}{" "}
                        {formatSize(item.sizeBytes).padStart(8)}
                    </Text>
                ))}
                <Text />
                <Text color={activeTheme.muted}>
                    Enter/e open external editor â€¢ r refresh index â€¢
                    binary/large files are guarded
                </Text>
            </Panel>
            {layout.showRight && (
                <Panel
                    title={selected ? `PREVIEW ${selected}` : "PREVIEW"}
                    tone="primary"
                    width={layout.rightWidth}
                    minHeight={viewport.bodyRows}
                >
                    <FieldRow
                        label="file"
                        value={selected ?? "none"}
                        maxValueColumns={Math.max(20, layout.rightWidth - 18)}
                    />
                    <FieldRow
                        label="type"
                        value={selectedRow?.type ?? "n/a"}
                    />
                    <FieldRow
                        label="size"
                        value={
                            selectedRow ?
                                formatSize(selectedRow.sizeBytes)
                            :   "n/a"
                        }
                    />
                    <FieldRow
                        label="modified"
                        value={selectedRow?.modifiedAt ?? "n/a"}
                        maxValueColumns={Math.max(20, layout.rightWidth - 18)}
                    />
                    <FieldRow
                        label="guard"
                        value={selectedRow?.guard ?? "n/a"}
                        valueColor={
                            selectedRow?.guard === "safe preview" ?
                                activeTheme.primary
                            :   activeTheme.warning
                        }
                    />
                    <Text />
                    <Text>
                        {clipTextLines(controller.editorPreview, {
                            maxLines: Math.max(4, viewport.bodyRows - 8),
                            maxColumns: Math.max(20, layout.rightWidth - 6),
                        })}
                    </Text>
                </Panel>
            )}
        </Box>
    )
}

function formatSize(bytes: number): string {
    if (bytes < 1024) return `${bytes} B`
    if (bytes < 1024 * 1024) return `${(bytes / 1024).toFixed(1)} KB`
    return `${(bytes / (1024 * 1024)).toFixed(1)} MB`
}
```

#### RateLtd/src/components/AppFrame.tsx

```tsx
import React, { useEffect, useState } from "react"
import { Box, Text } from "ink"
import type { RepoInfo } from "../utils/repo.js"
import { activeTheme } from "../theme.js"
import { useTerminalSize } from "../utils/terminalSize.js"
import { Banner } from "./Banner.js"
import {
    APP_FRAME_HEADER_ROWS,
    APP_FRAME_NAV_ROWS,
    APP_FRAME_SYSTEM_ROWS,
    createViewport,
    type AppViewport,
} from "../utils/layout.js"
import { NavigationTabs } from "./NavigationTabs.js"
import { normalizeScreen, screenMetadata } from "../state/navigation.js"

export function AppFrame({
    repo: _repo,
    activeScreen,
    isRunning,
    message,
    children,
}: {
    repo: RepoInfo
    activeScreen: string
    isRunning: boolean
    message: string
    children: (viewport: AppViewport) => React.ReactNode
}) {
    const terminal = useTerminalSize()
    const clock = useClock()
    const viewport = createViewport(terminal.columns, terminal.rows)
    const copy = screenMetadata[normalizeScreen(activeScreen)]
    const statusMessage = isRunning ? `running â€¢ ${message}` : message
    const systemPrefix = "SYSTEM: "
    const systemTextWidth = Math.max(
        1,
        viewport.bodyColumns - systemPrefix.length - 6,
    )

    return (
        <Box
            borderStyle="double"
            borderColor={activeTheme.primary}
            flexDirection="column"
            width={viewport.frameWidth}
            height={viewport.frameHeight}
            paddingX={1}
        >
            <HeaderBar
                badge={copy.badge}
                subtitle={copy.subtitle}
                clock={clock}
                width={viewport.bodyColumns}
            />

            <Box
                flexDirection="column"
                width={viewport.bodyColumns}
                height={viewport.bodyRows}
                overflow="hidden"
            >
                {children(viewport)}
            </Box>

            <Box height={1} />

            <SystemMessageBar
                width={viewport.bodyColumns}
                isRunning={isRunning}
                prefix={systemPrefix}
                message={truncate(statusMessage, systemTextWidth)}
            />

            <Box
                height={APP_FRAME_NAV_ROWS}
                overflow="hidden"
            >
                <NavigationTabs
                    active={activeScreen}
                    width={viewport.bodyColumns}
                />
            </Box>
        </Box>
    )
}

function HeaderBar({
    badge,
    subtitle,
    clock,
    width,
}: {
    badge: string
    subtitle: string
    clock: string
    width: number
}) {
    return (
        <Box
            flexDirection="row"
            justifyContent="space-between"
            width={width}
            height={APP_FRAME_HEADER_ROWS}
            overflow="hidden"
        >
            <Box
                borderStyle="single"
                borderColor={activeTheme.primary}
                paddingX={1}
            >
                <Text
                    color={activeTheme.primary}
                    bold
                >
                    {badge}
                </Text>
            </Box>

            <Box
                flexDirection="column"
                alignItems="center"
            >
                <Banner />
                <Text color={activeTheme.muted}>{subtitle}</Text>
            </Box>

            <Text color={activeTheme.muted}>{clock}</Text>
        </Box>
    )
}

function SystemMessageBar({
    width,
    isRunning,
    prefix,
    message,
}: {
    width: number
    isRunning: boolean
    prefix: string
    message: string
}) {
    return (
        <Box
            borderStyle="single"
            borderColor={isRunning ? activeTheme.warning : activeTheme.muted}
            width={width}
            height={APP_FRAME_SYSTEM_ROWS}
            paddingX={1}
            flexDirection="row"
            alignItems="center"
            overflow="hidden"
        >
            <Text>
                <Text
                    color={activeTheme.primary}
                    bold
                >
                    {prefix}
                </Text>
                <Text
                    color={isRunning ? activeTheme.warning : activeTheme.muted}
                >
                    {message}
                </Text>
            </Text>
        </Box>
    )
}

function useClock(): string {
    const [clock, setClock] = useState(() => formatClock())

    useEffect(() => {
        const timer = setInterval(() => {
            setClock(formatClock())
        }, 1000)

        return () => clearInterval(timer)
    }, [])

    return clock
}

function formatClock(): string {
    return new Date().toLocaleTimeString([], {
        hour: "2-digit",
        minute: "2-digit",
        second: "2-digit",
    })
}

function truncate(value: string, maxColumns: number): string {
    if (value.length <= maxColumns) return value
    if (maxColumns <= 1) return "â€¦"
    return `${value.slice(0, maxColumns - 1)}â€¦`
}
```

#### RateLtd/src/components/NavigationTabs.tsx

```tsx
import React from "react"
import { Box, Text } from "ink"
import { activeTheme } from "../theme.js"
import {
    normalizeScreen,
    primaryScreens,
    screenMetadata,
} from "../state/navigation.js"

export function NavigationTabs({
    active,
    width,
}: {
    active: string
    width: number
}) {
    const normalized = normalizeScreen(active)
    const utilityWidth = 22
    const tabWidth = Math.max(
        14,
        Math.floor((width - utilityWidth) / primaryScreens.length),
    )
    const usedWidth = tabWidth * primaryScreens.length + utilityWidth
    const spacerWidth = Math.max(0, width - usedWidth)

    return (
        <Box
            width={width}
            flexDirection="row"
        >
            {primaryScreens.map((screen) => {
                const metadata = screenMetadata[screen]
                const selected = screen === normalized
                const label = centerText(
                    `${metadata.shortcut ?? ""} ${metadata.displayName}`,
                    tabWidth - 2,
                )

                return (
                    <Box
                        key={screen}
                        borderStyle="single"
                        borderColor={
                            selected ? activeTheme.primary : activeTheme.muted
                        }
                        width={tabWidth}
                        justifyContent="center"
                    >
                        <Text
                            color={selected ? "black" : activeTheme.muted}
                            backgroundColor={
                                selected ? activeTheme.primary : undefined
                            }
                            bold={selected}
                        >
                            {label}
                        </Text>
                    </Box>
                )
            })}

            <Box
                borderStyle="single"
                borderColor={activeTheme.muted}
                width={11}
                justifyContent="center"
            >
                <Text color={activeTheme.muted}>? help</Text>
            </Box>

            <Box
                borderStyle="single"
                borderColor={activeTheme.muted}
                width={11 + spacerWidth}
                justifyContent="center"
            >
                <Text color={activeTheme.primary}>q quit</Text>
            </Box>
        </Box>
    )
}

function centerText(value: string, width: number): string {
    if (width <= 0) return ""
    if (value.length >= width) return value.slice(0, width)

    const left = Math.floor((width - value.length) / 2)
    const right = width - value.length - left

    return `${" ".repeat(left)}${value}${" ".repeat(right)}`
}
```

#### RateLtd/src/components/Menu.tsx

```tsx
import React from "react"
import { Text } from "ink"
import { activeTheme } from "../theme.js"

export type MenuItem = {
    id: string
    label: string
    detail?: string
}

export function Menu({
    items,
    selectedIndex,
}: {
    items: MenuItem[]
    selectedIndex: number
}) {
    return (
        <Text>
            {items
                .map((item, index) => {
                    const selected = index === selectedIndex
                    return `${selected ? "> " : "  "}${item.label}${item.detail ? ` - ${item.detail}` : ""}`
                })
                .join("\n")}
        </Text>
    )
}

export function menuColor(selected: boolean): string {
    return selected ? activeTheme.primary : activeTheme.muted
}
```

#### RateLtd/src/components/OutputScreen.tsx

```tsx
import React from "react"
import { Box, Text } from "ink"
import type { MeatHarnessController } from "../state/appTypes.js"
import { activeTheme } from "../theme.js"
import { Panel, FieldRow } from "./Panel.js"
import { clipTextLines, truncateLine } from "../utils/terminalText.js"
import { createTwoColumnLayout, type AppViewport } from "../utils/layout.js"

export function OutputScreen({
    controller,
    viewport,
}: {
    controller: MeatHarnessController
    viewport: AppViewport
}) {
    const layout = getOutputLayout(viewport)
    const active = controller.liveOutput
    const result = controller.result
    const command = active?.command ?? result?.command ?? "(none)"
    const cwd = active?.cwd ?? result?.cwd ?? controller.repo.targetRoot
    const stdout = active?.stdout ?? result?.stdout ?? ""
    const stderr = active?.stderr ?? result?.stderr ?? ""
    const exitCode = active?.exitCode ?? result?.exitCode
    const duration =
        result ? `${result.durationMs}ms`
        : controller.isRunning ? "running"
        : "n/a"
    const lastSession = controller.sessions[0]
    const lastStep = lastSession?.steps[0]
    const output = formatOutput(
        stdout,
        stderr,
        controller.isRunning,
        Boolean(active || result),
    )
    const status =
        controller.isRunning ? "running"
        : result ? "finished"
        : "idle"

    return (
        <Box
            width={layout.totalWidth}
            height={layout.bodyHeight}
            overflow="hidden"
        >
            <Box
                flexDirection="row"
                gap={layout.gap}
                width={layout.totalWidth}
                height={layout.bodyHeight}
                overflow="hidden"
            >
                <Box
                    width={layout.leftWidth}
                    height={layout.bodyHeight}
                    overflow="hidden"
                >
                    <Panel
                        title="LOGGERLTD"
                        tone="accent"
                        width={layout.leftWidth}
                        minHeight={layout.bodyHeight}
                    >
                        <Text
                            color={statusColor(status, result?.exitCode)}
                            bold
                        >
                            {status.toUpperCase()}{" "}
                            {exitCode === undefined ?
                                ""
                            :   `exit=${String(exitCode)}`}
                        </Text>
                        <Text color={activeTheme.primary}>
                            {truncateLine(
                                command,
                                Math.max(1, layout.leftWidth - 6),
                            )}
                        </Text>
                        <Text color={activeTheme.muted}>
                            {truncateLine(
                                cwd,
                                Math.max(1, layout.leftWidth - 6),
                            )}
                        </Text>
                        <Text color={activeTheme.muted}>
                            stdout {stdout.length} bytes â€¢ stderr{" "}
                            {stderr.length} bytes â€¢ runs{" "}
                            {controller.sessions.length}
                        </Text>
                        <Text />

                        <Text>
                            {clipTextLines(output, {
                                maxLines: layout.outputLines,
                                maxColumns: Math.max(1, layout.leftWidth - 6),
                            })}
                        </Text>
                    </Panel>
                </Box>

                {layout.showRight && (
                    <Box
                        width={layout.rightWidth}
                        height={layout.bodyHeight}
                        flexDirection="column"
                        overflow="hidden"
                    >
                        <Panel
                            title="ACTIVE RUN"
                            tone="primary"
                            width={layout.rightWidth}
                            minHeight={layout.summaryHeight}
                        >
                            <FieldRow
                                label="name"
                                labelWidth={layout.labelWidth}
                                value={command}
                                maxValueColumns={layout.sideValueWidth}
                            />
                            <FieldRow
                                label="status"
                                labelWidth={layout.labelWidth}
                                value={status}
                                valueColor={statusColor(
                                    status,
                                    result?.exitCode,
                                )}
                                maxValueColumns={layout.sideValueWidth}
                            />
                        </Panel>

                        <Panel
                            title="EVENTS.JSONL"
                            tone="danger"
                            width={layout.rightWidth}
                            minHeight={layout.targetHeight}
                        >
                            <FieldRow
                                label="events"
                                labelWidth={layout.labelWidth}
                                value={String(controller.logEvents.length)}
                            />
                            <FieldRow
                                label="last"
                                labelWidth={layout.labelWidth}
                                value={
                                    controller.logEvents.at(-1)?.event ?? "none"
                                }
                                maxValueColumns={layout.sideValueWidth}
                            />
                            <FieldRow
                                label="level"
                                labelWidth={layout.labelWidth}
                                value={
                                    controller.logEvents.at(-1)?.level ?? "n/a"
                                }
                            />
                            <Text color={activeTheme.muted}>
                                {clipTextLines(
                                    controller.logEvents
                                        .slice(
                                            -Math.max(
                                                1,
                                                layout.targetHeight - 5,
                                            ),
                                        )
                                        .map(
                                            (event) =>
                                                `${event.level} ${event.event}`,
                                        )
                                        .join("\n"),
                                    {
                                        maxLines: Math.max(
                                            1,
                                            layout.targetHeight - 5,
                                        ),
                                        maxColumns:
                                            layout.sideValueWidth +
                                            layout.labelWidth,
                                    },
                                )}
                            </Text>
                        </Panel>

                        <Panel
                            title="SANITIZED HANDOFF"
                            tone="warning"
                            width={layout.rightWidth}
                            minHeight={layout.actionsHeight}
                        >
                            <Text color={activeTheme.primary}>
                                Model-ready packet preview:
                            </Text>
                            <Text>
                                {clipTextLines(controller.handoffPacket, {
                                    maxLines: Math.max(
                                        2,
                                        layout.actionsHeight - 6,
                                    ),
                                    maxColumns: layout.actionValueWidth,
                                })}
                            </Text>
                            <ActionRow
                                keyName="C"
                                label="copy output"
                                width={layout.actionValueWidth}
                            />
                            <ActionRow
                                keyName="H"
                                label="copy handoff"
                                width={layout.actionValueWidth}
                            />
                            <ActionRow
                                keyName="S"
                                label="save log"
                                width={layout.actionValueWidth}
                            />
                            <ActionRow
                                keyName="X"
                                label="cancel"
                                width={layout.actionValueWidth}
                            />
                        </Panel>
                    </Box>
                )}
            </Box>
        </Box>
    )
}

function ActionRow({
    keyName,
    label,
    width,
}: {
    keyName: string
    label: string
    width: number
}) {
    const keyColumns = 8
    const safeLabel = truncateLine(label, Math.max(1, width - keyColumns))

    return (
        <Text>
            <Text
                color={activeTheme.primary}
                bold
            >
                {keyName.padEnd(keyColumns)}
            </Text>
            <Text>{safeLabel}</Text>
        </Text>
    )
}

function formatOutput(
    stdout: string,
    stderr: string,
    isRunning: boolean,
    hasRun: boolean,
): string {
    if (!hasRun) {
        return "No command has been run yet. Run a command from CommanderLtd to stream output here."
    }

    const sections = [
        "stdout:",
        stdout.length > 0 ? stdout.trimEnd()
        : isRunning ? "(waiting for stdout...)"
        : "(no stdout captured)",
        "",
        "stderr:",
        stderr.length > 0 ? stderr.trimEnd()
        : isRunning ? "(waiting for stderr...)"
        : "(no stderr captured)",
    ]

    return sections.join("\n")
}

function statusColor(status: string, exitCode?: number | null): string {
    if (status === "running") return activeTheme.warning
    if (status === "finished" && exitCode === 0) return activeTheme.primary
    if (status === "finished") return activeTheme.danger
    return activeTheme.muted
}

function getOutputLayout(viewport: AppViewport) {
    const columns = createTwoColumnLayout(viewport, 0.31, 58, 34)
    const showRight = columns.showRight && viewport.bodyRows >= 12
    const bodyHeight = Math.max(12, viewport.bodyRows)
    const summaryHeight = 6
    const targetHeight = 7
    const actionsHeight = Math.max(6, bodyHeight - summaryHeight - targetHeight)
    const outputLines = Math.max(3, bodyHeight - 8)
    const labelWidth = 7

    return {
        totalWidth: columns.totalWidth,
        gap: columns.gap,
        leftWidth: showRight ? columns.leftWidth : columns.totalWidth,
        rightWidth: columns.rightWidth,
        showRight,
        bodyHeight,
        summaryHeight,
        targetHeight,
        actionsHeight,
        outputLines,
        labelWidth,
        sideValueWidth: Math.max(10, columns.rightWidth - labelWidth - 8),
        actionValueWidth: Math.max(8, columns.rightWidth - 6),
    }
}
```

#### RateLtd/src/components/PreferLtdScreen.tsx

```tsx
import React from "react"
import { Box, Text } from "ink"
import type { MeatHarnessController } from "../state/appTypes.js"
import type { AppViewport } from "../utils/layout.js"
import { createTwoColumnLayout } from "../utils/layout.js"
import { Panel, FieldRow } from "./Panel.js"
import { activeTheme } from "../theme.js"

export function PreferLtdScreen({
    controller,
    viewport,
}: {
    controller: MeatHarnessController
    viewport: AppViewport
}) {
    const layout = createTwoColumnLayout(viewport, 0.45, 54, 42)
    const settings = controller.settings

    return (
        <Box
            width={layout.totalWidth}
            height={viewport.bodyRows}
            flexDirection="row"
            gap={layout.gap}
            overflow="hidden"
        >
            <Panel
                title="ENVIRONMENT / SAFETY"
                tone="accent"
                width={layout.leftWidth}
                minHeight={viewport.bodyRows}
            >
                <FieldRow
                    label="location"
                    value={controller.settingsPath}
                    maxValueColumns={Math.max(20, layout.leftWidth - 18)}
                />
                <FieldRow
                    label="version"
                    value={String(settings.version)}
                />
                <FieldRow
                    label="default root"
                    value={controller.repo.targetRoot}
                    maxValueColumns={Math.max(20, layout.leftWidth - 18)}
                />
                <FieldRow
                    label="theme"
                    value={settings.theme}
                    valueColor={activeTheme.primary}
                />
                <FieldRow
                    label="confirm risky"
                    value={
                        settings.requireConfirmationForRiskyCommands ? "on" : (
                            "off"
                        )
                    }
                />
                <FieldRow
                    label="confirm writes"
                    value="on (fixed)"
                    valueColor={activeTheme.primary}
                />
                <FieldRow
                    label="save logs"
                    value={settings.saveLogsAutomatically ? "on" : "off"}
                />
                <FieldRow
                    label="startup"
                    value={settings.startupScreen}
                />
                <FieldRow
                    label="retention"
                    value={`${settings.logs.retentionDays} days`}
                />
                <Text />
                <Text color={activeTheme.muted}>
                    t cycle theme â€¢ s write .rateltd/settings.json â€¢ other rows
                    are read-only in this pass
                </Text>
            </Panel>
            {layout.showRight && (
                <Panel
                    title="PROVIDERS / ALLOWLISTS"
                    tone="primary"
                    width={layout.rightWidth}
                    minHeight={viewport.bodyRows}
                >
                    <FieldRow
                        label="editor"
                        value={settings.editor.externalCommand}
                    />
                    <FieldRow
                        label="monaco"
                        value={
                            settings.editor.monacoCompanionCommand ??
                            "not configured"
                        }
                    />
                    <FieldRow
                        label="pwsh"
                        value={
                            settings.powershell.preferPwsh ?
                                "preferred"
                            :   "fallback allowed"
                        }
                    />
                    <FieldRow
                        label="allowlist"
                        value={String(
                            settings.powershell.allowlistedScriptIds.length,
                        )}
                    />
                    <FieldRow
                        label="git"
                        value={
                            controller.repo.isGitRepo ?
                                "available for target"
                            :   "unavailable for folder target"
                        }
                    />
                    <FieldRow
                        label="logs"
                        value=".agent-logs/events.jsonl"
                    />
                    <Text />
                    <Text color={activeTheme.warning}>
                        Legacy .meatharness settings remain readable.
                    </Text>
                    <Text color={activeTheme.muted}>
                        PowerShell scripts remain inventory-only until
                        explicitly allowlisted.
                    </Text>
                </Panel>
            )}
        </Box>
    )
}
```

#### RateLtd/src/components/OpsDeckScreen.tsx

```tsx
import React from "react"
import { Box, Text } from "ink"
import type { MeatHarnessController, OpsDeckItem } from "../state/appTypes.js"
import { activeTheme } from "../theme.js"
import { Panel, FieldRow } from "./Panel.js"
import { truncateLine } from "../utils/terminalText.js"
import {
    createTwoColumnLayout,
    windowAroundSelection,
    type AppViewport,
} from "../utils/layout.js"

export function OpsDeckScreen({
    controller,
    viewport,
}: {
    controller: MeatHarnessController
    viewport: AppViewport
}) {
    const layout = getOpsLayout(viewport)
    const selected = controller.opsItems[controller.opsSelectedIndex]
    const visibleOps = windowAroundSelection(
        controller.opsItems,
        controller.opsSelectedIndex,
        layout.commandRows,
    )

    return (
        <Box
            width={layout.totalWidth}
            height={layout.bodyHeight}
            overflow="hidden"
        >
            <Box
                flexDirection="row"
                gap={layout.gap}
                width={layout.totalWidth}
                height={layout.bodyHeight}
                overflow="hidden"
            >
                <Box
                    width={layout.leftWidth}
                    height={layout.bodyHeight}
                    overflow="hidden"
                >
                    <Panel
                        title="MACRO LIBRARY"
                        tone="accent"
                        width={layout.leftWidth}
                        minHeight={layout.bodyHeight}
                    >
                        <Text color={activeTheme.primary}>
                            Package â€¢ Git â€¢ Search â€¢ PowerShell macros for the
                            active target.
                        </Text>
                        <Text />

                        {visibleOps.length > 0 ?
                            visibleOps.map(({ item, index }) => (
                                <CommandRow
                                    key={item.id}
                                    item={item}
                                    selected={
                                        index === controller.opsSelectedIndex
                                    }
                                    width={Math.max(1, layout.leftWidth - 6)}
                                />
                            ))
                        :   <Text color={activeTheme.muted}>
                                No commands available for this repo.
                            </Text>
                        }
                    </Panel>
                </Box>

                {layout.showRight && (
                    <Box
                        width={layout.rightWidth}
                        height={layout.bodyHeight}
                        flexDirection="column"
                        overflow="hidden"
                    >
                        <Panel
                            title="SELECTED MACRO"
                            tone="primary"
                            width={layout.rightWidth}
                            minHeight={layout.selectedHeight}
                        >
                            <FieldRow
                                label="label"
                                labelWidth={layout.labelWidth}
                                value={selected?.label ?? "none"}
                                maxValueColumns={layout.sideValueWidth}
                            />
                            <FieldRow
                                label="group"
                                labelWidth={layout.labelWidth}
                                value={selected?.group ?? "none"}
                            />
                            <FieldRow
                                label="risk"
                                labelWidth={layout.labelWidth}
                                value={selected?.risk ?? "n/a"}
                                valueColor={riskColor(selected?.risk)}
                            />
                            <FieldRow
                                label="confirm"
                                labelWidth={layout.labelWidth}
                                value={
                                    selected?.requiresConfirmation ? "required"
                                    :   "not required"
                                }
                                valueColor={
                                    selected?.requiresConfirmation ?
                                        activeTheme.warning
                                    :   activeTheme.primary
                                }
                            />
                            <FieldRow
                                label="cmd"
                                labelWidth={layout.labelWidth}
                                value={selected?.command ?? "none"}
                                maxValueColumns={layout.sideValueWidth}
                            />
                            {!selected?.available && (
                                <Text color={activeTheme.warning}>
                                    {selected?.unavailableReason ??
                                        "Unavailable for this target."}
                                </Text>
                            )}
                        </Panel>

                        <Panel
                            title="TARGET"
                            tone="danger"
                            width={layout.rightWidth}
                            minHeight={layout.targetHeight}
                        >
                            <FieldRow
                                label="repo"
                                labelWidth={layout.labelWidth}
                                value={controller.repo.targetRoot}
                                maxValueColumns={layout.sideValueWidth}
                            />
                            <FieldRow
                                label="branch"
                                labelWidth={layout.labelWidth}
                                value={
                                    controller.repo.isGitRepo ?
                                        controller.repo.branch
                                    :   "n/a"
                                }
                                maxValueColumns={layout.sideValueWidth}
                            />
                            <FieldRow
                                label="type"
                                labelWidth={layout.labelWidth}
                                value={controller.repo.targetType}
                                maxValueColumns={layout.sideValueWidth}
                            />
                            <FieldRow
                                label="package"
                                labelWidth={layout.labelWidth}
                                value={
                                    controller.repo.hasPackageJson ?
                                        controller.repo.targetPackageName
                                    :   "n/a"
                                }
                                maxValueColumns={layout.sideValueWidth}
                            />
                            <FieldRow
                                label="state"
                                labelWidth={layout.labelWidth}
                                value={
                                    controller.repo.isGitRepo ?
                                        controller.repo.dirty ?
                                            "dirty"
                                        :   "clean"
                                    :   "git unavailable"
                                }
                                valueColor={
                                    controller.repo.dirty ?
                                        activeTheme.warning
                                    :   activeTheme.primary
                                }
                            />
                        </Panel>

                        <Panel
                            title="ACTIONS"
                            tone="warning"
                            width={layout.rightWidth}
                            minHeight={layout.actionsHeight}
                        >
                            <ActionRow
                                keyName="X"
                                label="cancel"
                                width={layout.actionValueWidth}
                            />
                            <ActionRow
                                keyName="C"
                                label="copy command"
                                width={layout.actionValueWidth}
                            />
                            <ActionRow
                                keyName="â†‘/â†“"
                                label="select"
                                width={layout.actionValueWidth}
                            />
                            <ActionRow
                                keyName="Enter"
                                label="run"
                                width={layout.actionValueWidth}
                            />
                        </Panel>
                    </Box>
                )}
            </Box>
        </Box>
    )
}

function CommandRow({
    item,
    selected,
    width,
}: {
    item: OpsDeckItem
    selected: boolean
    width: number
}) {
    const groupWidth = 11
    const riskWidth = 13
    const labelWidth = Math.min(26, Math.max(14, Math.floor(width * 0.32)))
    const group = truncateLine(item.group, groupWidth).padEnd(groupWidth)
    const label = truncateLine(item.label, labelWidth).padEnd(labelWidth)
    const risk = truncateLine(item.risk.toUpperCase(), riskWidth).padEnd(
        riskWidth,
    )
    const commandWidth = Math.max(
        8,
        width - groupWidth - labelWidth - riskWidth - 8,
    )
    const command = truncateLine(item.command, commandWidth)
    const prefix = item.available ? "â–¶" : "!"
    const row = `${prefix} ${group} ${label} ${risk} ${command}`

    if (selected) {
        return (
            <Text
                backgroundColor={activeTheme.primary}
                color="black"
            >
                {row.padEnd(width)}
            </Text>
        )
    }

    return (
        <Text>
            <Text
                color={
                    item.available ? activeTheme.primary : activeTheme.warning
                }
            >
                {" "}
                {group}
            </Text>
            <Text
                color={item.available ? activeTheme.primary : activeTheme.muted}
            >
                {" "}
                {label}
            </Text>
            <Text color={riskColor(item.risk)}> {risk}</Text>
            <Text
                color={item.available ? activeTheme.muted : activeTheme.warning}
            >
                {" "}
                {command}
            </Text>
        </Text>
    )
}

function riskColor(risk: OpsDeckItem["risk"] | undefined): string {
    if (
        risk === "destructive" ||
        risk === "admin" ||
        risk === "secret-sensitive"
    )
        return activeTheme.danger
    if (risk === "network" || risk === "medium") return activeTheme.warning
    return activeTheme.primary
}

function ActionRow({
    keyName,
    label,
    width,
}: {
    keyName: string
    label: string
    width: number
}) {
    const keyColumns = 8
    const safeLabel = truncateLine(label, Math.max(1, width - keyColumns))

    return (
        <Text>
            <Text
                color={activeTheme.primary}
                bold
            >
                {keyName.padEnd(keyColumns)}
            </Text>
            <Text>{safeLabel}</Text>
        </Text>
    )
}

function getOpsLayout(viewport: AppViewport) {
    const columns = createTwoColumnLayout(viewport, 0.31, 58, 34)
    const showRight = columns.showRight && viewport.bodyRows >= 12
    const bodyHeight = Math.max(12, viewport.bodyRows)
    const selectedHeight = 6
    const targetHeight = 7
    const actionsHeight = Math.max(
        6,
        bodyHeight - selectedHeight - targetHeight,
    )
    const commandRows = Math.max(3, bodyHeight - 4)
    const labelWidth = 8

    return {
        totalWidth: columns.totalWidth,
        gap: columns.gap,
        leftWidth: showRight ? columns.leftWidth : columns.totalWidth,
        rightWidth: columns.rightWidth,
        showRight,
        bodyHeight,
        selectedHeight,
        targetHeight,
        actionsHeight,
        commandRows,
        labelWidth,
        sideValueWidth: Math.max(10, columns.rightWidth - labelWidth - 8),
        actionValueWidth: Math.max(8, columns.rightWidth - 6),
    }
}
```

#### RateLtd/src/components/RateDashboardScreen.tsx

```tsx
import React from "react"
import { Box, Text } from "ink"
import type { MeatHarnessController } from "../state/appTypes.js"
import type { AppViewport } from "../utils/layout.js"
import { createTwoColumnLayout } from "../utils/layout.js"
import { activeTheme } from "../theme.js"
import { Panel, FieldRow } from "./Panel.js"

export function RateDashboardScreen({
    controller,
    viewport,
}: {
    controller: MeatHarnessController
    viewport: AppViewport
}) {
    const layout = createTwoColumnLayout(viewport, 0.43, 54, 42)
    const failedDiagnostics = controller.diagnostics.filter(
        (check) => check.status === "fail",
    )
    const warnings = controller.diagnostics.filter(
        (check) => check.status === "warn",
    )
    const recentRun = controller.sessions[0] ?? controller.activeSession
    const latestStep = recentRun?.steps.at(-1)
    const nextActions = buildNextActions(
        controller,
        failedDiagnostics.length,
        warnings.length,
    )

    return (
        <Box
            width={layout.totalWidth}
            height={viewport.bodyRows}
            flexDirection="row"
            gap={layout.gap}
            overflow="hidden"
        >
            <Box
                width={layout.leftWidth}
                flexDirection="column"
                overflow="hidden"
            >
                <Panel
                    title="REPO / TARGET SUMMARY"
                    tone="primary"
                    width={layout.leftWidth}
                    minHeight={Math.max(12, Math.floor(viewport.bodyRows / 2))}
                >
                    <FieldRow
                        label="target"
                        value={controller.repo.targetRoot}
                        maxValueColumns={Math.max(20, layout.leftWidth - 18)}
                    />
                    <FieldRow
                        label="type"
                        value={controller.repo.targetType}
                    />
                    <FieldRow
                        label="package"
                        value={controller.repo.targetPackageName}
                    />
                    <FieldRow
                        label="branch"
                        value={
                            controller.repo.isGitRepo ?
                                controller.repo.branch
                            :   "n/a"
                        }
                    />
                    <FieldRow
                        label="state"
                        value={
                            controller.repo.isGitRepo ?
                                controller.repo.dirty ?
                                    "dirty"
                                :   "clean"
                            :   "git unavailable"
                        }
                        valueColor={
                            controller.repo.dirty ?
                                activeTheme.warning
                            :   activeTheme.primary
                        }
                    />
                    <FieldRow
                        label="changes"
                        value={String(
                            controller.gitSummary.changedFiles.length,
                        )}
                    />
                    <FieldRow
                        label="node"
                        value={controller.repo.nodeVersion}
                    />
                    <FieldRow
                        label="pnpm"
                        value={controller.repo.pnpmVersion}
                    />
                    <FieldRow
                        label="logs"
                        value={String(controller.logEvents.length)}
                    />
                    <FieldRow
                        label="settings"
                        value={controller.settingsPath}
                        maxValueColumns={Math.max(20, layout.leftWidth - 18)}
                    />
                </Panel>
                <Panel
                    title="CLIPBOARD SUMMARY"
                    tone="warning"
                    width={layout.leftWidth}
                    minHeight={Math.max(
                        8,
                        viewport.bodyRows -
                            Math.max(12, Math.floor(viewport.bodyRows / 2)),
                    )}
                >
                    <FieldRow
                        label="state"
                        value={controller.writePlan.mode}
                        valueColor={
                            controller.writePlan.mode === "error" ?
                                activeTheme.danger
                            : controller.writePlan.mode === "planned" ?
                                activeTheme.primary
                            :   activeTheme.muted
                        }
                    />
                    <FieldRow
                        label="kind"
                        value={controller.writePlan.kind ?? "none"}
                    />
                    <FieldRow
                        label="files"
                        value={String(
                            controller.writePlan.payload?.files.length ?? 0,
                        )}
                    />
                    <FieldRow
                        label="warnings"
                        value={String(controller.writePlan.warnings.length)}
                        valueColor={
                            controller.writePlan.warnings.length > 0 ?
                                activeTheme.warning
                            :   activeTheme.primary
                        }
                    />
                    <FieldRow
                        label="bytes"
                        value={String(controller.writePlan.body.length)}
                    />
                    <Text color={activeTheme.muted}>
                        4 CommanderLtd Clipboard opens intake/preview/apply.
                    </Text>
                </Panel>
            </Box>
            {layout.showRight && (
                <Box
                    width={layout.rightWidth}
                    flexDirection="column"
                    overflow="hidden"
                >
                    <Panel
                        title="RECOMMENDED NEXT ACTIONS"
                        tone={
                            failedDiagnostics.length > 0 ? "danger" : "accent"
                        }
                        width={layout.rightWidth}
                        minHeight={Math.max(
                            10,
                            Math.floor(viewport.bodyRows / 2),
                        )}
                    >
                        {nextActions.map((action, index) => (
                            <Text
                                key={action}
                                color={
                                    index === 0 ?
                                        activeTheme.primary
                                    :   activeTheme.muted
                                }
                            >
                                {index + 1}. {action}
                            </Text>
                        ))}
                        <Text />
                        <Text color={activeTheme.muted}>
                            Numbers 1-8 route to real screens. Enter runs only
                            on CommanderLtd Ops.
                        </Text>
                    </Panel>
                    <Panel
                        title="RECENT RUN"
                        tone={
                            latestStep?.exitCode === 0 ? "primary"
                            : latestStep ?
                                "danger"
                            :   "warning"
                        }
                        width={layout.rightWidth}
                        minHeight={Math.max(
                            10,
                            viewport.bodyRows -
                                Math.max(10, Math.floor(viewport.bodyRows / 2)),
                        )}
                    >
                        <FieldRow
                            label="command"
                            value={
                                latestStep?.command ?? recentRun?.name ?? "none"
                            }
                            maxValueColumns={Math.max(
                                20,
                                layout.rightWidth - 18,
                            )}
                        />
                        <FieldRow
                            label="status"
                            value={
                                recentRun?.status ??
                                (controller.isRunning ? "running" : "idle")
                            }
                        />
                        <FieldRow
                            label="exit"
                            value={
                                latestStep ? String(latestStep.exitCode) : "n/a"
                            }
                        />
                        <FieldRow
                            label="duration"
                            value={
                                latestStep ?
                                    `${latestStep.durationMs}ms`
                                :   "n/a"
                            }
                        />
                        <FieldRow
                            label="output"
                            value={
                                latestStep ?
                                    `${latestStep.stdout.length + latestStep.stderr.length} bytes`
                                :   "n/a"
                            }
                        />
                        <Text color={activeTheme.muted}>
                            7 LoggerLtd opens live output and sanitized handoff.
                        </Text>
                    </Panel>
                </Box>
            )}
        </Box>
    )
}

function buildNextActions(
    controller: MeatHarnessController,
    failures: number,
    warnings: number,
): string[] {
    const actions: string[] = []
    if (!controller.repo.hasPackageJson)
        actions.push(
            "1 LauncherLtd: choose a package target if package macros are needed",
        )
    if (failures > 0) actions.push("8 HelpLtd: inspect failing diagnostics")
    if (controller.writePlan.mode === "planned")
        actions.push(
            "4 CommanderLtd Clipboard: review and confirm pending payload",
        )
    if (
        controller.repo.isGitRepo &&
        controller.gitSummary.changedFiles.length > 0
    )
        actions.push("6 DifferLtd: inspect changed files and patch")
    if (controller.repo.hasPackageJson)
        actions.push("5 CommanderLtd Ops: run pnpm verify/typecheck/test")
    if (controller.sessions.length > 0 || controller.liveOutput)
        actions.push("7 LoggerLtd: copy sanitized handoff packet")
    if (warnings > 0) actions.push("8 HelpLtd: review warning diagnostics")
    actions.push("3 EditorLtd: inspect source context")

    return actions.slice(0, 5)
}
```

#### RateLtd/src/components/Panel.tsx

```tsx
import React from "react"
import { Box, Text } from "ink"
import { activeTheme } from "../theme.js"
import { clipTextLines, truncateLine } from "../utils/terminalText.js"

export type PanelTone = "primary" | "accent" | "warning" | "danger" | "muted"

export function Panel({
    title,
    tone = "primary",
    width,
    minHeight,
    maxBodyLines,
    children,
}: {
    title: string
    tone?: PanelTone
    width?: number | string
    minHeight?: number
    maxBodyLines?: number
    children: React.ReactNode
}) {
    const numericWidth = typeof width === "number" ? width : undefined
    const titleWidth = numericWidth ? Math.max(1, numericWidth - 6) : 64

    return (
        <Box
            borderStyle="round"
            borderColor={toneColor(tone)}
            flexDirection="column"
            paddingX={1}
            paddingY={0}
            width={width}
            minHeight={minHeight}
        >
            <Text
                color={toneColor(tone)}
                bold
            >
                {` ${truncateLine(title, titleWidth)} `}
            </Text>
            <Box
                flexDirection="column"
                marginTop={1}
            >
                {typeof children === "string" && maxBodyLines ?
                    <Text>
                        {clipTextLines(children, { maxLines: maxBodyLines })}
                    </Text>
                :   children}
            </Box>
        </Box>
    )
}

export function FieldRow({
    label,
    value,
    valueColor,
    labelWidth = 14,
    maxValueColumns = 64,
}: {
    label: string
    value: string
    valueColor?: string
    labelWidth?: number
    maxValueColumns?: number
}) {
    return (
        <Text>
            <Text color={activeTheme.muted}>{label.padEnd(labelWidth)}</Text>
            <Text color={activeTheme.muted}>: </Text>
            <Text color={valueColor}>
                {clipTextLines(value, {
                    maxLines: 1,
                    maxColumns: maxValueColumns,
                    overflowLabel: false,
                })}
            </Text>
        </Text>
    )
}

export function Divider({ width = 56 }: { width?: number }) {
    return <Text color={activeTheme.muted}>{"-".repeat(width)}</Text>
}

export function KeyHint({
    keyName,
    label,
}: {
    keyName: string
    label: string
}) {
    return (
        <Text>
            <Text color={activeTheme.primary}>{keyName}</Text>
            <Text color={activeTheme.muted}> {label}</Text>
        </Text>
    )
}

function toneColor(tone: PanelTone): string {
    if (tone === "accent") return activeTheme.accent
    if (tone === "warning") return activeTheme.warning
    if (tone === "danger") return activeTheme.danger
    if (tone === "muted") return activeTheme.muted
    return activeTheme.primary
}
```

#### RateLtd/src/components/RepoLauncher.tsx

```tsx
import React from "react"
import { Box, Text } from "ink"
import type { MeatHarnessController, RepoTreeEntry } from "../state/appTypes.js"
import { activeTheme } from "../theme.js"
import { Panel, FieldRow } from "./Panel.js"
import { truncateLine } from "../utils/terminalText.js"
import {
    createTwoColumnLayout,
    windowAroundSelection,
    type AppViewport,
} from "../utils/layout.js"

export function RepoLauncher({
    controller,
    viewport,
}: {
    controller: MeatHarnessController
    viewport: AppViewport
}) {
    const layout = getLauncherLayout(viewport)
    const selected =
        controller.launcherEntries[controller.launcherSelectedIndex]
    const selectedPath = selected?.path ?? controller.repo.targetRoot

    const treeRows = windowAroundSelection(
        controller.launcherEntries,
        controller.launcherSelectedIndex,
        layout.treeRows,
    )

    return (
        <Box
            width={layout.totalWidth}
            height={layout.bodyHeight}
            overflow="hidden"
        >
            <Box
                flexDirection="row"
                gap={layout.gap}
                width={layout.totalWidth}
                height={layout.bodyHeight}
                overflow="hidden"
            >
                <Box
                    width={layout.leftWidth}
                    height={layout.bodyHeight}
                    overflow="hidden"
                >
                    <Panel
                        title="TARGET BROWSER"
                        tone="accent"
                        width={layout.leftWidth}
                        minHeight={layout.bodyHeight}
                    >
                        {treeRows.length > 0 ?
                            treeRows.map(({ item, index }) => (
                                <TreeRow
                                    key={`${item.path}:${item.kind}:${index}`}
                                    entry={item}
                                    selected={
                                        index ===
                                        controller.launcherSelectedIndex
                                    }
                                    width={Math.max(1, layout.leftWidth - 6)}
                                />
                            ))
                        :   <Text color={activeTheme.muted}>
                                No visible folders.
                            </Text>
                        }
                        <Text />
                        <Text color={activeTheme.muted}>
                            {controller.launcherStats.folders} folders â€¢{" "}
                            {controller.launcherStats.repos} git repos detected
                        </Text>
                    </Panel>
                </Box>

                {layout.showRight && (
                    <Box
                        width={layout.rightWidth}
                        height={layout.bodyHeight}
                        flexDirection="column"
                        overflow="hidden"
                    >
                        <Panel
                            title="TARGET DETAILS"
                            tone="accent"
                            width={layout.rightWidth}
                            minHeight={layout.summaryHeight}
                        >
                            <FieldRow
                                label="path"
                                labelWidth={layout.labelWidth}
                                value={selectedPath}
                                maxValueColumns={layout.sideValueWidth}
                            />
                            <FieldRow
                                label="type"
                                labelWidth={layout.labelWidth}
                                value={
                                    selected?.kind === "repo" ? "git repo"
                                    : (
                                        selected?.kind === "folder" ||
                                        selected?.kind === "root"
                                    ) ?
                                        "folder"
                                    :   (selected?.kind ?? "unknown")
                                }
                                valueColor={
                                    selected?.kind === "repo" ?
                                        activeTheme.primary
                                    :   activeTheme.accent
                                }
                                maxValueColumns={layout.sideValueWidth}
                            />
                            <FieldRow
                                label="active"
                                labelWidth={layout.labelWidth}
                                value={controller.repo.targetRoot}
                                maxValueColumns={layout.sideValueWidth}
                            />
                            <FieldRow
                                label="branch"
                                labelWidth={layout.labelWidth}
                                value={
                                    controller.repo.isGitRepo ?
                                        controller.repo.branch
                                    :   "n/a"
                                }
                                maxValueColumns={layout.sideValueWidth}
                            />
                            <FieldRow
                                label="state"
                                labelWidth={layout.labelWidth}
                                value={
                                    controller.repo.isGitRepo ?
                                        controller.repo.dirty ?
                                            "dirty"
                                        :   "clean"
                                    :   "git unavailable"
                                }
                                valueColor={
                                    controller.repo.dirty ?
                                        activeTheme.warning
                                    :   activeTheme.primary
                                }
                            />
                        </Panel>

                        <Panel
                            title="RECENT TARGETS"
                            tone="danger"
                            width={layout.rightWidth}
                            minHeight={layout.targetHeight}
                        >
                            <FieldRow
                                label="current"
                                labelWidth={layout.labelWidth}
                                value={controller.repo.targetRoot}
                                maxValueColumns={layout.sideValueWidth}
                            />
                            <FieldRow
                                label="package"
                                labelWidth={layout.labelWidth}
                                value={
                                    controller.repo.hasPackageJson ?
                                        controller.repo.targetPackageName
                                    :   "package unavailable"
                                }
                                maxValueColumns={layout.sideValueWidth}
                            />
                            <FieldRow
                                label="runs"
                                labelWidth={layout.labelWidth}
                                value={String(controller.sessions.length)}
                            />
                            <Text color={activeTheme.muted}>
                                Pinned targets: future-disabled until target
                                persistence is added.
                            </Text>
                        </Panel>

                        <Panel
                            title="ACTIONS"
                            tone="warning"
                            width={layout.rightWidth}
                            minHeight={layout.actionsHeight}
                        >
                            <ActionRow
                                keyName="â†‘/â†“"
                                label="move"
                                width={layout.actionValueWidth}
                            />
                            <ActionRow
                                keyName="Enter"
                                label="select folder/repo"
                                width={layout.actionValueWidth}
                            />
                            <ActionRow
                                keyName="Left"
                                label="collapse to parent"
                                width={layout.actionValueWidth}
                            />
                            <ActionRow
                                keyName="R"
                                label="refresh target state"
                                width={layout.actionValueWidth}
                            />
                            <ActionRow
                                keyName="Explorer"
                                label="available from controller action"
                                width={layout.actionValueWidth}
                            />
                            <Text color={activeTheme.warning}>
                                Manual path entry: future-disabled; use tree
                                selection now.
                            </Text>
                        </Panel>
                    </Box>
                )}
            </Box>
        </Box>
    )
}

function TreeRow({
    entry,
    selected,
    width,
}: {
    entry: RepoTreeEntry
    selected: boolean
    width: number
}) {
    const indent = "  ".repeat(entry.depth)
    const prefix = `${selected ? "â–¶" : " "} ${indent}${iconForKind(entry)} `
    const suffix =
        entry.kind === "repo" && !entry.name.includes("[repo]") ? " [repo]" : ""
    const label = truncateLine(`${prefix}${entry.name}${suffix}`, width)

    if (selected) {
        return (
            <Text
                backgroundColor={activeTheme.primary}
                color="black"
            >
                {label.padEnd(width)}
            </Text>
        )
    }

    return <Text color={colorForKind(entry)}>{label}</Text>
}

function ActionRow({
    keyName,
    label,
    width,
}: {
    keyName: string
    label: string
    width: number
}) {
    const keyColumns = 8
    const safeLabel = truncateLine(label, Math.max(1, width - keyColumns))

    return (
        <Text>
            <Text
                color={activeTheme.primary}
                bold
            >
                {keyName.padEnd(keyColumns)}
            </Text>
            <Text>{safeLabel}</Text>
        </Text>
    )
}

function getLauncherLayout(viewport: AppViewport) {
    const columns = createTwoColumnLayout(viewport, 0.31, 58, 34)
    const showRight = columns.showRight && viewport.bodyRows >= 12
    const bodyHeight = Math.max(12, viewport.bodyRows)
    const summaryHeight = 6
    const targetHeight = 7
    const actionsHeight = Math.max(6, bodyHeight - summaryHeight - targetHeight)
    const treeRows = Math.max(3, bodyHeight - 2)
    const labelWidth = 7

    return {
        totalWidth: columns.totalWidth,
        gap: columns.gap,
        leftWidth: showRight ? columns.leftWidth : columns.totalWidth,
        rightWidth: columns.rightWidth,
        showRight,
        bodyHeight,
        summaryHeight,
        targetHeight,
        actionsHeight,
        treeRows,
        labelWidth,
        sideValueWidth: Math.max(10, columns.rightWidth - labelWidth - 8),
        actionValueWidth: Math.max(8, columns.rightWidth - 6),
    }
}

function iconForKind(entry: RepoTreeEntry): string {
    if (entry.kind === "root") return entry.isExpanded ? "â–¾" : "â–¸"
    if (entry.kind === "repo") return entry.isExpanded ? "â–¾ â–£" : "â–¸ â–£"
    if (entry.kind === "folder") return "â–¸"
    if (entry.kind === "parent") return "â†‘"
    return "â€¢"
}

function colorForKind(entry: RepoTreeEntry): string {
    if (entry.kind === "repo") return activeTheme.primary
    if (entry.kind === "root") return activeTheme.primary
    if (entry.kind === "parent") return activeTheme.warning
    if (entry.kind === "file") return activeTheme.muted
    return activeTheme.accent
}
```

#### RateLtd/src/components/StatusBar.tsx

```tsx
import React from "react"
import { Box, Text } from "ink"
import type { RepoInfo } from "../utils/repo.js"
import { activeTheme } from "../theme.js"
import { truncateLine } from "../utils/terminalText.js"

export function StatusBar({ repo, width }: { repo: RepoInfo; width: number }) {
    const label = [
        `target: ${repo.targetRoot}`,
        `pkg: ${repo.targetPackageName}`,
        `branch: ${repo.branch}`,
        `state: ${repo.dirty ? "dirty" : "clean"}`,
        `node: ${repo.nodeVersion}`,
        `pnpm: ${repo.pnpmVersion}`,
    ].join("  ")

    return (
        <Box width={width}>
            <Text color={repo.dirty ? activeTheme.warning : activeTheme.accent}>
                {truncateLine(label, width)}
            </Text>
        </Box>
    )
}
```

#### RateLtd/src/components/StructuredTable.tsx

```tsx
import React from "react"
import { Text } from "ink"
import { truncateLine } from "../utils/terminalText.js"

export type StructuredTableColumn<T> = {
    key: keyof T
    label: string
    width: number
}

export function StructuredTable<T extends Record<string, unknown>>({
    columns,
    rows,
}: {
    columns: Array<StructuredTableColumn<T>>
    rows: T[]
}) {
    const header = columns
        .map((column) =>
            truncateLine(column.label.padEnd(column.width), column.width),
        )
        .join(" ")
    const body = rows
        .map((row) =>
            columns
                .map((column) =>
                    truncateLine(
                        String(row[column.key] ?? "").padEnd(column.width),
                        column.width,
                    ),
                )
                .join(" "),
        )
        .join("\n")
    return <Text>{[header, body].filter(Boolean).join("\n")}</Text>
}
```

#### RateLtd/src/components/WriterScreen.tsx

```tsx
import React from "react"
import { Box, Text } from "ink"
import type { MeatHarnessController, WriterAction } from "../state/appTypes.js"
import { activeTheme } from "../theme.js"
import { Panel, FieldRow } from "./Panel.js"
import { clipTextLines, truncateLine } from "../utils/terminalText.js"
import { createTwoColumnLayout, type AppViewport } from "../utils/layout.js"

export function WriterScreen({
    controller,
    viewport,
}: {
    controller: MeatHarnessController
    viewport: AppViewport
}) {
    const layout = getWriterLayout(viewport)
    const preview =
        controller.writePlan.body.length > 0 ?
            controller.writePlan.body
        :   "(nothing loaded)"
    const writeStats = getWriteStats(controller)

    return (
        <Box
            width={layout.totalWidth}
            height={layout.bodyHeight}
            overflow="hidden"
        >
            <Box
                flexDirection="row"
                gap={layout.gap}
                width={layout.totalWidth}
                height={layout.bodyHeight}
                overflow="hidden"
            >
                <Box
                    width={layout.leftWidth}
                    height={layout.bodyHeight}
                    overflow="hidden"
                >
                    <Panel
                        title="CLIPBOARD INTAKE"
                        tone="accent"
                        width={layout.leftWidth}
                        minHeight={layout.bodyHeight}
                    >
                        <Text color={activeTheme.primary}>
                            1. Clipboard Intake â€¢ detect payload type and build
                            a preview first.
                        </Text>

                        {controller.writerActions.map((action, index) => (
                            <WriterActionRow
                                key={action.id}
                                action={action.id}
                                label={action.label}
                                description={action.description}
                                selected={
                                    index === controller.writerSelectedIndex
                                }
                                width={Math.max(1, layout.leftWidth - 6)}
                            />
                        ))}

                        <Text />

                        <Text
                            color={planTitleColor(controller.writePlan.mode)}
                            bold
                        >
                            {controller.writePlan.title}
                        </Text>

                        <Text>
                            {clipTextLines(preview, {
                                maxLines: layout.previewLines,
                                maxColumns: Math.max(1, layout.leftWidth - 6),
                            })}
                        </Text>

                        {controller.writePlan.warnings.length > 0 &&
                            layout.warningLines > 0 && (
                                <Text color={activeTheme.warning}>
                                    {clipTextLines(
                                        controller.writePlan.warnings.join(
                                            "\n",
                                        ),
                                        {
                                            maxLines: layout.warningLines,
                                            maxColumns: Math.max(
                                                1,
                                                layout.leftWidth - 6,
                                            ),
                                        },
                                    )}
                                </Text>
                            )}
                    </Panel>
                </Box>

                {layout.showRight && (
                    <Box
                        width={layout.rightWidth}
                        height={layout.bodyHeight}
                        flexDirection="column"
                        overflow="hidden"
                    >
                        <Panel
                            title="SAFETY CHECKLIST"
                            tone="danger"
                            width={layout.rightWidth}
                            minHeight={layout.summaryHeight}
                        >
                            <FieldRow
                                label="preview"
                                labelWidth={layout.labelWidth}
                                value={
                                    controller.writePlan.mode === "planned" ?
                                        "ready"
                                    :   "required"
                                }
                                valueColor={
                                    controller.writePlan.mode === "planned" ?
                                        activeTheme.primary
                                    :   activeTheme.warning
                                }
                            />
                            <FieldRow
                                label="target"
                                labelWidth={layout.labelWidth}
                                value="bound"
                                valueColor={activeTheme.primary}
                            />
                            <FieldRow
                                label="paths"
                                labelWidth={layout.labelWidth}
                                value="guarded"
                                valueColor={activeTheme.primary}
                            />
                            <FieldRow
                                label="files"
                                labelWidth={layout.labelWidth}
                                value={writeStats.files}
                            />
                            <FieldRow
                                label="warn"
                                labelWidth={layout.labelWidth}
                                value={writeStats.warnings}
                            />
                            <FieldRow
                                label="bytes"
                                labelWidth={layout.labelWidth}
                                value={writeStats.bytes}
                            />
                        </Panel>

                        <Panel
                            title="TARGET"
                            tone="primary"
                            width={layout.rightWidth}
                            minHeight={layout.targetHeight}
                        >
                            <FieldRow
                                label="repo"
                                labelWidth={layout.labelWidth}
                                value={controller.repo.targetRoot}
                                maxValueColumns={layout.sideValueWidth}
                            />
                            <FieldRow
                                label="writes"
                                labelWidth={layout.labelWidth}
                                value="confirm first"
                                valueColor={activeTheme.warning}
                            />
                            <FieldRow
                                label="logs"
                                labelWidth={layout.labelWidth}
                                value=".agent-logs/events.jsonl"
                                valueColor={activeTheme.primary}
                                maxValueColumns={layout.sideValueWidth}
                            />
                        </Panel>

                        <Panel
                            title="ACTIONS"
                            tone="warning"
                            width={layout.rightWidth}
                            minHeight={layout.actionsHeight}
                        >
                            <ActionRow
                                keyName="â†‘/â†“"
                                label="select mode"
                                width={layout.actionValueWidth}
                            />
                            <ActionRow
                                keyName="Enter"
                                label="load preview / confirm"
                                width={layout.actionValueWidth}
                            />
                            <ActionRow
                                keyName="Esc"
                                label="clear intake"
                                width={layout.actionValueWidth}
                            />
                            <Text color={activeTheme.warning}>
                                No file write or command runs without this
                                confirmation screen.
                            </Text>
                        </Panel>
                    </Box>
                )}
            </Box>
        </Box>
    )
}

function WriterActionRow({
    action,
    label,
    description,
    selected,
    width,
}: {
    action: WriterAction
    label: string
    description: string
    selected: boolean
    width: number
}) {
    const icon = action === "file-write" ? "â—†" : "â–¶"
    const line = truncateLine(
        `${selected ? "â–¶" : " "} ${icon} ${label} â€” ${description}`,
        width,
    )

    if (selected) {
        return (
            <Text
                backgroundColor={activeTheme.primary}
                color="black"
            >
                {line.padEnd(width)}
            </Text>
        )
    }

    return <Text color={activeTheme.muted}>{line}</Text>
}

function ActionRow({
    keyName,
    label,
    width,
}: {
    keyName: string
    label: string
    width: number
}) {
    const keyColumns = 8
    const safeLabel = truncateLine(label, Math.max(1, width - keyColumns))

    return (
        <Text>
            <Text
                color={activeTheme.primary}
                bold
            >
                {keyName.padEnd(keyColumns)}
            </Text>
            <Text>{safeLabel}</Text>
        </Text>
    )
}

function planTitleColor(mode: MeatHarnessController["writePlan"]["mode"]) {
    if (mode === "planned") return activeTheme.primary
    if (mode === "error") return activeTheme.danger
    return activeTheme.muted
}

function getWriteStats(controller: MeatHarnessController) {
    const payloadFiles = controller.writePlan.payload?.files.length ?? 0

    return {
        files: String(payloadFiles),
        warnings: String(controller.writePlan.warnings.length),
        bytes: String(controller.writePlan.body.length),
    }
}

function getWriterLayout(viewport: AppViewport) {
    const columns = createTwoColumnLayout(viewport, 0.31, 58, 34)
    const showRight = columns.showRight && viewport.bodyRows >= 12
    const bodyHeight = Math.max(12, viewport.bodyRows)
    const warningLines =
        bodyHeight >= 24 ? 2
        : bodyHeight >= 18 ? 1
        : 0
    const previewLines = Math.max(3, bodyHeight - warningLines - 9)
    const summaryHeight = 6
    const targetHeight = 7
    const actionsHeight = Math.max(6, bodyHeight - summaryHeight - targetHeight)
    const labelWidth = 7

    return {
        totalWidth: columns.totalWidth,
        gap: columns.gap,
        leftWidth: showRight ? columns.leftWidth : columns.totalWidth,
        rightWidth: columns.rightWidth,
        showRight,
        bodyHeight,
        summaryHeight,
        targetHeight,
        actionsHeight,
        previewLines,
        warningLines,
        labelWidth,
        sideValueWidth: Math.max(10, columns.rightWidth - labelWidth - 8),
        actionValueWidth: Math.max(8, columns.rightWidth - 6),
    }
}
```

### RateLtd/src/controller/

#### RateLtd/src/controller/inputRouter.test.ts

```ts
import { describe, expect, it } from "vitest"

import { routeInput } from "./inputRouter.js"

const normal = { kind: "normal" } as const

describe("routeInput", () => {
    it("ignores q as a global quit while text entry is active", () => {
        const result = routeInput(
            "q",
            {},
            {
                screen: "input",
                inputMode: { kind: "text-entry", label: "Search" },
                hasConfirmDialog: false,
            },
        )

        expect(result).toEqual({ kind: "text-entry.input" })
    })

    it("routes modal Enter and Escape before screen/global shortcuts", () => {
        expect(
            routeInput(
                "q",
                { return: true },
                {
                    screen: "write",
                    inputMode: normal,
                    hasConfirmDialog: true,
                },
            ),
        ).toEqual({ kind: "modal.confirm" })

        expect(
            routeInput(
                "q",
                { escape: true },
                {
                    screen: "write",
                    inputMode: normal,
                    hasConfirmDialog: true,
                },
            ),
        ).toEqual({ kind: "modal.cancel" })
    })

    it("opens global help outside text-entry and modal modes", () => {
        const result = routeInput(
            "?",
            {},
            {
                screen: "launcher",
                inputMode: normal,
                hasConfirmDialog: false,
            },
        )

        expect(result).toEqual({ kind: "global", action: "help.open" })
    })

    it("requires confirmation before running risky selected ops commands", () => {
        const result = routeInput(
            "",
            { return: true },
            {
                screen: "ops",
                inputMode: normal,
                hasConfirmDialog: false,
                selectedCommandRequiresConfirmation: true,
            },
        )

        expect(result).toEqual({
            kind: "screen",
            action: "ops.confirm-required",
        })
    })
})
```

#### RateLtd/src/controller/inputRouter.ts

```ts
import type { ScreenId } from "../state/navigation.js"
import type { InputMode } from "../state/inputModes.js"

export type RouterKey = {
    upArrow?: boolean
    downArrow?: boolean
    leftArrow?: boolean
    rightArrow?: boolean
    return?: boolean
    escape?: boolean
    tab?: boolean
    shift?: boolean
    ctrl?: boolean
}

export type InputRouteContext = {
    screen: ScreenId
    inputMode: InputMode
    hasConfirmDialog: boolean
    selectedCommandRequiresConfirmation?: boolean
}

export type InputRouteResult =
    | { kind: "ignored"; reason: string }
    | { kind: "text-entry.cancel" }
    | { kind: "text-entry.input" }
    | { kind: "modal.confirm" }
    | { kind: "modal.cancel" }
    | { kind: "modal.toggle-choice" }
    | { kind: "modal.choose"; choice: "yes" | "no" }
    | { kind: "screen"; action: ScreenAction }
    | { kind: "global"; action: GlobalAction }

export type ScreenAction =
    | "launcher.up"
    | "launcher.down"
    | "launcher.open"
    | "launcher.collapse"
    | "launcher.refresh"
    | "launcher.open-explorer"
    | "write.up"
    | "write.down"
    | "write.plan-or-confirm"
    | "write.clear"
    | "ops.up"
    | "ops.down"
    | "ops.run"
    | "ops.confirm-required"
    | "ops.copy-command"
    | "command.cancel"
    | "editor.up"
    | "editor.down"
    | "editor.open-external"
    | "editor.refresh"
    | "differ.up"
    | "differ.down"
    | "differ.stage"
    | "differ.unstage"
    | "differ.revert"
    | "differ.export-patch"
    | "prefer.save"
    | "prefer.toggle-theme"
    | "diagnostics.refresh"
    | "diagnostics.copy"
    | "handoff.copy"
    | "output.copy"
    | "output.save"

export type GlobalAction =
    | "help.open"
    | "help.close"
    | "help.copy"
    | "quit"
    | "navigate.launcher"
    | "navigate.rate"
    | "navigate.editor"
    | "navigate.write"
    | "navigate.ops"
    | "navigate.differ"
    | "navigate.output"
    | "navigate.prefer"
    | "palette.open"

export function routeInput(
    input: string,
    key: RouterKey,
    context: InputRouteContext,
): InputRouteResult {
    if (context.inputMode.kind === "text-entry" || context.screen === "input") {
        if (key.escape) return { kind: "text-entry.cancel" }
        return { kind: "text-entry.input" }
    }

    if (context.hasConfirmDialog || context.inputMode.kind === "modal") {
        if (key.return) return { kind: "modal.confirm" }
        if (key.escape) return { kind: "modal.cancel" }
        if (key.leftArrow || key.rightArrow)
            return { kind: "modal.toggle-choice" }
        if (input.toLowerCase() === "y")
            return { kind: "modal.choose", choice: "yes" }
        if (input.toLowerCase() === "n")
            return { kind: "modal.choose", choice: "no" }
        return { kind: "ignored", reason: "modal-active" }
    }

    const screenRoute = routeScreenInput(input, key, context)
    if (screenRoute) return screenRoute

    if (input === "\u0010") return { kind: "global", action: "palette.open" }
    if (input === "?") return { kind: "global", action: "help.open" }
    if (input === "q" || input === "Q")
        return { kind: "global", action: "quit" }
    if (input === "1") return { kind: "global", action: "navigate.launcher" }
    if (input === "2") return { kind: "global", action: "navigate.rate" }
    if (input === "3") return { kind: "global", action: "navigate.editor" }
    if (input === "4") return { kind: "global", action: "navigate.write" }
    if (input === "5") return { kind: "global", action: "navigate.ops" }
    if (input === "6") return { kind: "global", action: "navigate.differ" }
    if (input === "7") return { kind: "global", action: "navigate.output" }
    if (input === "8") return { kind: "global", action: "navigate.prefer" }

    return { kind: "ignored", reason: "unmapped" }
}

function routeScreenInput(
    input: string,
    key: RouterKey,
    context: InputRouteContext,
): InputRouteResult | undefined {
    if (context.screen === "agent-help") {
        if (key.escape) return { kind: "global", action: "help.close" }
        if (input === "c" || input === "C")
            return { kind: "global", action: "help.copy" }
    }

    if (context.screen === "launcher") {
        if (key.upArrow) return { kind: "screen", action: "launcher.up" }
        if (key.downArrow) return { kind: "screen", action: "launcher.down" }
        if (key.return) return { kind: "screen", action: "launcher.open" }
        if (key.leftArrow)
            return { kind: "screen", action: "launcher.collapse" }
        if (input === "r" || input === "R")
            return { kind: "screen", action: "launcher.refresh" }
        if (input === "o" || input === "O")
            return { kind: "screen", action: "launcher.open-explorer" }
    }

    if (context.screen === "write") {
        if (key.upArrow) return { kind: "screen", action: "write.up" }
        if (key.downArrow) return { kind: "screen", action: "write.down" }
        if (key.return || input === "p" || input === "P") {
            return { kind: "screen", action: "write.plan-or-confirm" }
        }
        if (key.escape) return { kind: "screen", action: "write.clear" }
    }

    if (context.screen === "ops") {
        if (key.upArrow) return { kind: "screen", action: "ops.up" }
        if (key.downArrow) return { kind: "screen", action: "ops.down" }
        if (key.return) {
            return {
                kind: "screen",
                action:
                    context.selectedCommandRequiresConfirmation ?
                        "ops.confirm-required"
                    :   "ops.run",
            }
        }
        if (input === "c" || input === "C")
            return { kind: "screen", action: "ops.copy-command" }
        if (input === "x" || input === "X")
            return { kind: "screen", action: "command.cancel" }
    }

    if (context.screen === "editor") {
        if (key.upArrow) return { kind: "screen", action: "editor.up" }
        if (key.downArrow) return { kind: "screen", action: "editor.down" }
        if (input === "e" || input === "E" || key.return)
            return { kind: "screen", action: "editor.open-external" }
        if (input === "r" || input === "R")
            return { kind: "screen", action: "editor.refresh" }
    }

    if (context.screen === "differ") {
        if (key.upArrow) return { kind: "screen", action: "differ.up" }
        if (key.downArrow) return { kind: "screen", action: "differ.down" }
        if (input === "s" || input === "S")
            return { kind: "screen", action: "differ.stage" }
        if (input === "u" || input === "U")
            return { kind: "screen", action: "differ.unstage" }
        if (input === "x" || input === "X")
            return { kind: "screen", action: "differ.revert" }
        if (input === "p" || input === "P")
            return { kind: "screen", action: "differ.export-patch" }
    }

    if (context.screen === "prefer") {
        if (input === "s" || input === "S")
            return { kind: "screen", action: "prefer.save" }
        if (input === "t" || input === "T")
            return { kind: "screen", action: "prefer.toggle-theme" }
    }

    if (context.screen === "agent-help") {
        if (input === "r" || input === "R")
            return { kind: "screen", action: "diagnostics.refresh" }
        if (input === "d" || input === "D")
            return { kind: "screen", action: "diagnostics.copy" }
        if (input === "h" || input === "H")
            return { kind: "screen", action: "handoff.copy" }
    }

    if (context.screen === "output") {
        if (input === "c" || input === "C")
            return { kind: "screen", action: "output.copy" }
        if (input === "s" || input === "S")
            return { kind: "screen", action: "output.save" }
        if (input === "h" || input === "H")
            return { kind: "screen", action: "handoff.copy" }
        if (input === "x" || input === "X")
            return { kind: "screen", action: "command.cancel" }
    }

    return undefined
}
```

### RateLtd/src/integrations/

#### RateLtd/src/integrations/editor/externalEditorAdapter.ts

```ts
import type { EditorAdapter, EditorOpenResult } from "../../types/editor.js"
import { streamCommandLine } from "../../services/processRunner.js"

export function createExternalEditorAdapter(
    cwd: string,
    command = process.env.EDITOR ?? "code",
): EditorAdapter {
    return {
        id: "external-editor",
        label: command,
        async open(filePath: string): Promise<EditorOpenResult> {
            await streamCommandLine(`${command} ${quote(filePath)}`, cwd)
            return {
                status: "blocked",
                reason: "External editor launched outside the TUI.",
            }
        },
    }
}

function quote(value: string): string {
    return `"${value.replace(/"/g, '\\"')}"`
}
```

#### RateLtd/src/integrations/monaco/monacoAdapter.ts

```ts
import type { EditorAdapter, EditorOpenResult } from "../../types/editor.js"
import { streamCommandLine } from "../../services/processRunner.js"

export type MonacoAdapterOptions = {
    companionCommand?: string
    cwd: string
}

export function createMonacoAdapter(
    options: MonacoAdapterOptions,
): EditorAdapter {
    return {
        id: "monaco-companion",
        label: "Monaco Companion",
        async open(filePath: string): Promise<EditorOpenResult> {
            if (!options.companionCommand) {
                return {
                    status: "blocked",
                    reason: "No Monaco companion command configured.",
                }
            }

            await streamCommandLine(
                `${options.companionCommand} ${quote(filePath)}`,
                options.cwd,
            )
            return {
                status: "blocked",
                reason: "Monaco is launched as an external companion; it is not embedded in Ink.",
            }
        },
    }
}

function quote(value: string): string {
    return `"${value.replace(/"/g, '\\"')}"`
}
```

#### RateLtd/src/integrations/powershell/scriptInventory.ts

```ts
import { existsSync, readdirSync, readFileSync, statSync } from "node:fs"
import path from "node:path"
import type { CommandRisk } from "../../types/commands.js"

export type PowerShellCommandManifest = {
    id: string
    name: string
    sourcePath: string
    description: string
    parameters: string[]
    examples: string[]
    requiredModules: string[]
    requiresAdmin: boolean
    risk: CommandRisk
    allowlisted: boolean
    license: string
    source: string
}

const defaultExtensions = new Set([".ps1", ".psm1"])

export function scanPowerShellScripts(
    vendorRoots: string[],
    allowlist: string[] = [],
    limit = 200,
): PowerShellCommandManifest[] {
    const manifests: PowerShellCommandManifest[] = []
    for (const root of vendorRoots) {
        if (!existsSync(root)) continue
        walk(root, root, manifests, allowlist, limit)
        if (manifests.length >= limit) break
    }
    return manifests
}

function walk(
    root: string,
    current: string,
    manifests: PowerShellCommandManifest[],
    allowlist: string[],
    limit: number,
): void {
    if (manifests.length >= limit) return
    for (const entry of readdirSync(current, { withFileTypes: true })) {
        if (manifests.length >= limit) return
        const fullPath = path.join(current, entry.name)
        if (entry.isDirectory()) {
            if (![".git", "node_modules"].includes(entry.name))
                walk(root, fullPath, manifests, allowlist, limit)
        } else if (
            entry.isFile() &&
            defaultExtensions.has(path.extname(entry.name).toLowerCase())
        ) {
            manifests.push(manifestFor(root, fullPath, allowlist))
        }
    }
}

function manifestFor(
    root: string,
    sourcePath: string,
    allowlist: string[],
): PowerShellCommandManifest {
    const content =
        statSync(sourcePath).size < 256_000 ?
            readFileSync(sourcePath, "utf8")
        :   ""
    const id = path
        .relative(root, sourcePath)
        .replace(/[^a-z0-9]+/gi, "-")
        .replace(/^-|-$/g, "")
        .toLowerCase()
    const risk = classifyRisk(content)
    return {
        id,
        name: path.basename(sourcePath),
        sourcePath,
        description:
            extractHelp(content, ".SYNOPSIS") ||
            extractHelp(content, ".DESCRIPTION") ||
            "No comment-based help found.",
        parameters: Array.from(
            content.matchAll(/param\s*\(([\s\S]*?)\)/gi),
        ).flatMap((match) =>
            Array.from(match[1].matchAll(/\$([A-Za-z_][A-Za-z0-9_]*)/g)).map(
                (param) => param[1],
            ),
        ),
        examples: Array.from(
            content.matchAll(/\.EXAMPLE\s+([\s\S]*?)(?=\n\s*\.[A-Z]+|\s*#>)/gi),
        )
            .map((match) => match[1].trim())
            .slice(0, 3),
        requiredModules: Array.from(
            content.matchAll(
                /(?:Import-Module|#Requires\s+-Modules)\s+([A-Za-z0-9_.-]+)/gi,
            ),
        ).map((match) => match[1]),
        requiresAdmin:
            /#Requires\s+-RunAsAdministrator|Requires\s+admin|RunAsAdministrator/i.test(
                content,
            ),
        risk,
        allowlisted: allowlist.includes(id),
        license: findLicense(root),
        source: root,
    }
}

function extractHelp(content: string, tag: string): string {
    const escaped = tag.replace(".", "\\.")
    const match = content.match(
        new RegExp(
            `${escaped}\\s+([\\s\\S]*?)(?=\\n\\s*\\.[A-Z]+|\\s*#>)`,
            "i",
        ),
    )
    return match?.[1]?.trim().replace(/\s+/g, " ") ?? ""
}

function classifyRisk(content: string): CommandRisk {
    if (
        /Remove-Item|rm\s|del\s|Format-|Clear-Disk|Set-ExecutionPolicy/i.test(
            content,
        )
    )
        return "destructive"
    if (
        /Invoke-WebRequest|Invoke-RestMethod|New-PSSession|Enter-PSSession/i.test(
            content,
        )
    )
        return "network"
    if (/Credential|SecureString|Token|Secret|Password/i.test(content))
        return "secret-sensitive"
    if (/#Requires\s+-RunAsAdministrator/i.test(content)) return "admin"
    return "medium"
}

function findLicense(root: string): string {
    for (const name of ["LICENSE", "LICENSE.md", "license.txt", "COPYING"]) {
        const candidate = path.join(root, name)
        if (existsSync(candidate)) return candidate
    }
    return "unknown"
}
```

### RateLtd/src/lib/

#### RateLtd/src/lib/terminal-themes/vercel.ts

```ts
import type { Theme } from "@/components/ui/theme-provider"

export const vercelTheme: Theme = {
    border: {
        color: "#454545",
        focusColor: "#f75590",
        style: "round",
    },
    colors: {
        accent: "#8e4ec6",
        accentForeground: "#000000",
        background: "#000000",
        border: "#454545",
        error: "#e5484d",
        errorForeground: "#000000",
        focusRing: "#f75590",
        foreground: "#ededed",
        info: "#52a8ff",
        infoForeground: "#000000",
        muted: "#0a0a0a",
        mutedForeground: "#878787",
        primary: "#0070f3",
        primaryForeground: "#000000",
        secondary: "#1a1a1a",
        secondaryForeground: "#ededed",
        selection: "#0070f3",
        selectionForeground: "#000000",
        success: "#46a758",
        successForeground: "#000000",
        warning: "#ffb224",
        warningForeground: "#000000",
    },
    name: "vercel",
    spacing: {
        0: 0,
        1: 1,
        2: 2,
        3: 3,
        4: 4,
        6: 6,
        8: 8,
    },
    typography: {
        base: "",
        bold: true,
        lg: "bold",
        sm: "dim",
        xl: "bold",
    },
}
```

#### RateLtd/src/lib/utils.ts

```ts
import { clsx, type ClassValue } from "clsx"
import { twMerge } from "tailwind-merge"

export function cn(...inputs: ClassValue[]) {
    return twMerge(clsx(inputs))
}
```

### RateLtd/src/persistence/

#### RateLtd/src/persistence/logStore.ts

````ts
import { existsSync, readFileSync } from "node:fs"
import path from "node:path"
import { redactForLog, type AgentLogEvent } from "../utils/logger.js"
import { getGitSummary } from "../services/gitService.js"

export type StoredLogEvent = AgentLogEvent & {
    timestamp: string
    level: "info" | "warn" | "error"
}

export function readLogEvents(repoRoot: string, limit = 200): StoredLogEvent[] {
    const filePath = path.join(repoRoot, ".agent-logs", "events.jsonl")
    if (!existsSync(filePath)) return []

    return readFileSync(filePath, "utf8")
        .split(/\r?\n/)
        .filter(Boolean)
        .slice(-limit)
        .map(parseEvent)
        .filter((event): event is StoredLogEvent => event !== undefined)
}

export function exportHandoff(repoRoot: string): string {
    const events = readLogEvents(repoRoot, 100)
    const recentCommands = events
        .filter(
            (event) =>
                event.event === "command_finished" ||
                event.event === "command_started",
        )
        .slice(-10)
    const latestFailure = events
        .slice()
        .reverse()
        .find(
            (event) =>
                event.level === "error" || event.event === "command_finished",
        )
    const git = getGitSummary(repoRoot)
    const packet = [
        "# RateLtd Handoff Packet",
        `Generated: ${new Date().toISOString()}`,
        `Target: ${repoRoot}`,
        "",
        "## Target Summary",
        `- Type: ${git.isGitRepo ? "git-repo" : "folder"}`,
        `- Branch: ${git.isGitRepo ? git.branch : "n/a"}`,
        `- Changed files: ${git.changedFiles.length}`,
        "",
        "## Git Status / Diff Stat",
        git.isGitRepo ?
            [
                "```text",
                git.statusText,
                "",
                git.diffStat || "(no diff stat)",
                "```",
            ].join("\n")
        :   "Target is not a Git repository; Git-only context is unavailable.",
        "",
        "### Recent Commands",
        recentCommands.length > 0 ?
            recentCommands
                .map(
                    (event) =>
                        `- ${event.timestamp} ${event.level}: ${event.message ?? event.event}`,
                )
                .join("\n")
        :   "- No recent command events.",
        "",
        "## Latest Failure / Receipt",
        latestFailure ?
            [
                `- Event: ${latestFailure.event}`,
                `- Level: ${latestFailure.level}`,
                `- Message: ${latestFailure.message ?? "(none)"}`,
                latestFailure.data ?
                    `- Data: ${JSON.stringify(latestFailure.data)}`
                :   undefined,
            ]
                .filter(Boolean)
                .join("\n")
        :   "- No failure event found.",
        "",
        "## Log Tail",
        "```json",
        JSON.stringify(events.slice(-20), null, 2),
        "```",
    ].join("\n")

    const safePacket = redactForLog(packet)
    return typeof safePacket === "string" ? safePacket : String(safePacket)
}

function parseEvent(line: string): StoredLogEvent | undefined {
    try {
        const parsed = JSON.parse(line) as Partial<StoredLogEvent>
        if (
            typeof parsed.event !== "string" ||
            typeof parsed.repoRoot !== "string"
        ) {
            return undefined
        }
        const event = {
            event: parsed.event,
            repoRoot: parsed.repoRoot,
            screen: parsed.screen,
            message: parsed.message,
            data: parsed.data,
            timestamp:
                typeof parsed.timestamp === "string" ? parsed.timestamp : "",
            level:
                (
                    parsed.level === "warn" ||
                    parsed.level === "error" ||
                    parsed.level === "info"
                ) ?
                    parsed.level
                :   "info",
        }
        return redactForLog(event) as StoredLogEvent
    } catch {
        return undefined
    }
}
````

#### RateLtd/src/persistence/settingsStore.ts

```ts
import {
    existsSync,
    mkdirSync,
    readFileSync,
    renameSync,
    writeFileSync,
} from "node:fs"
import path from "node:path"
import { defaultSettings, validateSettings } from "../schemas/settings.js"
import type { RateLtdSettings } from "../types/settings.js"

export type SettingsReadResult = {
    settings: RateLtdSettings
    sourcePath: string
    migratedFromLegacy: boolean
}

export function readSettings(harnessRoot: string): RateLtdSettings {
    return readSettingsWithSource(harnessRoot).settings
}

export function readSettingsWithSource(
    harnessRoot: string,
): SettingsReadResult {
    for (const filePath of settingsCandidates(harnessRoot)) {
        if (!existsSync(filePath)) continue
        try {
            return {
                settings: validateSettings(
                    JSON.parse(readFileSync(filePath, "utf8")),
                ),
                sourcePath: filePath,
                migratedFromLegacy: isLegacySettingsPath(filePath),
            }
        } catch {
            recoverBrokenSettings(filePath)
            return {
                settings: defaultSettings,
                sourcePath: path.join(harnessRoot, ".rateltd", "settings.json"),
                migratedFromLegacy: false,
            }
        }
    }
    return {
        settings: defaultSettings,
        sourcePath: path.join(harnessRoot, ".rateltd", "settings.json"),
        migratedFromLegacy: false,
    }
}

export function writeSettings(
    harnessRoot: string,
    settings: RateLtdSettings,
): string {
    const filePath = path.join(harnessRoot, ".rateltd", "settings.json")
    mkdirSync(path.dirname(filePath), { recursive: true })
    writeFileSync(
        filePath,
        `${JSON.stringify(validateSettings(settings), null, 2)}\n`,
        "utf8",
    )
    return filePath
}

export function settingsCandidates(harnessRoot: string): string[] {
    return [
        path.join(harnessRoot, ".rateltd", "settings.json"),
        path.join(harnessRoot, ".meatharness", "settings.json"),
        path.join(harnessRoot, ".rateltd.local.json"),
        path.join(harnessRoot, ".meatharness.local.json"),
    ]
}

function recoverBrokenSettings(filePath: string): void {
    try {
        renameSync(filePath, `${filePath}.broken-${Date.now()}`)
    } catch {
        // Best effort only; defaults still keep the app usable.
    }
}

function isLegacySettingsPath(filePath: string): boolean {
    return filePath.toLowerCase().includes(".meatharness")
}
```

#### RateLtd/src/persistence/sessionStore.ts

```ts
import { readdirSync, readFileSync, existsSync } from "node:fs"
import path from "node:path"

export type StoredSessionFile = {
    filePath: string
    name: string
    updatedAt: string
    preview: string
}

export function listStoredSessions(
    repoRoot: string,
    limit = 50,
): StoredSessionFile[] {
    const dir = path.join(repoRoot, ".agent-logs")
    if (!existsSync(dir)) return []

    return readdirSync(dir, { withFileTypes: true })
        .filter(
            (entry) => entry.isFile() && entry.name.endsWith(".run.log.txt"),
        )
        .map((entry) => {
            const filePath = path.join(dir, entry.name)
            const preview = readFileSync(filePath, "utf8").slice(0, 800)
            return {
                filePath,
                name: entry.name,
                updatedAt: entry.name.slice(0, 19),
                preview,
            }
        })
        .sort((first, second) => second.name.localeCompare(first.name))
        .slice(0, limit)
}
```

### RateLtd/src/schemas/settings.ts

```ts
import type { RateLtdSettings } from "../types/settings.js"

export const defaultSettings: RateLtdSettings = {
    version: 1,
    theme: "matrix",
    requireConfirmationForRiskyCommands: true,
    saveLogsAutomatically: true,
    startupScreen: "launcher",
    editor: {
        externalCommand: process.env.EDITOR ?? "code",
    },
    diff: {
        unifiedFallback: true,
        largeFileLimitBytes: 512 * 1024,
    },
    powershell: {
        vendorRoots: ["D:\\SadDull", "D:\\MeatHarness", "D:\\RateLtd\\sources"],
        allowlistedScriptIds: [],
        preferPwsh: true,
    },
    logs: {
        retentionDays: 30,
    },
}

export function validateSettings(input: unknown): RateLtdSettings {
    if (!input || typeof input !== "object") return defaultSettings
    const record = input as Partial<RateLtdSettings>
    return {
        ...defaultSettings,
        ...record,
        version: 1,
        editor: { ...defaultSettings.editor, ...record.editor },
        diff: { ...defaultSettings.diff, ...record.diff },
        powershell: { ...defaultSettings.powershell, ...record.powershell },
        logs: { ...defaultSettings.logs, ...record.logs },
        theme:
            (
                record.theme === "vercel" ||
                record.theme === "fallbackAscii" ||
                record.theme === "matrix"
            ) ?
                record.theme
            :   defaultSettings.theme,
    }
}
```

#### RateLtd/src/services/diagnosticsService.ts

```ts
import { accessSync, constants, existsSync } from "node:fs"
import { execFileSync } from "node:child_process"
import path from "node:path"
import { settingsCandidates } from "./settingsService.js"

export type DiagnosticStatus = "pass" | "warn" | "fail"

export type DiagnosticCheck = {
    id: string
    label: string
    status: DiagnosticStatus
    detail: string
}

export function runDiagnostics(
    harnessRoot: string,
    targetRoot: string,
): DiagnosticCheck[] {
    return [
        commandCheck("node", "Node version", ["--version"], "fail"),
        commandCheck("pnpm", "pnpm version", ["--version"], "fail"),
        commandCheck("git", "Git availability", ["--version"], "warn"),
        commandCheck(
            "pwsh",
            "PowerShell 7 availability",
            ["--version"],
            "warn",
        ),
        commandCheck("gh", "GitHub CLI availability", ["--version"], "warn"),
        {
            id: "termcn",
            label: "termcn wrapper",
            status:
                existsSync(path.join(harnessRoot, "src", "ui", "termcn")) ?
                    "pass"
                :   "warn",
            detail: "Local Ink-compatible wrapper layer is used; no direct OpenTUI dependency required.",
        },
        {
            id: "config",
            label: "config file validity",
            status:
                settingsCandidates(harnessRoot).some(existsSync) ?
                    "pass"
                :   "warn",
            detail:
                settingsCandidates(harnessRoot).find(existsSync) ??
                "Using defaults; no settings file found.",
        },
        {
            id: "logs",
            label: "session/log storage",
            status:
                existsSync(path.join(targetRoot, ".agent-logs")) ? "pass" : (
                    "warn"
                ),
            detail: path.join(targetRoot, ".agent-logs"),
        },
        {
            id: "permissions",
            label: "target repo permissions",
            status: canWrite(targetRoot) ? "pass" : "fail",
            detail: targetRoot,
        },
        {
            id: "workspace",
            label: "workspace validation",
            status:
                existsSync(path.join(targetRoot, "package.json")) ? "pass" : (
                    "warn"
                ),
            detail:
                existsSync(path.join(targetRoot, "package.json")) ?
                    "package.json present"
                :   "No package.json found.",
        },
        {
            id: "terminal",
            label: "terminal width/height",
            status:
                (
                    (process.stdout.columns ?? 0) >= 80 &&
                    (process.stdout.rows ?? 0) >= 24
                ) ?
                    "pass"
                :   "warn",
            detail: `${process.stdout.columns ?? "unknown"}x${process.stdout.rows ?? "unknown"}`,
        },
        {
            id: "glyphs",
            label: "glyph support fallback",
            status: "pass",
            detail: "fallbackAscii theme is available.",
        },
    ]
}

export function copyDiagnosticsPayload(
    harnessRoot: string,
    targetRoot: string,
): string {
    return JSON.stringify(
        {
            generatedAt: new Date().toISOString(),
            checks: runDiagnostics(harnessRoot, targetRoot),
        },
        null,
        2,
    )
}

function commandCheck(
    id: string,
    label: string,
    args: string[],
    failStatus: DiagnosticStatus,
): DiagnosticCheck {
    try {
        const detail =
            execFileSync(id, args, {
                encoding: "utf8",
                windowsHide: true,
            }).split(/\r?\n/)[0] ?? "ok"
        return { id, label, status: "pass", detail }
    } catch {
        return { id, label, status: failStatus, detail: `${id} not available` }
    }
}

function canWrite(targetRoot: string): boolean {
    try {
        accessSync(targetRoot, constants.R_OK | constants.W_OK)
        return true
    } catch {
        return false
    }
}
```

#### RateLtd/src/services/fileSystemService.ts

```ts
import {
    existsSync,
    readFileSync,
    statSync,
    writeFileSync,
    readdirSync,
} from "node:fs"
import path from "node:path"
import { assertInsideRepoPath } from "../utils/repo.js"

export type FileMetadata = {
    absolutePath: string
    relativePath: string
    exists: boolean
    sizeBytes: number
    modifiedAt?: string
    isBinary: boolean
    isLarge: boolean
    readOnly: boolean
}

const largeFileLimitBytes = 512 * 1024
const ignoredDirs = new Set([
    ".git",
    "node_modules",
    "dist",
    "coverage",
    ".next",
    ".turbo",
])

export function getFileMetadata(
    repoRoot: string,
    relativePath: string,
): FileMetadata {
    const absolutePath = assertInsideRepoPath(repoRoot, relativePath)
    if (!existsSync(absolutePath)) {
        return {
            absolutePath,
            relativePath,
            exists: false,
            sizeBytes: 0,
            isBinary: false,
            isLarge: false,
            readOnly: false,
        }
    }
    const stat = statSync(absolutePath)
    const sample =
        stat.isFile() ?
            readFileSync(absolutePath).subarray(0, 4096)
        :   Buffer.alloc(0)
    return {
        absolutePath,
        relativePath,
        exists: true,
        sizeBytes: stat.size,
        modifiedAt: stat.mtime.toISOString(),
        isBinary: sample.includes(0),
        isLarge: stat.size > largeFileLimitBytes,
        readOnly: false,
    }
}

export function readTextFile(repoRoot: string, relativePath: string): string {
    const metadata = getFileMetadata(repoRoot, relativePath)
    if (!metadata.exists) throw new Error(`File not found: ${relativePath}`)
    if (metadata.isBinary)
        throw new Error(`Binary file cannot be previewed: ${relativePath}`)
    if (metadata.isLarge)
        throw new Error(`Large file exceeds preview guard: ${relativePath}`)
    return readFileSync(metadata.absolutePath, "utf8")
}

export function writeTextFile(
    repoRoot: string,
    relativePath: string,
    content: string,
    expectedPrevious?: string,
): void {
    const absolutePath = assertInsideRepoPath(repoRoot, relativePath)
    const current =
        existsSync(absolutePath) ?
            readFileSync(absolutePath, "utf8")
        :   undefined
    if (expectedPrevious !== undefined && current !== expectedPrevious) {
        throw new Error(`Save conflict: ${relativePath} changed on disk.`)
    }
    writeFileSync(absolutePath, content, "utf8")
}

export function listTextFiles(repoRoot: string, limit = 200): string[] {
    const files: string[] = []
    walk(repoRoot, repoRoot, files, limit)
    return files
}

function walk(
    root: string,
    current: string,
    files: string[],
    limit: number,
): void {
    if (files.length >= limit) return
    for (const entry of readdirSync(current, { withFileTypes: true })) {
        if (files.length >= limit) return
        if (entry.isDirectory()) {
            if (!ignoredDirs.has(entry.name))
                walk(root, path.join(current, entry.name), files, limit)
        } else if (entry.isFile()) {
            const fullPath = path.join(current, entry.name)
            const relative = path.relative(root, fullPath)
            if (!getFileMetadata(root, relative).isBinary) files.push(relative)
        }
    }
}
```

#### RateLtd/src/services/githubService.ts

````ts
import { execFileSync } from "node:child_process"

export type GitHubStatus = {
    hasRemote: boolean
    ownerRepo?: string
    ghAvailable: boolean
    authenticated: boolean
    currentBranchPr?: string
    checks?: string
}

export function getGitHubStatus(cwd: string): GitHubStatus {
    const remote = safe("git", ["remote", "get-url", "origin"], cwd).trim()
    const ownerRepo = parseOwnerRepo(remote)
    const ghAvailable = safe("gh", ["--version"], cwd).length > 0
    const authenticated =
        ghAvailable && safe("gh", ["auth", "status"], cwd).length > 0
    return {
        hasRemote: remote.length > 0,
        ownerRepo,
        ghAvailable,
        authenticated,
        currentBranchPr:
            ghAvailable ?
                safe(
                    "gh",
                    ["pr", "view", "--json", "url", "-q", ".url"],
                    cwd,
                ).trim() || undefined
            :   undefined,
        checks:
            ghAvailable ?
                safe("gh", ["pr", "checks"], cwd).trim() || undefined
            :   undefined,
    }
}

export function generatePrDescriptionFromDiff(diff: string): string {
    return [
        "## Summary",
        "- Update RateLtd implementation.",
        "",
        "## Diff Stat",
        "```",
        diff.slice(0, 4000),
        "```",
    ].join("\n")
}

export function generateCommitMessageFromDiff(diff: string): string {
    if (/settings|PreferLtd/i.test(diff))
        return "feat: add rateltd settings workflow"
    if (/git|DifferLtd/i.test(diff)) return "feat: add rateltd git workflow"
    return "feat: advance rateltd tui"
}

function parseOwnerRepo(remote: string): string | undefined {
    const match = remote.match(/github\.com[:/]([^/]+\/[^/.]+)(?:\.git)?$/i)
    return match?.[1]
}

function safe(command: string, args: string[], cwd: string): string {
    try {
        return execFileSync(command, args, {
            cwd,
            encoding: "utf8",
            windowsHide: true,
            stdio: ["ignore", "pipe", "pipe"],
        })
    } catch {
        return ""
    }
}
````

#### RateLtd/src/services/loggingService.ts

```ts
import {
    appendAgentLog,
    redactForLog,
    saveCommandResult,
    saveRunSession,
    type AgentLogEvent,
} from "../utils/logger.js"

export type LogEventType =
    | "command.started"
    | "command.output"
    | "command.finished"
    | "command.failed"
    | "file.write"
    | "clipboard.parse"
    | "git.operation"
    | "app.error"

export function logRateLtdEvent(event: AgentLogEvent): string {
    return appendAgentLog(event)
}

export {
    appendAgentLog,
    redactForLog,
    saveCommandResult,
    saveRunSession,
    type AgentLogEvent,
}
```

#### RateLtd/src/services/gitService.ts

```ts
import { execFileSync } from "node:child_process"

export type GitChangedFile = {
    path: string
    indexStatus: string
    workTreeStatus: string
    kind:
        | "modified"
        | "added"
        | "deleted"
        | "renamed"
        | "copied"
        | "untracked"
        | "unknown"
}

export type GitSummary = {
    isGitRepo: boolean
    branch: string
    statusText: string
    changedFiles: GitChangedFile[]
    diffStat: string
}

export function getGitSummary(cwd: string): GitSummary {
    const status = safeGit(cwd, ["status", "--porcelain=v1"])
    return {
        isGitRepo:
            safeGit(cwd, ["rev-parse", "--is-inside-work-tree"]).trim() ===
            "true",
        branch:
            safeGit(cwd, ["branch", "--show-current"]).trim() || "(detached)",
        statusText: status.trim() || "clean",
        changedFiles: parsePorcelainStatus(status),
        diffStat: safeGit(cwd, ["diff", "--stat"]).trim(),
    }
}

export function getFileDiff(
    cwd: string,
    filePath: string,
    staged = false,
): string {
    return safeGit(
        cwd,
        staged ?
            ["diff", "--cached", "--", filePath]
        :   ["diff", "--", filePath],
    )
}

export function stageFile(cwd: string, filePath: string): string {
    return safeGit(cwd, ["add", "--", filePath])
}

export function unstageFile(cwd: string, filePath: string): string {
    return safeGit(cwd, ["restore", "--staged", "--", filePath])
}

export function revertFile(cwd: string, filePath: string): string {
    return safeGit(cwd, ["restore", "--", filePath])
}

export function exportPatch(cwd: string): string {
    return safeGit(cwd, ["diff", "--binary"])
}

export function parsePorcelainStatus(status: string): GitChangedFile[] {
    return status
        .split(/\r?\n/)
        .filter(Boolean)
        .map((line) => {
            const indexStatus = line.slice(0, 1)
            const workTreeStatus = line.slice(1, 2)
            const rawPath = line.slice(3)
            const filePath =
                rawPath.includes(" -> ") ?
                    (rawPath.split(" -> ").at(-1) ?? rawPath)
                :   rawPath
            const code = `${indexStatus}${workTreeStatus}`
            return {
                path: filePath,
                indexStatus,
                workTreeStatus,
                kind: statusKind(code),
            }
        })
}

function statusKind(code: string): GitChangedFile["kind"] {
    if (code.includes("?")) return "untracked"
    if (code.includes("R")) return "renamed"
    if (code.includes("C")) return "copied"
    if (code.includes("A")) return "added"
    if (code.includes("D")) return "deleted"
    if (code.includes("M")) return "modified"
    return "unknown"
}

function safeGit(cwd: string, args: string[]): string {
    try {
        return execFileSync("git", args, {
            cwd,
            encoding: "utf8",
            windowsHide: true,
        })
    } catch {
        return ""
    }
}
```

#### RateLtd/src/services/powershellService.ts

```ts
import {
    scanPowerShellScripts,
    type PowerShellCommandManifest,
} from "../integrations/powershell/scriptInventory.js"
import { streamCommandLine, type CommandResult } from "./processRunner.js"

export { scanPowerShellScripts, type PowerShellCommandManifest }

export async function runAllowlistedPowerShellScript(
    manifest: PowerShellCommandManifest,
    cwd: string,
    args: string[] = [],
    signal?: AbortSignal,
): Promise<CommandResult> {
    if (!manifest.allowlisted) {
        throw new Error(`PowerShell script is not allowlisted: ${manifest.id}`)
    }

    const executable = "pwsh"
    const command = [
        executable,
        "-NoLogo",
        "-NoProfile",
        "-ExecutionPolicy",
        "Bypass",
        "-File",
        quote(manifest.sourcePath),
        ...args.map(quote),
    ].join(" ")
    return await streamCommandLine(command, cwd, {
        signal,
        timeoutMs: 1000 * 60 * 10,
    })
}

function quote(value: string): string {
    return `"${value.replace(/"/g, '\\"')}"`
}
```

#### RateLtd/src/services/settingsService.ts

```ts
export {
    readSettings,
    readSettingsWithSource,
    writeSettings,
    settingsCandidates,
    type SettingsReadResult,
} from "../persistence/settingsStore.js"
export { defaultSettings, validateSettings } from "../schemas/settings.js"
export type { RateLtdSettings } from "../types/settings.js"
```

#### RateLtd/src/services/processRunner.ts

```ts
import {
    streamCommandLine,
    streamCommand,
    runCommand,
    detectCommandRisk,
    type CommandResult,
    type StreamCommandOptions,
    type StreamCommandLineOptions,
} from "../commands/runner.js"

export {
    detectCommandRisk,
    runCommand,
    streamCommand,
    streamCommandLine,
    type CommandResult,
    type StreamCommandLineOptions,
    type StreamCommandOptions,
}
```

$### RateLtd/src/state/appNavigation.ts

```ts
import { existsSync, readdirSync, readFileSync, statSync } from "node:fs"
import path from "node:path"
import type { RepoInfo } from "../utils/repo.js"
import type { LauncherStats, OpsDeckItem, RepoTreeEntry } from "./appTypes.js"
import type { RateLtdSettings } from "../types/settings.js"
import { scanPowerShellScripts } from "../integrations/powershell/scriptInventory.js"

const blockedDirectoryNames = new Set([
    ".agent-backups",
    ".agent-logs",
    ".git",
    ".next",
    ".turbo",
    "build",
    "coverage",
    "dist",
    "node_modules",
])

const visibleFileNames = new Set([
    ".editorconfig",
    ".gitignore",
    "package.json",
    "pnpm-lock.yaml",
    "README.md",
    "tsconfig.json",
    "vitest.config.ts",
])

const launcherStatsCacheTtlMs = 10_000
const maxCountDepth = 3
const maxCountEntries = 1_500
const maxLauncherDirectories = 32
const maxRepoPreviewDirectories = 16

const repoRootCache = new Map<string, boolean>()
const packageScriptCache = new Map<string, string[]>()
const packageNameCache = new Map<string, string>()
const launcherStatsCache = new Map<
    string,
    { createdAt: number; mtimeMs: number; value: LauncherStats }
>()

export function buildRepoTreeEntries(
    root: string,
    activeTargetRoot: string,
): RepoTreeEntry[] {
    const resolvedRoot = path.resolve(root)
    const activeRoot = path.resolve(activeTargetRoot)
    const entries: RepoTreeEntry[] = [
        {
            name: resolvedRoot,
            path: resolvedRoot,
            kind: "root",
            depth: 0,
            isExpanded: true,
            isActive: false,
        },
    ]

    const parent = path.dirname(resolvedRoot)

    if (parent !== resolvedRoot) {
        entries.push({
            name: "..",
            path: parent,
            kind: "parent",
            depth: 1,
        })
    }

    for (const child of listChildDirectories(resolvedRoot)) {
        const childIsRepo = isRepoRoot(child)
        const childIsActive = path.resolve(child) === activeRoot

        entries.push({
            name: path.basename(child),
            path: child,
            kind: childIsRepo ? "repo" : "folder",
            depth: 1,
            isExpanded: childIsActive,
            isActive: childIsActive,
        })

        if (childIsActive) {
            for (const nested of listRepoPreviewEntries(child)) {
                entries.push(nested)
            }
        }
    }

    for (const file of listVisibleFiles(resolvedRoot)) {
        entries.push({
            name: path.basename(file),
            path: file,
            kind: "file",
            depth: 1,
        })
    }

    return entries
}

export function collectLauncherStats(root: string): LauncherStats {
    const targetRoot = isRepoRoot(root) ? root : (findFirstRepo(root) ?? root)
    const cacheKey = path.resolve(targetRoot)
    const rootMtimeMs = safeMtimeMs(cacheKey)
    const cached = launcherStatsCache.get(cacheKey)
    const now = Date.now()

    if (
        cached &&
        cached.mtimeMs === rootMtimeMs &&
        now - cached.createdAt <= launcherStatsCacheTtlMs
    ) {
        return cached.value
    }

    const counters = countTree(targetRoot, {
        depth: 0,
        visited: 0,
        maxDepth: maxCountDepth,
        maxEntries: maxCountEntries,
    })
    const scripts = discoverPackageScripts(targetRoot)
    const value = {
        files: counters.files,
        folders: counters.folders,
        repos: counters.repos,
        commands: scripts.length,
        packageName: readPackageName(targetRoot),
        updatedLabel: latestUpdatedLabel(targetRoot),
    } satisfies LauncherStats

    launcherStatsCache.set(cacheKey, {
        createdAt: now,
        mtimeMs: rootMtimeMs,
        value,
    })

    return value
}

export function isRepoRoot(candidate: string): boolean {
    const resolved = path.resolve(candidate)
    const cached = repoRootCache.get(resolved)

    if (cached !== undefined) return cached

    const value = existsSync(path.join(resolved, ".git"))

    repoRootCache.set(resolved, value)
    return value
}

export function discoverPackageScripts(targetRoot: string): string[] {
    const resolved = path.resolve(targetRoot)
    const cached = packageScriptCache.get(resolved)

    if (cached) return cached

    try {
        const parsed = JSON.parse(
            readFileSync(path.join(resolved, "package.json"), "utf8"),
        ) as {
            scripts?: Record<string, unknown>
        }

        const scripts = Object.entries(parsed.scripts ?? {})
            .filter(([, value]) => typeof value === "string")
            .map(([script]) => script)
            .sort((first, second) => first.localeCompare(second))

        packageScriptCache.set(resolved, scripts)
        return scripts
    } catch {
        packageScriptCache.set(resolved, [])
        return []
    }
}

export function buildOpsDeckItems(
    repo: RepoInfo,
    settings?: RateLtdSettings,
): OpsDeckItem[] {
    return [
        ...buildPackageOps(repo),
        ...buildGitOps(repo),
        ...buildSearchOps(),
        ...buildPowerShellOps(repo, settings),
    ]
}

export function knownLaunchRoots(repo: RepoInfo): string[] {
    return [
        path.parse(repo.targetRoot).root,
        path.dirname(repo.targetRoot),
        repo.targetRoot,
        repo.harnessRoot,
        "D:\\",
        "D:\\RateLtd",
        "D:\\MeatHarness",
        "D:\\Vouch",
        "D:\\Vouch\\vouch-server",
    ]
        .map((candidate) => path.resolve(candidate))
        .filter(
            (candidate, index, all) =>
                existsSync(candidate) && all.indexOf(candidate) === index,
        )
}

function listRepoPreviewEntries(repoRoot: string): RepoTreeEntry[] {
    const entries: RepoTreeEntry[] = []

    for (const directory of listChildDirectories(repoRoot).slice(
        0,
        maxRepoPreviewDirectories,
    )) {
        entries.push({
            name: path.basename(directory),
            path: directory,
            kind: isRepoRoot(directory) ? "repo" : "folder",
            depth: 2,
        })
    }

    for (const file of listVisibleFiles(repoRoot)) {
        entries.push({
            name: path.basename(file),
            path: file,
            kind: "file",
            depth: 2,
        })
    }

    return entries
}

function buildPackageOps(repo: RepoInfo): OpsDeckItem[] {
    const scripts = discoverPackageScripts(repo.targetRoot)
    const availableScripts = new Set(scripts)
    const required = ["verify", "typecheck", "test", "build"]
    const orderedScripts = [
        ...required,
        ...scripts.filter((script) => !required.includes(script)),
    ]
    const uniqueScripts = Array.from(new Set(orderedScripts))

    if (!repo.hasPackageJson) {
        return required.map((script) =>
            packageItem(script, false, "No package.json in target."),
        )
    }

    return uniqueScripts.map((script) =>
        packageItem(
            script,
            availableScripts.has(script),
            availableScripts.has(script) ? undefined : (
                `Script '${script}' not defined in package.json.`
            ),
        ),
    )
}

function packageItem(
    script: string,
    available: boolean,
    unavailableReason?: string,
): OpsDeckItem {
    const mediumRiskScripts = new Set([
        "build",
        "dev",
        "start",
        "test",
        "test:e2e",
        "validate",
        "verify",
    ])
    const label = script === "typecheck" ? "pnpm typecheck" : `pnpm ${script}`
    return {
        id: `package-${script.replace(/[^a-z0-9]+/gi, "-").toLowerCase()}`,
        label,
        command: `pnpm ${script}`,
        group: "Package",
        source: "package.json",
        risk: mediumRiskScripts.has(script) ? "medium" : "safe",
        requiresConfirmation: mediumRiskScripts.has(script),
        available,
        unavailableReason,
    }
}

function buildGitOps(repo: RepoInfo): OpsDeckItem[] {
    const canonicalGitCommands = [
        {
            id: "git-status",
            label: "git status",
            command: "git status --short --branch",
            risk: "safe" as const,
        },
        {
            id: "git-diff-stat",
            label: "git diff --stat",
            command: "git diff --stat",
            risk: "safe" as const,
        },
        {
            id: "git-diff",
            label: "git diff",
            command: "git diff",
            risk: "safe" as const,
        },
        {
            id: "git-diff-staged",
            label: "git diff --staged",
            command: "git diff --staged",
            risk: "safe" as const,
        },
        {
            id: "git-log",
            label: "git log",
            command: "git log --oneline --decorate -20",
            risk: "safe" as const,
        },
        {
            id: "git-remote",
            label: "git remote",
            command: "git remote -v",
            risk: "safe" as const,
        },
        {
            id: "git-add-all",
            label: "git add .",
            command: "git add .",
            risk: "medium" as const,
            requiresConfirmation: true,
        },
        {
            id: "git-commit-disabled",
            label: "git commit",
            command: 'git commit -m "<message>"',
            risk: "destructive" as const,
            requiresConfirmation: true,
            available: false,
            unavailableReason: "Disabled until a commit-message flow exists.",
        },
        {
            id: "git-push",
            label: "git push",
            command: "git push",
            risk: "network" as const,
            requiresConfirmation: true,
        },
    ]

    return canonicalGitCommands.map((item) => ({
        group: "Git",
        source: "git",
        available: item.available ?? repo.isGitRepo,
        unavailableReason:
            item.unavailableReason ??
            (repo.isGitRepo ? undefined : "Target is not a Git repository."),
        ...item,
    }))
}

function buildSearchOps(): OpsDeckItem[] {
    const canonicalSearch = [
        { id: "search-files", label: "rg --files", command: "rg --files" },
        {
            id: "search-src-files",
            label: "rg --files src",
            command: "rg --files src",
        },
        {
            id: "search-todos",
            label: "TODO/FIXME scan",
            command: 'rg -n "TODO|FIXME|SCAFFOLD_NOT_IMPLEMENTED" .',
        },
    ]

    return canonicalSearch.map((item) => ({
        ...item,
        group: "Search",
        source: "ripgrep",
        risk: "safe",
        available: true,
    }))
}

function buildPowerShellOps(
    repo: RepoInfo,
    settings?: RateLtdSettings,
): OpsDeckItem[] {
    const vendorRoots = [
        path.join(repo.harnessRoot, "sources"),
        "D:\\SadDull",
        "D:\\MeatHarness",
    ]
    const allowlist = settings?.powershell.allowlistedScriptIds ?? []
    const manifests = scanPowerShellScripts(vendorRoots, allowlist, 8)

    return manifests.map((manifest) => ({
        id: `powershell-${manifest.id}`,
        label: manifest.name,
        command: `pwsh -NoProfile -ExecutionPolicy Bypass -File "${manifest.sourcePath}"`,
        group: "PowerShell",
        source: manifest.source,
        risk: manifest.risk,
        requiresConfirmation: true,
        available: manifest.allowlisted,
        unavailableReason:
            manifest.allowlisted ? undefined : (
                "Inventoried only. Add script id to the PowerShell allowlist before execution."
            ),
    }))
}

function listChildDirectories(root: string): string[] {
    try {
        const directories = readdirSync(root, { withFileTypes: true })
            .filter((entry) => entry.isDirectory())
            .filter((entry) => !blockedDirectoryNames.has(entry.name))
            .map((entry) => path.join(root, entry.name))

        const repoRank = new Map(
            directories.map((directory) => [
                directory,
                isRepoRoot(directory) ? 0 : 1,
            ]),
        )

        return directories
            .sort((first, second) => {
                return (
                    (repoRank.get(first) ?? 1) - (repoRank.get(second) ?? 1) ||
                    path.basename(first).localeCompare(path.basename(second))
                )
            })
            .slice(0, maxLauncherDirectories)
    } catch {
        return []
    }
}

function listVisibleFiles(root: string): string[] {
    try {
        return readdirSync(root, { withFileTypes: true })
            .filter((entry) => entry.isFile())
            .filter((entry) => visibleFileNames.has(entry.name))
            .map((entry) => path.join(root, entry.name))
            .sort((first, second) =>
                path.basename(first).localeCompare(path.basename(second)),
            )
    } catch {
        return []
    }
}

function findFirstRepo(root: string): string | undefined {
    if (isRepoRoot(root)) return root

    for (const child of listChildDirectories(root)) {
        if (isRepoRoot(child)) return child
    }

    return undefined
}

type CountTreeState = {
    depth: number
    visited: number
    maxDepth: number
    maxEntries: number
}

function countTree(
    root: string,
    state: CountTreeState,
): { files: number; folders: number; repos: number; visited: number } {
    if (state.depth > state.maxDepth || state.visited >= state.maxEntries) {
        return { files: 0, folders: 0, repos: 0, visited: state.visited }
    }

    let files = 0
    let folders = 0
    let repos = isRepoRoot(root) ? 1 : 0
    let visited = state.visited

    try {
        for (const entry of readdirSync(root, { withFileTypes: true })) {
            if (visited >= state.maxEntries) break

            visited += 1

            if (entry.isDirectory()) {
                if (blockedDirectoryNames.has(entry.name)) continue

                folders += 1

                const child = countTree(path.join(root, entry.name), {
                    ...state,
                    depth: state.depth + 1,
                    visited,
                })
                files += child.files
                folders += child.folders
                repos += child.repos
                visited = child.visited
            } else if (entry.isFile()) {
                files += 1
            }
        }
    } catch {
        return { files, folders, repos, visited }
    }

    return { files, folders, repos, visited }
}

function readPackageName(root: string): string {
    const resolved = path.resolve(root)
    const cached = packageNameCache.get(resolved)

    if (cached) return cached

    try {
        const parsed = JSON.parse(
            readFileSync(path.join(resolved, "package.json"), "utf8"),
        ) as { name?: unknown }
        const name = typeof parsed.name === "string" ? parsed.name : "(none)"
        packageNameCache.set(resolved, name)
        return name
    } catch {
        packageNameCache.set(resolved, "(none)")
        return "(none)"
    }
}

function latestUpdatedLabel(root: string): string {
    try {
        const ageMs = Date.now() - statSync(root).mtimeMs
        const minutes = Math.max(0, Math.round(ageMs / 60000))

        if (minutes < 1) return "just now"
        if (minutes < 60) return `${minutes}m ago`

        const hours = Math.round(minutes / 60)
        if (hours < 24) return `${hours}h ago`

        return `${Math.round(hours / 24)}d ago`
    } catch {
        return "unknown"
    }
}

function safeMtimeMs(targetPath: string): number {
    try {
        return statSync(targetPath).mtimeMs
    } catch {
        return 0
    }
}
```

$### RateLtd/src/state/inputModes.ts

```ts
export type InputMode =
    | { kind: "normal" }
    | { kind: "text-entry"; label?: string }
    | { kind: "modal"; modal: "confirm" | "help" }

export const normalInputMode: InputMode = { kind: "normal" }

export function isTextEntryMode(mode: InputMode): boolean {
    return mode.kind === "text-entry"
}
```

$### RateLtd/src/state/appTypes.ts

```ts
import type { CommandResult } from "../commands/runner.js"
import type { FileWritePayload } from "../commands/files.js"
import type { RepoInfo } from "../utils/repo.js"
import type { RunSession } from "../utils/runSession.js"
import type { Screen } from "./screens.js"
import type { GitSummary } from "../services/gitService.js"
import type { RateLtdSettings } from "../types/settings.js"
import type { DiagnosticCheck } from "../services/diagnosticsService.js"
import type { StoredLogEvent } from "../persistence/logStore.js"
import type { CommandRisk } from "../types/commands.js"

export type { Screen }

export type LiveCommandOutput = {
    command: string
    cwd: string
    stdout: string
    stderr: string
    startedAt: string
    finishedAt?: string
    exitCode?: number | null
    cancelled?: boolean
}

export type Pending = {
    title: string
    body: string
    run: () => Promise<void>
    cancelScreen?: Screen
}

export type RepoTreeEntry = {
    name: string
    path: string
    kind: "root" | "parent" | "repo" | "folder" | "file"
    depth: number
    isExpanded?: boolean
    isActive?: boolean
}

export type LauncherStats = {
    files: number
    folders: number
    repos: number
    commands: number
    packageName: string
    updatedLabel: string
}

export type WriterAction = "file-write" | "command"

export type WriteMode = "idle" | "planned" | "error"

export type WritePlan = {
    mode: WriteMode
    kind?: WriterAction
    title: string
    body: string
    payload?: FileWritePayload
    command?: string
    warnings: string[]
}

export type WriteOutcome = {
    status: "idle" | "planned" | "complete" | "failed"
    title: string
    detail: string
    filesChanged: number
    timestamp?: string
}

export type OpsDeckItem = {
    id: string
    label: string
    command: string
    group: "Package" | "Git" | "Search" | "PowerShell"
    source: string
    risk: CommandRisk
    available: boolean
    unavailableReason?: string
    requiresConfirmation?: boolean
}

export type MeatHarnessController = {
    repo: RepoInfo
    screen: Screen
    setScreen: (screen: Screen) => void

    message: string
    setMessage: (message: string) => void

    isRunning: boolean

    result?: CommandResult
    liveOutput?: LiveCommandOutput
    sessions: RunSession[]
    activeSession?: RunSession
    logEvents: StoredLogEvent[]
    refreshLogs: () => void

    pending?: Pending

    launcherRoot: string
    launcherEntries: RepoTreeEntry[]
    launcherStats: LauncherStats
    launcherSelectedIndex: number
    moveLauncherSelection: (delta: number) => void
    openLauncherSelection: () => void
    moveLauncherToParent: () => void
    refreshLauncherTree: () => void
    collapseLauncherSelection: () => void
    cycleLauncherRoot: () => void
    chooseTargetRepo: (targetRoot: string) => void
    openSelectedPathInExplorer: () => void

    writerActions: Array<{
        id: WriterAction
        label: string
        description: string
    }>
    writerSelectedIndex: number
    selectedWriterAction: WriterAction
    moveWriterSelection: (delta: number) => void
    planSelectedClipboardAction: () => Promise<void>

    writePlan: WritePlan
    writeOutcome: WriteOutcome
    planClipboardFileWrite: () => Promise<void>
    planClipboardAiCommand: () => Promise<void>
    confirmWriteOrCommand: () => Promise<void>
    clearWritePlan: () => void

    opsItems: OpsDeckItem[]
    opsSelectedIndex: number
    moveOpsSelection: (delta: number) => void
    runSelectedOp: () => Promise<void>

    gitSummary: GitSummary
    diffSelectedIndex: number
    moveDiffSelection: (delta: number) => void
    selectedDiffText: string
    refreshGit: () => void
    stageSelectedDiffFile: () => Promise<void>
    unstageSelectedDiffFile: () => Promise<void>
    revertSelectedDiffFile: () => void
    exportPatch: () => Promise<void>

    editorFiles: string[]
    editorSelectedIndex: number
    editorPreview: string
    editorFileRows: Array<{
        path: string
        type: string
        sizeBytes: number
        modifiedAt: string
        guard: string
    }>
    moveEditorSelection: (delta: number) => void
    refreshEditorFiles: () => void
    openSelectedExternalEditor: () => Promise<void>

    settings: RateLtdSettings
    settingsPath: string
    saveSettings: (settings: RateLtdSettings) => void

    diagnostics: DiagnosticCheck[]
    refreshDiagnostics: () => void
    copyDiagnostics: () => Promise<void>
    handoffPacket: string
    copyHandoffPacket: () => Promise<void>

    copyFullOutput: () => Promise<void>
    saveOutput: () => void
    cancelRunningCommand: () => void
    copyAgentHelpInstructions: () => Promise<void>

    inputLabel: string
    inputValue: string
    setInputValue: (value: string) => void
    inputSubmit: (value: string) => void

    appExit: () => void
}
```

$### RateLtd/src/state/navigation.ts

```ts
export type ScreenId =
    | "launcher"
    | "rate"
    | "editor"
    | "write"
    | "ops"
    | "differ"
    | "output"
    | "prefer"
    | "confirm"
    | "input"
    | "file-preview"
    | "agent-help"

export type ScreenMetadata = {
    id: ScreenId
    displayName: string
    moduleName: RateLtdModuleName
    shortcut?: string
    description: string
    badge: string
    subtitle: string
}

export type RateLtdModuleName =
    | "RateLtd"
    | "LauncherLtd"
    | "EditorLtd"
    | "CommanderLtd"
    | "DifferLtd"
    | "LoggerLtd"
    | "PreferLtd"
    | "HelpLtd"

export const screenMetadata = {
    launcher: {
        id: "launcher",
        displayName: "LauncherLtd",
        moduleName: "LauncherLtd",
        shortcut: "1",
        description: "Choose and inspect the active target repository.",
        badge: "1 LAUNCHERLTD",
        subtitle: "choose your working repository",
    },
    rate: {
        id: "rate",
        displayName: "RateLtd",
        moduleName: "RateLtd",
        shortcut: "2",
        description: "Operational dashboard for the current target repository.",
        badge: "2 RATELTD",
        subtitle: "repo summary â€¢ recommended actions",
    },
    editor: {
        id: "editor",
        displayName: "EditorLtd",
        moduleName: "EditorLtd",
        shortcut: "3",
        description: "Preview files and prepare adapter-based edit workflows.",
        badge: "3 EDITORLTD",
        subtitle: "file list â€¢ preview â€¢ external editor",
    },
    write: {
        id: "write",
        displayName: "CommanderLtd",
        moduleName: "CommanderLtd",
        shortcut: "4",
        description: "Plan clipboard file writes and AI command execution.",
        badge: "4 COMMANDERLTD",
        subtitle: "clipboard intake â€¢ commands â€¢ writes",
    },
    ops: {
        id: "ops",
        displayName: "CommanderLtd",
        moduleName: "CommanderLtd",
        shortcut: "5",
        description: "Run package, Git, and search commands.",
        badge: "5 COMMANDERLTD",
        subtitle: "run built-in ops with one key",
    },
    differ: {
        id: "differ",
        displayName: "DifferLtd",
        moduleName: "DifferLtd",
        shortcut: "6",
        description: "Inspect Git status, changed files, and diffs.",
        badge: "6 DIFFERLTD",
        subtitle: "status â€¢ split fallback â€¢ patch export",
    },
    output: {
        id: "output",
        displayName: "LoggerLtd",
        moduleName: "LoggerLtd",
        shortcut: "7",
        description: "View live command output, saved logs, and run sessions.",
        badge: "7 LOGGERLTD",
        subtitle: "live output â€¢ logs â€¢ history",
    },
    prefer: {
        id: "prefer",
        displayName: "PreferLtd",
        moduleName: "PreferLtd",
        shortcut: "8",
        description: "Inspect versioned RateLtd settings and migration state.",
        badge: "8 PREFERLTD",
        subtitle: "settings â€¢ migration â€¢ safety",
    },
    confirm: {
        id: "confirm",
        displayName: "Confirm",
        moduleName: "CommanderLtd",
        description: "Confirm or cancel a pending action.",
        badge: "CONFIRM",
        subtitle: "choose yes or no",
    },
    input: {
        id: "input",
        displayName: "Input",
        moduleName: "CommanderLtd",
        description: "Capture typed input without triggering global shortcuts.",
        badge: "INPUT",
        subtitle: "type value",
    },
    "file-preview": {
        id: "file-preview",
        displayName: "EditorLtd",
        moduleName: "EditorLtd",
        description: "Preview a file inside the terminal.",
        badge: "EDITORLTD",
        subtitle: "read-only file view",
    },
    "agent-help": {
        id: "agent-help",
        displayName: "HelpLtd",
        moduleName: "HelpLtd",
        description: "Show operating guidance and copyable agent instructions.",
        badge: "HELPLTD",
        subtitle: "shortcuts â€¢ troubleshooting â€¢ handoff",
    },
} satisfies Record<ScreenId, ScreenMetadata>

export const primaryScreens = [
    "launcher",
    "rate",
    "editor",
    "write",
    "ops",
    "differ",
    "output",
    "prefer",
] as const
export const topLevelScreens = [
    "launcher",
    "rate",
    "editor",
    "write",
    "ops",
    "differ",
    "output",
    "prefer",
    "agent-help",
] as const satisfies readonly ScreenId[]

export const navigationOrder = [
    "launcher",
    "rate",
    "editor",
    "write",
    "ops",
    "differ",
    "output",
    "prefer",
    "agent-help",
] as const satisfies readonly ScreenId[]

export const oldScreenAliases = {
    home: "launcher",
    rate: "rate",
    rateltd: "rate",
    dashboard: "rate",
    clipboard: "write",
    preview: "write",
    "write-preview": "write",
    writer: "write",
    commander: "ops",
    workflows: "ops",
    commands: "ops",
    validation: "ops",
    git: "ops",
    search: "ops",
    scripts: "ops",
    files: "editor",
    editor: "editor",
    differ: "differ",
    diff: "differ",
    runs: "output",
    sessions: "output",
    logger: "output",
    logs: "output",
    "run-log": "output",
    "run-session": "output",
    "command-output": "output",
    settings: "prefer",
    prefer: "prefer",
    help: "agent-help",
    "agent-instructions": "agent-help",
} as const satisfies Record<string, ScreenId>

export function normalizeScreen(screen: string): ScreenId {
    if (isScreenId(screen)) return screen
    if (Object.hasOwn(oldScreenAliases, screen)) {
        return oldScreenAliases[screen as keyof typeof oldScreenAliases]
    }
    return "launcher"
}

export function isPrimaryScreen(
    screen: string,
): screen is (typeof primaryScreens)[number] {
    return primaryScreens.includes(
        normalizeScreen(screen) as (typeof primaryScreens)[number],
    )
}

export function screenDisplayName(screen: string): string {
    return screenMetadata[normalizeScreen(screen)].displayName
}

function isScreenId(screen: string): screen is ScreenId {
    return Object.hasOwn(screenMetadata, screen)
}
```

$### RateLtd/src/state/screens.ts

```ts
export {
    normalizeScreen,
    primaryScreens,
    screenDisplayName,
    screenMetadata,
    type ScreenId as Screen,
} from "./navigation.js"
```

$### RateLtd/src/state/useMeatHarnessController.ts

```ts
import { agentHelpInstructions } from "../components/AgentHelpModal.js"
import { useEffect, useMemo, useState } from "react"
import path from "node:path"
import { useApp, useInput } from "ink"
import type { RepoInfo } from "../utils/repo.js"
import { loadRepoInfo } from "../utils/repo.js"
import { copyToClipboard, readClipboard } from "../utils/clipboard.js"
import {
    appendAgentLog,
    formatCommandResult,
    formatRunSession,
    saveCommandResult,
    saveRunSession,
} from "../utils/logger.js"
import {
    createRunSession,
    finishRunSession,
    type RunSession,
} from "../utils/runSession.js"
import {
    streamCommandLine,
    type CommandResult,
} from "../services/processRunner.js"
import { extractPowerShellCommands } from "../utils/markdown.js"
import { applyWrites, planFileWrites } from "../commands/files.js"
import type {
    LiveCommandOutput,
    MeatHarnessController,
    Pending,
    Screen,
    WriteOutcome,
    WritePlan,
} from "./appTypes.js"
import {
    buildOpsDeckItems,
    buildRepoTreeEntries,
    collectLauncherStats,
} from "./appNavigation.js"
import { normalInputMode } from "./inputModes.js"
import {
    routeInput,
    type GlobalAction,
    type ScreenAction,
} from "../controller/inputRouter.js"
import {
    exportPatch as exportGitPatch,
    getFileDiff,
    getGitSummary,
    revertFile,
    stageFile,
    unstageFile,
    type GitSummary,
} from "../services/gitService.js"
import {
    getFileMetadata,
    listTextFiles,
    readTextFile,
} from "../services/fileSystemService.js"
import {
    readSettingsWithSource,
    writeSettings,
    type RateLtdSettings,
} from "../services/settingsService.js"
import {
    runDiagnostics,
    copyDiagnosticsPayload,
    type DiagnosticCheck,
} from "../services/diagnosticsService.js"
import { readLogEvents, type StoredLogEvent } from "../persistence/logStore.js"
import { createExternalEditorAdapter } from "../integrations/editor/externalEditorAdapter.js"
import { exportHandoff } from "../persistence/logStore.js"
import { openPathInExplorer } from "../utils/explorer.js"

const writerActions: MeatHarnessController["writerActions"] = [
    {
        id: "file-write",
        label: "Write files from clipboard JSON",
        description: "parse JSON payload, preview unified diff, write directly",
    },
    {
        id: "command",
        label: "Run AI command from clipboard",
        description: "extract runnable PowerShell commands and stream output",
    },
]

const emptyWritePlan: WritePlan = {
    mode: "idle",
    title: "Clipboard ready",
    body: "",
    warnings: [],
}

const emptyWriteOutcome: WriteOutcome = {
    status: "idle",
    title: "No write attempted",
    detail: "Load a clipboard payload, preview it, then confirm when ready.",
    filesChanged: 0,
}

const outputLogTailLimit = 6000
const commandBootstrapOutput = "command accepted\nstarting process...\n"
const commandNoStdoutOutput = "command completed with no stdout\n"

export function useMeatHarnessController(
    initialRepo: RepoInfo,
): MeatHarnessController {
    const app = useApp()
    const [repo, setRepo] = useState(initialRepo)
    const [screen, setScreen] = useState<Screen>("launcher")
    const [message, setMessage] = useState("Choose a repo.")
    const [result, setResult] = useState<CommandResult>()
    const [liveOutput, setLiveOutput] = useState<LiveCommandOutput>()
    const [activeAbortController, setActiveAbortController] =
        useState<AbortController>()
    const [sessions, setSessions] = useState<RunSession[]>([])
    const [activeSession, setActiveSession] = useState<RunSession>()
    const [pending, setPending] = useState<Pending>()
    const [launcherRoot, setLauncherRoot] = useState(
        path.parse(initialRepo.targetRoot).root,
    )
    const [launcherSelectedIndex, setLauncherSelectedIndex] = useState(0)
    const [launcherRefreshToken, setLauncherRefreshToken] = useState(0)
    const [writerSelectedIndex, setWriterSelectedIndex] = useState(0)
    const [writePlan, setWritePlan] = useState<WritePlan>(emptyWritePlan)
    const [writeOutcome, setWriteOutcome] =
        useState<WriteOutcome>(emptyWriteOutcome)
    const [opsSelectedIndex, setOpsSelectedIndex] = useState(0)
    const [inputLabel] = useState("")
    const [inputValue, setInputValue] = useState("")
    const [inputSubmit] = useState<(value: string) => void>(
        () => () => undefined,
    )
    const [isRunning, setIsRunning] = useState(false)
    const [gitSummary, setGitSummary] = useState<GitSummary>(() =>
        getGitSummary(initialRepo.targetRoot),
    )
    const [diffSelectedIndex, setDiffSelectedIndex] = useState(0)
    const [selectedDiffText, setSelectedDiffText] = useState("")
    const [editorFiles, setEditorFiles] = useState<string[]>(() =>
        listTextFiles(initialRepo.targetRoot, 200),
    )
    const [editorSelectedIndex, setEditorSelectedIndex] = useState(0)
    const [editorPreview, setEditorPreview] = useState("")
    const [settings, setSettings] = useState<RateLtdSettings>(
        () => readSettingsWithSource(initialRepo.harnessRoot).settings,
    )
    const [settingsPath, setSettingsPath] = useState(
        () => readSettingsWithSource(initialRepo.harnessRoot).sourcePath,
    )
    const [diagnostics, setDiagnostics] = useState<DiagnosticCheck[]>(() =>
        runDiagnostics(initialRepo.harnessRoot, initialRepo.targetRoot),
    )
    const [logEvents, setLogEvents] = useState<StoredLogEvent[]>(() =>
        readLogEvents(initialRepo.targetRoot),
    )
    const editorFileRows = useMemo(
        () =>
            editorFiles.map((file) => {
                const metadata = getFileMetadata(repo.targetRoot, file)
                return {
                    path: file,
                    type:
                        path.extname(file).replace(/^\./, "").toUpperCase() ||
                        "FILE",
                    sizeBytes: metadata.sizeBytes,
                    modifiedAt: metadata.modifiedAt ?? "unknown",
                    guard:
                        metadata.isBinary ? "binary"
                        : metadata.isLarge ? "large"
                        : "safe preview",
                }
            }),
        [editorFiles, repo.targetRoot],
    )

    const selectedWriterAction =
        writerActions[writerSelectedIndex]?.id ?? "file-write"

    const launcherEntries = useMemo(
        () => buildRepoTreeEntries(launcherRoot, repo.targetRoot),
        [launcherRoot, repo.targetRoot, launcherRefreshToken],
    )

    const launcherStats = useMemo(
        () => collectLauncherStats(repo.targetRoot),
        [repo.targetRoot, launcherRefreshToken],
    )

    const opsItems = useMemo(
        () => buildOpsDeckItems(repo, settings),
        [repo, settings],
    )

    useEffect(() => {
        refreshGit()
        refreshEditorFiles()
        refreshDiagnostics()
        refreshLogs()
    }, [repo.targetRoot])

    useEffect(() => {
        const selected = gitSummary.changedFiles[diffSelectedIndex]
        if (!selected) {
            setSelectedDiffText("(no changed file selected)")
            return
        }
        setSelectedDiffText(getFileDiff(repo.targetRoot, selected.path))
    }, [diffSelectedIndex, gitSummary, repo.targetRoot])

    useEffect(() => {
        const selected = editorFiles[editorSelectedIndex]
        if (!selected) {
            setEditorPreview("(no file selected)")
            return
        }
        try {
            setEditorPreview(readTextFile(repo.targetRoot, selected))
        } catch (error) {
            setEditorPreview(
                error instanceof Error ? error.message : String(error),
            )
        }
    }, [editorFiles, editorSelectedIndex, repo.targetRoot])

    useEffect(() => {
        appendAgentLog({
            repoRoot: initialRepo.targetRoot,
            event: "tui_started",
            screen: "launcher",
            message: "RateLtd TUI started.",
            data: {
                harnessRoot: initialRepo.harnessRoot,
                targetRoot: initialRepo.targetRoot,
                branch: initialRepo.branch,
                dirty: initialRepo.dirty,
                packageName: initialRepo.targetPackageName,
            },
        })
    }, [initialRepo])

    useEffect(() => {
        const activeIndex = launcherEntries.findIndex((entry) => entry.isActive)

        if (activeIndex >= 0) {
            setLauncherSelectedIndex(activeIndex)
        }
    }, [launcherRoot, launcherEntries])

    useEffect(() => {
        if (launcherSelectedIndex >= launcherEntries.length) {
            setLauncherSelectedIndex(Math.max(launcherEntries.length - 1, 0))
        }
    }, [launcherEntries.length, launcherSelectedIndex])

    useInput((input, key) => {
        const routed = routeInput(input, key, {
            screen,
            inputMode:
                screen === "input" ?
                    { kind: "text-entry", label: inputLabel }
                :   normalInputMode,
            hasConfirmDialog: screen === "confirm" && pending !== undefined,
            selectedCommandRequiresConfirmation:
                screen === "ops" ?
                    opsItems[opsSelectedIndex]?.requiresConfirmation
                :   false,
        })

        if (routed.kind === "ignored" || routed.kind === "text-entry.input")
            return

        if (routed.kind === "text-entry.cancel") {
            setScreen("launcher")
            return
        }

        if (routed.kind === "modal.confirm" || routed.kind === "modal.cancel")
            return
        if (
            routed.kind === "modal.toggle-choice" ||
            routed.kind === "modal.choose"
        )
            return

        if (routed.kind === "global") {
            handleGlobalInputAction(routed.action)
            return
        }

        handleScreenInputAction(routed.action)
    })

    function handleGlobalInputAction(action: GlobalAction) {
        if (action === "help.open") {
            setScreen("agent-help")
            setMessage("RateLtd instructions opened.")
            return
        }

        if (action === "help.close") {
            setScreen("launcher")
            setMessage("RateLtd instructions closed.")
            return
        }

        if (action === "help.copy") {
            void copyAgentHelpInstructions()
            return
        }

        if (action === "quit") {
            appendAgentLog({
                repoRoot: repo.targetRoot,
                event: "tui_exit_requested",
                screen,
                message: "User requested TUI exit.",
            })
            app.exit()
            return
        }

        if (action === "navigate.launcher") setScreen("launcher")
        else if (action === "navigate.rate") setScreen("rate")
        else if (action === "navigate.editor") setScreen("editor")
        else if (action === "navigate.write") setScreen("write")
        else if (action === "navigate.ops") setScreen("ops")
        else if (action === "navigate.differ") setScreen("differ")
        else if (action === "navigate.output") setScreen("output")
        else if (action === "navigate.prefer") setScreen("prefer")
        else if (action === "palette.open") {
            setScreen("ops")
            setMessage("CommanderLtd command catalog opened.")
        }
    }

    function handleScreenInputAction(action: ScreenAction) {
        if (action === "launcher.up") moveLauncherSelection(-1)
        else if (action === "launcher.down") moveLauncherSelection(1)
        else if (action === "launcher.open") setSelectedRepoAsTarget()
        else if (action === "launcher.collapse") collapseLauncherSelection()
        else if (action === "launcher.refresh") refreshLauncherTree()
        else if (action === "launcher.open-explorer")
            openSelectedPathInExplorer()
        else if (action === "write.up") moveWriterSelection(-1)
        else if (action === "write.down") moveWriterSelection(1)
        else if (action === "write.plan-or-confirm") {
            if (writePlan.mode === "planned") void openWriteConfirmation()
            else void planSelectedClipboardAction()
        } else if (action === "write.clear") clearWritePlan()
        else if (action === "ops.up") moveOpsSelection(-1)
        else if (action === "ops.down") moveOpsSelection(1)
        else if (action === "ops.run") void runSelectedOp()
        else if (action === "ops.confirm-required") openOpsConfirmation()
        else if (action === "ops.copy-command") void copySelectedOpCommand()
        else if (action === "command.cancel") cancelRunningCommand()
        else if (action === "editor.up") moveEditorSelection(-1)
        else if (action === "editor.down") moveEditorSelection(1)
        else if (action === "editor.open-external")
            void openSelectedExternalEditor()
        else if (action === "editor.refresh") refreshEditorFiles()
        else if (action === "differ.up") moveDiffSelection(-1)
        else if (action === "differ.down") moveDiffSelection(1)
        else if (action === "differ.stage") void stageSelectedDiffFile()
        else if (action === "differ.unstage") void unstageSelectedDiffFile()
        else if (action === "differ.revert") revertSelectedDiffFile()
        else if (action === "differ.export-patch") void exportPatch()
        else if (action === "prefer.save") saveSettings(settings)
        else if (action === "prefer.toggle-theme")
            saveSettings({
                ...settings,
                theme:
                    settings.theme === "matrix" ? "vercel"
                    : settings.theme === "vercel" ? "fallbackAscii"
                    : "matrix",
            })
        else if (action === "diagnostics.refresh") refreshDiagnostics()
        else if (action === "diagnostics.copy") void copyDiagnostics()
        else if (action === "handoff.copy") void copyHandoffPacket()
        else if (action === "output.copy") void copyFullOutput()
        else if (action === "output.save") saveOutput()
    }

    function moveLauncherSelection(delta: number) {
        setLauncherSelectedIndex((index) =>
            clamp(index + delta, 0, Math.max(launcherEntries.length - 1, 0)),
        )
    }

    function setSelectedRepoAsTarget() {
        const selected = launcherEntries[launcherSelectedIndex]

        if (!selected) {
            setMessage("No repo selected.")
            return
        }

        if (selected.kind === "file" || selected.kind === "parent") {
            setMessage(
                "Enter selects folders or Git repositories. Use Left on parent rows.",
            )
            return
        }

        chooseTargetRepo(selected.path)
    }

    function collapseLauncherSelection() {
        const selected = launcherEntries[launcherSelectedIndex]

        if (!selected) {
            setMessage("No repo tree entry selected.")
            return
        }

        if (selected.kind === "root") {
            setMessage("Already at root.")
            return
        }

        const parent = path.dirname(selected.path)
        setLauncherRoot(parent)
        setLauncherSelectedIndex(0)
        setMessage(`Collapsed to ${parent}`)
        appendAgentLog({
            repoRoot: repo.targetRoot,
            event: "launcher_collapsed",
            screen: "launcher",
            message: `Collapsed to ${parent}`,
            data: { previousPath: selected.path, parent },
        })
    }

    function refreshLauncherTree() {
        setLauncherRefreshToken((value) => value + 1)
        refreshRepoMetadata()
        refreshGit()
        refreshDiagnostics()
        setMessage("Target browser refreshed.")
    }

    function openSelectedPathInExplorer() {
        const selected = launcherEntries[launcherSelectedIndex]
        openPathInExplorer(selected?.path ?? repo.targetRoot)
        setMessage("Opened selected path in Explorer.")
    }

    function chooseTargetRepo(targetRoot: string) {
        try {
            const next = loadRepoInfo({
                harnessRoot: repo.harnessRoot,
                targetRoot,
            })
            setRepo(next)
            setLauncherRoot(path.parse(next.targetRoot).root)
            setResult(undefined)
            setActiveSession(undefined)
            setMessage(`Target repo set: ${next.targetRoot}`)
            setScreen("launcher")
            appendAgentLog({
                repoRoot: next.targetRoot,
                event: "target_repo_selected",
                screen: "launcher",
                message: `Target repo set: ${next.targetRoot}`,
                data: {
                    previousTargetRoot: repo.targetRoot,
                    nextTargetRoot: next.targetRoot,
                    branch: next.branch,
                    dirty: next.dirty,
                    packageName: next.targetPackageName,
                },
            })
        } catch (error) {
            const detail =
                error instanceof Error ? error.message : String(error)
            setMessage(detail)
            setScreen("launcher")
            appendAgentLog({
                repoRoot: repo.targetRoot,
                event: "target_repo_select_failed",
                level: "error",
                screen: "launcher",
                message: detail,
                data: { targetRoot },
            })
        }
    }

    function moveWriterSelection(delta: number) {
        setWriterSelectedIndex((index) =>
            clamp(index + delta, 0, writerActions.length - 1),
        )
        setWritePlan(emptyWritePlan)
        setWriteOutcome(emptyWriteOutcome)
    }

    async function planSelectedClipboardAction() {
        if (selectedWriterAction === "file-write") {
            await planClipboardFileWrite()
            return
        }
        await planClipboardAiCommand()
    }

    async function planClipboardFileWrite() {
        const pasted = await readClipboard()

        try {
            const plan = planFileWrites(repo.targetRoot, pasted)
            setWritePlan({
                mode: "planned",
                kind: "file-write",
                title: `File write payload: ${plan.paths.length} file(s)`,
                body: plan.diff,
                payload: plan.payload,
                warnings: [],
            })
            setWriteOutcome({
                status: "planned",
                title: `Ready to write ${plan.paths.length} file(s)`,
                detail: "Review the unified diff, then press Enter to confirm. No backups will be written.",
                filesChanged: plan.paths.length,
            })
            setMessage("File payload ready. Press Enter to confirm.")
        } catch (error) {
            const detail =
                error instanceof Error ? error.message : String(error)
            setWritePlan({
                mode: "error",
                kind: "file-write",
                title: "Invalid file-write JSON",
                body: detail,
                warnings: [],
            })
            setWriteOutcome({
                status: "failed",
                title: "Clipboard payload failed validation",
                detail,
                filesChanged: 0,
                timestamp: new Date().toLocaleTimeString(),
            })
            setMessage("Clipboard is not valid file-write JSON.")
            appendAgentLog({
                repoRoot: repo.targetRoot,
                event: "file_write_plan_failed",
                level: "error",
                screen: "write",
                message: detail,
            })
        }
    }

    async function planClipboardAiCommand() {
        const pasted = await readClipboard()
        const extracted = extractPowerShellCommands(pasted)

        if (extracted.commands.length === 0) {
            setWritePlan({
                mode: "error",
                kind: "command",
                title: "No runnable command found",
                body: "Clipboard did not contain runnable PowerShell, pnpm, git, rg, node, npm, npx, tsx, mkdir, cd, or code commands.",
                warnings: extracted.warnings,
            })
            setWriteOutcome({
                status: "failed",
                title: "No runnable command found",
                detail: "Clipboard did not contain a supported shell command.",
                filesChanged: 0,
                timestamp: new Date().toLocaleTimeString(),
            })
            setMessage("Clipboard did not contain a runnable command.")
            appendAgentLog({
                repoRoot: repo.targetRoot,
                event: "command_plan_failed",
                level: "error",
                screen: "write",
                message: "Clipboard did not contain a supported shell command.",
                data: { warnings: extracted.warnings },
            })
            return
        }

        const body = formatCommandRecipePreview(extracted.commands)

        setWritePlan({
            mode: "planned",
            kind: "command",
            title:
                extracted.commands.length === 1 ?
                    "AI command block"
                :   `AI command recipe: ${extracted.commands.length} steps`,
            body,
            command: JSON.stringify(extracted.commands),
            warnings: extracted.warnings,
        })
        setWriteOutcome({
            status: "planned",
            title:
                extracted.commands.length === 1 ?
                    "Command ready"
                :   `Command recipe ready: ${extracted.commands.length} steps`,
            detail: extracted.commands.join(" â†’ "),
            filesChanged: 0,
        })
        setMessage("Command block ready. Press Enter to confirm.")
        appendAgentLog({
            repoRoot: repo.targetRoot,
            event: "command_planned",
            screen: "write",
            message: "Command block planned from clipboard.",
            data: {
                commands: extracted.commands,
                warnings: extracted.warnings,
            },
        })
    }

    async function openWriteConfirmation() {
        if (writePlan.mode !== "planned") return
        setPending({
            title:
                writePlan.kind === "file-write" ?
                    "WRITE FILES FROM CLIPBOARD"
                :   "RUN AI COMMAND FROM CLIPBOARD",
            body: writePlan.body,
            cancelScreen: "write",
            run: async () => confirmWriteOrCommand(),
        })
        setScreen("confirm")
    }

    async function confirmWriteOrCommand() {
        if (writePlan.kind === "file-write" && writePlan.payload) {
            try {
                const applied = applyWrites(repo.targetRoot, writePlan.payload)
                setWritePlan(emptyWritePlan)
                setPending(undefined)
                setWriteOutcome({
                    status: "complete",
                    title: `Write complete: ${applied.changed.length} changed / ${applied.files.length} total`,
                    detail: `created ${applied.created}, updated ${applied.updated}, unchanged ${applied.unchanged}, bytes ${applied.bytesWritten}`,
                    filesChanged: applied.changed.length,
                    timestamp: new Date().toLocaleTimeString(),
                })
                setMessage(
                    `Wrote ${applied.changed.length} changed file(s). Logged to ${path.basename(applied.logPath)}.`,
                )
                refreshRepoMetadata()
                setScreen("write")
            } catch (error) {
                const detail =
                    error instanceof Error ? error.message : String(error)
                setPending(undefined)
                setWriteOutcome({
                    status: "failed",
                    title: "Write failed",
                    detail,
                    filesChanged: 0,
                    timestamp: new Date().toLocaleTimeString(),
                })
                setMessage("File write failed.")
                appendAgentLog({
                    repoRoot: repo.targetRoot,
                    event: "file_write_failed",
                    level: "error",
                    screen: "write",
                    message: detail,
                })
                setScreen("write")
            }
            return
        }

        if (writePlan.kind === "command" && writePlan.command) {
            const commands = parsePlannedCommands(writePlan.command)
            setWritePlan(emptyWritePlan)
            setPending(undefined)
            await executeCommandRecipe(commands)
        }
    }

    function clearWritePlan() {
        setWritePlan(emptyWritePlan)
        setWriteOutcome(emptyWriteOutcome)
        setPending(undefined)
        setMessage("Write plan cleared.")
        appendAgentLog({
            repoRoot: repo.targetRoot,
            event: "write_plan_cleared",
            screen: "write",
            message: "Write plan cleared.",
        })
    }

    function moveOpsSelection(delta: number) {
        setOpsSelectedIndex((index) =>
            clamp(index + delta, 0, Math.max(opsItems.length - 1, 0)),
        )
    }

    async function runSelectedOp() {
        const selected = opsItems[opsSelectedIndex]
        if (!selected) return
        if (!selected.available) {
            setMessage(
                selected.unavailableReason ??
                    "Selected macro is unavailable for this target.",
            )
            appendAgentLog({
                repoRoot: repo.targetRoot,
                event: "command_unavailable",
                level: "warn",
                screen: "ops",
                message:
                    selected.unavailableReason ?? "Selected macro unavailable.",
                data: {
                    id: selected.id,
                    command: selected.command,
                    group: selected.group,
                },
            })
            return
        }
        await executeCommand(selected.command)
    }

    function openOpsConfirmation() {
        const selected = opsItems[opsSelectedIndex]
        if (!selected) return
        if (!selected.available) {
            setMessage(
                selected.unavailableReason ??
                    "Selected macro is unavailable for this target.",
            )
            return
        }

        setPending({
            title: `RUN ${selected.label.toUpperCase()}`,
            body: `${selected.command}\n\nThis command is marked as requiring confirmation.`,
            cancelScreen: "ops",
            run: async () => {
                setPending(undefined)
                await executeCommand(selected.command)
            },
        })
        setScreen("confirm")
    }

    async function copySelectedOpCommand() {
        const selected = opsItems[opsSelectedIndex]
        if (!selected) {
            setMessage("No macro selected.")
            return
        }
        await copyToClipboard(selected.command)
        setMessage(`Copied command: ${selected.label}`)
        appendAgentLog({
            repoRoot: repo.targetRoot,
            event: "command_copied",
            screen: "ops",
            message: `Copied command: ${selected.label}`,
            data: {
                id: selected.id,
                command: selected.command,
                group: selected.group,
            },
        })
    }

    async function executeCommand(command: string) {
        appendAgentLog({
            repoRoot: repo.targetRoot,
            event: "command_requested",
            screen,
            message: `Command requested: ${command}`,
            data: { command },
        })

        await runAndShow(command)
    }

    async function executeCommandRecipe(commands: string[]) {
        if (commands.length === 0) {
            setMessage("No commands to run.")
            return
        }

        appendAgentLog({
            repoRoot: repo.targetRoot,
            event: "command_recipe_requested",
            screen,
            message: `Command recipe requested: ${commands.length} step(s)`,
            data: { commands },
        })

        await runRecipeAndShow(commands)
    }

    async function runAndShow(command: string) {
        await runRecipeAndShow([command])
    }

    async function runRecipeAndShow(commands: string[]) {
        const startedAt = new Date().toISOString()
        const abortController = new AbortController()
        const sessionName =
            commands.length === 1 ?
                commands[0]
            :   `recipe: ${commands.length} steps`
        let session = createRunSession(sessionName, repo.targetRoot)
        let latestResult: CommandResult | undefined

        setPending(undefined)
        setMessage(
            commands.length === 1 ?
                `Running: ${commands[0]}`
            :   `Running recipe: ${commands.length} steps`,
        )
        setResult(undefined)
        setActiveSession(session)
        setLiveOutput({
            command: sessionName,
            cwd: repo.targetRoot,
            stdout: commandBootstrapOutput,
            stderr: "",
            startedAt,
        })
        setActiveAbortController(abortController)
        setIsRunning(true)
        setScreen("output")

        appendAgentLog({
            repoRoot: repo.targetRoot,
            event: "command_started",
            screen: "output",
            message:
                commands.length === 1 ?
                    `Running: ${commands[0]}`
                :   `Running recipe: ${commands.length} steps`,
            data: { commands, cwd: repo.targetRoot, startedAt },
        })

        await yieldToInk()

        try {
            for (const [index, command] of commands.entries()) {
                if (abortController.signal.aborted) break

                setMessage(
                    `Running step ${index + 1}/${commands.length}: ${command}`,
                )
                setLiveOutput((current) => ({
                    command: current?.command ?? sessionName,
                    cwd: current?.cwd ?? repo.targetRoot,
                    stdout: appendLiveSection(
                        stripBootstrapOutput(current?.stdout ?? ""),
                        `step ${index + 1}/${commands.length}: ${command}`,
                    ),
                    stderr: current?.stderr ?? "",
                    startedAt,
                    finishedAt: current?.finishedAt,
                    exitCode: current?.exitCode,
                    cancelled: current?.cancelled,
                }))

                const next = await streamCommandLine(command, repo.targetRoot, {
                    signal: abortController.signal,
                    onStdout: (chunk) =>
                        setLiveOutput((current) =>
                            current ?
                                {
                                    ...current,
                                    stdout:
                                        stripBootstrapOutput(current.stdout) +
                                        chunk,
                                }
                            :   current,
                        ),
                    onStderr: (chunk) =>
                        setLiveOutput((current) =>
                            current ?
                                { ...current, stderr: current.stderr + chunk }
                            :   current,
                        ),
                })

                latestResult = next
                session = { ...session, steps: [...session.steps, next] }
                setResult(next)
                setActiveSession(session)

                if (next.exitCode !== 0) {
                    break
                }
            }

            session = finishRunSession(
                session,
                abortController.signal.aborted ? "cancelled" : undefined,
            )
            setActiveSession(session)
            setSessions((current) => [session, ...current].slice(0, 50))
            setLiveOutput({
                command: session.name,
                cwd: session.targetRoot,
                stdout:
                    session.steps.length > 0 ?
                        session.steps
                            .map((step, index) =>
                                formatLiveStepOutput(
                                    index,
                                    session.steps.length,
                                    step,
                                ),
                            )
                            .join("\n\n")
                    :   commandNoStdoutOutput,
                stderr: session.steps
                    .map((step) => step.stderr)
                    .filter(Boolean)
                    .join("\n"),
                startedAt,
                finishedAt: new Date().toISOString(),
                exitCode: latestResult?.exitCode ?? null,
                cancelled: abortController.signal.aborted,
            })
            setMessage(`Finished ${session.status}.`)
            setLauncherRefreshToken((value) => value + 1)
            appendAgentLog({
                repoRoot: repo.targetRoot,
                event: "command_finished",
                level: session.status === "passed" ? "info" : "error",
                screen: "output",
                message: `Command session finished ${session.status}: ${session.name}`,
                data: {
                    commands,
                    cwd: repo.targetRoot,
                    status: session.status,
                    stepCount: session.steps.length,
                    exitCode: latestResult?.exitCode ?? null,
                    durationMs: session.steps.reduce(
                        (total, step) => total + step.durationMs,
                        0,
                    ),
                    stdoutTail: tail(
                        session.steps.map((step) => step.stdout).join("\n"),
                        outputLogTailLimit,
                    ),
                    stderrTail: tail(
                        session.steps.map((step) => step.stderr).join("\n"),
                        outputLogTailLimit,
                    ),
                    sessionName: session.name,
                    sessionStatus: session.status,
                },
            })
        } finally {
            refreshRepoMetadata()
            setActiveAbortController(undefined)
            setIsRunning(false)
        }
    }

    async function copyFullOutput() {
        if (activeSession) {
            await copyToClipboard(formatRunSession(activeSession))
            setMessage("Copied full run output.")
            appendAgentLog({
                repoRoot: repo.targetRoot,
                event: "output_copied",
                screen: "output",
                message: "Copied full run output.",
            })
            return
        }

        if (result) {
            await copyToClipboard(formatCommandResult(result))
            setMessage("Copied latest command output.")
            appendAgentLog({
                repoRoot: repo.targetRoot,
                event: "output_copied",
                screen: "output",
                message: "Copied latest command output.",
            })
            return
        }

        setMessage("No output to copy.")
    }

    function saveOutput() {
        if (activeSession) {
            const saved = saveRunSession(repo.targetRoot, activeSession)
            setMessage(`Saved run output: ${saved}`)
            return
        }

        if (result) {
            const saved = saveCommandResult(repo.targetRoot, result)
            setMessage(`Saved command output: ${saved}`)
            return
        }

        setMessage("No output to save.")
    }

    async function copyAgentHelpInstructions() {
        await copyToClipboard(agentHelpInstructions)
        setMessage("Copied ChatGPT TUI instructions.")
        appendAgentLog({
            repoRoot: repo.targetRoot,
            event: "agent_help_copied",
            screen: "agent-help",
            message: "Copied ChatGPT TUI instructions.",
        })
    }

    function cancelRunningCommand() {
        if (!activeAbortController) {
            setMessage("No running command to cancel.")
            return
        }

        activeAbortController.abort()
        setMessage("Cancelling command.")
        appendAgentLog({
            repoRoot: repo.targetRoot,
            event: "command_cancel_requested",
            level: "warn",
            screen: "output",
            message: "Cancelling command.",
        })
    }

    function refreshGit() {
        const next = getGitSummary(repo.targetRoot)
        setGitSummary(next)
        setDiffSelectedIndex((index) =>
            clamp(index, 0, Math.max(next.changedFiles.length - 1, 0)),
        )
    }

    function moveDiffSelection(delta: number) {
        setDiffSelectedIndex((index) =>
            clamp(
                index + delta,
                0,
                Math.max(gitSummary.changedFiles.length - 1, 0),
            ),
        )
    }

    async function stageSelectedDiffFile() {
        const selected = gitSummary.changedFiles[diffSelectedIndex]
        if (!selected) {
            setMessage("No changed file selected.")
            return
        }
        stageFile(repo.targetRoot, selected.path)
        appendAgentLog({
            repoRoot: repo.targetRoot,
            event: "git.operation",
            screen: "differ",
            message: `Staged ${selected.path}`,
            data: { operation: "stage", path: selected.path },
        })
        refreshGit()
        setMessage(`Staged ${selected.path}`)
    }

    async function unstageSelectedDiffFile() {
        const selected = gitSummary.changedFiles[diffSelectedIndex]
        if (!selected) {
            setMessage("No changed file selected.")
            return
        }
        unstageFile(repo.targetRoot, selected.path)
        appendAgentLog({
            repoRoot: repo.targetRoot,
            event: "git.operation",
            screen: "differ",
            message: `Unstaged ${selected.path}`,
            data: { operation: "unstage", path: selected.path },
        })
        refreshGit()
        setMessage(`Unstaged ${selected.path}`)
    }

    function revertSelectedDiffFile() {
        const selected = gitSummary.changedFiles[diffSelectedIndex]
        if (!selected) {
            setMessage("No changed file selected.")
            return
        }
        setPending({
            title: `REVERT ${selected.path}`,
            body: "This discards unstaged working tree changes for the selected file.",
            cancelScreen: "differ",
            run: async () => {
                revertFile(repo.targetRoot, selected.path)
                appendAgentLog({
                    repoRoot: repo.targetRoot,
                    event: "git.operation",
                    level: "warn",
                    screen: "differ",
                    message: `Reverted ${selected.path}`,
                    data: { operation: "revert", path: selected.path },
                })
                setPending(undefined)
                setScreen("differ")
                refreshGit()
            },
        })
        setScreen("confirm")
    }

    async function exportPatch() {
        const patch = exportGitPatch(repo.targetRoot)
        await copyToClipboard(patch)
        appendAgentLog({
            repoRoot: repo.targetRoot,
            event: "git.operation",
            screen: "differ",
            message: "Copied patch to clipboard.",
            data: { operation: "export-patch", bytes: patch.length },
        })
        setMessage("Copied patch to clipboard.")
    }

    function refreshEditorFiles() {
        const files = listTextFiles(repo.targetRoot, 250)
        setEditorFiles(files)
        setEditorSelectedIndex((index) =>
            clamp(index, 0, Math.max(files.length - 1, 0)),
        )
    }

    function moveEditorSelection(delta: number) {
        setEditorSelectedIndex((index) =>
            clamp(index + delta, 0, Math.max(editorFiles.length - 1, 0)),
        )
    }

    async function openSelectedExternalEditor() {
        const selected = editorFiles[editorSelectedIndex]
        if (!selected) {
            setMessage("No file selected.")
            return
        }
        const adapter = createExternalEditorAdapter(
            repo.targetRoot,
            settings.editor.externalCommand,
        )
        await adapter.open(path.join(repo.targetRoot, selected))
        appendAgentLog({
            repoRoot: repo.targetRoot,
            event: "file.write",
            screen: "editor",
            message: `Opened external editor for ${selected}`,
            data: { path: selected, adapter: adapter.id },
        })
        setMessage(`Opened external editor for ${selected}`)
    }

    function saveSettings(next: RateLtdSettings) {
        const savedPath = writeSettings(repo.harnessRoot, next)
        setSettings(next)
        setSettingsPath(savedPath)
        appendAgentLog({
            repoRoot: repo.targetRoot,
            event: "settings.saved",
            screen: "prefer",
            message: `Saved settings to ${savedPath}`,
            data: { path: savedPath },
        })
        setMessage(`Saved settings to ${savedPath}`)
    }

    function refreshDiagnostics() {
        setDiagnostics(runDiagnostics(repo.harnessRoot, repo.targetRoot))
    }

    async function copyDiagnostics() {
        await copyToClipboard(
            copyDiagnosticsPayload(repo.harnessRoot, repo.targetRoot),
        )
        setMessage("Copied diagnostics.")
    }

    async function copyHandoffPacket() {
        await copyToClipboard(exportHandoff(repo.targetRoot))
        appendAgentLog({
            repoRoot: repo.targetRoot,
            event: "handoff_copied",
            screen,
            message: "Copied sanitized RateLtd handoff packet.",
        })
        setMessage("Copied sanitized handoff packet.")
    }

    function refreshLogs() {
        setLogEvents(readLogEvents(repo.targetRoot))
    }

    function refreshRepoMetadata() {
        try {
            setRepo(
                loadRepoInfo({
                    harnessRoot: repo.harnessRoot,
                    targetRoot: repo.targetRoot,
                }),
            )
        } catch {
            // Keep current repo state.
        }
    }

    return {
        repo,
        screen,
        setScreen,
        message,
        setMessage,
        isRunning,
        result,
        liveOutput,
        sessions,
        activeSession,
        logEvents,
        refreshLogs,
        pending,
        launcherRoot,
        launcherEntries,
        launcherStats,
        launcherSelectedIndex,
        moveLauncherSelection,
        openLauncherSelection: setSelectedRepoAsTarget,
        moveLauncherToParent: collapseLauncherSelection,
        refreshLauncherTree,
        collapseLauncherSelection,
        cycleLauncherRoot: () => undefined,
        chooseTargetRepo,
        openSelectedPathInExplorer,
        writerActions,
        writerSelectedIndex,
        selectedWriterAction,
        moveWriterSelection,
        planSelectedClipboardAction,
        writePlan,
        writeOutcome,
        planClipboardFileWrite,
        planClipboardAiCommand,
        confirmWriteOrCommand,
        clearWritePlan,
        opsItems,
        opsSelectedIndex,
        moveOpsSelection,
        runSelectedOp,
        gitSummary,
        diffSelectedIndex,
        moveDiffSelection,
        selectedDiffText,
        refreshGit,
        stageSelectedDiffFile,
        unstageSelectedDiffFile,
        revertSelectedDiffFile,
        exportPatch,
        editorFiles,
        editorSelectedIndex,
        editorPreview,
        editorFileRows,
        moveEditorSelection,
        refreshEditorFiles,
        openSelectedExternalEditor,
        settings,
        settingsPath,
        saveSettings,
        diagnostics,
        refreshDiagnostics,
        copyDiagnostics,
        handoffPacket: exportHandoff(repo.targetRoot),
        copyHandoffPacket,
        copyFullOutput,
        saveOutput,
        copyAgentHelpInstructions,
        cancelRunningCommand,
        inputLabel,
        inputValue,
        setInputValue,
        inputSubmit,
        appExit: app.exit,
    }
}

function parsePlannedCommands(serialized: string): string[] {
    try {
        const parsed = JSON.parse(serialized) as unknown
        if (
            Array.isArray(parsed) &&
            parsed.every((value) => typeof value === "string")
        ) {
            return parsed
        }
    } catch {
        // Fall through to legacy single-command support.
    }

    return [serialized]
}

function formatCommandRecipePreview(commands: string[]): string {
    if (commands.length === 1) return commands[0] ?? ""

    return commands
        .map(
            (command, index) =>
                `${String(index + 1).padStart(2, "0")}. ${command}`,
        )
        .join("\n")
}

function formatLiveStepOutput(
    index: number,
    total: number,
    step: CommandResult,
): string {
    return [
        `--- step ${index + 1}/${total}: exit ${step.exitCode} ---`,
        `command: ${step.command}`,
        `durationMs: ${step.durationMs}`,
        step.stdout.trimEnd(),
        step.stderr.trimEnd() ? `stderr:\n${step.stderr.trimEnd()}` : undefined,
    ]
        .filter(Boolean)
        .join("\n")
}

function appendLiveSection(existing: string, heading: string): string {
    const prefix = existing.trimEnd()
    const section = `\n--- ${heading} ---\n`

    if (prefix.length === 0) return section
    return `${prefix}${section}`
}

function stripBootstrapOutput(value: string): string {
    return value === commandBootstrapOutput ? "" : value
}

function yieldToInk(): Promise<void> {
    return new Promise((resolve) => setTimeout(resolve, 25))
}

function tail(value: string, maxLength: number): string {
    if (value.length <= maxLength) return value
    return `â€¦[TRUNCATED ${value.length - maxLength} chars]\n${value.slice(-maxLength)}`
}

function clamp(value: number, min: number, max: number): number {
    return Math.min(Math.max(value, min), max)
}
```

### RateLtd/src/styles/globals.css

```css
@import "tailwindcss";
@import "tw-animate-css";
@import "shadcn/tailwind.css";

@custom-variant dark (&:is(.dark *));

@theme inline {
    --color-background: var(--background);
    --color-foreground: var(--foreground);
    --color-card: var(--card);
    --color-card-foreground: var(--card-foreground);
    --color-popover: var(--popover);
    --color-popover-foreground: var(--popover-foreground);
    --color-primary: var(--primary);
    --color-primary-foreground: var(--primary-foreground);
    --color-secondary: var(--secondary);
    --color-secondary-foreground: var(--secondary-foreground);
    --color-muted: var(--muted);
    --color-muted-foreground: var(--muted-foreground);
    --color-accent: var(--accent);
    --color-accent-foreground: var(--accent-foreground);
    --color-destructive: var(--destructive);
    --color-destructive-foreground: var(--destructive-foreground);
    --color-border: var(--border);
    --color-input: var(--input);
    --color-ring: var(--ring);
    --color-chart-1: var(--chart-1);
    --color-chart-2: var(--chart-2);
    --color-chart-3: var(--chart-3);
    --color-chart-4: var(--chart-4);
    --color-chart-5: var(--chart-5);
    --radius-sm: calc(var(--radius) * 0.6);
    --radius-md: calc(var(--radius) * 0.8);
    --radius-lg: var(--radius);
    --radius-xl: calc(var(--radius) * 1.4);
    --radius-2xl: calc(var(--radius) * 1.8);
    --radius-3xl: calc(var(--radius) * 2.2);
    --radius-4xl: calc(var(--radius) * 2.6);
    --color-sidebar: var(--sidebar);
    --color-sidebar-foreground: var(--sidebar-foreground);
    --color-sidebar-primary: var(--sidebar-primary);
    --color-sidebar-primary-foreground: var(--sidebar-primary-foreground);
    --color-sidebar-accent: var(--sidebar-accent);
    --color-sidebar-accent-foreground: var(--sidebar-accent-foreground);
    --color-sidebar-border: var(--sidebar-border);
    --color-sidebar-ring: var(--sidebar-ring);
}

:root {
    --radius: 0.625rem;
    --background: oklch(1 0 0);
    --foreground: oklch(0.145 0 0);
    --card: oklch(1 0 0);
    --card-foreground: oklch(0.145 0 0);
    --popover: oklch(1 0 0);
    --popover-foreground: oklch(0.145 0 0);
    --primary: oklch(0.205 0 0);
    --primary-foreground: oklch(0.985 0 0);
    --secondary: oklch(0.97 0 0);
    --secondary-foreground: oklch(0.205 0 0);
    --muted: oklch(0.97 0 0);
    --muted-foreground: oklch(0.556 0 0);
    --accent: oklch(0.97 0 0);
    --accent-foreground: oklch(0.205 0 0);
    --destructive: oklch(0.577 0.245 27.325);
    --border: oklch(0.922 0 0);
    --input: oklch(0.922 0 0);
    --ring: oklch(0.708 0 0);
    --chart-1: oklch(0.646 0.222 41.116);
    --chart-2: oklch(0.6 0.118 184.704);
    --chart-3: oklch(0.398 0.07 227.392);
    --chart-4: oklch(0.828 0.189 84.429);
    --chart-5: oklch(0.769 0.188 70.08);
    --sidebar: oklch(0.985 0 0);
    --sidebar-foreground: oklch(0.145 0 0);
    --sidebar-primary: oklch(0.205 0 0);
    --sidebar-primary-foreground: oklch(0.985 0 0);
    --sidebar-accent: oklch(0.97 0 0);
    --sidebar-accent-foreground: oklch(0.205 0 0);
    --sidebar-border: oklch(0.922 0 0);
    --sidebar-ring: oklch(0.708 0 0);
}

.dark {
    --background: oklch(0.145 0 0);
    --foreground: oklch(0.985 0 0);
    --card: oklch(0.205 0 0);
    --card-foreground: oklch(0.985 0 0);
    --popover: oklch(0.205 0 0);
    --popover-foreground: oklch(0.985 0 0);
    --primary: oklch(0.922 0 0);
    --primary-foreground: oklch(0.205 0 0);
    --secondary: oklch(0.269 0 0);
    --secondary-foreground: oklch(0.985 0 0);
    --muted: oklch(0.269 0 0);
    --muted-foreground: oklch(0.708 0 0);
    --accent: oklch(0.269 0 0);
    --accent-foreground: oklch(0.985 0 0);
    --destructive: oklch(0.704 0.191 22.216);
    --border: oklch(1 0 0 / 10%);
    --input: oklch(1 0 0 / 15%);
    --ring: oklch(0.556 0 0);
    --chart-1: oklch(0.488 0.243 264.376);
    --chart-2: oklch(0.696 0.17 162.48);
    --chart-3: oklch(0.769 0.188 70.08);
    --chart-4: oklch(0.627 0.265 303.9);
    --chart-5: oklch(0.645 0.246 16.439);
    --sidebar: oklch(0.205 0 0);
    --sidebar-foreground: oklch(0.985 0 0);
    --sidebar-primary: oklch(0.488 0.243 264.376);
    --sidebar-primary-foreground: oklch(0.985 0 0);
    --sidebar-accent: oklch(0.269 0 0);
    --sidebar-accent-foreground: oklch(0.985 0 0);
    --sidebar-border: oklch(1 0 0 / 10%);
    --sidebar-ring: oklch(0.556 0 0);
}

@layer base {
    * {
        @apply border-border outline-ring/50;
    }
    body {
        @apply bg-background text-foreground;
    }
}
```

### RateLtd/src/types/

#### RateLtd/src/types/commands.ts

```ts
import type { CommandResult as RunnerCommandResult } from "../commands/runner.js"

export type CommandRisk =
    | "safe"
    | "low"
    | "medium"
    | "destructive"
    | "admin"
    | "network"
    | "secret-sensitive"

export type CommandLifecycleState =
    | "idle"
    | "queued"
    | "running"
    | "succeeded"
    | "failed"
    | "cancelled"
    | "timed-out"

export type CommandDescriptor = {
    id: string
    name: string
    command: string
    cwd?: string
    provider: "package" | "git" | "shell" | "powershell" | "github" | "workflow"
    description: string
    risk: CommandRisk
    requiresConfirmation: boolean
    timeoutMs?: number
}

export type CommandResult = RunnerCommandResult & {
    id?: string
    lifecycleState: CommandLifecycleState
    risk: CommandRisk
}
```

#### RateLtd/src/types/diff.d.ts

```ts
declare module "diff" {
    export function createTwoFilesPatch(
        oldFileName: string,
        newFileName: string,
        oldStr: string,
        newStr: string,
        oldHeader?: string,
        newHeader?: string,
    ): string
}
```

#### RateLtd/src/types/editor.ts

```ts
export type EditorBuffer = {
    path: string
    content: string
    originalContent: string
    dirty: boolean
    openedAt: string
}

export type EditorOpenResult =
    | { status: "opened"; buffer: EditorBuffer }
    | { status: "blocked"; reason: string }

export type SaveConflict = {
    path: string
    reason: string
}

export type EditorAdapter = {
    id: string
    label: string
    open: (filePath: string) => Promise<EditorOpenResult>
}
```

#### RateLtd/src/types/profile.ts

```ts
export type RepoMode = "node-repo" | "git-repo" | "folder"

export type ProfileId = "rateltd" | "meatharness" | "next" | "generic"

export type PackageScript = {
    name: string
    command: string
}

export type RepoProfile = {
    id: ProfileId
    label: string
    mode: RepoMode
    targetRoot: string
    packageName?: string
    packageManager: "pnpm" | "npm" | "unknown"
    runnableScripts: PackageScript[]
    searchRoots: string[]
}
```

#### RateLtd/src/types/settings.ts

```ts
export type RateLtdThemeName = "matrix" | "vercel" | "fallbackAscii"

export type RateLtdSettings = {
    version: 1
    theme: RateLtdThemeName
    requireConfirmationForRiskyCommands: boolean
    saveLogsAutomatically: boolean
    startupScreen: string
    editor: {
        externalCommand: string
        monacoCompanionCommand?: string
    }
    diff: {
        unifiedFallback: boolean
        largeFileLimitBytes: number
    }
    powershell: {
        vendorRoots: string[]
        allowlistedScriptIds: string[]
        preferPwsh: boolean
    }
    logs: {
        retentionDays: number
    }
}
```

### RateLtd/src/ui/termcn/

#### RateLtd/src/ui/termcn/Alert.tsx

```tsx
export { StatusMessage as Alert } from "./StatusMessage.js"
```

#### RateLtd/src/ui/termcn/Banner.tsx

```tsx
export { Banner } from "../../components/Banner.js"
```

#### RateLtd/src/ui/termcn/AppShell.tsx

```tsx
export { AppFrame as AppShell } from "../../components/AppFrame.js"
```

#### RateLtd/src/ui/termcn/CommandPalette.tsx

```tsx
import React from "react"
import { Text } from "ink"
import type { CommandDescriptor } from "../../types/commands.js"

export function CommandPalette({
    commands,
    selectedIndex,
}: {
    commands: CommandDescriptor[]
    selectedIndex: number
}) {
    return (
        <Text>
            {commands
                .map(
                    (command, index) =>
                        `${index === selectedIndex ? "> " : "  "}${command.name} [${command.risk}] ${command.command}`,
                )
                .join("\n")}
        </Text>
    )
}
```

#### RateLtd/src/ui/termcn/Confirm.tsx

```tsx
export { ConfirmDialog as Confirm } from "../../components/ConfirmDialog.js"
```

#### RateLtd/src/ui/termcn/DataGrid.tsx

```tsx
import React from "react"
import { Text } from "ink"

export function DataGrid({ rows }: { rows: string[] }) {
    return <Text>{rows.join("\n")}</Text>
}
```

#### RateLtd/src/ui/termcn/DiffView.tsx

```tsx
import React from "react"
import { Text } from "ink"
import { clipTextLines } from "../../utils/terminalText.js"

// termcn diff templates are not assumed to be Ink-compatible; this wrapper
// provides the local API while keeping rendering in pure Ink.
export function DiffView({
    diff,
    maxLines = 24,
}: {
    diff: string
    maxLines?: number
}) {
    return (
        <Text>
            {clipTextLines(diff || "(no diff)", { maxLines, maxColumns: 120 })}
        </Text>
    )
}
```

#### RateLtd/src/ui/termcn/DirectoryTree.tsx

```tsx
import React from "react"
import { Text } from "ink"

export type DirectoryTreeItem = {
    path: string
    depth: number
    kind: "file" | "folder" | "repo" | "root" | "parent"
}

export function DirectoryTree({ items }: { items: DirectoryTreeItem[] }) {
    return (
        <Text>
            {items
                .map(
                    (item) =>
                        `${"  ".repeat(item.depth)}${item.kind === "file" ? "-" : "+"} ${item.path}`,
                )
                .join("\n")}
        </Text>
    )
}
```

#### RateLtd/src/ui/termcn/index.ts

```ts
export { AppShell } from "./AppShell.js"
export { Panel, FieldRow, Divider, KeyHint } from "./Panel.js"
export { Tabs } from "./Tabs.js"
export { DiffView } from "./DiffView.js"
export { DataGrid } from "./DataGrid.js"
export { StatusMessage } from "./StatusMessage.js"
export { Alert } from "./Alert.js"
export { Banner } from "./Banner.js"
export { ProgressBar } from "./ProgressBar.js"
export { Confirm } from "./Confirm.js"
export { Modal } from "./Modal.js"
export { NotificationCenter } from "./NotificationCenter.js"
```

#### RateLtd/src/ui/termcn/Menu.tsx

```tsx
export { Menu, type MenuItem } from "../../components/Menu.js"
```

#### RateLtd/src/ui/termcn/Panel.tsx

```tsx
export {
    Panel,
    FieldRow,
    Divider,
    KeyHint,
    type PanelTone,
} from "../../components/Panel.js"
```

#### RateLtd/src/ui/termcn/ProgressBar.tsx

```tsx
import React from "react"
import { Text } from "ink"

export function ProgressBar({
    value,
    width = 20,
}: {
    value: number
    width?: number
}) {
    const safe = Math.max(0, Math.min(1, value))
    const filled = Math.round(width * safe)
    return (
        <Text>{`${"=".repeat(filled)}${"-".repeat(Math.max(0, width - filled))}`}</Text>
    )
}
```

#### RateLtd/src/ui/termcn/Modal.tsx

```tsx
export { Panel as Modal } from "./Panel.js"
```

#### RateLtd/src/ui/termcn/StatusMessage.tsx

```tsx
import React from "react"
import { Text } from "ink"
import { activeTheme } from "../../theme.js"

export function StatusMessage({
    message,
    tone = "muted",
}: {
    message: string
    tone?: "primary" | "warning" | "danger" | "muted"
}) {
    const color =
        tone === "primary" ? activeTheme.primary
        : tone === "warning" ? activeTheme.warning
        : tone === "danger" ? activeTheme.danger
        : activeTheme.muted
    return <Text color={color}>{message}</Text>
}
```

#### RateLtd/src/ui/termcn/NotificationCenter.tsx

```tsx
import React from "react"
import { Text } from "ink"

export function NotificationCenter({ messages }: { messages: string[] }) {
    return (
        <Text>
            {messages.length > 0 ? messages.join("\n") : "No notifications"}
        </Text>
    )
}
```

#### RateLtd/src/ui/termcn/Tabs.tsx

```tsx
export { NavigationTabs as Tabs } from "../../components/NavigationTabs.js"
```

### RateLtd/src/utils/

#### RateLtd/src/utils/explorer.ts

```ts
import { spawn } from "node:child_process"

export function openPathInExplorer(targetPath: string): void {
    const child = spawn("explorer.exe", [targetPath], {
        detached: true,
        stdio: "ignore",
        windowsHide: true,
    })

    child.unref()
}
```

#### RateLtd/src/utils/layout.ts

```ts
export type ColumnMode = "wide" | "medium" | "narrow" | "minimal"
export type DensityMode = "full" | "compact" | "minimal"

export const DESIGN_FRAME_WIDTH = 148
export const DESIGN_FRAME_HEIGHT = 83
export const DESIGN_BODY_COLUMNS = 144
export const DESIGN_BODY_ROWS = 72

export type AppViewport = {
    columns: number
    rows: number
    frameWidth: number
    frameHeight: number
    bodyRows: number
    bodyColumns: number
    columnMode: ColumnMode
    densityMode: DensityMode
}

export type PanelLayout = {
    totalWidth: number
    leftWidth: number
    rightWidth: number
    gap: number
    showRight: boolean
}

const MIN_BODY_COLUMNS = 24
const MIN_BODY_ROWS = 4

export const APP_FRAME_BORDER_ROWS = 2
export const APP_FRAME_HEADER_ROWS = 3
export const APP_FRAME_SYSTEM_ROWS = 3
export const APP_FRAME_NAV_ROWS = 3
export const APP_FRAME_VERTICAL_GUARD_ROWS = 1

export function createViewport(columns: number, rows: number): AppViewport {
    const safeColumns = sanitizeDimension(columns, 120)
    const safeRows = sanitizeDimension(rows, 32)

    const frameWidth = Math.max(1, safeColumns)
    const frameHeight = Math.max(1, safeRows)
    const bodyColumns = Math.max(MIN_BODY_COLUMNS, frameWidth - 4)
    const chromeRows =
        APP_FRAME_BORDER_ROWS +
        APP_FRAME_HEADER_ROWS +
        APP_FRAME_SYSTEM_ROWS +
        APP_FRAME_NAV_ROWS +
        APP_FRAME_VERTICAL_GUARD_ROWS
    const bodyRows = Math.max(MIN_BODY_ROWS, frameHeight - chromeRows)

    return {
        columns: safeColumns,
        rows: safeRows,
        frameWidth,
        frameHeight,
        bodyRows,
        bodyColumns,
        columnMode: getColumnMode(safeColumns),
        densityMode: getDensityMode(safeRows),
    }
}

export function getColumnMode(columns: number): ColumnMode {
    if (columns >= 140) return "wide"
    if (columns >= 110) return "medium"
    if (columns >= 80) return "narrow"
    return "minimal"
}

export function getDensityMode(rows: number): DensityMode {
    if (rows >= 36) return "full"
    if (rows >= 28) return "compact"
    return "minimal"
}

export function createTwoColumnLayout(
    viewport: AppViewport,
    rightRatio = 0.31,
    minimumLeftWidth = 58,
    minimumRightWidth = 34,
): PanelLayout {
    const totalWidth = viewport.bodyColumns
    const gap = 1
    const availableForSplit = totalWidth - gap

    if (
        viewport.columnMode === "minimal" ||
        availableForSplit < minimumLeftWidth + minimumRightWidth
    ) {
        return {
            totalWidth,
            leftWidth: totalWidth,
            rightWidth: 0,
            gap: 0,
            showRight: false,
        }
    }

    const maxRightWidth = availableForSplit - minimumLeftWidth

    if (maxRightWidth < minimumRightWidth) {
        return {
            totalWidth,
            leftWidth: totalWidth,
            rightWidth: 0,
            gap: 0,
            showRight: false,
        }
    }

    const desiredRightWidth = Math.floor(totalWidth * rightRatio)
    const rightWidth = clamp(
        desiredRightWidth,
        minimumRightWidth,
        maxRightWidth,
    )
    const leftWidth = totalWidth - rightWidth - gap

    return {
        totalWidth,
        leftWidth,
        rightWidth,
        gap,
        showRight: true,
    }
}

export function windowAroundSelection<T>(
    items: readonly T[],
    selectedIndex: number,
    maxRows: number,
): Array<{ item: T; index: number }> {
    const visibleRows = Math.max(0, Math.floor(maxRows))

    if (visibleRows === 0 || items.length === 0) return []

    if (items.length <= visibleRows) {
        return items.map((item, index) => ({ item, index }))
    }

    const safeSelectedIndex = clamp(selectedIndex, 0, items.length - 1)
    const half = Math.floor(visibleRows / 2)
    const start = clamp(safeSelectedIndex - half, 0, items.length - visibleRows)

    return items.slice(start, start + visibleRows).map((item, offset) => ({
        item,
        index: start + offset,
    }))
}

export function clamp(value: number, min: number, max: number): number {
    if (max < min) return min
    return Math.min(Math.max(value, min), max)
}

function sanitizeDimension(value: number, fallback: number): number {
    if (!Number.isFinite(value) || value <= 0) return fallback
    return Math.floor(value)
}
```

#### RateLtd/src/utils/clipboard.ts

```ts
import clipboard from "clipboardy"

export async function copyToClipboard(value: string): Promise<void> {
    await clipboard.write(value)
}

export async function readClipboard(): Promise<string> {
    return await clipboard.read()
}
```

#### RateLtd/src/utils/markdown.ts

````ts
import { detectCommandRisk } from "../commands/runner.js"

export type ExtractedCommands = {
    commands: string[]
    warnings: string[]
}

const proseHints =
    /^(here|this|run|copy|paste|the following|then|next|note:|explanation:|after that)/i

const commandStarts =
    /^(pnpm|npm|node|npx|tsx|git|rg|pwsh|powershell|cmd|Get-|Set-|New-|Remove-|Copy-|Move-|Test-|Select-|Where-|ForEach-|if\s*\(|\$|cd\s|mkdir|code\s)/i

export function extractPowerShellCommands(input: string): ExtractedCommands {
    const warnings: string[] = []
    const source = extractFencedCommandSource(input, warnings)

    const commands = source
        .split(/\r?\n/)
        .map((line) => line.trim())
        .filter((line) => line.length > 0 && !line.startsWith("#"))
        .flatMap(splitCommandChain)
        .map((line) => line.trim())
        .filter((line) => line.length > 0)
        .filter((line) => {
            if (commandStarts.test(line)) return true
            if (proseHints.test(line)) {
                warnings.push(`Ignored prose: ${line.slice(0, 100)}`)
            }
            return false
        })

    for (const command of commands) {
        const risk = detectCommandRisk(command)

        if (risk === "destructive") {
            warnings.push(`Destructive command detected: ${command}`)
        }

        if (/[A-Z]:\\|\.{2}[\\/]/.test(command)) {
            warnings.push(`Review path scope: ${command}`)
        }
    }

    return { commands, warnings }
}

function extractFencedCommandSource(input: string, warnings: string[]): string {
    const fences = [
        ...input.matchAll(
            /```(?:powershell|pwsh|ps1|cmd|bat|sh|bash|txt)?\s*([\s\S]*?)```/gi,
        ),
    ]

    if (fences.length === 0) {
        return input
    }

    warnings.push("Markdown fences stripped.")
    return fences.map((match) => match[1]).join("\n")
}

function splitCommandChain(command: string): string[] {
    const trimmed = command.trim()

    if (trimmed.length === 0) return []

    if (!trimmed.includes(";")) return [trimmed]

    return splitOutsideQuotes(trimmed, ";")
}

function splitOutsideQuotes(value: string, delimiter: string): string[] {
    const parts: string[] = []
    let current = ""
    let quote: '"' | "'" | undefined
    let escaped = false

    for (const char of value) {
        if (escaped) {
            current += char
            escaped = false
            continue
        }

        if (char === "`") {
            current += char
            escaped = true
            continue
        }

        if ((char === '"' || char === "'") && quote === undefined) {
            quote = char
            current += char
            continue
        }

        if (char === quote) {
            quote = undefined
            current += char
            continue
        }

        if (char === delimiter && quote === undefined) {
            parts.push(current.trim())
            current = ""
            continue
        }

        current += char
    }

    if (current.trim().length > 0) {
        parts.push(current.trim())
    }

    return parts
}
````

#### RateLtd/src/utils/logger.ts

```ts
import { mkdirSync, writeFileSync, appendFileSync } from "node:fs"
import path from "node:path"
import type { CommandResult } from "../commands/runner.js"
import type { RunSession } from "./runSession.js"
import { summarizeRunSession } from "./runSession.js"

export type AgentLogLevel = "info" | "warn" | "error"

export type AgentLogEvent = {
    timestamp?: string
    level?: AgentLogLevel
    event: string
    repoRoot: string
    screen?: string
    message?: string
    data?: Record<string, unknown>
}

const sensitiveKeyPattern =
    /(secret|token|password|passwd|pwd|api[_-]?key|private[_-]?key|database[_-]?url|postgres|stripe|clerk|neon|vercel|webhook|auth|bearer|credential|connection[_-]?string)/i
const sensitiveValuePattern =
    /(sk_(?:test|live)_[A-Za-z0-9_\-]+|pk_(?:test|live)_[A-Za-z0-9_\-]+|whsec_[A-Za-z0-9_\-]+|napi_[A-Za-z0-9_\-]+|ntn_[A-Za-z0-9_\-]+|github_pat_[A-Za-z0-9_]+|postgres(?:ql)?:\/\/[^\s"']+|Bearer\s+[A-Za-z0-9._\-]+)/gi
const maxLoggedStringLength = 6000

export function formatCommandResult(result: CommandResult): string {
    return [
        `command: ${redactText(result.command)}`,
        `cwd: ${redactText(result.cwd)}`,
        `timestamp: ${result.timestamp}`,
        `exitCode: ${result.exitCode}`,
        `durationMs: ${result.durationMs}`,
        "",
        "stdout:",
        redactText(result.stdout.trimEnd()),
        "",
        "stderr:",
        redactText(result.stderr.trimEnd()),
    ].join("\n")
}

export function saveCommandResult(
    repoRoot: string,
    result: CommandResult,
): string {
    const logsDir = ensureLogsDir(repoRoot)
    const stamp = safeLogName(result.timestamp)
    const filePath = path.join(logsDir, `${stamp}.command.log.txt`)

    writeFileSync(filePath, formatCommandResult(result), "utf8")

    appendAgentLog({
        repoRoot,
        event: "command_result_saved",
        level: "info",
        screen: "output",
        message: `Saved command output for ${result.command}`,
        data: {
            command: result.command,
            cwd: result.cwd,
            exitCode: result.exitCode,
            durationMs: result.durationMs,
            stdoutBytes: result.stdout.length,
            stderrBytes: result.stderr.length,
            stdoutTail: tail(result.stdout, maxLoggedStringLength),
            stderrTail: tail(result.stderr, maxLoggedStringLength),
            filePath,
        },
    })

    return filePath
}

export function formatRunSession(session: RunSession): string {
    const lines = [summarizeRunSession(session), "", "steps:"]

    session.steps.forEach((step, index) => {
        lines.push(
            "",
            `--- step ${index + 1}: ${step.exitCode === 0 ? "passed" : "failed"} ---`,
            formatCommandResult(step),
        )
    })

    return lines.join("\n")
}

export function saveRunSession(repoRoot: string, session: RunSession): string {
    const logsDir = ensureLogsDir(repoRoot)
    const stamp = safeLogName(session.startedAt)
    const name = safeLogName(session.name)
    const filePath = path.join(logsDir, `${stamp}-${name}.run.log.txt`)

    writeFileSync(filePath, formatRunSession(session), "utf8")

    appendAgentLog({
        repoRoot,
        event: "run_session_saved",
        level: session.status === "failed" ? "error" : "info",
        screen: "output",
        message: `Saved run session ${session.name}`,
        data: {
            name: session.name,
            status: session.status,
            startedAt: session.startedAt,
            finishedAt: session.finishedAt,
            stepCount: session.steps.length,
            filePath,
            steps: session.steps.map((step) => ({
                command: step.command,
                cwd: step.cwd,
                timestamp: step.timestamp,
                exitCode: step.exitCode,
                durationMs: step.durationMs,
                stdoutBytes: step.stdout.length,
                stderrBytes: step.stderr.length,
                stdoutTail: tail(step.stdout, maxLoggedStringLength),
                stderrTail: tail(step.stderr, maxLoggedStringLength),
            })),
        },
    })

    return filePath
}

export function appendAgentLog(event: AgentLogEvent): string {
    const logsDir = ensureLogsDir(event.repoRoot)
    const filePath = path.join(logsDir, "events.jsonl")
    const timestamp = event.timestamp ?? new Date().toISOString()
    const level = event.level ?? "info"

    const record = redactForLog({
        timestamp,
        level,
        event: event.event,
        repoRoot: event.repoRoot,
        screen: event.screen,
        message: event.message,
        data: event.data ?? {},
    })

    appendFileSync(filePath, `${JSON.stringify(record)}\n`, "utf8")
    return filePath
}

export function redactForLog(value: unknown): unknown {
    if (typeof value === "string") {
        const redacted = value.replace(sensitiveValuePattern, "[REDACTED]")
        return redacted.length > maxLoggedStringLength ?
                `${redacted.slice(0, maxLoggedStringLength)}â€¦[TRUNCATED ${redacted.length - maxLoggedStringLength} chars]`
            :   redacted
    }

    if (
        typeof value === "number" ||
        typeof value === "boolean" ||
        value === null
    ) {
        return value
    }

    if (Array.isArray(value)) {
        return value.map((item) => redactForLog(item))
    }

    if (typeof value === "object" && value !== null) {
        const output: Record<string, unknown> = {}

        for (const [key, nested] of Object.entries(value)) {
            if (sensitiveKeyPattern.test(key)) {
                output[key] = "[REDACTED]"
            } else {
                output[key] = redactForLog(nested)
            }
        }

        return output
    }

    return String(value)
}

function tail(value: string, maxLength: number): string {
    if (value.length <= maxLength) return value
    return `â€¦[TRUNCATED ${value.length - maxLength} chars]\n${value.slice(-maxLength)}`
}

function redactText(value: string): string {
    const redacted = redactForLog(value)
    return typeof redacted === "string" ? redacted : String(redacted)
}

function ensureLogsDir(repoRoot: string): string {
    const logsDir = path.join(repoRoot, ".agent-logs")
    mkdirSync(logsDir, { recursive: true })
    return logsDir
}

function safeLogName(value: string): string {
    return value.replace(/[:.\\/?*"<>|]/g, "-")
}
```

#### RateLtd/src/utils/packageScripts.ts

```ts
import { existsSync, readFileSync } from "node:fs"
import path from "node:path"
import type { PackageScript } from "../types/profile.js"

export type PackageJsonInfo = {
    name?: string
    scripts: Record<string, string>
    dependencies: Record<string, string>
    devDependencies: Record<string, string>
}

export function readPackageJsonInfo(
    targetRoot: string,
): PackageJsonInfo | undefined {
    const packagePath = path.join(targetRoot, "package.json")

    if (!existsSync(packagePath)) {
        return undefined
    }

    const parsed = JSON.parse(readFileSync(packagePath, "utf8")) as Record<
        string,
        unknown
    >

    return {
        name: typeof parsed.name === "string" ? parsed.name : undefined,
        scripts: normalizeStringRecord(parsed.scripts),
        dependencies: normalizeStringRecord(parsed.dependencies),
        devDependencies: normalizeStringRecord(parsed.devDependencies),
    }
}

export function getRunnablePackageScripts(targetRoot: string): PackageScript[] {
    const info = readPackageJsonInfo(targetRoot)

    if (!info) {
        return []
    }

    return Object.entries(info.scripts)
        .map(([name, command]) => ({ name, command }))
        .sort((first, second) => first.name.localeCompare(second.name))
}

export function getPackageScriptNames(targetRoot: string): string[] {
    return getRunnablePackageScripts(targetRoot).map((script) => script.name)
}

export function hasPackageScript(
    targetRoot: string,
    scriptName: string,
): boolean {
    return getPackageScriptNames(targetRoot).includes(scriptName)
}

export function hasDependency(
    info: PackageJsonInfo | undefined,
    dependencyName: string,
): boolean {
    if (!info) {
        return false
    }

    return Boolean(
        info.dependencies[dependencyName] ??
        info.devDependencies[dependencyName],
    )
}

function normalizeStringRecord(value: unknown): Record<string, string> {
    if (!value || typeof value !== "object") {
        return {}
    }

    const record: Record<string, string> = {}

    for (const [key, item] of Object.entries(
        value as Record<string, unknown>,
    )) {
        if (typeof item === "string") {
            record[key] = item
        }
    }

    return record
}
```

#### RateLtd/src/utils/profiles.ts

```ts
import { existsSync } from "node:fs"
import path from "node:path"
import type {
    PackageScript,
    ProfileId,
    RepoMode,
    RepoProfile,
} from "../types/profile.js"
import {
    getRunnablePackageScripts,
    hasDependency,
    readPackageJsonInfo,
} from "./packageScripts.js"

export function detectRepoMode(targetRoot: string): RepoMode {
    const hasPackageJson = existsSync(path.join(targetRoot, "package.json"))
    const hasGit = existsSync(path.join(targetRoot, ".git"))

    if (hasPackageJson && hasGit) return "node-repo"
    if (hasGit) return "git-repo"
    return "folder"
}

export function detectProfileId(targetRoot: string): ProfileId {
    const packageInfo = readPackageJsonInfo(targetRoot)
    const packageName = packageInfo?.name?.toLowerCase() ?? ""

    if (
        packageName === "rateltd" ||
        (existsSync(path.join(targetRoot, "src", "brand", "rateLtd.ts")) &&
            existsSync(path.join(targetRoot, "src", "app.tsx")))
    ) {
        return "rateltd"
    }

    if (
        packageName === "meatharness" ||
        (existsSync(path.join(targetRoot, "src", "cli.ts")) &&
            existsSync(path.join(targetRoot, "src", "app.tsx")))
    ) {
        return "meatharness"
    }

    if (
        hasDependency(packageInfo, "next") ||
        existsSync(path.join(targetRoot, "next.config.ts")) ||
        existsSync(path.join(targetRoot, "app"))
    ) {
        return "next"
    }

    return "generic"
}

export function loadRepoProfile(targetRoot: string): RepoProfile {
    const packageInfo = readPackageJsonInfo(targetRoot)
    const id = detectProfileId(targetRoot)
    const runnableScripts = getRunnablePackageScripts(targetRoot)

    return {
        id,
        label: profileLabel(id),
        mode: detectRepoMode(targetRoot),
        targetRoot,
        packageName: packageInfo?.name,
        packageManager: detectPackageManager(targetRoot),
        runnableScripts,
        searchRoots: detectSearchRoots(targetRoot, id),
    }
}

export function detectSearchRoots(
    targetRoot: string,
    profileId = detectProfileId(targetRoot),
): string[] {
    const candidates = searchRootCandidates(profileId)
    const existing = candidates.filter((candidate) =>
        existsSync(path.join(targetRoot, candidate)),
    )

    return existing.length > 0 ? existing : ["."]
}

export function formatPackageScript(
    script: PackageScript,
    packageManager = "pnpm",
): string {
    return `${packageManager} ${script.name}`
}

function searchRootCandidates(profileId: ProfileId): string[] {
    if (profileId === "rateltd") return ["src"]
    if (profileId === "meatharness") return ["src"]
    if (profileId === "next")
        return ["app", "components", "features", "lib", "src", "tests"]
    return ["src", "app", "lib", "components", "tests"]
}

function detectPackageManager(
    targetRoot: string,
): RepoProfile["packageManager"] {
    if (existsSync(path.join(targetRoot, "pnpm-lock.yaml"))) return "pnpm"
    if (existsSync(path.join(targetRoot, "package-lock.json"))) return "npm"
    return "unknown"
}

function profileLabel(profileId: ProfileId): string {
    if (profileId === "rateltd") return "RateLtd"
    if (profileId === "meatharness") return "MeatHarness"
    if (profileId === "next") return "Next.js"
    return "Generic"
}
```

#### RateLtd/src/utils/terminalSize.ts

```ts
import { useEffect, useState } from "react"

export type TerminalSize = {
    columns: number
    rows: number
}

export function getTerminalSize(): TerminalSize {
    return {
        columns: process.stdout.columns ?? 120,
        rows: process.stdout.rows ?? 32,
    }
}

export function useTerminalSize(): TerminalSize {
    const [size, setSize] = useState<TerminalSize>(() => getTerminalSize())

    useEffect(() => {
        const update = () => setSize(getTerminalSize())

        process.stdout.on("resize", update)
        update()

        return () => {
            process.stdout.off("resize", update)
        }
    }, [])

    return size
}
```

#### RateLtd/src/utils/runSession.ts

```ts
import type { CommandResult } from "../commands/runner.js"

export type RunSessionStatus = "running" | "passed" | "failed" | "cancelled"

export type RunSession = {
    id: string
    name: string
    targetRoot: string
    startedAt: string
    finishedAt?: string
    status: RunSessionStatus
    steps: CommandResult[]
}

export function createRunSession(name: string, targetRoot: string): RunSession {
    const startedAt = new Date().toISOString()

    return {
        id: `run-${startedAt.replace(/[:.]/g, "-")}`,
        name,
        targetRoot,
        startedAt,
        status: "running",
        steps: [],
    }
}

export function finishRunSession(
    session: RunSession,
    status?: RunSessionStatus,
): RunSession {
    return {
        ...session,
        finishedAt: new Date().toISOString(),
        status:
            status ??
            (session.steps.every((step) => step.exitCode === 0) ?
                "passed"
            :   "failed"),
    }
}

export function summarizeRunSession(session: RunSession): string {
    const passed = session.steps.filter((step) => step.exitCode === 0).length
    const failed = session.steps.filter((step) => step.exitCode !== 0).length
    const durationMs = session.steps.reduce(
        (total, step) => total + step.durationMs,
        0,
    )

    return [
        `${session.name} [${session.status}]`,
        `target: ${session.targetRoot}`,
        `started: ${session.startedAt}`,
        session.finishedAt ? `finished: ${session.finishedAt}` : undefined,
        `steps: ${session.steps.length} (${passed} passed, ${failed} failed)`,
        `durationMs: ${durationMs}`,
    ]
        .filter(Boolean)
        .join("\n")
}
```

#### RateLtd/src/utils/repo.ts

```ts
import { existsSync, readFileSync } from "node:fs"
import path from "node:path"
import { execFileSync } from "node:child_process"
import { rateLtdBrand } from "../brand/rateLtd.js"

export type RepoInfo = {
    harnessRoot: string
    targetRoot: string
    targetType: "git-repo" | "folder"
    isGitRepo: boolean
    hasPackageJson: boolean
    branch: string
    dirty: boolean
    nodeVersion: string
    pnpmVersion: string
    targetPackageName: string
}

export type LoadRepoInfoOptions = {
    harnessRoot?: string
    targetRoot?: string
}

export function assertInsideRepoPath(
    repoRoot: string,
    candidate: string,
): string {
    const resolved = path.resolve(repoRoot, candidate)
    const relative = path.relative(repoRoot, resolved)

    if (relative.startsWith("..") || path.isAbsolute(relative)) {
        throw new Error(`Path escapes repo root: ${candidate}`)
    }

    return resolved
}

export function resolveTargetRoot(
    options: {
        harnessRoot?: string
        argv?: string[]
        env?: NodeJS.ProcessEnv
    } = {},
): string {
    const harnessRoot = path.resolve(options.harnessRoot ?? process.cwd())
    const argv = options.argv ?? process.argv.slice(2)
    const env = options.env ?? process.env

    const inlineRepoArg = argv.find((arg) => arg.startsWith("--repo="))
    const inlineTargetArg = argv.find((arg) => arg.startsWith("--target="))
    const repoIndex = argv.findIndex((arg) => arg === "--repo" || arg === "-r")
    const targetIndex = argv.findIndex(
        (arg) => arg === "--target" || arg === "-t",
    )

    const candidate =
        inlineRepoArg?.slice("--repo=".length) ??
        inlineTargetArg?.slice("--target=".length) ??
        (repoIndex >= 0 ? argv[repoIndex + 1] : undefined) ??
        (targetIndex >= 0 ? argv[targetIndex + 1] : undefined) ??
        env.RATELTD_TARGET_REPO ??
        env.MEATHARNESS_TARGET_REPO ??
        readLocalTargetRoot(harnessRoot) ??
        harnessRoot

    return normalizeRoot(harnessRoot, candidate)
}

export function readLocalTargetRoot(harnessRoot: string): string | undefined {
    // RateLtd keeps legacy MeatHarness config names readable so existing local
    // sessions can launch before users migrate settings into .rateltd.
    const configFiles = [
        ".rateltd.local.json",
        ".rateltdrc.local.json",
        path.join(rateLtdBrand.newConfigDir, "settings.json"),
        ".meatharness.local.json",
        ".meatharnessrc.local.json",
        path.join(rateLtdBrand.oldConfigDir, "settings.json"),
    ]

    for (const fileName of configFiles) {
        const configPath = path.join(harnessRoot, fileName)

        if (!existsSync(configPath)) {
            continue
        }

        const parsed = JSON.parse(readFileSync(configPath, "utf8")) as {
            targetRoot?: unknown
            targetRepo?: unknown
            repo?: unknown
        }

        const value = parsed.targetRoot ?? parsed.targetRepo ?? parsed.repo

        if (typeof value === "string" && value.trim().length > 0) {
            return value
        }
    }

    return undefined
}

export function loadRepoInfo(options: LoadRepoInfoOptions = {}): RepoInfo {
    const harnessRoot = path.resolve(options.harnessRoot ?? process.cwd())
    const targetRoot = normalizeRoot(
        harnessRoot,
        options.targetRoot ?? harnessRoot,
    )

    const packagePath = path.join(targetRoot, "package.json")
    const hasPackageJson = existsSync(packagePath)
    const isGitRepo =
        safeExec(
            "git",
            ["rev-parse", "--is-inside-work-tree"],
            targetRoot,
        ).trim() === "true"

    const branch =
        isGitRepo ?
            safeExec("git", ["branch", "--show-current"], targetRoot).trim() ||
            "(detached)"
        :   "(not git)"
    const status =
        isGitRepo ? safeExec("git", ["status", "--short"], targetRoot) : ""
    const nodeVersion =
        safeExec("node", ["--version"], targetRoot).trim() || "unknown"
    const pnpmVersion =
        safeExec("pnpm", ["--version"], targetRoot).trim() || "unknown"

    return {
        harnessRoot,
        targetRoot,
        targetType: isGitRepo ? "git-repo" : "folder",
        isGitRepo,
        hasPackageJson,
        branch,
        dirty: status.trim().length > 0,
        nodeVersion,
        pnpmVersion,
        targetPackageName:
            hasPackageJson ? readPackageName(packagePath) : "(no package.json)",
    }
}

function normalizeRoot(harnessRoot: string, candidate: string): string {
    return path.isAbsolute(candidate) ?
            path.resolve(candidate)
        :   path.resolve(harnessRoot, candidate)
}

function readPackageName(packagePath: string): string {
    try {
        const parsed = JSON.parse(readFileSync(packagePath, "utf8")) as {
            name?: unknown
        }

        return (
                typeof parsed.name === "string" && parsed.name.trim().length > 0
            ) ?
                parsed.name
            :   "(unnamed)"
    } catch {
        return "(unreadable package)"
    }
}

function safeExec(command: string, args: string[], cwd: string): string {
    try {
        return execFileSync(command, args, { cwd, encoding: "utf8" })
    } catch {
        return ""
    }
}
```

#### RateLtd/src/utils/terminalText.ts

```ts
export type TextWindow = {
    text: string
    totalLines: number
    startLine: number
    visibleLines: number
    overflowTop: number
    overflowBottom: number
}

export function truncateLine(value: string, maxColumns: number): string {
    if (maxColumns <= 0) return ""
    if (value.length <= maxColumns) return value
    if (maxColumns <= 1) return "â€¦"

    return `${value.slice(0, maxColumns - 1)}â€¦`
}

export function clipTextLines(
    input: string,
    options: {
        maxLines: number
        maxColumns?: number
        startLine?: number
        overflowLabel?: boolean
    },
): string {
    return createTextWindow(input, options).text
}

export function createTextWindow(
    input: string,
    options: {
        maxLines: number
        maxColumns?: number
        startLine?: number
        overflowLabel?: boolean
    },
): TextWindow {
    const maxLines = Math.max(0, options.maxLines)
    const maxColumns = options.maxColumns ?? 120
    const rawLines = input.length > 0 ? input.split(/\r?\n/) : [""]
    const totalLines = rawLines.length
    const startLine = clamp(
        options.startLine ?? Math.max(0, totalLines - maxLines),
        0,
        Math.max(0, totalLines - 1),
    )
    const windowLines = rawLines
        .slice(startLine, startLine + maxLines)
        .map((line) => truncateLine(line, maxColumns))
    const overflowTop = startLine
    const overflowBottom = Math.max(
        0,
        totalLines - startLine - windowLines.length,
    )
    const labelledLines = [...windowLines]

    if (options.overflowLabel !== false && overflowTop > 0) {
        labelledLines.unshift(`â€¦ ${overflowTop} line(s) above â€¦`)
    }

    if (options.overflowLabel !== false && overflowBottom > 0) {
        labelledLines.push(`â€¦ ${overflowBottom} line(s) below â€¦`)
    }

    return {
        text: labelledLines.join("\n"),
        totalLines,
        startLine,
        visibleLines: windowLines.length,
        overflowTop,
        overflowBottom,
    }
}

function clamp(value: number, min: number, max: number): number {
    return Math.min(Math.max(value, min), max)
}
```

### RateLtd/src/.editorconfig

```editorconfig
root = false

[*]
charset = utf-8
end_of_line = lf
insert_final_newline = true
indent_style = space
indent_size = 2

[*.{ts,tsx}]
indent_size = 2
```

### RateLtd/src/cli.ts

```ts
#!/usr/bin/env node
import React from "react"
import { render, Text } from "ink"
import { App } from "./app.js"
import { loadRepoInfo, resolveTargetRoot } from "./utils/repo.js"
import { rateLtdBrand } from "./brand/rateLtd.js"

try {
    const harnessRoot = process.cwd()
    const targetRoot = resolveTargetRoot({ harnessRoot })
    const repo = loadRepoInfo({ harnessRoot, targetRoot })

    render(React.createElement(App, { repo }))
} catch (error) {
    const message = error instanceof Error ? error.message : String(error)

    render(
        React.createElement(
            Text,
            { color: "red" },
            `${rateLtdBrand.productName} preflight failed: ${message}`,
        ),
    )

    process.exitCode = 1
}
```

### RateLtd/src/app.tsx

```tsx
import React from "react"
import type { RepoInfo } from "./utils/repo.js"
import { AppFrame } from "./components/AppFrame.js"
import { AppScreens } from "./components/AppScreens.js"
import { useMeatHarnessController } from "./state/useMeatHarnessController.js"

export function App({ repo: initialRepo }: { repo: RepoInfo }) {
    const controller = useMeatHarnessController(initialRepo)

    return (
        <AppFrame
            repo={controller.repo}
            activeScreen={controller.screen}
            isRunning={controller.isRunning}
            message={controller.message}
        >
            {(viewport) => (
                <AppScreens
                    controller={controller}
                    viewport={viewport}
                />
            )}
        </AppFrame>
    )
}
```

### RateLtd/src/theme.ts

```ts
export type Theme = {
    name: "matrix"
    primary: string
    secondary: string
    accent: string
    muted: string
    danger: string
    warning: string
    background: string
    gradient: string[]
}

export const activeTheme: Theme = {
    name: "matrix",
    primary: "greenBright",
    secondary: "green",
    accent: "cyanBright",
    muted: "gray",
    danger: "redBright",
    warning: "yellowBright",
    background: "black",
    gradient: ["#00ff66", "#00d9ff", "#ff00aa"],
}
```

## RateLtd/.gitignore

```gitignore
# Dependencies
node_modules/
.pnpm-store/

# Build output
dist/
build/
out/
coverage/
*.tsbuildinfo
.cache/
.vite/
.turbo/

# Local/generated project material
.codex/
docs/
MeatHarness/
mockups/
sources/

# Logs
logs/
*.log
.agent-backups/

# Keep sanitized agent logs tracked
!.agent-logs/
!.agent-logs/events.jsonl

# Environment/secrets
.env
.env.*
!.env.example

# Local config
.meatharness.local.json
.meatharnessrc.local.json

# OS/editor
.DS_Store
Thumbs.db
desktop.ini

.vscode/*
!.vscode/extensions.json
!.vscode/settings.json

# Temporary files
*.tmp
*.temp
*.bak
*.orig
*.swp
```

## RateLtd/README.md

````md
# RateLtd

Local PowerShell-first Ink TUI for repo selection, clipboard file-write payloads, built-in ops, and copyable command output.

## Product

RateLtd preserves the original runtime behaviors and adds real module workflows:

```txt
1 LauncherLtd
2 RateLtd dashboard
3 EditorLtd
4 CommanderLtd clipboard intake
5 CommanderLtd ops
6 DifferLtd
7 LoggerLtd
8 PreferLtd
```
````

The TUI is responsive by terminal cells, not pixels. It reads `process.stdout.columns` and `process.stdout.rows`, then renders only the rows that fit.

### 1 LauncherLtd

Pick the target repo.

```txt
Arrow keys  move through repo tree
Enter       select repo row as target
Left        collapse to parent folder
```

### 2 RateLtd

Dashboard for the active target repo. It reads real repo metadata, Git state, log count, settings path, and diagnostics.

### 3 EditorLtd

Real file workflow:

```txt
Arrow keys  choose file
Enter/E     open selected file in configured external editor
R           refresh file list
```

EditorLtd previews text files inside the terminal and blocks binary/large files. Monaco is adapter-based only and is not embedded in Ink.

### 4 CommanderLtd Clipboard

Clipboard intake for AI handoff payloads.

Planned final behavior:

```txt
Arrow keys  choose action
Enter       prepare selected clipboard action
Left/Right  choose YES or NO during confirmation
Enter       confirm selected answer
Esc         cancel or clear
```

Clipboard actions:

```txt
Write files from clipboard JSON
Run AI command from clipboard
```

Supported file-write JSON:

```json
{
    "files": [
        {
            "path": "src/example.ts",
            "content": "complete file content"
        }
    ]
}
```

### 5 CommanderLtd Ops

Built-in repo operations.

```txt
Arrow keys  select op
Enter       run op
```

Commands come from:

```txt
package.json scripts
Git commands with confirmation on mutating commands
safe search commands
```

### 6 DifferLtd

Real Git workflow:

```txt
Arrow keys  choose changed file
S           stage selected file
U           unstage selected file
X           revert selected file with confirmation
P           copy full patch to clipboard
```

DifferLtd reads real `git status --porcelain` and `git diff` output through `src/services/gitService.ts`.

### 7 LoggerLtd

Read, copy, save, or cancel output.

```txt
C           copy full run output
S           save output to .agent-logs
X           cancel running command
```

LoggerLtd also reads `.agent-logs/events.jsonl` and shows recent machine-readable events.

Command execution uses the local process runner with stdout/stderr streaming, a default 20 minute timeout, and cancellation through `AbortController`. Cancellation kills the spawned shell process; detached child processes started by that shell may need separate cleanup.

### 8 PreferLtd

Settings workflow:

```txt
T           cycle theme
S           write .rateltd/settings.json
```

PreferLtd reads and writes versioned RateLtd settings through `src/services/settingsService.ts`.

### Global keys

```txt
1           LauncherLtd
2           RateLtd dashboard
3           EditorLtd
4           CommanderLtd clipboard
5           CommanderLtd ops
6           DifferLtd
7           LoggerLtd
8           PreferLtd
?           HelpLtd diagnostics and shortcuts
Q           Quit
```

### Local config

Optional local-only target config:

```json
{
    "targetRoot": "D:\\Vouch"
}
```

Preferred RateLtd paths:

```txt
.rateltd.local.json
.rateltdrc.local.json
.rateltd\settings.json
```

Legacy MeatHarness paths are still read for compatibility:

```txt
.meatharness.local.json
.meatharnessrc.local.json
.meatharness\settings.json
```

Do not commit it.

PreferLtd settings are read from `.rateltd\settings.json` first, then legacy `.meatharness\settings.json`. Saving from PreferLtd writes the migrated settings to `.rateltd\settings.json`.

### Migration Notes

- The package command `rateltd` is now available.
- The legacy `meatharness` bin remains available for existing local scripts.
- Internal legacy screen IDs remain available for compatibility: `launcher`, `write`, `ops`, and `output`.
- `.agent-logs/events.jsonl` is preserved as the machine-readable event log.
- `.meatharness` config/session paths remain supported for compatibility.

### PowerShell Provider Safety

PowerShell scripts are inventoried, not executed, unless they are explicitly allowlisted in settings. The inventory captures comment-based help, parameters, module hints, admin requirements, risk classification, and license/source metadata.

### Validation

```powershell
pnpm install
pnpm typecheck
pnpm test
pnpm build
pnpm verify
```

### Scripts

```powershell
pnpm install
pnpm tui
pnpm typecheck
pnpm test
pnpm verify
```

## RateLtd/tsconfig.json

```json
{
    "compilerOptions": {
        "target": "ES2022",
        "module": "NodeNext",
        "moduleResolution": "bundler",
        "resolvePackageJsonImports": true
        "jsx": "react-jsx",
        "strict": true,
        "esModuleInterop": true,
        "allowSyntheticDefaultImports": true,
        "skipLibCheck": true,
        "forceConsistentCasingInFileNames": true,
        "rootDir": "src",
        "outDir": "dist",
        "sourceMap": true,
        "types": ["node"]
    },
    "include": ["src/**/*.ts", "src/**/*.tsx"],
    "exclude": ["dist", "node_modules"]
}

```

## RateLtd/vitest.config.ts

```ts
import { defineConfig } from "vitest/config"

export default defineConfig({
    test: {
        environment: "node",
        include: ["src/**/*.test.ts"],
        restoreMocks: true,
        clearMocks: true,
    },
})
```

## RateLtd/components.json

```json
{
  "$schema": "https://ui.shadcn.com/schema.json",
  "style": "radix-nova",
  "rsc": false,
  "tsx": true,
  "tailwind": {
    "config": "",
    "css": "src/styles/globals.css",
    "baseColor": "neutral",
    "cssVariables": true,
    "prefix": ""
  },
  "aliases": {
    "components": "#components",
    "utils": "#lib/utils",
    "ui": "#components/ui",
    "lib": "#lib",
    "hooks": "#hooks"
  }
  "iconLibrary": "lucide"
}
```

## RateLtd/package.json

```json
{
    "name": "rateltd",
    "version": "0.2.0",
    "private": true,
    "type": "module",
    "description": "A PowerShell-first Ink TUI for repo selection, file-write payloads, built-in ops, and copyable command output.",
    "packageManager": "pnpm@10.33.2",
    "engines": {
        "node": ">=20.19.0"
    },
    "bin": {
        "rateltd": "./dist/cli.js",
        "meatharness": "./dist/cli.js"
    },
    "scripts": {
        "dev": "tsx src/cli.ts",
        "tui": "tsx src/cli.ts",
        "start": "node dist/cli.js",
        "typecheck": "tsc -p tsconfig.json --noEmit",
        "build": "tsc -p tsconfig.json",
        "test": "vitest run",
        "test:watch": "vitest",
        "verify": "pnpm typecheck && pnpm test"
    },
    "dependencies": {
        "class-variance-authority": "^0.7.1",
        "clipboardy": "5.3.1",
        "clsx": "^2.1.1",
        "diff": "9.0.0",
        "ink": "7.0.1",
        "lucide-react": "^1.14.0",
        "react": "19.2.5",
        "shadcn": "^4.7.0",
        "tailwind-merge": "^3.5.0",
        "tw-animate-css": "^1.4.0"
    },
    "devDependencies": {
        "@types/node": "25.6.0",
        "@types/react": "19.2.14",
        "ink-testing-library": "4.0.0",
        "tsx": "4.21.0",
        "typescript": "6.0.3",
        "vitest": "4.1.5"
    },
    "imports": {
        "#components/*": "./src/components/*.tsx",
        "#lib/*": "./src/lib/*.ts",
        "#hooks/*": "./src/hooks/*.ts"
    }
}
```

## RateLtd/theme-provider.tsx

```tsx
import * as React from "react"

import { defaultTheme } from "/lib/terminal-themes/default"

type BorderStyle =
    | "single"
    | "double"
    | "round"
    | "bold"
    | "singleDouble"
    | "doubleSingle"
    | "classic"

export interface ColorTokens {
    primary: string
    primaryForeground: string
    secondary: string
    secondaryForeground: string
    accent: string
    accentForeground: string
    success: string
    successForeground: string
    warning: string
    warningForeground: string
    error: string
    errorForeground: string
    info: string
    infoForeground: string
    background: string
    foreground: string
    muted: string
    mutedForeground: string
    border: string
    focusRing: string
    selection: string
    selectionForeground: string
}

export interface SpacingTokens {
    0: number
    1: number
    2: number
    3: number
    4: number
    6: number
    8: number
}

export interface TypographyTokens {
    bold: boolean
    sm: string
    base: string
    lg: string
    xl: string
}

export interface BorderTokens {
    style: BorderStyle
    color: string
    focusColor: string
}

export interface Theme {
    name: string
    colors: ColorTokens
    spacing: SpacingTokens
    typography: TypographyTokens
    border: BorderTokens
}

export interface MotionContextValue {
    reduced: boolean
}

export interface UnicodeContextValue {
    unicode: boolean
}

const getEnv = (name: string): string | undefined =>
    typeof process !== "undefined" && process.env ?
        process.env[name]
    :   undefined

export const isReducedMotion = (): boolean =>
    getEnv("NO_MOTION") === "1" || getEnv("CI") === "true"

const detectUnicodeSupport = (): boolean => {
    if (typeof window !== "undefined") {
        return true
    }

    if (getEnv("NO_UNICODE") === "1" || getEnv("NO_UNICODE") === "true") {
        return false
    }

    const platform =
        typeof process !== "undefined" && process.platform ?
            process.platform
        :   "browser"

    if (getEnv("WSL_DISTRO_NAME")) {
        return true
    }
    if (getEnv("WT_SESSION")) {
        return true
    }
    if (getEnv("TERM_PROGRAM") === "vscode") {
        return true
    }
    if (getEnv("MSYSTEM")) {
        return false
    }
    if (platform === "darwin" || platform === "linux") {
        return true
    }

    return true
}

export const isNoUnicode = (): boolean => !detectUnicodeSupport()

export const MotionContext = React.createContext<MotionContextValue>({
    reduced: isReducedMotion(),
})

export const UnicodeContext = React.createContext<UnicodeContextValue>({
    unicode: !isNoUnicode(),
})

export const useMotion = (): MotionContextValue =>
    React.useContext(MotionContext)

export const useUnicode = (): boolean =>
    React.useContext(UnicodeContext).unicode

interface ThemeContextValue {
    setTheme: (theme: Theme) => void
    theme: Theme
}

const ThemeContext = React.createContext<ThemeContextValue>({
    setTheme: () => {
        /* noop */
    },
    theme: defaultTheme,
})

export interface ThemeProviderProps {
    children: React.ReactNode
    noUnicode?: boolean
    reducedMotion?: boolean
    theme?: Theme
}

export const detectColorScheme = (): "dark" | "light" => {
    const colorFgBg = getEnv("COLORFGBG")
    if (colorFgBg) {
        const parts = colorFgBg.split(";")
        const background = Number.parseInt(parts.at(-1) ?? "0", 10)
        if (!Number.isNaN(background)) {
            return background <= 6 ? "dark" : "light"
        }
    }

    const termBackground = getEnv("TERM_BACKGROUND")
    if (termBackground === "light") {
        return "light"
    }
    if (termBackground === "dark") {
        return "dark"
    }

    return "dark"
}

export interface AutoThemeProviderProps {
    children: React.ReactNode
    darkTheme: Theme
    lightTheme: Theme
}

export const ThemeProvider = ({
    children,
    noUnicode,
    reducedMotion,
    theme = defaultTheme,
}: ThemeProviderProps) => {
    const [currentTheme, setCurrentTheme] = React.useState(theme)

    React.useEffect(() => {
        setCurrentTheme(theme)
    }, [theme])

    const motionValue = React.useMemo(
        () => ({ reduced: reducedMotion ?? isReducedMotion() }),
        [reducedMotion],
    )

    const unicodeValue = React.useMemo(
        () => ({
            unicode: noUnicode === undefined ? !isNoUnicode() : !noUnicode,
        }),
        [noUnicode],
    )

    const themeValue = React.useMemo(
        () => ({ setTheme: setCurrentTheme, theme: currentTheme }),
        [currentTheme],
    )

    return (
        <MotionContext.Provider value={motionValue}>
            <UnicodeContext.Provider value={unicodeValue}>
                <ThemeContext.Provider value={themeValue}>
                    {children}
                </ThemeContext.Provider>
            </UnicodeContext.Provider>
        </MotionContext.Provider>
    )
}

export const AutoThemeProvider = ({
    children,
    darkTheme,
    lightTheme,
}: AutoThemeProviderProps) => {
    const scheme = detectColorScheme()
    return (
        <ThemeProvider theme={scheme === "dark" ? darkTheme : lightTheme}>
            {children}
        </ThemeProvider>
    )
}

export const useTheme = (): Theme => React.useContext(ThemeContext).theme

export const useThemeUpdater = (): ((theme: Theme) => void) =>
    React.useContext(ThemeContext).setTheme

export const createTheme = (
    overrides: Partial<Theme> & { name: string },
): Theme => ({
    ...defaultTheme,
    ...overrides,
    border: {
        ...defaultTheme.border,
        ...overrides.border,
    },
    colors: {
        ...defaultTheme.colors,
        ...overrides.colors,
    },
    spacing: {
        ...defaultTheme.spacing,
        ...overrides.spacing,
    },
    typography: {
        ...defaultTheme.typography,
        ...overrides.typography,
    },
})
```
