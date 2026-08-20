---
title: 'The Hipster Stack™ Technology Stack\template\tests\contract\architecture-validator.test.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\tests\contract\architecture-validator.test.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.tests.contract.architecture-validator.test.ts'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-hipster-stack-technology-stack
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Hipster Stack™ Technology Stack\template\tests\contract\architecture-validator.test.ts'
source_file: 'architecture-validator.test.ts'
source_sha256: 'f95b648202b16e7e5ad2f261bfbc39631472e44e8806ffd23410442014b7f412'
generated: true
---

# `architecture-validator.test.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\tests\contract\architecture-validator.test.ts`
> SHA-256: `f95b648202b16e7e5ad2f261bfbc39631472e44e8806ffd23410442014b7f412`

```ts
import { execFileSync, spawnSync } from "node:child_process"
import { mkdtempSync, mkdirSync, rmSync, writeFileSync } from "node:fs"
import { tmpdir } from "node:os"
import { join } from "node:path"
import { afterEach, describe, expect, it } from "vitest"

const root = process.cwd()
const validator = join(root, "scripts", "validate-architecture.mjs")
const fixtures: string[] = []

function createFixture(): string {
  const fixture = mkdtempSync(join(tmpdir(), "vibes-architecture-"))
  fixtures.push(fixture)
  mkdirSync(join(fixture, "components"), { recursive: true })
  writeFileSync(join(fixture, "components", "card.tsx"), "export function Card() { return null }\n")
  return fixture
}

function writeFixtureFile(fixture: string, path: string, body: string) {
  const target = join(fixture, path)
  mkdirSync(join(target, ".."), { recursive: true })
  writeFileSync(target, body)
}

afterEach(() => {
  for (const fixture of fixtures.splice(0)) {
    rmSync(fixture, { recursive: true, force: true })
  }
})

describe("architecture validator", () => {
  it("accepts the current repository boundaries", () => {
    expect(() => execFileSync(process.execPath, [validator, "--root", root])).not.toThrow()
  })

  it("rejects a forbidden import and passes after the fixture is repaired", () => {
    const fixture = createFixture()
    const offender = join(fixture, "components", "bad.tsx")
    writeFileSync(offender, 'import { createProjectAction } from "@/lib/actions/projectActions"\n')

    const rejected = spawnSync(process.execPath, [validator, "--root", fixture], {
      encoding: "utf8",
    })

    expect(rejected.status).toBe(1)
    expect(rejected.stderr).toContain("components/bad.tsx")

    rmSync(offender)

    expect(() => execFileSync(process.execPath, [validator, "--root", fixture])).not.toThrow()
  })

  it.each([
    [
      "app/page.tsx",
      'import { getPrisma } from "@/lib/db/prisma"\nexport default function Page() { return null }\n',
      "routes adapt requests and cannot access persistence",
    ],
    [
      "components/server-card.tsx",
      '"use server"\nexport async function ServerCard() {}\n',
      "cannot declare Server Actions",
    ],
    [
      "types/leaked.ts",
      'import type { Prisma } from "@/prisma/generated/prisma/client"\nexport type Leaked = Prisma.ProjectGetPayload<{}>\n',
      "public schemas and contracts",
    ],
    [
      "lib/fetchers/writing.ts",
      'import "server-only"\nexport async function write(tx) { return tx.project.create({ data: {} }) }\n',
      "cannot write",
    ],
    [
      "lib/auth/synchronizing.ts",
      'import "server-only"\nexport async function sync(prisma) { return prisma.user.upsert({ where: {} }) }\n',
      "session adapters cannot write",
    ],
    [
      "lib/actions/direct-db.ts",
      '"use server"\nimport { getPrisma } from "@/lib/db/prisma"\nexport async function action() { return getPrisma() }\n',
      "Server Actions validate and delegate",
    ],
    [
      "lib/fetchers/unguarded.ts",
      "export async function read() { return [] }\n",
      "server-only guard",
    ],
  ])("rejects %s", (path, body, evidence) => {
    const fixture = createFixture()
    writeFixtureFile(fixture, path, body)

    const rejected = spawnSync(process.execPath, [validator, "--root", fixture], {
      encoding: "utf8",
    })

    expect(rejected.status).toBe(1)
    expect(rejected.stderr).toContain(path)
    expect(rejected.stderr).toContain(evidence)
  })
})

```