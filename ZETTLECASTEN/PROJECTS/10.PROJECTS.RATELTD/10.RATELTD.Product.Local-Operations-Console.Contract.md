---
title: RateLtd Local Operations Console Contract
type: contract
scope: project
project: RateLtd
domain: product
artifact: local-operations-console
kind: contract
namespace: rateltd.product.local-operations-console.contract
status: active
authority: source-of-truth
parent: "[[rateltd.project.map]]"
depends_on:
  - "[[rateltd.product.local-context-protocol.contract]]"
  - "[[rateltd.product.vision]]"
supersedes: []
tags:
  - projects/rateltd
  - contracts/product
  - rateltd/tui
  - status/active
created: 2026-05-07
updated: 2026-08-11
---

# RateLtd Local Operations Console Contract

## Contract Statement

RateLtd is a **single-window local operations console** for ChatGPT-assisted coding.

It does not replace the primary tools. It wraps the useful parts so the operator does not have to context-switch across all of them.

## Does Not Replace

RateLtd does not replace:

- GitHub
    
- VS Code
    
- PowerShell
    
- Git
    
- pnpm
    
- File Explorer
    
- Codex
    
- ChatGPT
    

## Product Purpose

RateLtd centralizes the local actions ChatGPT needs Ivan to perform, packages them as safe keyboard macros, captures the result, and formats the result back into model-usable context.

## Operating Model

RateLtd should provide:

- one place
    
- one target
    
- one set of known actions
    
- one captured output stream
    
- one handoff format back to ChatGPT
    

## Operator-Proof Design Requirement

Operator-proof design is not an insult. It is a product requirement.

The TUI should assume:

- the human is tired
    
- the model needs precision
    
- manual copying is error-prone
    
- window switching causes mistakes
    
- rate limits punish wasted loops
    

Therefore:

- every action should be visible
    
- every command should be prebuilt
    
- every risky action should confirm
    
- every output should be captured
    
- every handoff should be formatted
    
- every unavailable action should explain itself
    

## Final Mental Model

RateLtd is not a generic dev tool.

RateLtd is a local control panel for the human-in-the-loop portion of AI coding.

## Design Rules

1. Actions must be visible before they are executed.
    
2. Commands must be known, selectable, and logged.
    
3. Risky actions must require confirmation.
    
4. Output must be captured in a reusable format.
    
5. Context must return to ChatGPT in a predictable handoff shape.
    
6. Unavailable actions must explain why they are unavailable.
    

## Required Invariants

- RateLtd must remain single-window by default.
    
- RateLtd must reduce context-switching, not add another place to manage complexity.
    
- RateLtd must prefer keyboard-selectable macros over manual command typing.
    
- RateLtd must preserve captured output as a first-class product artifact.
    
- RateLtd must make local state legible before action.
    
- RateLtd must treat handoff formatting as a core feature, not a nice-to-have.
    

## Valid UI Receipts

A feature is valid only if it appears as at least one of the following:

- screen
    
- panel
    
- row
    
- selected item
    
- keybinding
    
- button/action
    
- status badge
    
- output pane
    
- preview pane
    
- copy/export action
    
- settings row
    

## Invalid Product Direction

RateLtd should not become:

- a generic IDE
    
- a GitHub client
    
- a cloud dashboard
    
- a project management tool
    
- an ornamental terminal skin
    
- a feature buffet detached from the AI coding loop
    

## Failure Modes

|Failure|Cause|Required Handling|
|---|---|---|
|Operator context-switches anyway|Action requires external manual work|Add macro, launch action, or captured handoff|
|Command is typed manually|Known operation lacks macro|Promote repeated command into CommanderLtd Ops|
|Output disappears|Result is not routed into session store|Capture stdout/stderr and expose in LoggerLtd|
|Risky action runs too easily|Missing confirmation or risk label|Add risk classification and confirmation gate|
|Product becomes cluttered|Buttons exist without protocol role|Remove or hide controls without local workflow receipt|

## Acceptance Criteria

-  RateLtd provides a single-window operating surface for local AI-assisted coding.
    
-  The product reduces manual copy/paste and context-switching.
    
-  Every macro or command has a visible UI receipt.
    
-  Every execution path produces captured output.
    
-  Every handoff can be pasted back into ChatGPT.
    
-  The TUI remains focused on operator-mediated local coding workflows.
    

## Verification Checklist

-  Namespace is correct.
    
-  Scope is explicit.
    
-  Domain boundary is clear.
    
-  Rules are testable.
    
-  Forbidden behavior is documented.
    
-  Dependencies are linked.
    
-  Implementation references can be added after repo audit.
    
-  This contract does not duplicate another active source-of-truth note.
    

## Open Questions

- Should CommanderLtd Clipboard and CommanderLtd Ops remain separate screens or become modes of one screen?
    
- Should handoff format be a visible top-level action across all screens?
    
- Should RateLtd show “next best action” based on repo state or only expose selectable macros?
    

## Changelog

|Date|Change|Reason|
|---|---|---|
|2026-05-07|Created|Converted local operations console doctrine into durable RateLtd product contract|

---

