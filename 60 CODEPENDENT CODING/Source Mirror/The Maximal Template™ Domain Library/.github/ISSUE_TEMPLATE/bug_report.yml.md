---
title: 'The Maximal Template™ Domain Library\.github\ISSUE_TEMPLATE\bug_report.yml'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\.github\ISSUE_TEMPLATE\bug_report.yml'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.github.issue-template.bug-report.yml'
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
source_path: 'The Maximal Template™ Domain Library\.github\ISSUE_TEMPLATE\bug_report.yml'
source_file: 'bug_report.yml'
source_sha256: '6eb9415df48d1b0532c99ba236763421704ac330c99d3e8a6ef86e4f4ce9635f'
generated: true
---

# `bug_report.yml`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\.github\ISSUE_TEMPLATE\bug_report.yml`
> SHA-256: `6eb9415df48d1b0532c99ba236763421704ac330c99d3e8a6ef86e4f4ce9635f`

```yaml
name: Bug
description: Report behavior that is broken or violates an established contract.
title: ""
body:
  - type: textarea
    id: problem
    attributes:
      label: Problem
      description: What is broken?
    validations:
      required: true
  - type: textarea
    id: evidence
    attributes:
      label: Evidence / reproduction
      description: Provide the smallest useful reproduction, logs, screenshots, or observed behavior.
    validations:
      required: true
  - type: textarea
    id: contract
    attributes:
      label: Affected contract
      description: Identify the relevant route, feature, presentation, data, auth/authz, integration, workflow, or recipe boundary.
  - type: textarea
    id: expected
    attributes:
      label: Expected behavior
    validations:
      required: true

```