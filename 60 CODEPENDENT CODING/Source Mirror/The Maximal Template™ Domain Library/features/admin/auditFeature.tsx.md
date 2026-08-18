---
title: 'The Maximal Template™ Domain Library\features\admin\auditFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\admin\auditFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.admin.auditfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\admin\auditFeature.tsx'
source_file: 'auditFeature.tsx'
source_sha256: 'cea0f8f0b7fcae0058c2536da29c5376dbb892ef55f19edeb60136f009675377'
generated: true
---

# `auditFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\admin\auditFeature.tsx`
> SHA-256: `cea0f8f0b7fcae0058c2536da29c5376dbb892ef55f19edeb60136f009675377`

```tsx
import {
  AuditLogBlock,
  PageHeaderBlock,
} from "@/components/blocks/application-sections";
import { getAuditEvents } from "@/lib/fetchers/adminFetchers";
import { classifyAuditEvent } from "@/lib/workflows/admin/classifyAuditEvent";

// Features orchestrate blocks and lib helpers; they never import raw UI primitives.
export async function AuditFeature() {
  const events = await getAuditEvents();
  return (
    <div className="space-y-6">
      <PageHeaderBlock
        eyebrow="Administration"
        title="Audit trail"
        description="Uncached tenant-scoped administrative activity."
      />
      <AuditLogBlock
        events={events.map((event) => ({
          id: event.id,
          action: `${event.action} · ${classifyAuditEvent(event.action)}`,
          resource: `${event.resourceType}${event.resourceId ? ` · ${event.resourceId}` : ""}`,
          timestamp: new Date(event.createdAt).toLocaleString(),
        }))}
      />
    </div>
  );
}

```