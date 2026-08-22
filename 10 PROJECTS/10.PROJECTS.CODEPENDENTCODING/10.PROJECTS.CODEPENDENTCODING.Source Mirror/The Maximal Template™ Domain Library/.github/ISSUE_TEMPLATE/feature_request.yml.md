---
title: 'The Maximal Template™ Domain Library\.github\ISSUE_TEMPLATE\feature_request.yml'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\.github\ISSUE_TEMPLATE\feature_request.yml'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.github.issue-template.feature-request.yml'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-maximal-template-domain-library
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Maximal Template™ Domain Library\.github\ISSUE_TEMPLATE\feature_request.yml'
source_file: 'feature_request.yml'
source_sha256: 'de6850a3de006c078797d2971be740f5f04268804c32aa16a1163db88f52f79c'
generated: true
---

# `feature_request.yml`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\.github\ISSUE_TEMPLATE\feature_request.yml`
> SHA-256: `de6850a3de006c078797d2971be740f5f04268804c32aa16a1163db88f52f79c`

```yaml
name: Feature
description: Propose a bounded product capability or recipe/foundation addition.
title: ""
body:
  - type: textarea
    id: outcome
    attributes:
      label: Outcome
      description: What user/product outcome should exist?
    validations:
      required: true
  - type: textarea
    id: scope
    attributes:
      label: Scope
      description: Which shared-foundation or recipe capability changes?
    validations:
      required: true
  - type: textarea
    id: layers
    attributes:
      label: Expected layers
      description: Identify likely routes, features, blocks, fetchers/actions, db helpers, workflows, auth/authz, integrations, schemas, or types.
  - type: textarea
    id: acceptance
    attributes:
      label: Acceptance criteria
      description: State observable completion criteria.
    validations:
      required: true

```