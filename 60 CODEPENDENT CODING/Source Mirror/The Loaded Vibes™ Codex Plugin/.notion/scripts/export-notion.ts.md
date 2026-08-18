---
title: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\export-notion.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\export-notion.ts'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.scripts.export-notion.ts'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\export-notion.ts'
source_file: 'export-notion.ts'
source_sha256: 'd3e7a831263a8989a47c049e38b2cca87e9a02ad7e9dc832ce2e94b747ce9d6e'
generated: true
---

# `export-notion.ts`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\scripts\export-notion.ts`
> SHA-256: `d3e7a831263a8989a47c049e38b2cca87e9a02ad7e9dc832ce2e94b747ce9d6e`

```ts
#!/usr/bin/env npx tsx

import fs from "node:fs/promises";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { Client } from "@modelcontextprotocol/sdk/client/index.js";
import { StreamableHTTPClientTransport } from "@modelcontextprotocol/sdk/client/streamableHttp.js";
import { StdioClientTransport } from "@modelcontextprotocol/sdk/client/stdio.js";

import type {
  Meeting,
  Project,
  Task,
  Team,
} from "../schemas.js";

type NotionPage = {
  id: string;
  properties?: Record<string, any>;
};

type QueryResult = {
  results?: NotionPage[];
  next_cursor?: string | null;
  nextCursor?: string | null;
};

type ToolResult =
  | { toolResult?: unknown; content?: unknown; structuredContent?: unknown }
  | undefined;

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.join(__dirname, "..");
const OUTPUT_DIR = path.join(ROOT, "snapshots", "notion");
const PAGE_SIZE = Number(process.env.NOTION_MCP_PAGE_SIZE ?? 100);

const DATA_SOURCES = {
  projects: {
    id: "2d5a4e63-bf23-8115-a70f-000bc1ef9d05",
    map: (page: NotionPage): Project | null => {
      const props = page.properties ?? {};
      const name = getTitle(props, "Name");
      if (!name) return null;

      return {
        id: page.id,
        name,
        status: getSelect(props, "Status") ?? "Active",
        milestone: getSelect(props, "Milestone") ?? null,
        phase: getSelect(props, "Phase") ?? null,
        domain: getSelect(props, "Domain") ?? null,
        startDate: getDate(props, "Start Date"),
        endDate: getDate(props, "End Date"),
        teamId: getRelationIds(props, "Team")[0],
        taskIds: getRelationIds(props, "Tasks"),
      };
    },
  },
  tasks: {
    id: "2d5a4e63-bf23-8137-8277-000b41c867c3",
    map: (page: NotionPage): Task | null => {
      const props = page.properties ?? {};
      const name = getTitle(props, "Name");
      if (!name) return null;

      return {
        id: page.id,
        name,
        done: getCheckbox(props, "Done"),
        taskCode:
          getFormulaString(props, "Task Code") ??
          getRichText(props, "Task Code") ??
          undefined,
        due: getDate(props, "Due"),
        priority: getSelect(props, "Priority") ?? null,
        projectId: getRelationIds(props, "Project")[0],
        teamId: getRelationIds(props, "Team")[0],
      };
    },
  },
  meetings: {
    id: "2caa4e63-bf23-815a-8981-000bbdbb7f0b",
    map: (page: NotionPage): Meeting | null => {
      const props = page.properties ?? {};
      const name = getTitle(props, "Name");
      if (!name) return null;

      return {
        id: page.id,
        name,
        type: (getSelect(props, "Type") ??
          "Standup") as Meeting["type"],
        cadence: (getSelect(props, "Cadence") ??
          null) as Meeting["cadence"],
        date: getDate(props, "Date"),
        attendeeTeamIds: getRelationIds(props, "Attendees"),
        actionItemTaskIds: getRelationIds(props, "Action Items"),
        projectIds: getRelationIds(props, "Projects"),
        teamIds: getRelationIds(props, "Teams"),
      };
    },
  },
  teams: {
    id: "2d5a4e63-bf23-816b-9f75-000b219f7713",
    map: (page: NotionPage): Team | null => {
      const props = page.properties ?? {};
      const name = getTitle(props, "Team name") ?? getTitle(props, "Name");
      if (!name) return null;

      return {
        id: page.id,
        name,
        meetings: getRelationIds(props, "Meetings"),
        projects: getRelationIds(props, "Projects"),
        projectsComplete: getNumeric(props, "Projects Complete"),
        tasks: getRelationIds(props, "Tasks"),
        tasksCompleted: getNumeric(props, "Tasks Completed"),
      };
    },
  },
} as const;

function getTitle(
  props: Record<string, any>,
  key: string
): string | undefined {
  const prop = props[key];
  if (!prop) return undefined;
  if (prop.type === "title" || prop.type === "rich_text") {
    const fragments = prop[prop.type] ?? [];
    return fragments.map((f: any) => f.plain_text ?? "").join("").trim() || undefined;
  }
  return undefined;
}

function getRichText(
  props: Record<string, any>,
  key: string
): string | undefined {
  const prop = props[key];
  if (!prop || prop.type !== "rich_text") return undefined;
  return (
    (prop.rich_text ?? [])
      .map((f: any) => f.plain_text ?? "")
      .join("")
      .trim() || undefined
  );
}

function getSelect(
  props: Record<string, any>,
  key: string
): string | undefined {
  const prop = props[key];
  if (!prop) return undefined;
  if (prop.type === "select") return prop.select?.name;
  return undefined;
}

function getDate(props: Record<string, any>, key: string): string | null {
  const prop = props[key];
  if (!prop || prop.type !== "date") return null;
  return prop.date?.start ?? null;
}

function getCheckbox(props: Record<string, any>, key: string): boolean {
  const prop = props[key];
  if (!prop || prop.type !== "checkbox") return false;
  return Boolean(prop.checkbox);
}

function getRelationIds(
  props: Record<string, any>,
  key: string
): string[] {
  const prop = props[key];
  if (!prop || prop.type !== "relation") return [];
  const rel = prop.relation ?? [];
  return rel.map((r: any) => r.id).filter(Boolean);
}

function getFormulaString(
  props: Record<string, any>,
  key: string
): string | undefined {
  const prop = props[key];
  if (!prop || prop.type !== "formula") return undefined;
  if (typeof prop.formula?.string === "string") return prop.formula.string;
  if (typeof prop.formula?.number === "number")
    return String(prop.formula.number);
  return undefined;
}

function getNumeric(props: Record<string, any>, key: string): number | undefined {
  const prop = props[key];
  if (!prop) return undefined;

  if (prop.type === "number" && typeof prop.number === "number") {
    return prop.number;
  }
  if (prop.type === "rollup") {
    if (typeof prop.rollup?.number === "number") return prop.rollup.number;
    if (typeof prop.rollup?.function === "number") return prop.rollup.function;
  }
  if (prop.type === "formula") {
    if (typeof prop.formula?.number === "number") return prop.formula.number;
    if (typeof prop.formula?.string === "string") {
      const match = prop.formula.string.match(/\\d+(?:\\.\\d+)?/);
      if (match) return Number(match[0]);
    }
  }
  if (prop.type === "rich_text") {
    const text = getRichText(props, key);
    const match = text?.match(/\\d+(?:\\.\\d+)?/);
    if (match) return Number(match[0]);
  }
  return undefined;
}

function unwrapToolResult(result: ToolResult): any {
  if (!result) throw new Error("Tool result is empty");
  if ("toolResult" in result && result.toolResult !== undefined) {
    return result.toolResult;
  }
  if ("structuredContent" in result && result.structuredContent !== undefined) {
    return result.structuredContent;
  }
  if ("content" in result && Array.isArray(result.content)) {
    for (const item of result.content as any[]) {
      if (item?.type === "text" && typeof item.text === "string") {
        try {
          return JSON.parse(item.text);
        } catch {
          // fall through
        }
      }
      if (item?.type === "resource" && typeof item.resource?.text === "string") {
        try {
          return JSON.parse(item.resource.text);
        } catch {
          // fall through
        }
      }
    }
  }
  throw new Error("Unable to parse tool result payload");
}

async function connectClient() {
  const client = new Client(
    { name: "notion-export", version: "0.1.0" },
    { capabilities: {} }
  );

  const transport =
    process.env.NOTION_MCP_HTTP_URL !== undefined
      ? new StreamableHTTPClientTransport(
          new URL(process.env.NOTION_MCP_HTTP_URL),
          {
            requestInit: {
              headers: process.env.AUTH_TOKEN
                ? { Authorization: `Bearer ${process.env.AUTH_TOKEN}` }
                : undefined,
            },
          }
        )
      : new StdioClientTransport({
          command: process.env.NOTION_MCP_COMMAND ?? "npx",
          args:
            process.env.NOTION_MCP_ARGS?.split(" ") ??
            ["-y", "@notionhq/notion-mcp-server"],
          env: {
            ...process.env,
          },
        });

  await client.connect(transport);
  return { client, transport };
}

async function queryDataSource(
  client: Client,
  dataSourceId: string,
  startCursor?: string | null
): Promise<QueryResult> {
  const result = await client.callTool({
    name: "query-data-source",
    arguments: {
      data_source_id: dataSourceId,
      page_size: PAGE_SIZE,
      start_cursor: startCursor ?? undefined,
    },
  });
  return unwrapToolResult(result) as QueryResult;
}

async function exportDataSource<T>(
  key: string,
  dataSourceId: string,
  map: (page: NotionPage) => T | null
) {
  console.log(`Exporting ${key}...`);
  const { client, transport } = await connectClient();

  const rows: T[] = [];
  try {
    let cursor: string | null | undefined;
    do {
      const page = await queryDataSource(client, dataSourceId, cursor);
      const results = page.results ?? [];
      for (const entry of results) {
        const mapped = map(entry);
        if (mapped) rows.push(mapped);
      }
      cursor = page.next_cursor ?? page.nextCursor ?? null;
    } while (cursor);
  } finally {
    await transport.close();
  }

  await fs.mkdir(OUTPUT_DIR, { recursive: true });
  const outFile = path.join(OUTPUT_DIR, `${key}.json`);
  await fs.writeFile(
    outFile,
    JSON.stringify(
      { exportedAt: new Date().toISOString(), rows },
      null,
      2
    ),
    "utf8"
  );
  console.log(`✔ ${key}: wrote ${rows.length} rows to ${path.relative(ROOT, outFile)}`);
}

async function main() {
  await exportDataSource("projects", DATA_SOURCES.projects.id, DATA_SOURCES.projects.map);
  await exportDataSource("tasks", DATA_SOURCES.tasks.id, DATA_SOURCES.tasks.map);
  await exportDataSource("meetings", DATA_SOURCES.meetings.id, DATA_SOURCES.meetings.map);
  await exportDataSource("teams", DATA_SOURCES.teams.id, DATA_SOURCES.teams.map);
}

main().catch((error) => {
  console.error(`Export failed: ${error instanceof Error ? error.message : String(error)}`);
  if (error instanceof Error && error.stack) {
    console.error(error.stack);
  }
  process.exit(1);
});

```