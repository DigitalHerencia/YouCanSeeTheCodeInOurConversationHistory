---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\agent-plugin-schema.mjs'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\agent-plugin-schema.mjs'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.eng.agent-plugin-schema.mjs'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\agent-plugin-schema.mjs'
source_file: 'agent-plugin-schema.mjs'
source_sha256: 'ff2f1cf50b56a9e5a247a02f7b7ba8a2a5f3c9e9ba82628615fbd7f7f7611cb3'
generated: true
---

# `agent-plugin-schema.mjs`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\eng\agent-plugin-schema.mjs`
> SHA-256: `ff2f1cf50b56a9e5a247a02f7b7ba8a2a5f3c9e9ba82628615fbd7f7f7611cb3`

```javascript
import Ajv2020 from "ajv/dist/2020.js";

export const AGENT_PLUGIN_SCHEMA_URL = "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json";
export const AGENT_PLUGIN_SCHEMA = {
  $schema: "https://json-schema.org/draft/2020-12/schema",
  $id: AGENT_PLUGIN_SCHEMA_URL,
  type: "object",
  properties: {
    $schema: { const: AGENT_PLUGIN_SCHEMA_URL },
    name: { type: "string", minLength: 1, maxLength: 64, pattern: "^(?!.*(?:--|\\.\\.))[a-z0-9](?:[a-z0-9.-]*[a-z0-9])?$" },
    version: { type: "string" }, description: { type: "string" },
    author: { type: "object", properties: { name: { type: "string" }, email: { type: "string" }, url: { type: "string" } }, additionalProperties: false },
    homepage: { type: "string" }, repository: { type: "string" }, license: { type: "string" },
    keywords: { type: "array", items: { type: "string" } },
    extensions: { type: "object", additionalProperties: { type: "object" } },
  },
  required: ["$schema", "name"],
  additionalProperties: false,
};

const validate = new Ajv2020({ allErrors: true }).compile(AGENT_PLUGIN_SCHEMA);
export function validateAgentPluginManifest(manifest) {
  return validate(manifest) ? [] : (validate.errors ?? []).map((error) =>
    `${error.instancePath || "manifest"} ${error.message}`);
}

```