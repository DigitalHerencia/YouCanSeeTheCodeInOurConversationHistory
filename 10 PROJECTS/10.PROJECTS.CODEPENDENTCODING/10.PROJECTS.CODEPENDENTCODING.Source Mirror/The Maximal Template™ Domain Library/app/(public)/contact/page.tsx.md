---
title: 'The Maximal Template™ Domain Library\app\(public)\contact\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\app\(public)\contact\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.app.-public-.contact.page.tsx'
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
source_path: 'The Maximal Template™ Domain Library\app\(public)\contact\page.tsx'
source_file: 'page.tsx'
source_sha256: '3b2b223fc1d7aea625ea8e946bdf07db946d836cc81681c19a53849f1eaa7d24'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\app\(public)\contact\page.tsx`
> SHA-256: `3b2b223fc1d7aea625ea8e946bdf07db946d836cc81681c19a53849f1eaa7d24`

```tsx
import { Mail, MessageSquareText } from "lucide-react";

import { ContactWithCards } from "@/components/blocks/contact-sections";

export default function Page() {
  return (
    <ContactWithCards
      title="Talk through your application shape"
      description="Choose a direct channel; no inert contact form or fake submission path."
      contactMethods={[
        {
          icon: <Mail className="size-6" />,
          title: "Email",
          description: "Send product and implementation questions.",
          action: { label: "Write an email", href: "mailto:hello@example.com" },
        },
        {
          icon: <MessageSquareText className="size-6" />,
          title: "Application demo",
          description:
            "Inspect a concrete recipe before choosing a configuration.",
          action: { label: "Explore dashboard", href: "/dashboard" },
        },
      ]}
    />
  );
}

```