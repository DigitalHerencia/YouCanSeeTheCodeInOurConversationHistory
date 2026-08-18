---
title: 'The Maximal Template™ Domain Library\.github\ISSUE_TEMPLATE\chore_request.yml'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\.github\ISSUE_TEMPLATE\chore_request.yml'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.github.issue-template.chore-request.yml'
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
source_path: 'The Maximal Template™ Domain Library\.github\ISSUE_TEMPLATE\chore_request.yml'
source_file: 'chore_request.yml'
source_sha256: '92d83eb660da6d43f4a7f7e7b49a40b1621ba1010b24f159fd809cf10190cafe'
generated: true
---

# `chore_request.yml`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\.github\ISSUE_TEMPLATE\chore_request.yml`
> SHA-256: `92d83eb660da6d43f4a7f7e7b49a40b1621ba1010b24f159fd809cf10190cafe`

```yaml
name: Task / Chore
description: Track bounded maintenance, conformance, refactoring, or tooling work.
title: ""
body:
  - type: textarea
    id: task
    attributes:
      label: Task
      description: What specifically must change?
    validations:
      required: true
  - type: textarea
    id: reason
    attributes:
      label: Reason
      description: Why is this work necessary now?
    validations:
      required: true
  - type: textarea
    id: boundaries
    attributes:
      label: Architectural boundaries
      description: Which Maximal Template contracts are affected?
  - type: textarea
    id: validation
    attributes:
      label: Validation
      description: Which repository-native checks establish completion?

```