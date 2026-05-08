---

title: RateLtd Local Context Protocol Contract  
type: contract  
scope: project  
project: RateLtd  
domain: product  
artifact: local-context-protocol  
kind: product-definition  
namespace: rateltd.product.local-context-protocol.contract  
status: active  
authority: source-of-truth  
parent: [[rateltd.project.map]]  
depends_on:
- [[rateltd.product.vision]]   
- [[rateltd.features.inventory]]  
supersedes: []  
tags:
- projects/rateltd
- domains/product 
- types/contract
- kinds/product-definition
- status/active
- rateltd/protocol  
created: 2026-05-07  
updated: 2026-05-07

---

# RateLtd Local Context Protocol Contract

## Contract Statement

RateLtd is not merely a cockpit.

RateLtd is a **local context protocol surface**.

It is the shared interface contract between ChatGPT and the local machine, with Ivan as the authorized operator.

## Product Framing

RateLtd exists because ChatGPT needs reliable local truth from the codebase, but cannot safely or directly operate the local machine by itself.

RateLtd provides the structured protocol surface between:

- model intelligence
    
- local repository state
    
- command execution
    
- file mutation
    
- output capture
    
- human authorization
    

## Local Truth RateLtd Must Provide

RateLtd should expose the kinds of local truth ChatGPT needs:

- current target
    
- file tree
    
- selected files
    
- relevant file contents
    
- package scripts
    
- Git status
    
- diffs
    
- command output
    
- errors
    
- logs
    
- settings
    
- recent run/session history
    

## Model-Consumable Requests

ChatGPT should be able to ask RateLtd for predictable local context and operations, including:

- give me repo summary
    
- give me diff
    
- run verify
    
- apply this file payload
    
- open or preview file
    
- export handoff packet
    
- show latest command failure
    
- copy sanitized session context
    

## Human Role

Ivan stays in the loop, but stops being the harness.

The human operator role becomes:

- approve
    
- trigger
    
- observe
    
- paste the handoff back
    
- decide when to escalate to Codex
    

## TUI Role

RateLtd’s role is to:

- gather local truth
    
- run safe macros
    
- apply generated payloads
    
- capture results
    
- format outputs for the model
    
- prevent sloppy human copy/paste errors
    

## Canonical Doctrine

Every RateLtd feature exists because ChatGPT needs one of four things from the local repo:

1. **Context**
    
2. **Execution**
    
3. **Mutation**
    
4. **Feedback**
    

Safety gates exist to make those four operations survivable under tired-human, rate-limited, high-context conditions.

## Feature Taxonomy

### Context Providers

Screens and modules that gather and expose local state.

Examples:

- LauncherLtd
    
- EditorLtd
    
- DifferLtd
    
- LoggerLtd
    

### Execution Providers

Screens and modules that run commands or macros.

Examples:

- CommanderLtd Ops
    
- PowerShell macros
    
- package scripts
    
- Git macros
    

### Mutation Providers

Screens and modules that change files, settings, Git state, or local configuration.

Examples:

- clipboard file writes
    
- Git stage/restore
    
- settings writes
    

### Feedback Providers

Screens and modules that capture results and return usable context to the model.

Examples:

- LoggerLtd output
    
- sessions
    
- diagnostics
    
- export handoff
    

### Safety Gates

Controls that protect the operator and repository from unsafe or sloppy execution.

Examples:

- confirmation
    
- redaction
    
- path guards
    
- risk labels
    
- dry preview
    

## Non-Negotiable Build Instruction

Do not build features for Ivan to manually operate a dev tool.

Build protocol surfaces that let Ivan safely mediate between ChatGPT and the local codebase.

## Required Invariants

- RateLtd must always know its current target.
    
- RateLtd must distinguish generic folders from Git repositories.
    
- RateLtd must treat local machine state as model-consumable context.
    
- RateLtd must make mutation previewable before it becomes destructive.
    
- RateLtd must capture command output as reusable session context.
    
- RateLtd must keep Ivan as the authorized operator.
    

## Failure Modes

|Failure|Cause|Required Handling|
|---|---|---|
|Model receives stale state|Local truth was not refreshed before handoff|Provide explicit refresh action and timestamped context packet|
|Human miscopies payload|Manual copy/paste remains too involved|Prefer structured clipboard/file-payload parsing|
|Unsafe write occurs|Mutation provider lacks preview or path guard|Require preview, confirmation, and target-bound path safety|
|Command output is lost|Execution result is not logged|Route stdout/stderr into LoggerLtd/session store|
|TUI becomes generic dev tool|Features are added without protocol role|Reject feature unless it supports context, execution, mutation, feedback, or safety|

## Acceptance Criteria

-  Each RateLtd feature maps to context, execution, mutation, feedback, or safety.
    
-  Each visible action returns model-usable output or operator-usable state.
    
-  Each mutation path includes preview, confirmation, or safety handling.
    
-  Each command output can be captured into a handoff or session context.
    
-  The product remains a protocol surface, not a general-purpose IDE.
    

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

- Should ChatGPT-facing handoff packets use one canonical schema across all RateLtd screens?
    
- Should RateLtd expose separate context packet types for repo summary, diff, error report, and session handoff?
    
- Should safety gates be centralized as a shared protocol layer or owned per provider?
    

## Changelog

|Date|Change|Reason|
|---|---|---|
|2026-05-07|Created|Converted protocol doctrine into durable RateLtd product contract|

---

