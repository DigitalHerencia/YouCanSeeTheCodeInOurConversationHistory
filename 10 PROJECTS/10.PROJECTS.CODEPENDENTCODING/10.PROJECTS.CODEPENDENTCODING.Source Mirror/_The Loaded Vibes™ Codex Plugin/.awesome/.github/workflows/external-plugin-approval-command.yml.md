---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\external-plugin-approval-command.yml'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\external-plugin-approval-command.yml'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.github.workflows.external-plugin-approval-command.yml'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\external-plugin-approval-command.yml'
source_file: 'external-plugin-approval-command.yml'
source_sha256: '3e475cdd695504aa9ba7a3cd1d301061920862ed27179b495c3e71e16b33d4c3'
generated: true
---

# `external-plugin-approval-command.yml`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\external-plugin-approval-command.yml`
> SHA-256: `3e475cdd695504aa9ba7a3cd1d301061920862ed27179b495c3e71e16b33d4c3`

```yaml
name: External Plugin Approval Commands

on:
  pull_request:
    types: [closed]

concurrency:
  group: external-plugin-approval-pr-${{ github.event.pull_request.number }}
  cancel-in-progress: false

permissions:
  pull-requests: write
  contents: read

jobs:
  sync-merged-pr-labels:
    runs-on: ubuntu-latest
    if: >-
      github.event.pull_request.merged == true &&
      contains(github.event.pull_request.labels.*.name, 'external-plugin')
    steps:
      - name: Normalize merged external plugin PR labels
        uses: actions/github-script@f28e40c7f34bde8b3046d885e986cb6290c5673b # v7.1.0
        with:
          script: |
            const prNumber = context.payload.pull_request.number;
            const staleLabels = ['awaiting-review', 'awaiting-approval', 'ready-for-review', 'rejected'];

            const { data: currentLabels } = await github.rest.issues.listLabelsOnIssue({
              owner: context.repo.owner,
              repo: context.repo.repo,
              issue_number: prNumber,
              per_page: 100
            });
            const labelNames = new Set(currentLabels.map((label) => label.name));

            if (!labelNames.has('approved')) {
              await github.rest.issues.addLabels({
                owner: context.repo.owner,
                repo: context.repo.repo,
                issue_number: prNumber,
                labels: ['approved']
              });
            }

            for (const labelName of staleLabels) {
              if (!labelNames.has(labelName)) {
                continue;
              }

              await github.rest.issues.removeLabel({
                owner: context.repo.owner,
                repo: context.repo.repo,
                issue_number: prNumber,
                name: labelName
              });
            }

```