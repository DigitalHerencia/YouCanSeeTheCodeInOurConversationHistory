---
title: 'The Maximal Template™ Domain Library\features\support\knowledgeBaseFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\support\knowledgeBaseFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.support.knowledgebasefeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\support\knowledgeBaseFeature.tsx'
source_file: 'knowledgeBaseFeature.tsx'
source_sha256: '8bd6456322d42bd0e4ae2acab955ebf58ea37323b799200fc8e944d49c861ead'
generated: true
---

# `knowledgeBaseFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\support\knowledgeBaseFeature.tsx`
> SHA-256: `8bd6456322d42bd0e4ae2acab955ebf58ea37323b799200fc8e944d49c861ead`

```tsx
import {
  DataTableBlock,
  PageHeaderBlock,
} from "@/components/blocks/application-sections";
import { getKnowledgeArticles } from "@/lib/fetchers/supportFetchers";

export async function KnowledgeBaseFeature() {
  const articles = await getKnowledgeArticles();
  return (
    <div className="space-y-6">
      <PageHeaderBlock eyebrow="Support" title="Knowledge base" />
      <DataTableBlock
        columns={[
          { key: "title", label: "Article" },
          { key: "status", label: "Status" },
          { key: "updated", label: "Updated" },
        ]}
        rows={articles.map((article) => ({
          id: article.id,
          cells: {
            title: article.title,
            status: article.status,
            updated: new Date(article.updatedAt).toLocaleDateString(),
          },
        }))}
      />
    </div>
  );
}

```