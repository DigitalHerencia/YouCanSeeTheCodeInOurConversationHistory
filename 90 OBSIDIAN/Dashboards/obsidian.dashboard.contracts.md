---
title: Contract Dashboard
type: dashboard
scope: vault
project:
domain: obsidian
artifact: contracts
kind: dashboard
namespace: obsidian.dashboard.contracts
status: active
authority: reference
parent:
depends_on:
  - "[[obsidian.contracts.property-schema]]"
supersedes: []
tags:
  - obsidian/dashboard
  - contracts
  - status/active
---

# Contract Dashboard

## Active Contracts

    TABLE project, domain, artifact, kind, status, authority
    FROM "10 PROJECTS" OR "90 OBSIDIAN"
    WHERE type = "contract" AND status = "active"
    SORT project ASC, domain ASC, artifact ASC

## Draft Contracts

    TABLE project, domain, artifact, kind, updated
    FROM "10 PROJECTS" OR "90 OBSIDIAN"
    WHERE type = "contract" AND status = "draft"
    SORT updated DESC

## Source-of-Truth Notes

    TABLE type, project, domain, artifact, status
    FROM ""
    WHERE authority = "source-of-truth"
    SORT project ASC, domain ASC

## Work Packages

    TABLE project, domain, status, updated
    FROM "10 PROJECTS"
    WHERE kind = "work-package"
    SORT updated DESC

## Note

Convert the indented Dataview queries into Dataview code blocks inside Obsidian if needed.
