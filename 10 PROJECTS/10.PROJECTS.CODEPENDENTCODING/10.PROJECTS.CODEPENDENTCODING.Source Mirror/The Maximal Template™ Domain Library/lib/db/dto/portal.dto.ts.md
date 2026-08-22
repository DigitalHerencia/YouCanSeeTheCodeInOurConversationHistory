---
title: 'The Maximal Template™ Domain Library\lib\db\dto\portal.dto.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\dto\portal.dto.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.dto.portal.dto.ts'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-maximal-template-domain-library
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Maximal Template™ Domain Library\lib\db\dto\portal.dto.ts'
source_file: 'portal.dto.ts'
source_sha256: '28c6efd488fde547ee23294ffbb09be2b2f536a0a3775a9064441cfe96233a99'
generated: true
---

# `portal.dto.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\dto\portal.dto.ts`
> SHA-256: `28c6efd488fde547ee23294ffbb09be2b2f536a0a3775a9064441cfe96233a99`

```ts
import type { PortalDocumentDTO } from "../../../types/portalTypes";
import type { PortalDocumentRecord } from "../selects/portal.selects";

export function toPortalDocumentDTO(
  record: PortalDocumentRecord,
): PortalDocumentDTO {
  const latest = record.versions[0] ?? null;

  return {
    id: record.id,
    title: record.title,
    description: record.description,
    status: record.status,
    clientVisible: record.clientVisible,
    currentVersionNumber: record.currentVersionNumber,
    version: record.version,
    latestVersion: latest
      ? {
          id: latest.id,
          versionNumber: latest.versionNumber,
          filename: latest.asset.filename,
          contentType: latest.asset.contentType,
          byteSize: latest.asset.byteSize.toString(),
          createdAt: latest.createdAt.toISOString(),
        }
      : null,
    createdAt: record.createdAt.toISOString(),
    updatedAt: record.updatedAt.toISOString(),
  };
}

```