# 1. Public Showroom / Demo Site

### Goal 

Make `themaximaltemplate.vercel.app` an impressive, completely explorable demonstration of what the Maximal Template contains and what your architecture looks like.

**The showroom wins on:** breadth, clarity, visual quality, realistic data, architectural legibility, working navigation, and zero friction.

It does **not** need production-grade tenant security internally before we finish it.

- [ ] ## P0 — Fix the application navigation and route integrity

**Actual finding:** `tenant-shell.tsx` still contains:

`Users → /users`

but the actual Admin Users route is `/admin/users`. The same shell only exposes Dashboard, Projects, Users, Media, AI, and Settings.

Meanwhile the existing Explorer knows about the real breadth of the application: CRM, Projects, Support, Marketing, Invoicing, Social, AI, Portal, Admin, Settings, Auth/Onboarding, Integrations, Components and Architecture. All of those capabilities are enabled in `content/application.ts`.

**Priority work:**

- Kill `/users`; use `/admin/users`.
- Establish one canonical route/navigation definition.
- Make the app shell represent the actual maximal superset.
- Organize the sidebar into meaningful groups instead of trying to fit the whole product into six links.
- Derive desktop/mobile navigation from the same source so drift doesn't happen again.

This is the clearest current **showroom P0** because the application's own navigation currently understates and misroutes the thing it is supposed to showcase.

---

## P0 — Define explicit showroom behavior for mutation surfaces

The public routing foundation is already correct: `proxy.ts` runs Clerk middleware but does **not** protect the application routes, so browsing itself is open. Preserve that.

But there is a UX collision.

**Actual finding:** `/crm/contacts/new` renders a fully interactive React Hook Form that calls `createContact()`. `createContact()` immediately calls `requireIdentity()`.

So a signed-out visitor can inspect the form—which is good—but submitting it hits production-oriented auth behavior.

For the showroom, make this intentional instead of accidental.

**Priority work:**

- Forms should remain visible and usable as demonstrations.
- Protected mutation buttons should either:
  - run explicit demo-only simulated behavior, or
  - clearly present a non-persisting preview state.
- Don't let users discover the security architecture by clicking **Create** and getting an auth error.
- Audit every visible create/edit/status/approval/publish control for this same condition.

The secure implementation gets restored in backlog #2.

---

## P0 — Replace proof-of-existence seed data with showroom-quality data

This is now **live-database verified**.

Current demo DB contains:

- 1 CRM account
- 1 CRM contact
- 1 CRM deal
- 1 project
- 2 tasks
- 1 support ticket
- 1 campaign
- 1 invoice
- 1 expense
- 1 social post
- 1 AI generation
- 1 portal document
- 1 audit event

The seed source confirms the same basic one-example-per-domain strategy.

That's excellent for proving the schema works. It's terrible for showing off a CRM pipeline, kanban, analytics dashboard, support queue, social calendar, audit timeline, or invoice dashboard.

**Priority work:**

- Expand the **existing single demo organization**, not add complexity.
- Create enough records to produce meaningful distributions and states.
- Give records believable relationships and history.
- Make each recipe showcase its intended UI archetype.

For example, CRM needs deals across several stages—not fifty duplicate contacts. Projects needs multiple statuses/deadlines/assignees. Support needs open/escalated/resolved tickets. Invoicing needs draft/sent/paid/overdue. Social needs a populated calendar.

---

## P1 — Rebuild Architecture & Security into a real showcase

Your doctrine specifically says architecture should be **part of the product demonstration**, not something the visitor has to infer from the repository.

**Actual finding:** the existing `/architecture` page is four small cards: Reads, Writes, Providers, Presentation.

It currently displays:

- `RLS SCOPED`
- `DEFAULT DENY`
- “Authenticated CRUD enters through lib/actions with RBAC and ABAC checks.”

Those claims are currently stronger than the implementation warrants. For example, `updateTaskStatus()` only calls broad `assertPermission("projects:write")`, not resource-level ABAC. And I rechecked the current live Neon connection: the active role is still `neondb_owner` with `rolbypassrls = true`.

So for the showroom:

**Priority work:**

- Turn this into an actual architecture explorer.
- Visually show:
   - `route → feature → block → primitive`
   - `feature → fetcher/action/workflow/auth/authz/integration`
   - recipe composition
   - directory classifier
   - auth → authz → scoped query → RLS production model
   - provider boundaries
   - webhook lifecycle
- Distinguish **“production template architecture”** from **“currently enforced by this public showroom.”**
- Stop presenting RLS/ABAC badges as runtime attestations where that's not yet true.

That's more credible **and** more impressive.

---

## P1 — Turn `/components` into the actual UI catalog

**Actual finding:** `/components` currently demonstrates two buttons, two badges and a card containing a text sentence listing block categories.

Meanwhile the repository already contains substantially more reusable application UI: tables, metrics, kanban, timeline, split-pane, file vault, media library, chat workspace, audit log and empty states.

So the materials exist. **The showroom just doesn't show them.**

**Priority work:**

- Turn `/components` into the visual catalog for the actual primitive/block system.
- Preview real variants instead of describing them.
- Include marketing blocks and application blocks.
- Include loading, empty, error and detail states.
- Make it visually obvious how primitives become blocks.

This is particularly valuable for employers/clients because it proves there is an actual reusable UI system underneath the pages.

---

## P1 — Normalize the application block catalog

This one is both showroom work and legitimate architecture cleanup.

**Actual finding:** `components/blocks/application-sections.tsx` has become a catch-all containing unrelated presentation categories including:

- integration status
- page headers
- metrics
- data-table toolbar
- data table
- record detail
- kanban
- timeline
- split pane
- file vault
- media library
- chat
- audit log
- empty state

Your canonical doctrine explicitly wants blocks organized by **presentation category**, with grouped variants, rather than route/domain junk drawers.

So split this intelligently into category files such as:

`data-tables`, `dashboard-sections`, `kanban-sections`, `timeline-sections`, `file-sections`, `chat-sections`, `audit-sections`, etc.

Not because smaller files are inherently holy, but because **one “application sections” file is becoming exactly the vague abstraction your doctrine is trying to avoid.**

---

## P1 — Fix the two public pages currently violating their own presentation doctrine

Your doctrine says static public pages with no application behavior should directly compose **blocks**, not features and not arbitrary primitives.

**Actual finding:** both `/architecture` and `/components` currently import `Badge`, `Card`, `Button`, etc. directly from `components/ui`.

Those are perfect first candidates for normalization because we're already redesigning them anyway.

This is worth fixing now because these pages are literally explaining an architecture they currently don't follow.

---

## P1 — Make the showroom's public shell lead with exploration, not authentication

**Actual finding:** the public shell currently has an explicit **Sign in** button alongside **Explore**. The tenant shell likewise shows a Clerk Sign In control whenever signed out.

Authentication should remain available because Clerk/auth surfaces are part of what the template demonstrates. But your product framing is now clear:

**authentication is an exhibit, not admission.**

So:

- Explore should dominate.
- Auth can live in the architecture/demo navigation.
- Don't visually frame the showroom like a normal SaaS acquisition funnel begging the visitor to create an account.

---

## P2 — Make every recipe visibly demonstrate a different UI capability

The architecture document already tells us what each recipe is supposed to showcase—CRM pipeline, project kanban/timeline, support split-pane/chat, social calendar/composer, portal document vault, admin records/audit, etc.

And importantly, many of those reusable blocks already exist.

So the task is **not inventing nine products**. It is making sure the existing routes and blocks actually show the range that is already designed into the architecture.

This becomes much easier after the seed-data pass.

---

## P2 — Perform the real showroom verification pass

Once the above is done:

- Crawl every public and application route signed out.
- Check every sidebar/mobile/header link.
- Exercise non-destructive interactive controls.
- Verify no public experience accidentally dumps somebody into Clerk.
- Check desktop/mobile.
- Check browser console.
- Check loading/error/empty states.
- Run format/lint/typecheck/build.

This isn't generic QA theater. The current `/users` defect is concrete evidence that successful source-level validation does **not** prove the showroom navigation works.

---

### Showroom definition of done

The showroom is finished when:

**I can send somebody one URL, they can immediately explore the complete Maximal Template, every recipe feels populated and intentional, every major UI pattern is visible, the architecture is understandable from the application itself, nothing important requires authentication, and nothing visible makes a security claim the implementation doesn't currently earn.**

Then we freeze it and clone/derive the secure edition.

---

# 2. Shippable / Generated Template Hardening

### Goal

Take the finished showroom codebase and convert it into the **actual production-oriented template that Loaded Vibes can generate/prune/configure**.

This phase keeps the visual system, routes, features, blocks and application architecture we've polished—but removes the demo shortcuts and makes the security claims true.

The canonical architecture already defines that generated product as the same superset grammar with selected recipes/providers pruned from it.

## P0 — Replace demo-pinned persisted reads with authenticated tenant context

**Actual finding:** `withTemplateReadTransaction()` explicitly hardcodes:

`user_seed_owner`

for public read operations.

And real fetchers such as Projects currently use that function for `getProjects()`, `getProject()`, `getProjectTasks()` **and even `getMyTasks()`**.

That is correct for our showroom.

It is completely wrong for the generated application.

**Hardening work:**

- Generated/private application fetchers resolve the actual Clerk identity.
- Resolve real application membership and organization.
- Public/demo fallback disappears from ordinary production fetchers.
- `getMyTasks()` genuinely means **my** tasks.
- Public-example data, if retained at all, gets an explicit separate demo boundary.

This should be the first code-level transformation after cloning.

---

## P0 — Make PostgreSQL RLS actually enforce tenant isolation

**Actual finding:** `lib/db/client.ts` simply connects Prisma using `DATABASE_URL`.

I rechecked the connected live Neon database during this audit:

**current role:** `neondb_owner`  
**BYPASSRLS:** `true`

Therefore the current application connection does not provide the RLS defense-in-depth promised by the architecture.

**Hardening work:**

- Create a dedicated application/runtime DB role without `BYPASSRLS`.
- Use owner/admin credentials only for Prisma migrations and administrative lifecycle.
- Runtime `DATABASE_URL` → restricted application role.
- Migration/direct connection → owner role.
- Verify session tenant variables.
- Run two-tenant positive/negative isolation tests against the same role the application actually uses.

Only after this passes do `RLS SCOPED` and `DEFAULT DENY` become runtime truth.

---

## P0 — Complete action-level ABAC enforcement

There is already a good implementation to copy.

`updateContact()` and `archiveContact()` load the resource and call `authorizeOwnedOrAssignedWrite()`.

But other current actions don't.

**Actual examples:**

- `updateTaskStatus()` only checks `projects:write`.
- `updateSupportTicketStatus()` only checks `support:write`.
- `updateCrmDealStage()` only checks `crm:write`.

So the helper exists; the enforcement is inconsistent.

**Hardening work:**

- Apply resource policies to every mutation where ownership/assignment/resource attributes matter.
- Treat CRM contact update/archive as the reference implementation.
- Test real actions, not just policy helpers.

---

## P0 — Close cross-resource tenant-integrity holes

**Actual finding:** `createTask()` verifies that `projectId` belongs to the active organization, but then accepts and writes:

- `milestoneId`
- `parentTaskId`
- `assigneeMembershipId`

without verifying their project/organization relationship.

Likewise `createCrmDeal()` verifies the account but writes `primaryContactId` and `ownerMembershipId` without equivalent relationship validation.

**Hardening work:**

- Validate related-resource tenancy transactionally.
- Add composite database invariants where they make the relationship impossible to represent incorrectly.
- RLS remains defense in depth, not a substitute for these invariants.

---

## P1 — Repair webhook idempotency/retry semantics

**Actual finding:** `claimWebhookEventTx()` inserts with:

`ON CONFLICT ("provider", "eventId") DO NOTHING`

and failed webhook events are persisted as `FAILED`.

Stripe then treats a `null` claim as an already-processed duplicate and returns success.

That means:

**first attempt fails → record becomes FAILED → provider retries same event ID → conflict → interpreted as duplicate → never retried.**

**Hardening work:**

- PROCESSED → duplicate/ignore.
- active PROCESSING → don't double process.
- FAILED → reclaim.
- stale PROCESSING → reclaim.
- Track attempts/lease timestamps if needed.

Apply the same lifecycle consistently to Clerk/Stripe/SendGrid.

---

## P1 — Make human-readable sequence numbers concurrency safe

Still current in source.

Support tickets determine the next number using `MAX(number) + 1`.

Invoices do the same inside `createInvoiceTx()`.

Two simultaneous creates can therefore calculate the same value.

**Hardening work:**

- Replace with a database-safe tenant counter/allocator or bounded collision retry.
- Keep sequencing transactional.

This matters in the generated template; it does not matter enough to derail the showroom.

---

## P1 — Make AI rate limiting atomic

**Actual finding:** the AI endpoint currently:

1. counts generations in the last minute;
2. checks `limit: 5`;
3. creates the generation.

Concurrent requests can all see the same pre-limit count.

Also every failure currently returns HTTP `400`, including provider/runtime/rate-limit failures.

**Hardening work:**

- Atomic limiter/reservation mechanism.
- `429` for rate limits.
- Correctly distinguish input, authentication, provider and internal errors.
- Test concurrent requests.

---

## P1 — Build security tests around real boundaries, not helper functions alone

**Actual finding:** the repository currently has no `test` script in `package.json`.

The visible test suite is `tests/authz.test.ts`, which verifies authorization helper behavior—but does not call the actual actions that currently bypass some of those helpers.

That explains how the policy helper can be correct while the application path is not.

**Minimum generated-template tests:**

- authenticated fetcher uses authenticated tenant
- cross-tenant read rejected
- cross-tenant mutation rejected
- ownership/assignment ABAC enforced through actual actions
- restricted runtime role proves RLS
- failed webhook retries
- duplicate processed webhook does not
- concurrent invoice/ticket allocation
- AI limit concurrency
- representative Clerk/onboarding lifecycle

Not an enterprise test cathedral. Just tests for the claims we're actually making.

---

## P1 — Add proportional CI once those tests exist

**Actual finding:** `.github/workflows` currently contains only a README explicitly saying a native workflow should eventually be wired.

So the template currently has no actual CI workflow enforcing its own claims.

Once the hardening tests exist:

- format check
- lint
- typecheck
- Prisma validation
- architecture/contracts validation
- focused tests
- build where appropriate

Then observe the workflow before calling it green.

---

## P2 — Restore production route/access semantics

This is where the deliberate showroom openness ends.

The current `proxy.ts` intentionally does not call route protection.

For the generated template:

- public website remains public;
- auth pages remain public;
- onboarding behaves like real onboarding;
- application routes establish real identity/tenant context;
- protected mutations require authentication;
- admin privileges mean something;
- portal/internal boundaries become real;
- application tenancy is application-owned as the doctrine specifies;
- Clerk remains authentication rather than tenancy.

This should be done **after** the showroom is cloned, exactly as you described.

---

## P2 — Verify integrations as actual production capabilities

The source already has real structural boundaries for provider integrations and webhook routes. The template doctrine names Clerk, Neon, Prisma, Stripe, Hugging Face, SendGrid, Cloudinary and Vercel Blob as the intended provider set.

The generated template needs to distinguish:

- configured and operational;
- optional but correctly scaffolded;
- intentionally excluded by generator selection.

No fake “configured” indicators.

And each provider should follow the existing classifier rather than dragging architecture into provider-specific folders.

---

## P2 — Replace “architecture claimed” with “architecture verified”

At the end of hardening:

- RLS badges correspond to real runtime isolation.
- ABAC badges correspond to real mutation paths.
- webhook claims correspond to retry-tested behavior.
- auth/onboarding claims correspond to real Clerk behavior.
- generated recipe claims correspond to actual included files/routes/providers.
- execution records reflect fresh evidence rather than “looks complete.”

That is when this becomes the **golden production template**, rather than the showroom that demonstrates what the golden template is supposed to look like.
