---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\pr-risk-scan-comment.yml'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\pr-risk-scan-comment.yml'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.github.workflows.pr-risk-scan-comment.yml'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\pr-risk-scan-comment.yml'
source_file: 'pr-risk-scan-comment.yml'
source_sha256: '797299111a8880f5c3b356246865b276e78f6e18900425c42a743ec1048185e5'
generated: true
---

# `pr-risk-scan-comment.yml`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\.github\workflows\pr-risk-scan-comment.yml`
> SHA-256: `797299111a8880f5c3b356246865b276e78f6e18900425c42a743ec1048185e5`

```yaml
name: PR Risk Scan — Comment

on:
  workflow_run:
    workflows: ["PR Risk Scan — Gate"]
    types: [completed]

permissions:
  issues: write
  pull-requests: write
  actions: read

jobs:
  comment:
    runs-on: ubuntu-latest
    if: github.event.workflow_run.event == 'pull_request'
    steps:
      - name: Download scan artifact
        id: download
        continue-on-error: true
        uses: actions/download-artifact@3e5f45b2cfb9172054b4087a40e8e0b5a5461e7c # v8.0.1
        with:
          name: pr-risk-scan-results
          run-id: ${{ github.event.workflow_run.id }}
          github-token: ${{ github.token }}

      - name: Upsert PR comment
        uses: actions/github-script@f28e40c7f34bde8b3046d885e986cb6290c5673b # v7.1.0
        with:
          script: |
            const fs = require('fs');
            const marker = '<!-- pr-risk-scan-results -->';
            const reportPath = 'report.md';
            const prNumberPath = 'pr-number.txt';

            if (!fs.existsSync(reportPath)) {
              core.warning('Risk scan report.md artifact was not found. Skipping comment update.');
              return;
            }

            let body = fs.readFileSync(reportPath, 'utf8');

            // Treat artifact content as untrusted (the gate workflow runs on PR code).
            // Prevent spam/notification abuse and avoid API failures on oversized bodies.
            body = body.replace(/@/g, '@\u200b');
            const maxLength = 65000;
            if (body.length > maxLength) {
              body = `${body.slice(0, maxLength)}\n\n_...(truncated)..._`;
            }
            if (!body.includes(marker)) {
              body = `${marker}\n${body}`;
            }
            let prNumber = null;
            if (fs.existsSync(prNumberPath)) {
              const parsed = parseInt(fs.readFileSync(prNumberPath, 'utf8').trim(), 10);
              if (!Number.isNaN(parsed)) {
                prNumber = parsed;
              }
            }

            if (!prNumber) {
              const fallback = context.payload.workflow_run.pull_requests?.[0]?.number;
              if (fallback) {
                prNumber = fallback;
              }
            }

            if (!prNumber) {
              core.warning('Could not determine PR number for comment upsert. Skipping.');
              return;
            }

            const { data: comments } = await github.rest.issues.listComments({
              owner: context.repo.owner,
              repo: context.repo.repo,
              issue_number: prNumber,
              per_page: 100,
            });

            const existing = comments.find((comment) => comment.body.includes(marker));

            if (existing) {
              await github.rest.issues.updateComment({
                owner: context.repo.owner,
                repo: context.repo.repo,
                comment_id: existing.id,
                body,
              });
              console.log(`Updated existing risk scan comment ${existing.id}`);
            } else {
              await github.rest.issues.createComment({
                owner: context.repo.owner,
                repo: context.repo.repo,
                issue_number: prNumber,
                body,
              });
              console.log('Created new risk scan comment');
            }

```