---
title: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\constants.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\constants.ts'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.scripts.constants.ts'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\constants.ts'
source_file: 'constants.ts'
source_sha256: 'd5cfa3a5cb909991521637a9bfe92da301967b2cd3856e891a457c373abc2517'
generated: true
---

# `constants.ts`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\scripts\constants.ts`
> SHA-256: `d5cfa3a5cb909991521637a9bfe92da301967b2cd3856e891a457c373abc2517`

```ts
import path from "path";

// ESM-safe __dirname equivalent (NodeNext)

const __dirname = path.dirname(__filename);

// Template sections for the README
export interface Templates {
  instructionsSection: string;
  instructionsUsage: string;
  promptsSection: string;
  promptsUsage: string;
  collectionsSection: string;
  collectionsUsage: string;
  featuredCollectionsSection: string;
  agentsSection: string;
  agentsUsage: string;
  skillsSection: string;
  skillsUsage: string;
}

/**
 * README copy is intentionally aligned to:
 * - templates/TEMPLATES_MASTER_SPECIFICATION.md (canonical directories + file types)
 * - AGENTS.md (repo structure)
 */
export const TEMPLATES: Templates = {
  instructionsSection: `## 📋 Custom Instructions

Instruction files (\`*.instructions.md\`) that apply coding standards and guidance for specific file patterns.`,

  instructionsUsage: `### How to Use Custom Instructions

**In this repository:**
- Instruction assets live in \`instructions/\` and use the \`*.instructions.md\` extension.

**In your own workspace/repository:**
- Add instruction files to the location your Copilot setup expects (commonly under \`.github/\` in a consuming repo).
- Ensure each instructions file includes YAML frontmatter with:
  - \`description: '...'\`
  - \`applyTo: '...'\``,

  promptsSection: `## 🎯 Reusable Prompts

Prompt files (\`*.prompt.md\`) for task-specific workflows in Copilot Chat. Prompts can specify an agent, model, and available tools.`,

  promptsUsage: `### How to Use Reusable Prompts

**In this repository:**
- Prompt assets live in \`prompts/\` and use the \`*.prompt.md\` extension.

**In your own workspace/repository:**
- Install/copy the prompt file into your prompt location and run it via:
  - Typing \`/prompt-name\` in chat
  - Command Palette → "Chat: Run Prompt"
- Prompts must include YAML frontmatter with:
  - \`description: '...'\`
  - \`agent: 'agent'\` (unless intentionally targeting another agent)`,

  collectionsSection: `## 📦 Collections

Curated collections of related prompts, instructions, agents, and skills organized around specific themes or workflows.`,

  collectionsUsage: `### How to Use Collections

- Browse curated groupings of related assets.
- Install items individually or adopt a collection as a toolkit.
- Validate collection manifests with \`npm run collection:validate\`.`,

  featuredCollectionsSection: `## 🌟 Featured Collections

Curated collections of prompts, instructions, agents, and skills organized around specific themes and workflows.`,

  agentsSection: `## 🤖 Custom Agents

Custom agent definitions (\`*.agent.md\`) that specialize Copilot chat behavior and optionally configure tool access (including MCP).`,

  agentsUsage: `### How to Use Custom Agents

**In this repository:**
- Agent assets live in \`agents/\` and use the \`*.agent.md\` extension.

**In your own workspace/repository:**
- Copy the agent file into your agent location.
- Ensure agent frontmatter includes:
  - \`description: '...'\` (required)
- Optionally add \`tools:\`, \`model:\`, and MCP configuration depending on target.`,

  skillsSection: `## 🎯 Agent Skills

Agent Skills are self-contained folders under \`skills/\` with a \`SKILL.md\` and optional bundled assets. Skills follow the Agent Skills specification and are validated via \`npm run skill:validate\`.`,

  skillsUsage: `### How to Use Agent Skills

- Each skill is a folder under \`skills/<skill-name>/\` containing \`SKILL.md\`.
- Skills may include bundled assets (scripts, templates, reference data).
- Run \`npm run skill:validate\` to validate skill structure and constraints.`,
};

export const vscodeInstallImage =
  "https://img.shields.io/badge/VS_Code-Install-0098FF?style=flat-square&logo=visualstudiocode&logoColor=white";

export const vscodeInsidersInstallImage =
  "https://img.shields.io/badge/VS_Code_Insiders-Install-24bfa5?style=flat-square&logo=visualstudiocode&logoColor=white";

export const repoBaseUrl =
  "https://raw.githubusercontent.com/github/awesome-copilot/main";

export interface AkaInstallUrls {
  instructions: string;
  prompt: string;
  agent: string;
}

export const AKA_INSTALL_URLS: AkaInstallUrls = {
  instructions: "https://aka.ms/awesome-copilot/install/instructions",
  prompt: "https://aka.ms/awesome-copilot/install/prompt",
  agent: "https://aka.ms/awesome-copilot/install/agent",
};

export const ROOT_FOLDER: string = path.join(__dirname, "..");

export const INSTRUCTIONS_DIR: string = path.join(ROOT_FOLDER, "instructions");
export const PROMPTS_DIR: string = path.join(ROOT_FOLDER, "prompts");
export const AGENTS_DIR: string = path.join(ROOT_FOLDER, "agents");
export const SKILLS_DIR: string = path.join(ROOT_FOLDER, "skills");
export const COLLECTIONS_DIR: string = path.join(ROOT_FOLDER, "collections");
export const DOCS_DIR: string = path.join(ROOT_FOLDER, "docs");

export const MAX_COLLECTION_ITEMS: number = 50;

// Canonical naming rules (templates/TEMPLATES_MASTER_SPECIFICATION.md)
export const LOWER_HYPHEN_NAME_RE = /^[a-z0-9-]+$/;

// Extensions
export const AGENT_FILE_SUFFIX = ".agent.md";
export const PROMPT_FILE_SUFFIX = ".prompt.md";
export const INSTRUCTIONS_FILE_SUFFIX = ".instructions.md";

// Agent Skills validation constants (unchanged; spec-defined)
export const SKILL_NAME_MIN_LENGTH: number = 1;
export const SKILL_NAME_MAX_LENGTH: number = 64;
export const SKILL_DESCRIPTION_MIN_LENGTH: number = 10;
export const SKILL_DESCRIPTION_MAX_LENGTH: number = 1024;

```