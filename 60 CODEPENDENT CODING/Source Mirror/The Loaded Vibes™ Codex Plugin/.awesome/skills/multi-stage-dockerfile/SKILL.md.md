---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\multi-stage-dockerfile\SKILL.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\multi-stage-dockerfile\SKILL.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.multi-stage-dockerfile.skill.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\multi-stage-dockerfile\SKILL.md'
source_file: 'SKILL.md'
source_sha256: '7dfea7d31f3744930cb07869e15a79f90dbd47d2ddc56d165715fbd257db9ba7'
generated: true
---

# `SKILL.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\multi-stage-dockerfile\SKILL.md`
> SHA-256: `7dfea7d31f3744930cb07869e15a79f90dbd47d2ddc56d165715fbd257db9ba7`

```markdown
---
name: multi-stage-dockerfile
description: 'Create optimized multi-stage Dockerfiles for any language or framework'
---

Your goal is to help me create efficient multi-stage Dockerfiles that follow best practices, resulting in smaller, more secure container images.

## Multi-Stage Structure

- Use a builder stage for compilation, dependency installation, and other build-time operations
- Use a separate runtime stage that only includes what's needed to run the application
- Copy only the necessary artifacts from the builder stage to the runtime stage
- Use meaningful stage names with the `AS` keyword (e.g., `FROM node:18 AS builder`)
- Place stages in logical order: dependencies → build → test → runtime

## Base Images

- Start with official, minimal base images when possible
- Specify exact version tags to ensure reproducible builds (e.g., `python:3.11-slim` not just `python`)
- Consider distroless images for runtime stages where appropriate
- Use Alpine-based images for smaller footprints when compatible with your application
- Ensure the runtime image has the minimal necessary dependencies

## Layer Optimization

- Organize commands to maximize layer caching
- Place commands that change frequently (like code changes) after commands that change less frequently (like dependency installation)
- Use `.dockerignore` to prevent unnecessary files from being included in the build context
- Combine related RUN commands with `&&` to reduce layer count
- Consider using COPY --chown to set permissions in one step

## Security Practices

- Avoid running containers as root - use `USER` instruction to specify a non-root user
- Remove build tools and unnecessary packages from the final image
- Scan the final image for vulnerabilities
- Set restrictive file permissions
- Use multi-stage builds to avoid including build secrets in the final image

## Performance Considerations

- Use build arguments for configuration that might change between environments
- Leverage build cache efficiently by ordering layers from least to most frequently changing
- Consider parallelization in build steps when possible
- Set appropriate environment variables like NODE_ENV=production to optimize runtime behavior
- Use appropriate healthchecks for the application type with the HEALTHCHECK instruction

```