---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\pr-artifact-explorer\security.mjs'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\pr-artifact-explorer\security.mjs'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.extensions.pr-artifact-explorer.security.mjs'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\pr-artifact-explorer\security.mjs'
source_file: 'security.mjs'
source_sha256: '8097533291444ad4e187b0c995dd8624dd2a134358f13cb6a0f97bfcc66261c0'
generated: true
---

# `security.mjs`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\extensions\pr-artifact-explorer\security.mjs`
> SHA-256: `8097533291444ad4e187b0c995dd8624dd2a134358f13cb6a0f97bfcc66261c0`

```javascript
export const CAPABILITY_TOKEN_HEADER = "x-pr-artifact-explorer-token";

export function isCanonicalHost(req, canonicalHost) {
  return (
    String(req.headers.host ?? "").toLowerCase() ===
    String(canonicalHost ?? "").toLowerCase()
  );
}

export function isCrossSiteRequest(req, canonicalOrigin) {
  const origin = req.headers.origin;
  if (origin) {
    if (origin === canonicalOrigin) return false;
    if (origin === "null") return true;
    if (/^https?:\/\//i.test(origin)) return true;
    return false;
  }
  const site = req.headers["sec-fetch-site"];
  return site === "cross-site" || site === "same-site";
}

export function requiresCapabilityToken(pathname) {
  return (
    pathname.startsWith("/api/") ||
    pathname.startsWith("/content/") ||
    pathname === "/events"
  );
}

export function hasCapabilityToken(req, url, expectedToken) {
  if (!expectedToken) return false;
  const header = req.headers[CAPABILITY_TOKEN_HEADER];
  const headerToken = Array.isArray(header) ? header[0] : header;
  if (headerToken === expectedToken) return true;
  const allowsQueryToken =
    url.pathname.startsWith("/content/") || url.pathname === "/events";
  return allowsQueryToken && url.searchParams.get("token") === expectedToken;
}

```