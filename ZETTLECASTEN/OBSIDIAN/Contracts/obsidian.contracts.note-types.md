---
title: Obsidian Contract Note Types
type: standard
scope: vault
project:
domain: obsidian
artifact: note-types
kind: standard
namespace: obsidian.contracts.note-types
status: active
authority: source-of-truth
parent: "[[obsidian.contracts.naming-standard]]"
depends_on:
  - "[[obsidian.contracts.property-schema]]"
supersedes: []
tags:
  - obsidian/contracts
  - obsidian/note-types
  - status/active
created:
updated: 2026-08-18
---
# Obsidian Contract Note Types

## Contract

A durable rule document.

Contracts define what must be true, what must not happen, and how work is judged.

## Map

A navigation note that gathers links and summaries for a vault area, project, domain, or topic.

## Workflow

A repeatable operating procedure.

## Reference

Stable supporting knowledge about a tool, standard, concept, API, library, or external source.

## Research

Exploratory or investigative material.

Research may later produce contracts, references, or project decisions.

## Writing

Essays, articles, personal writing, drafts, and other authored material.

## Execution

Current work state such as plans, task notes, progress records, decision logs, or implementation status.

## Template

A reusable starting structure for creating another note.

## Dashboard

A note that presents generated or queried information as an operating view.

## Standard

A vault-wide or project-wide convention governing how information is structured or handled.

## Legacy

Preserved material that may still contain useful information but is no longer authoritative.

## Capture

Raw or unfinished material that has not yet been classified as a durable note.

## Source Document

A primary context document that defines the purpose, boundaries, or operating context of a vault or project.

## Work Package

A bounded implementation or maintenance task for ChatGPT, Codex, or the user.

## Handoff

A state-transfer note containing enough context for work to continue without rediscovery.

## Checklist

A repeatable list of verification or completion items.

## Schema

A structured definition of properties, fields, allowed values, or document shape.

## Simple

A first-class Codependent Coding knowledge record representing exactly one real source file.

A Simple note is not merely prose documentation about a file. It is the knowledge representation of that file and may contain:

- the canonical Codependent Coding architectural contract;
- source identity and canonical path;
- direct relationships to other Simples;
- required, permitted, conditional, and prohibited composition rules;
- derived backlinks and Dataview analysis;
- canonicalization, demo, hardening, and generation-readiness state;
- the public-demo golden prototype;
- the hardened golden prototype;
- validation, test, security, and provenance evidence.

The architectural class of the represented file is recorded in `simple_type` rather than by inventing a new vault note type for every code responsibility.

## Rule

Do not force every note to become a contract.

Use:

- contracts for durable rules
- maps for navigation
- workflows for repeatable procedures
- references for stable knowledge
- research for investigation
- execution notes for active work
- captures for unfinished material
- templates for reusable structure
- simples for one-file Codependent Coding knowledge records
- legacy notes for preserved non-authoritative material
