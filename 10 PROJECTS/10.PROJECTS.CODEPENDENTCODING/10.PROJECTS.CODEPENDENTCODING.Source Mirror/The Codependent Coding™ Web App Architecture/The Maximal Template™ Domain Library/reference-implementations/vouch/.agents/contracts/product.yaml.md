---
title: 'The Hipster Stack™ Technology Stack\template\reference-implementations\vouch\.agents\contracts\product.yaml'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\reference-implementations\vouch\.agents\contracts\product.yaml'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.reference-implementations.vouch.agents.contracts.product.yaml'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-hipster-stack-technology-stack
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Hipster Stack™ Technology Stack\template\reference-implementations\vouch\.agents\contracts\product.yaml'
source_file: 'product.yaml'
source_sha256: 'efe167bdcaa48beed1201863734620af782cfe937210ac481aee5c70f463cd53'
generated: true
---

# `product.yaml`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\reference-implementations\vouch\.agents\contracts\product.yaml`
> SHA-256: `efe167bdcaa48beed1201863734620af782cfe937210ac481aee5c70f463cd53`

```yaml
id: vouch.product
reference_scope: vouch-only
source_date: "2026-05-16"
authority: source-of-truth
definition: commitment-backed payment coordination
core_rule: both participants confirm inside the confirmation window before release can proceed
merchant_fee:
  due: committed_creation
  hosted_by: stripe
customer_authorization:
  hosted_by: stripe
  vouch_authority: workflow_truth_only
boundaries:
  not_scheduler: true
  not_messaging: true
  not_discretionary_outcome_system: true
  not_provider_discovery: true

```