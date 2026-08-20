---
title: 'The Maximal Template™ Domain Library\features\support\inboxFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\support\inboxFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.support.inboxfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\support\inboxFeature.tsx'
source_file: 'inboxFeature.tsx'
source_sha256: '394014ad08143a1f318d283f26157a742be7a126d8646ceef23586f9659cff50'
generated: true
---

# `inboxFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\support\inboxFeature.tsx`
> SHA-256: `394014ad08143a1f318d283f26157a742be7a126d8646ceef23586f9659cff50`

```tsx
import {
  DataTableBlock,
  PageHeaderBlock,
} from "@/components/blocks/application-sections";
import { getSupportInbox } from "@/lib/fetchers/supportFetchers";

export async function InboxFeature() {
  const tickets = await getSupportInbox();
  return (
    <div className="space-y-6">
      <PageHeaderBlock eyebrow="Support" title="Inbox" />
      <DataTableBlock
        columns={[
          { key: "ticket", label: "Ticket" },
          { key: "priority", label: "Priority" },
          { key: "status", label: "Status" },
          { key: "requester", label: "Requester" },
          { key: "assignee", label: "Assignee" },
        ]}
        rows={tickets.map((ticket) => ({
          id: ticket.id,
          href: `/support/tickets/${ticket.id}`,
          cells: {
            ticket: `#${ticket.number} · ${ticket.subject}`,
            priority: ticket.priority,
            status: ticket.status,
            requester:
              ticket.requester?.displayName ?? ticket.requester?.email ?? null,
            assignee: ticket.assignee?.displayName ?? null,
          },
        }))}
      />
    </div>
  );
}

```