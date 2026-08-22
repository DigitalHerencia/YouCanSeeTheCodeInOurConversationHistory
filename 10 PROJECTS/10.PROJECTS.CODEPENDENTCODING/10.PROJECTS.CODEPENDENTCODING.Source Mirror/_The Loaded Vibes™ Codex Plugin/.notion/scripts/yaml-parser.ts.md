---
title: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\yaml-parser.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\yaml-parser.ts'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.scripts.yaml-parser.ts'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\yaml-parser.ts'
source_file: 'yaml-parser.ts'
source_sha256: 'c7ee9d74ff716f9011a6825a245c516ad048e5478ee6af5dd6553e44a0ae5cfe'
generated: true
---

# `yaml-parser.ts`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\scripts\yaml-parser.ts`
> SHA-256: `c7ee9d74ff716f9011a6825a245c516ad048e5478ee6af5dd6553e44a0ae5cfe`

```ts
// YAML parser for collection files and frontmatter parsing using vfile-matter
import fs from "fs";
import yaml from "js-yaml";
import path from "path";
import { VFile } from "vfile";
import { matter } from "vfile-matter";

// Type definitions
export interface Frontmatter {
  name?: string;
  title?: string;
  description?: string;
  tools?: string[];
  "mcp-servers"?: Record<string, McpServerConfig>;
  [key: string]: unknown;
}

export interface McpServerConfig {
  type?: string;
  command?: string;
  args?: string[];
  url?: string;
  headers?: Record<string, string>;
  tools?: string[];
  env?: Record<string, string>;
}

export interface AgentMetadata {
  name: string | null;
  description: string | null;
  tools: string[];
  mcpServers: Record<string, McpServerConfig>;
}

export interface McpServerConfigResult {
  name: string;
  type?: string;
  command?: string;
  args?: string[];
  url?: string;
  headers?: Record<string, string>;
}

export interface SkillMetadata {
  name: string;
  description: string;
  assets: string[];
  path: string;
}

export interface CollectionItem {
  path: string;
  kind: "prompt" | "instruction" | "agent";
  usage?: string;
}

export interface CollectionDisplay {
  ordering?: "manual" | "alpha";
  show_badge?: boolean | string;
}

export interface Collection {
  id: string;
  name: string;
  description: string;
  tags?: string[];
  items: CollectionItem[];
  display?: CollectionDisplay;
  featured?: boolean;
}

function safeFileOperation<T>(
  operation: () => T,
  filePath: string,
  defaultValue: T
): T {
  try {
    return operation();
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    console.error(`Error processing file ${filePath}: ${message}`);
    return defaultValue;
  }
}

/**
 * Parse a collection YAML file (.collection.yml)
 * Collections are pure YAML files without frontmatter delimiters
 * @param filePath - Path to the collection file
 * @returns Parsed collection object or null on error
 */
export function parseCollectionYaml(filePath: string): Collection | null {
  return safeFileOperation(
    () => {
      const content = fs.readFileSync(filePath, "utf8");

      // Collections are pure YAML files, parse directly with js-yaml
      return yaml.load(content, { schema: yaml.JSON_SCHEMA }) as Collection;
    },
    filePath,
    null
  );
}

/**
 * Parse frontmatter from a markdown file using vfile-matter
 * Works with any markdown file that has YAML frontmatter (agents, prompts, instructions)
 * @param filePath - Path to the markdown file
 * @returns Parsed frontmatter object or null on error
 */
export function parseFrontmatter(filePath: string): Frontmatter | null {
  return safeFileOperation(
    () => {
      const content = fs.readFileSync(filePath, "utf8");
      const file = new VFile({ path: filePath, value: content });

      // Parse the frontmatter using vfile-matter
      matter(file);

      // The frontmatter is now available in file.data.matter
      const frontmatter = (file.data as { matter?: Frontmatter }).matter;

      // Normalize string fields that can accumulate trailing newlines/spaces
      if (frontmatter) {
        if (typeof frontmatter.name === "string") {
          frontmatter.name = frontmatter.name.replace(/[\r\n]+$/g, "").trim();
        }
        if (typeof frontmatter.title === "string") {
          frontmatter.title = frontmatter.title.replace(/[\r\n]+$/g, "").trim();
        }
        if (typeof frontmatter.description === "string") {
          // Remove only trailing whitespace/newlines; preserve internal formatting
          frontmatter.description = frontmatter.description.replace(
            /[\s\r\n]+$/g,
            ""
          );
        }
      }

      return frontmatter ?? null;
    },
    filePath,
    null
  );
}

/**
 * Extract agent metadata including MCP server information
 * @param filePath - Path to the agent file
 * @returns Agent metadata object with name, description, tools, and mcp-servers
 */
export function extractAgentMetadata(filePath: string): AgentMetadata | null {
  const frontmatter = parseFrontmatter(filePath);

  if (!frontmatter) {
    return null;
  }

  return {
    name: typeof frontmatter.name === "string" ? frontmatter.name : null,
    description:
      typeof frontmatter.description === "string"
        ? frontmatter.description
        : null,
    tools: frontmatter.tools || [],
    mcpServers: frontmatter["mcp-servers"] || {},
  };
}

/**
 * Extract MCP server names from an agent file
 * @param filePath - Path to the agent file
 * @returns Array of MCP server names
 */
export function extractMcpServers(filePath: string): string[] {
  const metadata = extractAgentMetadata(filePath);

  if (!metadata || !metadata.mcpServers) {
    return [];
  }

  return Object.keys(metadata.mcpServers);
}

/**
 * Extract full MCP server configs from an agent file
 * @param filePath - Path to the agent file
 * @returns Array of MCP server configuration objects
 */
export function extractMcpServerConfigs(
  filePath: string
): McpServerConfigResult[] {
  const metadata = extractAgentMetadata(filePath);
  if (!metadata || !metadata.mcpServers) return [];
  return Object.entries(metadata.mcpServers).map(([name, cfg]) => {
    // Ensure we don't mutate original cfg
    const copy = { ...cfg };
    return {
      name,
      type: typeof copy.type === "string" ? copy.type : undefined,
      command: typeof copy.command === "string" ? copy.command : undefined,
      args: Array.isArray(copy.args) ? copy.args : undefined,
      url: typeof copy.url === "string" ? copy.url : undefined,
      headers:
        typeof copy.headers === "object" && copy.headers !== null
          ? copy.headers
          : undefined,
    };
  });
}

/**
 * Parse SKILL.md frontmatter and list bundled assets in a skill folder
 * @param skillPath - Path to skill folder
 * @returns Skill metadata with name, description, and assets array
 */
export function parseSkillMetadata(skillPath: string): SkillMetadata | null {
  return safeFileOperation(
    () => {
      const skillFile = path.join(skillPath, "SKILL.md");
      if (!fs.existsSync(skillFile)) {
        return null;
      }

      const frontmatter = parseFrontmatter(skillFile);

      // Validate required fields
      if (!frontmatter?.name || !frontmatter?.description) {
        console.warn(
          `Invalid skill at ${skillPath}: missing name or description in frontmatter`
        );
        return null;
      }

      // List bundled assets (all files except SKILL.md), recursing through subdirectories
      const getAllFiles = (
        dirPath: string,
        arrayOfFiles: string[] = []
      ): string[] => {
        const files = fs.readdirSync(dirPath);

        files.forEach((file) => {
          const filePath = path.join(dirPath, file);
          if (fs.statSync(filePath).isDirectory()) {
            arrayOfFiles = getAllFiles(filePath, arrayOfFiles);
          } else {
            const relativePath = path.relative(skillPath, filePath);
            if (relativePath !== "SKILL.md") {
              arrayOfFiles.push(relativePath);
            }
          }
        });

        return arrayOfFiles;
      };

      const assets = getAllFiles(skillPath).sort();

      return {
        name: frontmatter.name,
        description: frontmatter.description,
        assets,
        path: skillPath,
      };
    },
    skillPath,
    null
  );
}

export { safeFileOperation };

```