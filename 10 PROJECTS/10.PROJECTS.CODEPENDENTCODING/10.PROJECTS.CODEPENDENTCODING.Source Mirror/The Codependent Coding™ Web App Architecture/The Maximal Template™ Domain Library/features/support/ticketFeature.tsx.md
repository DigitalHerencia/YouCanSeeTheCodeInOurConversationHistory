---
title: 'The Maximal Template™ Domain Library\features\support\ticketFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\support\ticketFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.support.ticketfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\support\ticketFeature.tsx'
source_file: 'ticketFeature.tsx'
source_sha256: '286387f0605215885a8a69d4b9794c117848b8cf1f1d8c2c8e1ed052bafb5bd4'
generated: true
---

# `ticketFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\support\ticketFeature.tsx`
> SHA-256: `286387f0605215885a8a69d4b9794c117848b8cf1f1d8c2c8e1ed052bafb5bd4`

```tsx
import {
  EmptyStateBlock,
  PageHeaderBlock,
  RecordDetailBlock,
} from "@/components/blocks/application-sections";
import { getSupportTicket } from "@/lib/fetchers/supportFetchers";

export async function TicketFeature({ ticketId }: { ticketId: string }) {
  const ticket = await getSupportTicket(ticketId);
  if (!ticket)
    return (
      <EmptyStateBlock
        title="Ticket not found"
        description="No visible support ticket matches this identifier."
      />
    );
  return (
    <div className="space-y-6">
      <PageHeaderBlock
        eyebrow={`Ticket #${ticket.number}`}
        title={ticket.subject}
      />
      <RecordDetailBlock
        title="Support request"
        status={ticket.status}
        items={[
          { label: "Priority", value: ticket.priority },
          {
            label: "Requester",
            value:
              ticket.requester?.displayName ?? ticket.requester?.email ?? "—",
          },
          {
            label: "Assignee",
            value: ticket.assignee?.displayName ?? "Unassigned",
          },
          { label: "Messages", value: String(ticket.messageCount) },
          {
            label: "First response due",
            value: ticket.firstResponseDueAt
              ? new Date(ticket.firstResponseDueAt).toLocaleString()
              : "—",
          },
          {
            label: "Resolution due",
            value: ticket.resolutionDueAt
              ? new Date(ticket.resolutionDueAt).toLocaleString()
              : "—",
          },
          { label: "Description", value: ticket.description ?? "—" },
        ]}
      />
    </div>
  );
}

```