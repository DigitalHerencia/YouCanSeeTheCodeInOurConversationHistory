---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\azure-developer-cli\examples\azure.yaml'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\azure-developer-cli\examples\azure.yaml'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.azure-developer-cli.examples.azure.yaml'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-loaded-vibes-codex-plugin
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\azure-developer-cli\examples\azure.yaml'
source_file: 'azure.yaml'
source_sha256: 'eef1a3f2a99bec511300f8ad12ffee17007f445ee242c9d39985f12d96ef08c0'
generated: true
---

# `azure.yaml`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\azure-developer-cli\examples\azure.yaml`
> SHA-256: `eef1a3f2a99bec511300f8ad12ffee17007f445ee242c9d39985f12d96ef08c0`

```yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: sample-app

infra:
  provider: bicep
  path: ./infra
  module: main

services:
  api:
    project: ./src/api
    language: ts
    host: appservice
  web:
    project: ./src/web
    dist: dist
    language: ts
    host: staticwebapp

# Add hooks only when the default lifecycle cannot express the requirement.
# Keep nontrivial commands in scripts/azd and provide both OS variants.
hooks:
  preprovision:
    windows:
      shell: pwsh
      run: ./scripts/azd/validate.ps1
      interactive: false
      continueOnError: false
    posix:
      shell: sh
      run: ./scripts/azd/validate.sh
      interactive: false
      continueOnError: false

```