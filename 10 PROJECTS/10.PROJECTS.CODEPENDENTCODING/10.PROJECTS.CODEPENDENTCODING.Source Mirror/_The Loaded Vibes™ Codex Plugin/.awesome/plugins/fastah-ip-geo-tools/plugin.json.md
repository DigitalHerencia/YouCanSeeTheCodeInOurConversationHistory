---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\fastah-ip-geo-tools\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\fastah-ip-geo-tools\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.fastah-ip-geo-tools.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\fastah-ip-geo-tools\plugin.json'
source_file: 'plugin.json'
source_sha256: '15a2c4f886312325b294dce57e7d9f2b031c4f199647775339a503dc84068508'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\fastah-ip-geo-tools\plugin.json`
> SHA-256: `15a2c4f886312325b294dce57e7d9f2b031c4f199647775339a503dc84068508`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "fastah-ip-geo-tools",
  "description": "This plugin is for network operations engineers who wish to tune and publish IP geolocation feeds in RFC 8805 format. It consists of an AI Skill and an associated MCP server that geocodes geolocation place names to real cities for accuracy.",
  "version": "0.0.9",
  "author": {
    "name": "Fastah Inc.",
    "url": "https://getfastah.com"
  },
  "repository": "https://github.com/github/awesome-copilot",
  "license": "Apache-2.0",
  "keywords": [
    "geofeed",
    "ip-geolocation",
    "rfc-8805",
    "rfc-9632",
    "network-operations",
    "isp",
    "cloud",
    "hosting",
    "ixp"
  ],
  "extensions": {
    "com.github.awesome-copilot": {
      "skills": [
        "./skills/geofeed-tuner/"
      ]
    }
  }
}

```