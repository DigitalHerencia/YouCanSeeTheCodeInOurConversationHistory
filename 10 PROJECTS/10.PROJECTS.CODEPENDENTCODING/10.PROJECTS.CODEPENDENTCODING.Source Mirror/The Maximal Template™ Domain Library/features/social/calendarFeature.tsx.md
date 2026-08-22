---
title: 'The Maximal Template™ Domain Library\features\social\calendarFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\social\calendarFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.social.calendarfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\social\calendarFeature.tsx'
source_file: 'calendarFeature.tsx'
source_sha256: '16c7236d20951967ed4757529d84398603d4729863ce441d4abc6c60ad806d3c'
generated: true
---

# `calendarFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\social\calendarFeature.tsx`
> SHA-256: `16c7236d20951967ed4757529d84398603d4729863ce441d4abc6c60ad806d3c`

```tsx
import {
  PageHeaderBlock,
  TimelineBlock,
} from "@/components/blocks/application-sections";
import { getScheduledSocialPosts } from "@/lib/fetchers/socialFetchers";

export async function CalendarFeature() {
  const posts = await getScheduledSocialPosts();
  return (
    <div className="space-y-6">
      <PageHeaderBlock
        eyebrow="Social"
        title="Publishing calendar"
        description="Scheduled posts for the active organization."
        action={{ label: "Compose post", href: "/social/compose" }}
      />
      <TimelineBlock
        items={posts.map((post) => ({
          id: post.id,
          title: post.title ?? post.content.slice(0, 80),
          timestamp: post.scheduledAt
            ? new Date(post.scheduledAt).toLocaleString()
            : "Unscheduled",
          detail: post.variants
            .map(
              (variant) =>
                `${variant.accountDisplayName} (${variant.provider})`,
            )
            .join(", "),
        }))}
      />
    </div>
  );
}

```