# T02 Validate PRD & TechReq presence

Meetings: Engineering Meeting @January 2, 2026  (../Meetings/Engineering%20Meeting%20@January%202,%202026%202dca4e63bf2381f3a117ee5a92bd751c.md)
Parent item: ENG-M1-P1.1-INIT – Environment Initialization  (ENG-M1-P1%201-INIT%20%E2%80%93%20Environment%20Initialization%202e2a4e63bf2380538203dcabc6e3c366.md)
Projects: ENG-M1-P1.1-INIT – Environment Initialization  (../Projects/ENG-M1-P1%201-INIT%20%E2%80%93%20Environment%20Initialization%202dba4e63bf2380f283d3f693dbe0139a.md)
Status: Not started
Tasks: T02 Validate PRD & TechReq presence  (../Tasks/T02%20Validate%20PRD%20&%20TechReq%20presence%202dca4e63bf238021b0abc69624fa900e.md)
Teams: Engineering Team (../Teams/Engineering%20Team%202d5a4e63bf238034a68af4e24b342def.md)

# Competitive Advantage Documentation Index

**Last Updated:** January 5, 2025

**Status:** Complete ✅

---

## Quick Links

[Product Requirements Document (PRD)](T02%20Validate%20PRD%20&%20TechReq%20presence/Product%20Requirements%20Document%20(PRD)%202dfa4e63bf23809fbe32d64e5aa8654a.md)

[**Technical Requirements Document (TRD)**](T02%20Validate%20PRD%20&%20TechReq%20presence/Technical%20Requirements%20Document%20(TRD)%202dfa4e63bf238072842bf81307a071e2.md)

[Copilot Instructions for Competitive Advantage Platform](T02%20Validate%20PRD%20&%20TechReq%20presence/Copilot%20Instructions%20for%20Competitive%20Advantage%20Pla%202dfa4e63bf2380e4a736d4615204425c.md)

### 📋 Product & Strategy

- [**PRD.md**](https://www.notion.so/PRD.md) - Product Requirements Document
    - Product vision, goals, and features
    - User personas and success metrics
    - Revenue model and business goals
    - Technology overview

### 🏗️ Technical Architecture

- [**TECH-REQUIREMENTS.md**](https://www.notion.so/TECH-REQUIREMENTS.md) - Technical Specification
    - Complete tech stack with versions
    - Architecture diagrams
    - Frontend patterns (RSC, Server Actions)
    - Backend patterns (Prisma, Clerk, PostgreSQL)
    - Security requirements (OWASP)
    - Testing standards
    - DevOps and deployment workflow

### 💻 Development Workflow

- [**COPILOT-INSTRUCTIONS.md**](https://www.notion.so/COPILOT-INSTRUCTIONS.md) - AI Development Guide
    - Spec → Design → Implement workflow
    - 50+ working code examples
    - Frontend patterns (Client/Server components)
    - Backend patterns (Server Actions, API routes)
    - Security checklist
    - Git workflow and PR process
    - Debugging and troubleshooting

### 📚 Supporting Documentation

- [**CHANGELOG.md**](https://www.notion.so/CHANGELOG.md) - Version history and releases
- [**CONTRIBUTING.md**](https://www.notion.so/CONTRIBUTING.md) - Contribution guidelines
- [**SECURITY.md**](https://www.notion.so/SECURITY.md) - Security policies and reporting
- [**README.md**](https://www.notion.so/README.md) - Project overview and quick start
- [**.copilot/ENHANCEMENT-SUMMARY.md**](https://www.notion.so/.copilot/ENHANCEMENT-SUMMARY.md) - What was enhanced

---

## Documentation Overview

### The Three Pillars

**1. [PRD.md](http://prd.md/) - "What"**

```
What are we building?
Why do we build it?
For whom are we building?
How do we measure success?

```

↓ Answers: Product vision, user needs, business goals

**2. [TECH-REQUIREMENTS.md](http://tech-requirements.md/) - "How"**

```
How do we build this technically?
What technologies do we use?
What patterns do we follow?
How do we ensure quality?

```

↓ Answers: Architecture, patterns, standards, security

**3. [COPILOT-INSTRUCTIONS.md](http://copilot-instructions.md/) - "Do"**

```
How do I actually write the code?
What patterns should I follow?
What security checks matter?
How do I deploy this?

```

↓ Answers: Practical patterns, code examples, workflows

---

## Getting Started

### 1. New to the Project? (30 minutes)

```
1. Read PRD.md § 1-3
   → Understand what the product is

2. Skim TECH-REQUIREMENTS.md § 1-2
   → Know the tech stack overview

3. Bookmark COPILOT-INSTRUCTIONS.md
   → Reference while coding

```

### 2. Ready to Code? (5 minutes before starting)

```
1. Check COPILOT-INSTRUCTIONS.md § 2
   → Follow Spec → Design → Implement phases

2. Reference relevant code patterns
   → Copy examples from sections 3-4

3. Verify security checklist
   → Section 8: Security checklist

```

### 3. Need a Pattern? (2 minutes)

```
Search COPILOT-INSTRUCTIONS.md for:
- "Server Component Pattern" → RSC examples
- "Client Component Pattern" → Interactive UI
- "Server Action Pattern" → Form submissions
- "API Route Pattern" → Webhooks
- "Error Handling Pattern" → Exception handling

```

### 4. Before Opening a PR? (10 minutes)

```
1. Run security checklist
   → COPILOT-INSTRUCTIONS.md § 8

2. Verify naming conventions
   → COPILOT-INSTRUCTIONS.md § 9

3. Follow git workflow
   → COPILOT-INSTRUCTIONS.md § 11

```

---

## Document Structure

### [PRD.md](http://prd.md/) (750 lines)

| Section | Purpose | Reference |
| --- | --- | --- |
| 1. Product Summary | Vision and positioning | Feature planning |
| 2. Goals & Non-Goals | Constraints and scope | Feature validation |
| 3. Target Users | Personas and use cases | Feature requirements |
| 4. Core Features | Feature areas | Development roadmap |
| 5. Success Metrics | Quantified targets | KPI tracking |
| 6. Tech Requirements | High-level stack | TECH-REQUIREMENTS reference |

### [TECH-REQUIREMENTS.md](http://tech-requirements.md/) (3,200 lines)

| Section | Purpose | Code Examples |
| --- | --- | --- |
| 1. Architecture | System design | Diagrams |
| 2. Frontend Stack | React, Next.js, TypeScript | 3 patterns |
| 3. Backend Stack | PostgreSQL, Prisma, Clerk | 4 patterns |
| 4. Data Processing | Jobs, aggregations, ML | Architecture |
| 5. Security | OWASP, auth, validation | Checklist |
| 6. Testing | Unit, integration, E2E | 3 examples |
| 7. Observability | Logging, monitoring, alerts | JSON format |
| 8. Development Workflow | Features, sprints, deployment | 6 phases |
| 9. DevCycle Integration | Spec-Driven Workflow | Phase mapping |
| 10. Tech Stack Summary | Quick reference | Version matrix |

### [COPILOT-INSTRUCTIONS.md](http://copilot-instructions.md/) (2,500 lines)

| Section | Purpose | Code Examples |
| --- | --- | --- |
| 1. Project Overview | Context and constraints | Tech stack |
| 2. Workflow Phases | Spec → Design → Implement | 3 phases |
| 3. Frontend Patterns | RSC, Client, Server Actions | 5 patterns |
| 4. Backend Patterns | Server Actions, API routes | 5 patterns |
| 5. Data Validation | Zod schemas | Schema examples |
| 6. Multi-Tenancy | Enforcement patterns | Middleware + RLS |
| 7. Testing Patterns | Unit, integration, E2E | 3 examples |
| 8. Security Checklist | Pre-PR verification | 11 items |
| 9. Naming Conventions | Files, code, commits | Standards |
| 10. Code Quality | TS, comments, errors | 3 standards |
| 11. Git Workflow | Branches, commits, PRs | Conventions |
| 12. Common Workflows | Feature, bugfix, docs | Step-by-step |
| 13. Debugging | Issues and solutions | Performance profiling |
| 14. Deployment | Checks and process | Rollback procedure |
| 15. Copilot Do's & Don'ts | Best practices | 20 items |

---

## Key Concepts

### Multi-Tenancy

Enforced at every layer:

- **Database**: Row-level security (RLS) policies
- **Queries**: All queries filter by `tenantId`
- **API**: Middleware validates tenant access
- **Business Logic**: No cross-tenant operations

→ Reference: TECH-REQUIREMENTS § 3.2, COPILOT-INSTRUCTIONS § 6

### Server-First Architecture

Default to server-side rendering and execution:

- **Fetching**: Done on server (no extra API calls)
- **Authentication**: Validated server-side
- **Authorization**: Checked before returning data
- **Client**: Only handles UI interactivity

→ Reference: TECH-REQUIREMENTS § 2, COPILOT-INSTRUCTIONS § 3

### Type Safety

End-to-end TypeScript with strict mode:

- **Schemas**: Defined with zod
- **Queries**: Typed via Prisma
- **Components**: Props typed as interfaces
- **Functions**: Parameters and returns typed

→ Reference: TECH-REQUIREMENTS § 3.1, COPILOT-INSTRUCTIONS § 5

### Spec-Driven Development

All features start with a spec:

```
1. ANALYZE
   └─ Write spec in EARS notation

2. DESIGN
   └─ Plan data models and API surface

3. IMPLEMENT
   └─ Code following COPILOT-INSTRUCTIONS patterns

4. VALIDATE
   └─ Test per TECH-REQUIREMENTS § 7

5. REFLECT
   └─ Code review against checklist

6. HANDOFF
   └─ Deploy with pre-flight checklist

```

→ Reference: COPILOT-INSTRUCTIONS § 2

---

## Technology Stack (Quick Reference)

```
Frontend:
  - Next.js 15 (App Router)
  - React 19 (Server Components)
  - TypeScript 5.8 (strict mode)
  - Tailwind CSS 4 (utility-first)
  - shadcn/ui (composable components)
  - Recharts (charting)
  - Mapbox GL (geospatial)

Backend:
  - Node.js 20+
  - PostgreSQL (Neon)
  - Prisma 6 (ORM)
  - Clerk 6 (auth)
  - Redis (Upstash cache)
  - Qstash (job queue)

DevOps:
  - Vercel (hosting)
  - GitHub (version control)
  - GitHub Actions (CI)
  - Neon (DB branching)

Testing:
  - Vitest (unit/integration)
  - Playwright (E2E)
  - Testing Library (components)

Monitoring:
  - Vercel Analytics
  - Sentry (error tracking)
  - Custom logging (JSON structured)

```

→ Reference: TECH-REQUIREMENTS § 11

---

## Common Patterns (with Examples)

### Adding a New Feature

**Step 1: Specification (COPILOT-INSTRUCTIONS § 2.1)**

```bash
Create /specs/domains/[feature].md with:
- EARS requirements
- Acceptance criteria
- Data dependencies

```

**Step 2: Design (COPILOT-INSTRUCTIONS § 2.2)**

```
- Schema changes (Prisma)?
- API surface (Server Actions)?
- Components (new or reuse)?
- Error handling?

```

**Step 3: Implement (COPILOT-INSTRUCTIONS § 3-4)**

```
Backend:  app/actions/[feature].ts
Server:   lib/server/[feature].ts + tests
Frontend: components/[Feature]/...tsx
Tests:    e2e/[feature].spec.ts

```

**Step 4: Security (COPILOT-INSTRUCTIONS § 8)**

```
☑ No hardcoded secrets
☑ All inputs validated (zod)
☑ Database queries tenant-scoped
☑ Error messages safe
☑ Authorization checks present

```

**Step 5: Deploy (COPILOT-INSTRUCTIONS § 14)**

```bash
git push feature/[feature]
→ PR with spec + tests
→ Code review approval
→ Merge to main
→ Auto-deploy to Vercel

```

---

## Decision Making

### When in doubt, reference:

| Question | Document | Section |
| --- | --- | --- |
| Should this feature exist? | [PRD.md](http://prd.md/) | § 4 (Feature areas) |
| What's the technical approach? | [TECH-REQUIREMENTS.md](http://tech-requirements.md/) | § 2-4 (Patterns) |
| How do I code this pattern? | [COPILOT-INSTRUCTIONS.md](http://copilot-instructions.md/) | § 3-4 (Examples) |
| Is this secure? | [COPILOT-INSTRUCTIONS.md](http://copilot-instructions.md/) | § 8 (Checklist) |
| How do I deploy this? | [TECH-REQUIREMENTS.md](http://tech-requirements.md/) | § 9 or COPILOT § 14 |
| What's the naming convention? | [COPILOT-INSTRUCTIONS.md](http://copilot-instructions.md/) | § 9 |
| How do I test this? | [TECH-REQUIREMENTS.md](http://tech-requirements.md/) | § 7 |

---

## Maintenance & Evolution

### Update Schedule

| Trigger | Document(s) | Process |
| --- | --- | --- |
| New feature approved | [PRD.md](http://prd.md/) | Add to § 4 |
| Tech stack version bump | [TECH-REQUIREMENTS.md](http://tech-requirements.md/) | Update § 2-4 |
| New pattern discovered | [COPILOT-INSTRUCTIONS.md](http://copilot-instructions.md/) | Add to § 3-4 |
| Architecture decision | [TECH-REQUIREMENTS.md](http://tech-requirements.md/) § 9 | Document decision record |
| Security policy change | [TECH-REQUIREMENTS.md](http://tech-requirements.md/) § 5 | Update checklist |

### Process

```
1. Create feature branch: docs/[topic]
2. Make changes to relevant document(s)
3. No code review needed for docs-only
4. Merge when satisfied
5. Update version/date at bottom

```

---

## FAQ

### Q: Where do I find code patterns?

**A:** [COPILOT-INSTRUCTIONS.md](http://copilot-instructions.md/) § 3-4 has 50+ working examples

### Q: What security checks do I need?

**A:** [COPILOT-INSTRUCTIONS.md](http://copilot-instructions.md/) § 8 (11-item pre-PR checklist)

### Q: How do I enforce multi-tenancy?

**A:** [COPILOT-INSTRUCTIONS.md](http://copilot-instructions.md/) § 6 (middleware + RLS patterns)

### Q: What's the tech stack?

**A:** [TECH-REQUIREMENTS.md](http://tech-requirements.md/) § 11 (quick reference table)

### Q: How do I deploy?

**A:** [COPILOT-INSTRUCTIONS.md](http://copilot-instructions.md/) § 14 (pre-deployment checklist + process)

### Q: What's our branching strategy?

**A:** [COPILOT-INSTRUCTIONS.md](http://copilot-instructions.md/) § 11 (git workflow)

### Q: What are the naming conventions?

**A:** [COPILOT-INSTRUCTIONS.md](http://copilot-instructions.md/) § 9 (complete guide)

### Q: How do I write a feature spec?

**A:** [COPILOT-INSTRUCTIONS.md](http://copilot-instructions.md/) § 2.1 (specification phase)

### Q: What does success look like?

**A:** [PRD.md](http://prd.md/) § 5 (quantified success metrics)

### Q: How is the team organized?

**A:** [PRD.md](http://prd.md/) § 3 (target users and personas)

---

## Resources

- **Testing Examples**: TECH-REQUIREMENTS § 7 or COPILOT § 7
- **Database Schema**: TECH-REQUIREMENTS § 3.2
- **Error Handling**: COPILOT-INSTRUCTIONS § 4.4
- **API Design**: TECH-REQUIREMENTS § 3.4
- **Component Library**: `components/ui/` (shadcn/ui)
- **Feature Examples**: `/specs/domains/` (when created)

---

## Version History

| Date | Document | Change |
| --- | --- | --- |
| 2025-01-05 | [PRD.md](http://prd.md/) | Enhanced with metrics and revenue model |
| 2025-01-05 | [TECH-REQUIREMENTS.md](http://tech-requirements.md/) | Created (3,200 lines) |
| 2025-01-05 | [COPILOT-INSTRUCTIONS.md](http://copilot-instructions.md/) | Created (2,500 lines) |