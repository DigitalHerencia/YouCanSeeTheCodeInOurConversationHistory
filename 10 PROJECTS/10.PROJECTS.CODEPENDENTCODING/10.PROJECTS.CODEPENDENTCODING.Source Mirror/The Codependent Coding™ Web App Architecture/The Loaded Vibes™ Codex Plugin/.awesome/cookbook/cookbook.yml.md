---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\cookbook.yml'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\cookbook.yml'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.cookbook.cookbook.yml'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\cookbook.yml'
source_file: 'cookbook.yml'
source_sha256: 'a770d07339a4cac28c54d22271a192842589a6e9be5b980b952a04420e4bcfae'
generated: true
---

# `cookbook.yml`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\cookbook\cookbook.yml`
> SHA-256: `a770d07339a4cac28c54d22271a192842589a6e9be5b980b952a04420e4bcfae`

```yaml
# yaml-language-server: $schema=../.schemas/cookbook.schema.json
# Cookbook manifest for the Awesome GitHub Copilot website
# This file defines the structure of cookbooks and recipes for the Samples page

cookbooks:
  - id: copilot-sdk
    name: GitHub Copilot SDK
    description: Ready-to-use recipes for building with the GitHub Copilot SDK across multiple languages
    path: cookbook/copilot-sdk
    featured: true
    languages:
      - id: nodejs
        name: Node.js / TypeScript
        icon: "\uE628"
        extension: .ts
      - id: python
        name: Python
        icon: "\uE73C"
        extension: .py
      - id: dotnet
        name: .NET (C#)
        icon: "\uE648"
        extension: .cs
      - id: go
        name: Go
        icon: "\uE626"
        extension: .go
    recipes:
      - id: error-handling
        name: Error Handling
        description: Handle errors gracefully including connection failures, timeouts, and cleanup
        tags:
          - errors
          - basics
          - reliability
      - id: multiple-sessions
        name: Multiple Sessions
        description: Manage multiple independent conversations simultaneously
        tags:
          - sessions
          - advanced
          - concurrency
      - id: managing-local-files
        name: Managing Local Files
        description: Organize files by metadata using AI-powered grouping strategies
        tags:
          - files
          - organization
          - ai-powered
      - id: pr-visualization
        name: PR Visualization
        description: Generate interactive PR age charts using GitHub MCP Server
        tags:
          - github
          - visualization
          - mcp
      - id: persisting-sessions
        name: Persisting Sessions
        description: Save and resume sessions across restarts
        tags:
          - sessions
          - persistence
          - state-management
      - id: accessibility-report
        name: Accessibility Report
        description: Generate WCAG accessibility reports using the Playwright MCP server
        tags:
          - accessibility
          - playwright
          - mcp
          - wcag

  - id: community-samples
    name: Community Samples
    description: Community-contributed projects and examples for GitHub Copilot
    path: cookbook/community-samples
    featured: false
    languages: []
    recipes:
      - id: nodejs-agentic-issue-resolver
        name: Node.js Agentic Issue Resolver
        description: A resilient agentic workflow for autonomous codebase exploration and fixing, optimized for the Copilot SDK Technical Preview
        external: true
        url: https://github.com/Impesud/nodejs-copilot-issue-resolver
        author:
          name: Impesud
          url: https://github.com/Impesud
        tags:
          - nodejs
          - copilot-sdk
          - agents
          - community
      - id: copilot-sdk-web-app
        name: Copilot SDK Web App
        description: A full-stack chat application built with the GitHub Copilot SDK, .NET Aspire, and React with GitHub OAuth, session history, and model selection
        external: true
        url: https://github.com/aaronpowell/copilot-sdk-web-app
        author:
          name: aaronpowell
          url: https://github.com/aaronpowell
        tags:
          - dotnet
          - copilot-sdk
          - web-app
          - community
      - id: copilot-sdk-java-examples
        name: Copilot SDK Java Examples
        description: A web-based chat application built with the GitHub Copilot Java SDK, Jetty, with auth status, JSON API, chat, and CLI connectivity examples
        external: true
        url: https://github.com/thesurenk/github-copilot-java-examples
        author:
          name: thesurenk
          url: https://github.com/thesurenk
        tags:
          - java
          - copilot-sdk
          - web-app
          - cli
          - community

```