# Unique Templates Is An Oxymoron

First, **TanStack inspired this project but is not really a SaaS template**. What makes it interesting here is how it presents a technical ecosystem. The current TanStack homepage immediately exposes the stack, lets you “start with a prompt,” shows enormous usage proof, explains a few strong principles, and organizes the products into understandable categories rather than dumping a list of packages on you. Its Builder then turns those choices into something interactive.

The actual SaaS-template world—Achromatic, MakerKit, Supastarter, ShipFast, Open SaaS, Vercel starters, etc.—has converged on a different set of expectations. Achromatic, for example, now ships auth, billing, organizations, roles, admin, credits, AI chat, storage, marketing pages, email, analytics, monitoring, docs, responsive UI and a substantial design system; Supastarter emphasizes production-ready auth/billing/multi-tenancy; ShipFast deliberately goes more minimal around payments/database/login/UI; Open SaaS emphasizes modularity and the ability to remove things you don't need. 

## The best product features have become pretty predictable

The **baseline** is no longer exciting:

- Authentication and account management
- Billing/subscriptions
- Database
- Email
- Dashboard 
- Marketing site
- Settings
- Responsive UI

People basically assume those exist now. Current kits increasingly differentiate on **organizations, invitations, membership roles, administration, usage/credit billing, AI features, storage, monitoring, analytics and documented architecture**. 

For a serious **B2B SaaS template**, I think the strongest feature package is:

 > **Identity → organizations → membership → authorization → billing → administration → observability.**

In other words, don't merely demonstrate:

`User → Login → Dashboard`

Demonstrate something closer to:

`User → Workspace → Members → Roles → Permissions → Resources → Billing → Admin`

That tells somebody, _“I can actually build a company product on this.”_

Achromatic's current kit illustrates this particularly well: organization switching, invitations, roles, ownership transfer and admin controls are treated as first-class application features rather than optional examples.

---

# Where the really good ones separate themselves: presentation

This is where TanStack is particularly worth stealing ideas from.

### 1. **They show the system instead of explaining the system**

TanStack doesn't lead with thirty paragraphs about architecture.

It gives you:

**Framework**  
Start / Router

**Data & State**  
Query / DB / Store / AI

**UI & UX**  
Table / Charts / Form / Hotkeys / Markdown

**Performance**  
Virtual / Pacer

**Tooling**  
Devtools / Config / CLI / Intent

That taxonomy is incredibly effective. 

For a SaaS template, the equivalent would be something like:

**Application**

- Dashboard
- Workspaces
- Members
- Settings

**Identity & Access**

- Authentication
- RBAC
- ABAC
- Sessions

**Commerce**

- Plans
- Checkout
- Billing
- Usage

**Data**

- Database
- RLS
- Fetchers
- Mutations

**Operations**

- Admin
- Webhooks
- Audit
- Monitoring

**UI**

- Primitives
- Blocks
- Charts
- Forms

Now the architecture becomes **browsable**.

That's much more compelling than a giant “Features” grid containing 37 checkmarks.

---

## 2. A real, populated application beats component galleries

Look at the current ShadCN dashboard example. It doesn't just display a `Card`, a `Table`, and a `Badge`.

It displays an application:

- sidebar navigation
- account/workspace identity
- metrics
- trend indicators
- charts
- tables
- filters
- status
- row actions
- settings/search/help

with believable fake product data.

That's important.

A template demo should **look like someone has already been using it for six months**.

Not:

> Welcome, John!  
> You don't have any projects yet.

That might be correct onboarding UX for a real product. It's terrible template-showcase UX.

For a template, populate the bastard.

Fake organizations. Fake users. Fake invoices. Fake activity. Fake usage. Fake audit records. Fake charts. Fake permissions.

Let people see what the system becomes.

---

## 3. Excellent templates use a restrained visual system

ShadCN is probably the clearest influence on current SaaS UI. Its model is deliberately “open code”: components are intended to be owned and modified rather than consumed as an opaque package. 

And interestingly, shadcn's 2026 styles show that **visual identity is increasingly about more than changing colors**. Luma changes geometry, elevation and spacing; Sera changes typography, corners, tracking and control treatment.

That's the right lesson.

A distinctive template shouldn't rely upon:

> purple gradient + glowing button = branding

Its identity should come from a consistent combination of:

**type + spacing + borders + radius + elevation + density + interaction + iconography.**

If you're doing neo-brutalism, for example, the design system should express that structurally:

**heavy borders, assertive typography, crisp surfaces, deliberate offsets/shadows, tight color discipline and strong hierarchy.**

Not cartoons everywhere.

---

# 4. The navigation itself teaches you the product

This is one of TanStack's smartest choices.

The nav isn't merely navigation. It teaches you their conceptual model:

**Framework / Data & State / UI & UX / Performance / Tooling.** 

Good SaaS demos do the same thing.

A sidebar like:

> Overview  
> Analytics  
> Projects  
> Team  
> Documents  
> Settings

Immediately communicates what the application is. That's exactly the strategy visible in ShadCN's current dashboard example. 

For a **template**, you can push this further because your navigation can communicate **capabilities rather than a fictional business domain**.

Something like:

> **Demo**  
> Overview  
> Analytics  
> Data
> 
> **Workspace**  
> Organizations  
> Members  
> Roles  
> Invitations
> 
> **Commerce**  
> Plans  
> Billing  
> Usage  
> Invoices
> 
> **System**  
> Activity  
> Webhooks  
> Permissions  
> Admin
> 
> **Design System**  
> Components  
> Blocks  
> Patterns

Now opening the demo is basically an interactive table of contents.

---

# 5. Search / command palettes are disproportionately valuable

Notice TanStack puts **Search** and **Ask AI** right in the global navigation.

Developer-facing products benefit enormously from global discoverability because their information architecture is inherently broad.

For a maximal SaaS template, I would absolutely have something like:

**⌘K / Ctrl+K**

and make it understand:

- pages
- blocks
- components
- features
- architecture examples
- settings
- users
- organizations
- documentation

It makes a huge template feel intentional rather than bloated.

---

# 6. Interactive configuration is becoming a major differentiator

This is probably the **single biggest TanStack concept worth borrowing**.

TanStack Builder doesn't say:

> “We support these seventeen things.”

It lets the visitor **compose a stack**. TanStack's CLI similarly describes itself around composing an app while keeping choices inspectable. 

That is dramatically better for a template/generator than a static features page.

Imagine a template demo with:

> **Build your starter**
> 
> Authentication  
> `● Clerk`
> 
> Database  
> `● Neon`
> 
> ORM  
> `● Prisma`
> 
> Billing  
> `● Stripe`
> 
> Authorization  
> `✓ RBAC`  
> `✓ ABAC`
> 
> Tenant isolation  
> `✓ PostgreSQL RLS`
> 
> UI  
> `● shadcn/ui`
> 
> Theme  
> `● Brutalist`
> 
> `[Preview Architecture]`  
> `[Generate Project]`

And as someone changes selections, the **architecture visualization, file tree or generated configuration changes beside it**.

That's considerably more memorable than another landing page.

---

# 7. Show implementation evidence

A subtle thing good developer products do is make claims verifiable.

TanStack says **type-safe**, then shows recognizable type examples. It says framework-agnostic, then shows React/Vue/Solid/Angular/Vanilla. It says production-grade and pairs that with download/star figures.

Achromatic similarly doesn't merely say “organizations”; its product page actually exposes invitations, membership roles and ownership transfer as concrete capabilities. 

So:

**Weak**

> Secure by default.

**Strong**

> RBAC + ABAC  
> PostgreSQL RLS  
> server-enforced authorization  
> signed webhook verification

**Even stronger**

Give me a UI where I can inspect those capabilities.

Maybe:

**Security Inspector**

|Resource|Subject|RBAC|ABAC|RLS|Result|
|---|---|---|---|---|---|
|Invoice #304|Member|✓|✓|✓|Allowed|
|Organization settings|Viewer|✕|—|✓|Denied|

Now the template is **demonstrating architecture through UI**.

That's unusual enough to make people remember it.

---

# 8. The public demo matters a lot

Achromatic prominently exposes a **live demo** right beside its purchasing CTA.

Vercel's template ecosystem similarly revolves around the simple loop of **see template → deploy → inspect/modify**. Its catalog explicitly positions templates as a way to jumpstart applications.

For a template, friction is the enemy.

I should not have to:

1. clone it,
2. create six service accounts,
3. populate environment variables,
4. configure OAuth,
5. run migrations,
6. seed a database,

just to discover whether I like the fucking sidebar.

**Public demo first.**

Installation later.

---

# 9. There are really two products

This is something I think a lot of templates miss.

You are selling/showing:

### Product A — the generated application

Dashboard, billing, users, organizations, admin, etc.

### Product B — the development system

Architecture, conventions, directory structure, CLI, configuration, primitives, blocks, patterns and extensibility.

TanStack is extraordinarily good at **Product B**.

Achromatic/MakerKit/etc. are primarily selling **Product A + its underlying source**.

The coolest modern template would expose **both simultaneously**.

That means somebody can say:

> “Damn, that's a nice dashboard.”

and five minutes later:

> “Oh shit, I understand how this whole application is put together.”

---

# What I think the killer template demo looks like

For something like The Maximal Template, I'd steal the **ideas**, not the visual identity, from all of these.

I would structure the public experience roughly like this:

| **LANDING**               | Strong visual identity → one-sentence proposition → interactive application preview → stack proof → architecture/features → launch demo. |
| :------------------------ | :--------------------------------------------------------------------------------------------------------------------------------------- |
| **DEMO APP**              | ly populated, unrestricted fictional SaaS.<br>                                                                                           |
| **CAPABILITY EXPLORER**   | Auth / authorization / data / commerce / integrations / UI                                                                               |
| **DESIGN SYSTEM**         | Primitives → blocks → compositions → full pages.                                                                                         |
| **ARCHITECTURE EXPLORER** | Visual directory tree + request lifecycle + boundaries.                                                                                  |
| **SECURITY DEMO**         | RBAC / ABAC / RLS / webhook examples shown visually.                                                                                     |
| **BUILDER**               | Choose capabilities → see generated architecture/configuration.                                                                          |
| **DOCS**                  | Then explain the details.                                                                                                                |

And I would make the whole thing **feel like one application**, not a marketing website bolted onto Storybook bolted onto an admin dashboard bolted onto some docs.

### The big idea

The best current products are moving away from:

**“Here is our long list of features.”**

toward:

**“Here is the system. Touch it.”**

TanStack does that with its stack and Builder. shadcn does it by exposing actual adaptable UI instead of hiding a component library behind an API. The stronger SaaS templates do it with populated live applications and complete product surfaces. 

**That's the direction I'd push hardest.**

Your differentiator doesn't need to be _“we have even more features than the other maximalist boilerplate.”_

It can be:

> **This is the template where you can actually see and understand the entire SaaS system working.**

That is a much stronger idea.