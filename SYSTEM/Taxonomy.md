# Classification Contract

## Properties

Use properties only for operational state or plugin configuration: `status`, `phase`, `progress`, `priority`, `due`, `cadence`, `archived`, creation/update metadata, and narrowly necessary plugin relationships.

## Tags

Tags classify content. Prefer stable facets:

- `type/*` — project, area, resource, task, prompt, study, clipping, ai-thread, decision
- `domain/*` — typescript, product, design, research, business
- `topic/*` — react, nextjs, zod, postgres, auth, testing
- `stack/*` — nextjs, react, typescript, prisma, neon, clerk, vercel
- `source/*` — book, web, ai-thread, codebase, conversation

Do not create tags for active/done/blocked/archived when a lifecycle property already owns that fact.
