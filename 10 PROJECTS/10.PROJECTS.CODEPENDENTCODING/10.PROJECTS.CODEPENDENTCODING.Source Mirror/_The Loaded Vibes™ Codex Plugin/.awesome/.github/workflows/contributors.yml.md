---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\contributors.yml'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\contributors.yml'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.github.workflows.contributors.yml'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\contributors.yml'
source_file: 'contributors.yml'
source_sha256: '1949a91df8d3d3bdf5394d87d3c35ea48271a83c493dac6286b6d89d163175a8'
generated: true
---

# `contributors.yml`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\contributors.yml`
> SHA-256: `1949a91df8d3d3bdf5394d87d3c35ea48271a83c493dac6286b6d89d163175a8`

```yaml
name: Contributors

on:
  schedule:
    - cron: '0 3 * * 0' # Weekly on Sundays at 3am UTC
  workflow_dispatch: # Manual trigger

jobs:
  contributors:
    runs-on: ubuntu-latest
    timeout-minutes: 5
    permissions:
      contents: write
      pull-requests: write
    steps:
      - name: Checkout
        uses: actions/checkout@de0fac2e4500dabe0009e67214ff5f5447ce83dd # v6.0.2
        with:
          fetch-depth: 0
          ref: main

      - name: Extract Node version from package.json
        id: node-version
        run: |
          NODE_VERSION=$(jq -r '.engines.node // "22.x"' package.json)
          echo "version=${NODE_VERSION}" >> "$GITHUB_OUTPUT"

      - name: Setup Node.js
        uses: actions/setup-node@53b83947a5a98c8d113130e565377fae1a50d02f # v6.3.0
        with:
          node-version: ${{ steps.node-version.outputs.version }}

      - name: Install dependencies
        run: npm ci

      - name: Check contributors
        id: contributors_check
        run: npm run contributors:check
        env:
          PRIVATE_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        continue-on-error: true

      - name: Generate contributors report
        if: steps.contributors_check.outcome == 'failure'
        run: |
          mkdir -p reports
          npm run contributors:report
          test -f reports/contributor-report.md && cat reports/contributor-report.md >> "$GITHUB_STEP_SUMMARY"
        env:
          PRIVATE_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        continue-on-error: true

      - name: Regenerate README
        run: npm start

      - name: Check for changes
        id: verify-changed-files
        run: |
          if git diff --exit-code > /dev/null; then
            echo "changed=false" >> $GITHUB_OUTPUT
          else
            echo "changed=true" >> $GITHUB_OUTPUT
          fi

      - name: Commit contributors
        if: steps.verify-changed-files.outputs.changed == 'true'
        run: |
          git config --local user.email "action@github.com"
          git config --local user.name "GitHub Action"
          git add .
          git commit -m "docs: update contributors" -a || exit 0

      - name: Create Pull Request
        if: steps.verify-changed-files.outputs.changed == 'true'
        uses: peter-evans/create-pull-request@22a9089034f40e5a961c8808d113e2c98fb63676 # v7.0.11
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
          base: main
          commit-message: "docs: update contributors"
          title: "Update Contributors"
          body: |
            Auto-generated PR to update contributors.

            This PR was automatically created by the contributors workflow.
          branch: update-contributors
          delete-branch: true

```