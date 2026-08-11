---
title: RateLtd Protocol Completeness Contract
type: contract
scope: project
project: RateLtd
domain: product
artifact: protocol-completeness
kind: contract
namespace: rateltd.product.protocol-completeness.contract
status: active
authority: source-of-truth
parent: "[[rateltd.project.map]]"
depends_on:
  - "[[rateltd.product.local-context-protocol.contract]]"
  - "[[rateltd.product.local-operations-console.contract]]"
  - "[[rateltd.agent-ops.inference-efficiency-engineering.standard]]"
supersedes: []
tags:
  - projects/rateltd
  - contracts/product
  - rateltd/protocol
  - status/active
created: 2026-05-07
updated: 2026-08-11
---

# RateLtd Protocol Completeness Contract

## Contract Statement

RateLtd should pursue **protocol completeness**, not feature accumulation.

## Problem With Feature Accumulation

The old instinct in software is feature accumulation.

People often treat progress as adding:

- more capabilities
    
- more settings
    
- more integrations
    
- more surfaces
    
- more buttons
    
- more complexity
    

On paper, that looks like growth.

In practice, it often becomes vanity.

The product gets heavier. The architecture sprawls. Maintenance increases. Attention fragments. A large percentage of what gets built either goes unused or delivers marginal value.

In an agentic coding environment, this is especially expensive because every unnecessary abstraction, speculative service, and premature capability consumes:

- inference
    
- context window
    
- implementation effort
    
- rate-limited execution cycles
    

Feature chasing burns scarce intelligence on work that does not materially improve the system.

## Protocol Completeness Philosophy

Protocol completeness asks a better question:

> What interaction contract must be fully supported for this product to fulfill its purpose?

That question is tighter, sharper, and more disciplined than asking what else the product can do.

## Protocol Definition

A protocol is the complete loop of meaningful interaction between systems.

For RateLtd, the systems are:

- model intelligence
    
- local machine reality
    
- human supervision
    

The protocol is how those systems exchange:

- context
    
- execution
    
- mutation
    
- feedback
    

## Completion Standard

If that loop is complete, reliable, and deterministic, the product is complete in the only way that matters, even if it contains relatively few visible features.

Protocol completeness is not minimalism for its own sake.

It is not anti-infrastructure.

It simply demands justification.

## Infrastructure Rule

Every piece of infrastructure must directly support the protocol.

Every visible control must have a real behavioral contract.

Every output must feed the loop.

Every abstraction must earn its place by making the interaction:

- more complete
    
- more reliable
    
- more efficient
    

Anything else is ornamental complexity.

## Definition of Protocol-Complete

A protocol-complete system is not defined by breadth.

It is defined by closure.

The loop is whole.

Nothing necessary is missing.

Nothing unnecessary is consuming attention.

It is complete because its contract is complete.

## Required Protocol Loop

RateLtd is protocol-complete when the following loop is fully supported:

1. The operator selects a local target.
    
2. RateLtd gathers visible local truth.
    
3. ChatGPT receives model-usable context.
    
4. ChatGPT returns a command, file payload, work package, or question.
    
5. RateLtd previews and risk-labels the operation.
    
6. The operator approves or rejects.
    
7. RateLtd executes, writes, opens, or inspects.
    
8. RateLtd captures output.
    
9. RateLtd formats the result as handoff context.
    
10. The loop continues without losing state.
    

## Non-Negotiable Rule

No feature should exist merely because it is possible.

A feature is valid only when it improves the protocol loop.

## Failure Modes

|Failure|Cause|Required Handling|
|---|---|---|
|Product becomes broad but shallow|Features accumulate without protocol role|Remove or defer features without loop contribution|
|Architecture sprawls|Infrastructure is added before UI receipt|Require screen/control/output justification|
|Operator attention fragments|Product adds surfaces instead of closure|Collapse work into the core protocol loop|
|Codex burns tokens on vanity work|Prompts chase feature breadth|Recenter prompt around protocol completeness|
|Loop breaks after execution|Output is not captured or formatted|Route execution results into LoggerLtd/handoff packet|

## Acceptance Criteria

-  Every feature directly supports context, execution, mutation, feedback, or safety.
    
-  Every visible control has a behavioral contract.
    
-  Every output feeds the operator/model loop.
    
-  Every abstraction earns its place by improving protocol completeness.
    
-  No feature exists merely because it is possible.
    
-  The product is judged by loop closure, not feature count.
    

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

- What is the minimum implementation set required for RateLtd to be protocol-complete?
    
- Should “protocol incomplete” be a visible diagnostic state in RateLtd?
    
- Should each screen declare which part of the protocol loop it satisfies?
    

## Changelog

|Date|Change|Reason|
|---|---|---|
|2026-05-07|Created|Converted protocol completeness doctrine into durable RateLtd product contract|

