---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\deploy-website.yml'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\deploy-website.yml'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.github.workflows.deploy-website.yml'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\deploy-website.yml'
source_file: 'deploy-website.yml'
source_sha256: '1149080965bc7b349c07e2eb59adfecb7ebc6b4bc3689c203d71117594800f89'
generated: true
---

# `deploy-website.yml`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\deploy-website.yml`
> SHA-256: `1149080965bc7b349c07e2eb59adfecb7ebc6b4bc3689c203d71117594800f89`

```yaml
# GitHub Pages deployment workflow
# Builds the Astro website and deploys to GitHub Pages

name: Deploy Website to GitHub Pages

on:
  # Triggered manually from the Actions tab, or dispatched by the Publish to main workflow.
  workflow_dispatch:

# Sets permissions of the GITHUB_TOKEN to allow deployment to GitHub Pages
permissions:
  contents: read
  pages: write
  id-token: write

# Allow only one concurrent deployment, skipping runs queued between the run in-progress and latest queued.
# However, do NOT cancel in-progress runs as we want to allow these production deployments to complete.
concurrency:
  group: "pages"
  cancel-in-progress: false

jobs:
  # Build job
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@34e114876b0b11c390a56381ad16ebd13914f8d5 # v4.3.1
        with:
          fetch-depth: 0 # Full history needed for git-based last updated dates

      - name: Setup Node.js
        uses: actions/setup-node@49933ea5288caeca8642d1e84afbd3f7d6820020 # v4.4.0
        with:
          node-version: "22"
          cache: "npm"

      - name: Install root dependencies
        run: npm ci

      - name: Install website dependencies
        run: npm ci
        working-directory: ./website

      - name: Generate website data
        run: npm run website:data

      - name: Build Astro site
        run: npm run build
        working-directory: ./website

      - name: Setup Pages
        uses: actions/configure-pages@983d7736d9b0ae728b81ab479565c72886d7745b # v5.0.0

      - name: Upload artifact
        uses: actions/upload-pages-artifact@56afc609e74202658d3ffba0e8f6dda462b719fa # v3.0.1
        with:
          path: "./website/dist"

  # Deployment job
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@d6db90164ac5ed86f2b6aed7e0febac5b3c0c03e # v4.0.5

```