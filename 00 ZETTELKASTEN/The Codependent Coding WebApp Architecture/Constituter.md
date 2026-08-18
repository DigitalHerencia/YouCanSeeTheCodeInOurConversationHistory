# The Constituter™

The Constituter is the stateless web application used to configure an `Ontology` or build a custom `Arrangement` from supported `Simples`from The Maximal Template™.

It is an adapter over the same configuration semantics used by the CLI and portable config file.

## Web App UI/UX

The top layer of the configuration UI allows the user to choose from 9 defaults that are starting points based on standardized SaaS recipes

1. `Ontologies` configure page routes

    The next layer allows the user to select/deselect normalized page routes from a list of all the routes from The Maximal Template™

2. Page routes render feature components

    The next layer allows the user to configure the normalized feature components in each page route by selecting/deselecting feature components from a list of all the features from The Maximal Template™ 

3. Features components orchestrate logic and presentation

    The features can be customized by selecting/deselecting options for the logic and presentation layers 

4. The PureUI Presentation Layer™ is composed of pure UI block components

    The next layer allows the user to configure the normalized block components in each feature component by selecting/deselecting block components and choosing the block variation they want from a list of all the blocks from The Maximal Template™

5. Presentation blocks are composed of UI primitives

    The next layer allows the user to configure the normalized UI primitives in each block component by selecting/deselecting UI primitives and choosing which variant they want from the from a list of all the UI primitives from The Maximal Template™

6. UI primitives have variants styled with semantic design tokens

    The next layer allows the user to configure the normalized semantic tokens that style each UI primitives by selecting normalized Tailwind CSS color palettes, amination values, Tailwind properties like `rounded`, padding, margins, and Typography properties like define values for Next.js fonts, typefaces for headings, and so on. These properties are derived from and transform The Maximal Template™ `globals.css`

7. Logic is orchestrated in workflows called BusinessLogic Blocks™ 

    The next layer allows the user to configure the normalized workflows in each feature component by selecting/deselecting workflows from a list of all the workflows from The Maximal Template™

8. Workflows are composed of server operations and helpers

    The last layer allows the user to configure the normalized server operations and helpers that compose each workflow by selecting/deselecting normalized server operations and helpers from a list of all server operations and helpers The Maximal Template™

### Pages 
  
- DashboardTemplate.tsx
- DocsTemplate.tsx
- BlogTemplate.tsx
- LandingPageTemplate.tsx
- PortfolioTemplate.tsx
- PricingTemplate.tsx
- ProductTemplate.tsx
- WorkspaceTemplate.tsx
- SettingsTemplate.tsx
- FormTemplate.tsx
- DataGridTemplate.tsx
- CalanderTemplate.tsx
- ProfileTemplate.tsx
- ProjectTemplate.tsx
- AdminTemplate.tsx
- BillingTemplate.tsx
- StepperTemplate.tsx
### Blocks

1. Marketing Blocks

  - **Hero Section** — Bold headline, subtext, CTA button, and optional image/shapes
  - **Feature Grid** — 3and 4-column grids with icons and descriptions
  - **Testimonials** — Cards, carousel, and single-quote layouts with avatars
  - **Logo Cloud** — Client/partner logo strip with optional marquee scroll
  - **CTA Section** — Newsletter signup, trial signup, and contact variants
  - **Stats Section** — Big number KPIs with labels and neubrutalism accents
  - **Team Section** — Member cards with role, bio, and social links
  - **FAQ Section** — Accordion-based Q&A with expand/collapse animation
  - **Footer Section** — Multi-column layout with newsletter and social links
  - **Contact Section** — Contact form with info cards and map placeholder

2. Application Blocks

  - **Auth Forms** — Login, Signup, Forgot Password, OTP verification
  - **Error Pages** — 404, 500, and maintenance pages in neubrutalism style
  - **Settings Page** — Tabbed settings with Profile, Notifications, and Billing panels
  - **Onboarding Flow** — Multi-step setup wizard with progress tracking
  - **Invoice** — Printable invoice / receipt layout with line items and totals
  
### UI Components

1. Form Components

  - Button (7 variants, 5 sizes)
  - Input
  - Textarea
  - Checkbox
  - Radio Group
  - Select
  - Switch
  - Slider
  - Label
  - Input OTP
  - **Dropzone** 

2. Layout & Containers

  - Card
  - Layered Card (stacked paper effect)
  - **Stat Card** (statistics display) 
  - Dialog
  - Drawer
  - Sheet
  - Accordion
  - Collapsible
  - Tabs
  - **Stepper** (multi-step forms/wizards) 
  - Scroll Area
  - Aspect Ratio
  - Separator

3. **Feedback & Status**

  - Alert
  - Alert Dialog
  - Badge
  - Progress
  - Skeleton
  - **Spinner** (5 animation variants) 
  - Sonner (Toast)
  - **Math Curve Loader** (animated loading spinners driven by mathematical curves) 
  - **Math Curve Progress** (progress bars rendered as animated mathematical curves) 
  - **Math Curve Background** (full-bleed animated curve backgrounds) 

4. **Navigation**

  - Breadcrumb
  - Dropdown Menu
  - Command Palette
  - Pagination
  - Popover
  - Tooltip
  - Hover Card

5. **Data Display**

  - Avatar
  - Table
  - Calendar
  - **Kbd** (keyboard shortcut hints)

6. **Charts (10 Types)**

  - Area Chart
  - Bar Chart
  - Line Chart
  - Pie Chart
  - **Donut Chart** (pie with center content)
  - **Radar Chart** (multi-variable comparison) 
  - **Radial Bar Chart** (circular progress) 
  - **Gauge Chart** (speedometer KPI) 
  - **Sparkline** (inline trend charts) 

7. **Decorative (Neubrutalism Special)**

  - Sticker (rotated labels)
  - Marquee (scrolling ticker)
  - **64 SVG Shapes** (Geometric, Organic, Celestial, Mathematical, Mechanical, and more) 
  - **17 ASCII Shapes** (Torus, Donut, Sphere, Cube, Helix, Trefoil Knot, Geodesic Dome, Saturn, Hyperboloid, DNA, Spiral, Rose, Wave, Vortex…) 

### Semantic Design Tokens

  - color-background;
  - color-foreground;
  - color-card;
  - color-card-foreground;
  - color-popover;
  - color-popover-foreground;
  - color-primary;
  - color-primary-foreground;
  - color-secondary;
  - color-secondary-foreground;
  - color-accent;
  - color-accent-foreground;
  - color-muted;
  - color-muted-foreground;
  - color-destructive;
  - color-destructive-foreground;
  - color-success;
  - color-success-foreground;
  - color-warning;
  - color-warning-foreground;
  - color-info;
  - color-info-foreground;
  - color-border;
  - color-input;
  - color-ring;
  - color-chart-1;
  - color-chart-2;
  - color-chart-3;
  - color-chart-4;
  - color-chart-5;
  - color-neon-pink;
  - color-neon-green;
  - color-neon-blue;
  - color-neon-orange;
  - color-neon-purple;
  - color-clash-1;
  - color-clash-2;
  - color-clash-3;
  - color-clash-4;
  - radius-sm;
  - radius-md;
  - radius-lg;
  - radius-xl;
  - var-rounded;
  - var-hover;
  - var-active;
  - var-focused;
  - var-border;
  - breakpoint-sm:
  - breakpoint-md:
  - breakpoint-lg;
  - breakpoint-xl;
### Integrations

- Stripe (Payments & Billing)
    * Checkout & Pricing: Handling customer subscriptions, one-time purchases, and coupon codes
    * Customer Portal: Allowing users to update their credit cards, view invoices, or cancel plans
    * Webhooks: Listening for successful payments or failed renewals to update user access levels
    * Tax & Compliance: Calculating sales tax automatically based on user location  
- Hugging Face (AI & Machine Learning) 
    * Model Hosting & Inference: Running AI models to process text, image generation, or data analysis
    * Embeddings Generation: Turning text into math numbers (vectors) so your database can search by meaning. 
    * Dataset Access: Fetching public or private datasets needed to train or fine-tune your app's AI.   
- Vercel Blob Storage (Object & File Hosting)
    - **File Uploads & Storage:** Hosting unstructured files like PDFs, csv exports, code files, and raw backups.
    - **Temporary Assets:** Handling ephemeral uploads like form attachments, raw processing files, and quick imports.
    - **Global Asset Delivery:** Distributing static assets quickly across a global edge network with low-latency access.
    - **Programmatic Management:** Automating file deletion, token-based signed uploads, and bucket cleanup routines.
- Cloudinary (Media Optimization & Management)
    - **Dynamic Image & Video Transformation:** Resizing, cropping, and applying filters to media on-the-fly using URL parameters.
    - **Format Optimization:** Automatically converting uploads to modern formats (like WebP or AVIF) to reduce file sizes.
    - **Responsive Delivery:** Serving the exact right image dimensions based on the user's screen size or device type.
    - **Media Organization & Tagging:** Managing user avatars, product pictures, and social media media bundles with metadata.

### Business Logic

- Customer Relationship Management (CRM) 
   * Lead & Pipeline Tracking: Moving potential customers through clear sales stages (e.g., Cold Prospect → Contacted → Deal Won)
   * Interaction Logs: Connecting customer phone notes, support tickets, and email threads to a single client profile
   * Sales Activity Automation: Creating automatic tasks for a sales rep when a deal gets stuck in a pipeline stage for too long
- Project Management & Collaboration 
    * Task Hierarchy: Organizing items clearly into workspaces, larger projects, small subtasks, and milestones. 
    * Dependency Engine: Checking if shifting one deadline forward will break a later task that depends on it. 
    * Activity History: Tracking exactly who created a ticket, left a comment, or changed a target date.  
- Human Resources & Applicant Tracking (HRIS / ATS) 
    * Employee Lifecycle: Handling employee onboarding checklists, official job title changes, and offboarding workflows. 
    * Time-Off Accrual: Calculating how many vacation days an employee earns each month and managing time-off requests. 
    * Hiring Pipeline: Routing a job applicant from their first application to interviews, background checks, and official offer letters. 
- Enterprise Resource Planning (ERP) & Supply Chain
    - Inventory Rules: Tracking physical warehouse stock and triggering automatic reorder points when items get low.
    - Order Fulfillment Flow: Managing the journey of a physical item from manufacturing to packing and carrier pickup.
    - Asset Depreciation: Calculating how much value heavy warehouse equipment or company laptops lose over time.
- E-commerce & Digital Storefronts
   - Cart Pricing & Discounts: Applying complex rules like "Buy One Get One Free," coupon limitations, and bundle prices.
   - Product Variants: Managing combinations of sizes, colors, stock numbers, and categories for items.
   - Returns Lifecycle: Checking if an item is eligible for return and tracking the restocking process
- Financial Technology & Accounting (FinTech)
   - Double-Entry Ledger: Ensuring every single transaction has balancing debit and credit items so the books match perfectly.
   - Bank Reconciliation: Automatically comparing internal transaction lists with official external bank files to find errors.
   - Expense Limits: Flagging employee corporate card purchases that violate department spending caps.
- Marketing Automation & Email Campaigns
   - Audience Filters: Generating smart lists of users based on actions (e.g., "Active users who haven't logged in for 14 days
   - Drip Workflow Engine: Managing precise timing rules (e.g., "Wait 48 hours, check if link was clicked, then send email B").
   - Campaign Delivery Statistics: Tracking global open rates, clicks, and unsubscribes without storing cookies
- Business Intelligence & Data Analytics 
   - Data Aggregation Pipelines: Cleaning, formatting, and restructuring messy raw data before saving it into charts.
   - Metric Formulas: Managing the exact rules for calculating business metrics like Monthly Recurring Revenue (MRR) or Churn Rate.
   - Report Visibility: Limiting specific chart views based on a user's company role or their paid subscription plan
- Cybersecurity & Identity Governance
   - Access Policies: Triggering conditional requirements (like forcing security checks if a user signs in from a brand new country).
   - Compliance Audit Trails: Keeping permanent records of exactly who viewed sensitive files or changed administration settings.
   - Threat Assessment: Analyzing traffic signs to lock accounts showing rapid, suspicious bot-like activity
- Content Management Systems (CMS)
   - Publishing Workflow: Routing an article from draft to peer review, manager approval, scheduling, and live status.
   - Version History: Saving historical snapshots of text so editors can compare older changes and roll back mistakes.
   - Asset Asset Mapping: Tracking exactly which pages or blog posts use a specific uploaded image file.

### Authorization

- RBAC (Role-Based Access Control)
    - Role Hierarchy: Defining structural business roles like Owner, Admin, Manager, Member, and Guest.
    - Permission Mapping: Linking static capabilities (e.g., `create:project`, `delete:billing`) directly to specific roles.
    - Route & Component Guarding: Blocking unauthorized users from entering entire pages or viewing specific UI elements.
    - User-to-Role Assignment: Managing how accounts are bound to roles when invited to a new workspace. 
- ABAC (Attribute-Based Access Control)
    - Dynamic Policy Evaluation: Determining access in real-time based on the user, the resource, and the current environment.
    - Contextual Variables: Checking runtime properties like user department, IP address, device type, or time of day.
    - Resource Ownership Rules: Enforcing fine-grained logic like "Users can only edit a document if they are the author _and_ the document status is 'Draft'."
    - Tenant & Boundary Scoping: Restricting data access based on company dimensions, subscription tiers, or geofences.

### Caching

- SSR & ISR (Data Lifecycle & Performance)
- Request Memoization: Reusing fetch responses within a single server render pass to prevent duplicate database calls.
- Data Cache (Server-Side): Storing data across separate user requests and deployments to speed up page loads.
- Full Route Cache: Pre-rendering and caching entire HTML and React Server Component payloads at build or background time.
- Cache Invalidation & Revalidation: Flushing or updating stale cache entries on-demand using tags (`revalidateTag`) or time intervals (`revalidatePath`).

### Dependency Graphs

Dependencies are normalized and configured automatically so the user cannot configure a template that won't work properly do to broken or missing dependencies. 

In practice this mean that selecting or deselecting options in the web app configuration UI automatically deactivates or activates corresponding options that are dependent on whatever option the user is configuring.

Tooltips can be used to warn the user about mandatory dependencies that effect the options available to them.

## Functional System Decomposition

The default SaaS definitions are functionally decomposed into modules. I'm branding the modules as libraries called `Simples`. The library from the hipster stack website will be repurposed for this and the existing content folded in.

The authoritative decomposition inventory should be built **top-down in exactly this order**:

    Domain Ontology™
        ↓
    App Router
    ├── Page Routes
    └── Webhook Handlers
        ↓
    Feature Orchestration
    └── Feature Components
        ├── PureUI Presentation Layer™
        │   └── Component Blocks
        │       └── UI Primitive + Variant
        │           └── Semantic Design Tokens
        │
        └── BusinessLogic Blocks™
            └── Workflows
                ├── Server Operations
                │   ├── Auth / Authz
                │   ├── Actions
                │   └── Fetchers
                │
                ├── Integrations
                │   ├── Stripe
                │   ├── Clerk
                │   └── selected providers
                │
                ├── Utils
                │
                ├── Data Transport
                │   ├── DTO Mappers
                │   ├── Prisma Selects
                │   └── Transactions
                │
                ├── Helpers
                │   ├── Constants
                │   ├── Params
                │   └── Cache
                │
                ├── Types
                ├── Interfaces
                └── Zod Schemas

The libraries are the source of truth for the master template. All of the code for every possible configuration of `Simples` from the 9 `Ontologies` are contained in one repository. The generator transforms this codebase when it initializes a new project.  

All nine `Ontologies` inherit from a common application foundation that is the substrate upon which the selected `Ontology` is constituted. 

    Shared Foundation
    ├── Public / Product
    ├── Authentication
    ├── Onboarding
    ├── Dashboard / App Shell
    ├── User Profile
    ├── Organization / Membership
    ├── Settings
    ├── Billing when selected
    ├── Integrations Settings when selected
    ├── Navigation / Shells
    ├── Common Auth/Authz
    ├── Database Foundation
    ├── Validation
    ├── Error / Loading States
    └── Common Tenant Infrastructure

The customized transformed master template that is generated based on the user's configuration of one of the default starter specifications is called `The Arrangement™`

So the generator model becomes:

    Shared Foundation
            +
    Selected Ontology™
            +
    User Overrides
            +
    Optional Capabilities
            +
    Presentation Configuration
            +
    Dependency Closure
            ↓
    Resolved Application Definition
            ↓
    The Arrangement™

The generated standalone application is ****`The Arrangement™`****: a white-label project produced from a normalized and validated application definition. It contains no runtime dependency on the generator and no requirement to remain connected to a hosted control plane.

### The Architecture Classifier

```text

STATIC PUBLIC PRESENTATION ONLY?
    app/(public) page + components/blocks

REACT HOOK FORM?
    feature form + components/ui

APPLICATION ORCHESTRATION?
    features/

PERSISTED DATABASE READ?
    lib/fetchers/

ORDINARY PERSISTED CRUD WRITE?
    lib/actions/

PRISMA SELECT?
    lib/db/selects/

DTO MAPPER?
    lib/db/dto/

ATOMIC DATABASE TRANSACTION?
    lib/db/transactions/

CLERK / AUTHENTICATION?
    lib/auth/

RBAC / ABAC / AUTHORIZATION?
    lib/authz/

PROVIDER-SPECIFIC EXTERNAL BEHAVIOR?
    lib/integrations/{provider}/

WEBHOOK HTTP LIFECYCLE?
    app/api/{provider}/…/route.ts

DOMAIN / BUSINESS LOGIC ORCHESTRATION?
    lib/workflows/{domain}/

CACHE CONCERN?
    lib/cache/

CONSTANT?
    lib/constants/

TRUE GENERIC UTILITY?
    lib/utils/

PRISMA SCHEMA / MIGRATION / SEED?
    prisma/

RUNTIME INPUT VALIDATION?
    schemas/

SHARED COMPILE-TIME CONTRACT?
    types/
```

### Terminology

| Term                   | Canonical meaning                                                                    |
| ---------------------- | ------------------------------------------------------------------------------------ |
| Tenant **Routes**      | Authenticated URL/HTTP boundary.                                                     |
| Public Routes          | Static public content is `(public)`, not the marketing business domain.              |
| Static Pages           | Static pages may compose blocks directly; they do not require empty features.        |
| **Feature**            | Application capability orchestration boundary.                                       |
| **Client Feature**     | Deliberate browser-only orchestration companion.                                     |
| Forms                  | RHF form features are an explicit feature → UI primitive exception.                  |
| **Block**              | Pure reusable UI composition.                                                        |
| **Primitive**          | Lowest-level UI component.                                                           |
| **Fetcher**            | Read-only persisted application data operation.                                      |
| **Action**             | Ordinary persisted CRUD mutation boundary.                                           |
| **Transaction Helper** | Atomic database persistence helper preserving multi-write invariants.                |
| **Select**             | Precise Prisma projection.                                                           |
| **DTO Mapper**         | Persistence/domain → transport-safe mapping function.                                |
| **Schema**             | Runtime boundary validation contract.                                                |
| **Authentication**     | Establishes verified identity/session.                                               |
| **Authorization**      | Decides permitted operation/resource/context.                                        |
| **Tenant**             | Architectural isolation concept.                                                     |
| **Organization**       | Canonical application-owned tenant entity in the default model.                      |
| **Membership**         | Contextual relationship connecting a User to an Organization and business authority. |
| **RLS**                | PostgreSQL row-level containment layer.                                              |
| **Integration**        | Provider-specific external-service mechanics.                                        |
| **Webhook**            | Provider HTTP request boundary and reconciliation lifecycle.                         |
### Branded Products
| **Codependent Coding™ WebApp Architecture** | The governing architecture and documentation system. It defines responsibilities, boundaries, invariants, composition, security posture, and implementation grammar.                     |
| ------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Hipster Stack™ Technology Stack**         | The concrete technology stack plus deterministic constitution/generation system and CLI that turns a normalized application definition into a project.                                   |
| **Maximal Template™ Domain Library**        | The single runnable superset application containing every supported implementation that may be retained, removed, or transformed during generation.                                      |
| **The Anthimeria™**                         | Stateless web configuration workbench over the shared Application Definition and resolver.                                                                                               |
| **Loaded Vibes™** Codex Plugin              | The Codex-oriented architecture-enforcement and software-operations layer: governance, agents, skills, instructions, prompts, validators, smoke tests, and developer-environment assets. |
| The Vibes Visual System™                    | Dark industrial technical system with restrained cyan/teal signal, not rainbow/cartoon neo-brutalism.                                                                                    |
| **Simples™**                                | A maximal domain library of normalized supported building blocks.                                                                                                                        |
| **Ontology™**                               | One of nine default normalized starter application definitions/presets.                                                                                                                  |
| **BusinessLogic Blocks™**                   | Domain/business logic workflow orchestration boundary.                                                                                                                                   |
| **PureUI Presentation Layer™**              | Pure reusable UI composition orchestration boundary.                                                                                                                                     |
| The Arrangement™                            | Generated standalone white-label application.                                                                                                                                            |
| The Virgule™                                | Dependency-closed resolved authority for materialization and preview.                                                                                                                    |

