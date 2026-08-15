# New Direction

I finally figured out how I'm gonna revolutionize the generators/CLI and the most important thing is: 

**We're gonna start from the front and work our way back, which is the opposite of what everybody always done.** 

## Interfaces in Your Faces

The included images are all of my Vouch UI blocks that I got from the @boldkit registry from the ShadCN UI directory but obviously I customized these and modified them and wired them into Vouch. 

The point is simple:

	We use UI components as the primitives. 

The user decides which interfaces (as in which UI) to include and how to customize them. The recipe is generated, normalized, and validated based on those specifications. 

### Same Model

1. The user configures their preferences using the web app UI to generate the recipe. 
2. That gets normalized and validated and the output is feed into the cli. 
3. Then the generator engine uses the recipe to transform the maximal template. 
4. The output is the finished artifact for the end user. 

### New Features

- The recipes have the page templates
- The page templates hold the feature components
- the features hold the logic and blocks
- The blocks are composed of UI primitives
- The UI primitives have variants
- The variants have design tokens

## Recipes

So at the top level we have SaaS recipes the user chooses to start with:

**The "Essential Starter" Recipes:** These are the most common MVPs built by solo developers and agencies.

- CRM / Pipeline Tracker: High-value recipe. Focuses on kanban boards, custom fields, contact management, and email syncing.
- Project Management / Task Tracker: Perfect for showcasing complex UI components like nested task lists, drag-and-drop boards, timelines, and team workspaces.
- Customer Support / Ticketing System: Focuses on role-based access control (Admin vs. Agent vs. Customer), email-to-ticket conversion, and real-time chat.

**The "Data-Heavy" Recipes:** These cater to users who need dashboards, analytics, and heavy integrations.

- Marketing Automation & Analytics: Perfect for showing how to connect external APIs (e.g., Google Analytics, Meta Ads) and aggregate metrics into clean charts.
- Invoicing & Expense Tracker: Focuses heavily on financial math, PDF generation, recurring subscription setups, and multi-currency formatting.
- Social Media Scheduler: Focuses on cron jobs, background queues, and media upload storage (e.g., AWS S3).

**The "Modern & Specialized" Recipes:** High-converting templates targeting modern tech trends.

- AI-Powered Wrapper / Micro-SaaS: A template with built-in OpenAI/Anthropic API integration, usage-based pricing, prompt streaming, and rate-limiting.
- B2B Client Portal: A secure portal for agencies to share files, invoices, and   messaging with their clients under custom domains.
- Internal Tools / Admin Portal: Focuses on database schema viewing, bulk user management, and audit logs.
  
## Just Be Normal and Validate Me 

The recipes gets normalized and validated based on:
### Integrations

Stripe (Payments & Billing)

* Checkout & Pricing: Handling customer subscriptions, one-time purchases, and coupon codes
* Customer Portal: Allowing users to update their credit cards, view invoices, or cancel plans
* Webhooks: Listening for successful payments or failed renewals to update user access levels
* Tax & Compliance: Calculating sales tax automatically based on user location

Clerk (Authentication & User Management) 

* Identity Verification: Handling user sign-ups, log-ins, log-outs, and multi-factor authentication (MFA)
* Session Management: Keeping track of whether a user is logged in across different devices and browsers
* User Profiles: Storing basic account details like name, profile picture, and email addresses
* Roles & Permissions: Checking if a user is a basic member, an admin, or part of a specific organization

Neon (Serverless Postgres Database) 
 
* Structured Data Storage: Saving core application data like user profiles, posts, settings, and logs
* Data Relations: Connecting different data points together (e.g., matching a specific blog post to its author)
* Data Consistency: Ensuring all transactions are safely saved and valid using strict SQL rules
* Branching & Scaling: Creating separate database environments for testing new features without touching live data
   
Hugging Face (AI & Machine Learning) 
  
* Model Hosting & Inference: Running AI models to process text, image generation, or data analysis
* Embeddings Generation: Turning text into math numbers (vectors) so your database can search by meaning. 
* Dataset Access: Fetching public or private datasets needed to train or fine-tune your app's AI. 
  
Vercel Blob Storage (Object & File Hosting)

- **File Uploads & Storage:** Hosting unstructured files like PDFs, csv exports, code files, and raw backups.
- **Temporary Assets:** Handling ephemeral uploads like form attachments, raw processing files, and quick imports.
- **Global Asset Delivery:** Distributing static assets quickly across a global edge network with low-latency access.
- **Programmatic Management:** Automating file deletion, token-based signed uploads, and bucket cleanup routines.
  
Cloudinary (Media Optimization & Management)

- **Dynamic Image & Video Transformation:** Resizing, cropping, and applying filters to media on-the-fly using URL parameters.
- **Format Optimization:** Automatically converting uploads to modern formats (like WebP or AVIF) to reduce file sizes.
- **Responsive Delivery:** Serving the exact right image dimensions based on the user's screen size or device type.
- **Media Organization & Tagging:** Managing user avatars, product pictures, and social media media bundles with metadata.

### Business Logic

Customer Relationship Management (CRM) 

* Lead & Pipeline Tracking: Moving potential customers through clear sales stages (e.g., Cold Prospect → Contacted → Deal Won)
* Interaction Logs: Connecting customer phone notes, support tickets, and email threads to a single client profile
* Sales Activity Automation: Creating automatic tasks for a sales rep when a deal gets stuck in a pipeline stage for too long

Project Management & Collaboration 

 * Task Hierarchy: Organizing items clearly into workspaces, larger projects, small subtasks, and milestones. 
 * Dependency Engine: Checking if shifting one deadline forward will break a later task that depends on it. 
 * Activity History: Tracking exactly who created a ticket, left a comment, or changed a target date.  
 
Human Resources & Applicant Tracking (HRIS / ATS) 

 * Employee Lifecycle: Handling employee onboarding checklists, official job title changes, and offboarding workflows. 
 * Time-Off Accrual: Calculating how many vacation days an employee earns each month and managing time-off requests. 
 * Hiring Pipeline: Routing a job applicant from their first application to interviews, background checks, and official offer letters. 

Enterprise Resource Planning (ERP) & Supply Chain
 
 - Inventory Rules: Tracking physical warehouse stock and triggering automatic reorder points when items get low.
 - Order Fulfillment Flow: Managing the journey of a physical item from manufacturing to packing and carrier pickup.
 - Asset Depreciation: Calculating how much value heavy warehouse equipment or company laptops lose over time.

E-commerce & Digital Storefronts
   
  - Cart Pricing & Discounts: Applying complex rules like "Buy One Get One Free," coupon limitations, and bundle prices.
  - Product Variants: Managing combinations of sizes, colors, stock numbers, and categories for items.
  - Returns Lifecycle: Checking if an item is eligible for return and tracking the restocking process

Financial Technology & Accounting (FinTech)

  - Double-Entry Ledger: Ensuring every single transaction has balancing debit and credit items so the books match perfectly.
  - Bank Reconciliation: Automatically comparing internal transaction lists with official external bank files to find errors.
  - Expense Limits: Flagging employee corporate card purchases that violate department spending caps.
    
Marketing Automation & Email Campaigns
   
   - Audience Filters: Generating smart lists of users based on actions (e.g., "Active users who haven't logged in for 14 days").
   - Drip Workflow Engine: Managing precise timing rules (e.g., "Wait 48 hours, check if link was clicked, then send email B").
   - Campaign Delivery Statistics: Tracking global open rates, clicks, and unsubscribes without storing cookies

Business Intelligence & Data Analytics 
   
   - Data Aggregation Pipelines: Cleaning, formatting, and restructuring messy raw data before saving it into charts.
   - Metric Formulas: Managing the exact rules for calculating business metrics like Monthly Recurring Revenue (MRR) or Churn Rate.
   - Report Visibility: Limiting specific chart views based on a user's company role or their paid subscription plan

Cybersecurity & Identity Governance
   
   - Access Policies: Triggering conditional requirements (like forcing security checks if a user signs in from a brand new country).
   - Compliance Audit Trails: Keeping permanent records of exactly who viewed sensitive files or changed administration settings.
   - Threat Assessment: Analyzing traffic signs to lock accounts showing rapid, suspicious bot-like activity

Content Management Systems (CMS)
   
   - Publishing Workflow: Routing an article from draft to peer review, manager approval, scheduling, and live status.
   - Version History: Saving historical snapshots of text so editors can compare older changes and roll back mistakes.
   - Asset Asset Mapping: Tracking exactly which pages or blog posts use a specific uploaded image file.

### Authorization

RBAC (Role-Based Access Control)

- Role Hierarchy: Defining structural business roles like Owner, Admin, Manager, Member, and Guest.
- Permission Mapping: Linking static capabilities (e.g., `create:project`, `delete:billing`) directly to specific roles.
- Route & Component Guarding: Blocking unauthorized users from entering entire pages or viewing specific UI elements.
- User-to-Role Assignment: Managing how accounts are bound to roles when invited to a new workspace. 

ABAC (Attribute-Based Access Control)

- Dynamic Policy Evaluation: Determining access in real-time based on the user, the resource, and the current environment.
- Contextual Variables: Checking runtime properties like user department, IP address, device type, or time of day.
- Resource Ownership Rules: Enforcing fine-grained logic like "Users can only edit a document if they are the author _and_ the document status is 'Draft'."
- Tenant & Boundary Scoping: Restricting data access based on company dimensions, subscription tiers, or geofences.

### Caching

SSR & ISR (Data Lifecycle & Performance)

- Request Memoization: Reusing fetch responses within a single server render pass to prevent duplicate database calls.
- Data Cache (Server-Side): Storing data across separate user requests and deployments to speed up page loads.
- Full Route Cache: Pre-rendering and caching entire HTML and React Server Component payloads at build or background time.
- Cache Invalidation & Revalidation: Flushing or updating stale cache entries on-demand using tags (`revalidateTag`) or time intervals (`revalidatePath`). 

## Generation XXX

The recipes is used to include modules from the maximal template:

- routes
- webhooks
- features
- components
- types 
- typescript interfaces
- zod schemas
- prisma orm schema
- cache
- fetchers
- actions
- auth
- authz
- constants
- params
- utils
- transactions
- DTO mappers
- prisma selects

## Source Materials

We need aggressively customize these assets to make them look more like my vibes:

- White Label  - Ready to be used in my recipes 
- Dark Mode Only - Remove light mode options
- **Thick Borders** - 3px solid borders that define elements
- **Hard Shadows** - Offset shadows with no blur (4px 4px 0px)
- **Bold Colors** - High-contrast, vibrant color palettes
- **Raw Typography** - Bold, uppercase text for emphasis
- **Zero Radius** - Square corners for that raw, unpolished look 

### BoldKit

[boldkit/src/components/templates at main · ANIBIT14/boldkit](https://github.com/ANIBIT14/boldkit/tree/main/src/components/templates)

- BlogTemplate.tsx
- DashboardTemplate.tsx
- DocsTemplate.tsx
- LandingPageTemplate.tsx
- Portfolio Template.tsx
- PricingTemplate.tsx
- ProductTemplate.tsx

[https://github.com/ANIBIT14/boldkit/tree/main/src/components/blocks](https://github.com/ANIBIT14/boldkit/tree/main/src/components/blocks)
  
- auth-forms.tsx
- dashboard-layout.tsx
- error-pages.tsx
- invoice.tsx
- onboarding-flow.tsx
- settings-page.tsx
- bento-grid.tsx
- changelog-section.tsx
- comparison-table.tsx
- contact-section.tsx
- cta-section.tsx
- faq-section.tsx
- feature-grid.tsx
- footer-section.tsx
- hero-section.tsx
- logo-cloud.tsx
- pricing-section.tsx
- stats-section.tsx
- team-section.tsx
- testimonials.tsx

[https://github.com/ANIBIT14/boldkit/tree/main/src/components/ui](https://github.com/ANIBIT14/boldkit/tree/main/src/components/ui)

- accordion.tsx
- alert-dialog.tsx
- alert.tsx
- ascii-shapes.tsx
- aspect-ratio.tsx
- avatar.tsx
- badge.tsx
- breadcrumb.tsx
- button-group.tsx
- button.tsx
- calendar.tsx
- card.tsx
- carousel.tsx
- chart-toolbar.tsx
- chart.tsx
- checkbox.tsx
- collapsible.tsx
- combobox.tsx
- command.tsx
- context-menu.tsx
- data-table.tsx
- date-picker.tsx
- date-range-picker.tsx
- dialog.tsx
- drawer.tsx
- dropdown-menu.tsx
- dropzone.tsx
- empty-state.tsx
- field.tsx
- hover-card.tsx
- index.ts
- input-group.tsx
- input-otp.tsx
- input.tsx
- kbd.tsx
- label.tsx
- layered-card.tsx
- marquee.tsx
- math-curve-background.tsx
- math-curve-loader.tsx
- math-curve-progress.tsx
- menubar.tsx
- motion.tsx
- multi-step-form.tsx
- native-select.tsx
- navigation-menu.tsx
- pagination.tsx
- popover.tsx
- progress.tsx
- radio-group.tsx
- rating.tsx
- resizable.tsx
- scroll-area.tsx
- select.tsx
- separator.tsx
- sheet.tsx
- sidebar.tsx
- skeleton.tsx
- slider.tsx
- sonner.tsx
- spinner.tsx
- stat-card.tsx
- stepper.tsx
- sticker.tsx
- switch.tsx
- table.tsx
- tabs.tsx
- tag-input.tsx
- textarea.tsx
- time-picker.tsx
- timeline.tsx
- toggle-group.tsx
- toggle.tsx
- tooltip.tsx
- tour.tsx
- tree-view.tsx
- annotations.tsx
- container.tsx
- donut-chart.tsx
- empty.tsx
- funnel-chart.tsx
- gauge-chart.tsx
- heatmap-chart.tsx
- index.ts
- legend.tsx
- loading.tsx
- palettes.ts
- radar-chart.tsx
- radial-bar-chart.tsx
- sankey-chart.tsx
- sparkline.tsx
- tooltip.tsx
- treemap-chart.tsx
- types.ts
- utils.ts

## Codependent Coding

This where the generator/cli ends and the spec-driven agentic pair programing dev tool begins.
## Pages

Then the user can choose which page templates to include:

1. Public & Marketing Pages

  - **Landing Page** (Hero section, features grid, social proof)
  - **Pricing Page** (Tier comparison cards, monthly/annual toggle, FAQs)
  - **Features/Product Tour Page** (Deep-dive layout for specific modules)
  - **Contact / Demo Request Page** (Lead capture form with calendar embed slot) 
  
2. Authentication & Onboarding

  - **Sign In / Log In Page** (Credentials, OAuth buttons, "Forgot Password" link)
  - **Sign Up / Register Page** (Account creation, terms checkbox)
  - **Workspace Setup / Onboarding Flow** (Step-by-step wizard to name organization/invite team)

2. Core Application Dashboards 

  - **Main Dashboard / Overview** (KPI cards, recent activity feed, quick-action shortcuts)
  - **Data List View / Data Table** (Filters, search bar, pagination, bulk actions)
  - **Item Detail / Single Record View** (Tabs for info, activity logs, related records)
  - **Kanban Board View** (Drag-and-drop columns for pipelines or tasks)
  - **Calendar / Timeline View** (Scheduling, deadlines, or resource planning)
  - **Analytics / Reports Dashboard** (Charts, graphs, date-range pickers, export buttons) 

2. Settings & Management

  - **User Profile Settings** (Avatar upload, personal info, password reset)
  - **Team Management / Members Page** (Invite members, role/permission dropdowns)
  - **Billing & Subscription Portal** (Current plan status, invoices, payment method update)
  - **API & Integrations Settings** (Webhook creation, API key management, app marketplace)

5. Utility & Error Pages

  - **404 Not Found Page** (Friendly error graphic, "Go Back Home" button)
  - **500 Server Error Page** (System down notification, support link)
  - **Access Denied / Unauthorized Page** (For users trying to view restricted team data)

6. CRM / Pipeline Tracker

  - **Pipeline Kanban Board** (Drag-and-drop deals across sales stages)
  - **Lead / Contact Directory** (Advanced searchable datagrid of prospects and customers)
  - **Company / Account Profile** (Timeline view of all historical touchpoints) emails, and notes with an organization.
  - **Deals / Revenue Analytics (Win/loss ratios, sales velocity charts, and rep performance leaderboards)

7. Project Management / Task Tracker

  - **Project Overview / Summary:** High-level health metrics, recent file updates, and milestone progress bars.
  - **Task List & Backlog View:** Nested subtasks, custom status labels, and multi-select prioritization queues.
  - **Gantt / Timeline Chart:** Interactive horizontal timeline showing project roadmaps and task dependencies.
  - **My Tasks Dashboard:** Personalized, cross-project layout focusing on an individual worker's due dates.

8. Customer Support / Ticketing System

  - **Agent Inbox / Ticket Queue:** Split-pane interface showcasing unassigned, open, and escalated support queues.
  - **Ticket Resolution Workspace:** Rich-text ticket response editor with a sidebar displaying user history, device context, and macro templates.
  - **Customer Knowledge Base:** Clean, searchable article portal for self-service troubleshooting.
  - **Support SLA Dashboard:** Analytics highlighting average first-response times and resolution metrics.

9. Marketing Automation & Analytics

  - **Campaign Builder / Studio:** Visual card grid or workflow view to chain email steps and behavioral triggers.
  - **Audience Segment Manager:** Rule-based query builder to group users by custom tags and behaviors.
  - **Attribution & ROI Dashboard:** Integrations manager connecting external ad platforms next to multi-touch conversion funnels.

10. Invoicing & Expense Tracker

  - **Invoice Creator:** Form-heavy template featuring multi-currency calculators, tax line-items, and live PDF previewing.
  - **Invoices Directory / Ledger:** Invoice history tab emphasizing status badges (Draft, Paid, Overdue) and quick-action reminder buttons.
  - **Expense Upload & Receipt OCR:** File drop-zone template capturing vendor data alongside category fields.

11. Social Media Scheduler

  - **Content Calendar Grid:** Month/Week calendar layout displaying scheduled image and text posts.
  - **Post Composer:** Split-screen editor showing platform-specific live previews (e.g., LinkedIn vs. X formats).
  - **Media Library Asset Manager:** Folder-based grid view to manage images, videos, and graphic assets.

12. AI-Powered Wrapper / Micro-SaaS

  - **AI Chat / Generation Workspace:** Sidebar conversation window or prompt interface with real-time markdown streaming outputs.
  - **Prompt Engineering Playground:** Sandbox view allowing users to test system prompts, adjust temperature sliders, and track token usage costs.
  - **API Usage Credit Dashboard:** Visual usage meter tracking token consumption, rate limits, and remaining credits.

13. B2B Client Portal

  - **Shared Project Dashboard:** Client-facing welcome screen showing current project status, missing approvals, and quick links.
  - **Secure Document Vault:** File sharing layout featuring upload permissions, digital signing statuses, and version histories.
  - **Client Billing Hub:** Simplified invoice listing allowing external clients to instantly click and settle outstanding accounts via Stripe Elements.

14. Internal Tools / Admin Portal

  - **Database Record Inspector:** Raw data table interface allowing engineers to view, search, and edit database rows.
  - **Bulk User Action Center:** Operational panel designed for administrative workflows like ban-hammer triggers, impersonations, or tier modifications.
  - **Security & Audit Logs:** Paginated, read-only table detailing system actions, IP addresses, and authorization changes. 
  
## Blocks

The user can choose the blocks for each page:

### Marketing Blocks

- **Hero Section** — Bold headline, subtext, CTA button, and optional image/shapes
- **Feature Grid** — 3- and 4-column grids with icons and descriptions
- **Testimonials** — Cards, carousel, and single-quote layouts with avatars
- **Logo Cloud** — Client/partner logo strip with optional marquee scroll
- **CTA Section** — Newsletter signup, trial signup, and contact variants
- **Stats Section** — Big number KPIs with labels and neubrutalism accents
- **Team Section** — Member cards with role, bio, and social links
- **FAQ Section** — Accordion-based Q&A with expand/collapse animation
- **Footer Section** — Multi-column layout with newsletter and social links
- **Contact Section** — Contact form with info cards and map placeholder

### Application Blocks

- **Auth Forms** — Login, Signup, Forgot Password, OTP verification
- **Error Pages** — 404, 500, and maintenance pages in neubrutalism style
- **Settings Page** — Tabbed settings with Profile, Notifications, and Billing panels
- **Onboarding Flow** — Multi-step setup wizard with progress tracking
- **Invoice** — Printable invoice / receipt layout with line items and totals
  
## Components

Then the user can decide with components to include in the blocks:

Form Components

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

Layout & Containers

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

**Feedback & Status**

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

**Navigation**

- Breadcrumb
- Dropdown Menu
- Command Palette
- Pagination
- Popover
- Tooltip
- Hover Card

**Data Display**

- Avatar
- Table
- Calendar
- **Kbd** (keyboard shortcut hints)

**Charts (10 Types)**

- Area Chart
- Bar Chart
- Line Chart
- Pie Chart
- **Donut Chart** (pie with center content)
- **Radar Chart** (multi-variable comparison) 
- **Radial Bar Chart** (circular progress) 
- **Gauge Chart** (speedometer KPI) 
- **Sparkline** (inline trend charts) 

**Decorative (Neubrutalism Special)**

- Sticker (rotated labels)
- Marquee (scrolling ticker)
- **64 SVG Shapes** (Geometric, Organic, Celestial, Mathematical, Mechanical, and more) 
- **17 ASCII Shapes** (Torus, Donut, Sphere, Cube, Helix, Trefoil Knot, Geodesic Dome, Saturn, Hyperboloid, DNA, Spiral, Rose, Wave, Vortex…) 
- **Shape Builder** (interactive tool to customize shapes, export SVG/JSX) 

## Theming

Then the user can choose how to style the components:

*Customize with CSS variables*

```

/* Works with Tailwind v4 + shadcn. Drop this into your globals.css. */

/* Tailwind v4 bridge: maps utility colors (bg-background, text-foreground, …) to the HSL channel variables below. 
Required — without it, classes like bg-background resolve to raw "60 9% 98%" and produce invalid CSS. */

@theme {
  --color-background: hsl(var(--background));
  --color-foreground: hsl(var(--foreground));
  --color-card: hsl(var(--card));
  --color-card-foreground: hsl(var(--card-foreground));
  --color-popover: hsl(var(--popover));
  --color-popover-foreground: hsl(var(--popover-foreground));
  --color-primary: hsl(var(--primary));
  --color-primary-foreground: hsl(var(--primary-foreground));
  --color-secondary: hsl(var(--secondary));
  --color-secondary-foreground: hsl(var(--secondary-foreground));
  --color-accent: hsl(var(--accent));
  --color-accent-foreground: hsl(var(--accent-foreground));
  --color-muted: hsl(var(--muted));
  --color-muted-foreground: hsl(var(--muted-foreground));
  --color-destructive: hsl(var(--destructive));
  --color-destructive-foreground: hsl(var(--destructive-foreground));
  --color-success: hsl(var(--success));
  --color-success-foreground: hsl(var(--success-foreground));
  --color-warning: hsl(var(--warning));
  --color-warning-foreground: hsl(var(--warning-foreground));
  --color-info: hsl(var(--info));
  --color-info-foreground: hsl(var(--info-foreground));
  --color-border: hsl(var(--border));
  --color-input: hsl(var(--input));
  --color-ring: hsl(var(--ring));
  --color-chart-1: hsl(var(--chart-1));
  --color-chart-2: hsl(var(--chart-2));
  --color-chart-3: hsl(var(--chart-3));
  --color-chart-4: hsl(var(--chart-4));
  --color-chart-5: hsl(var(--chart-5));
  --color-neon-pink: hsl(var(--neon-pink));
  --color-neon-green: hsl(var(--neon-green));
  --color-neon-blue: hsl(var(--neon-blue));
  --color-neon-orange: hsl(var(--neon-orange));
  --color-neon-purple: hsl(var(--neon-purple));
  --color-clash-1: hsl(var(--clash-1));
  --color-clash-2: hsl(var(--clash-2));
  --color-clash-3: hsl(var(--clash-3));
  --color-clash-4: hsl(var(--clash-4));
  --radius-sm: calc(var(--radius) - 4px);
  --radius-md: calc(var(--radius) - 2px);
  --radius-lg: var(--radius);
  --radius-xl: calc(var(--radius) + 4px);
}

:root {
  /* Base Colors */
  --background: 60 9% 98%;
  --foreground: 240 10% 10%;

  /* Primary */
  --primary: 0 84% 71%;
  --primary-foreground: 240 10% 10%;

  /* Secondary */
  --secondary: 174 62% 56%;
  --secondary-foreground: 240 10% 10%;

  /* Accent */
  --accent: 49 100% 71%;
  --accent-foreground: 240 10% 10%;

  /* Muted */
  --muted: 60 5% 90%;
  --muted-foreground: 240 4% 46%;

  /* Card & Popover */
  --card: 0 0% 100%;
  --card-foreground: 240 10% 10%;
  --popover: 0 0% 100%;
  --popover-foreground: 240 10% 10%;

  /* Destructive */
  --destructive: 0 84% 60%;
  --destructive-foreground: 0 0% 100%;

  /* Status — success / warning / info */
  --success: 152 69% 69%;
  --success-foreground: 240 10% 10%;
  --warning: 49 100% 60%;
  --warning-foreground: 240 10% 10%;
  --info: 212 100% 73%;
  --info-foreground: 240 10% 10%;

  /* Border & Input */
  --border: 240 10% 10%;
  --input: 240 10% 10%;
  --ring: 240 10% 10%;

  /* Radius - Minimal for neubrutalism */
  --radius: 0rem;

  /* BoldKit specific */
  --shadow-color: 240 10% 10%;
  --shadow-offset: 4px;
  --border-width: 3px;

  /* Chart colors */
  --chart-1: 0 84% 71%;
  --chart-2: 174 62% 56%;
  --chart-3: 49 100% 71%;
  --chart-4: 271 76% 53%;
  --chart-5: 326 78% 60%;

  /* Neon colors */
  --neon-pink: 330 100% 65%;
  --neon-green: 120 100% 50%;
  --neon-blue: 195 100% 50%;
  --neon-orange: 25 100% 55%;
  --neon-purple: 280 100% 60%;

  /* Clash colors */
  --clash-1: 15 85% 60%;
  --clash-2: 280 70% 50%;
  --clash-3: 165 80% 45%;
  --clash-4: 45 95% 55%;
}

.dark {
  /* Base Colors */
  --background: 240 10% 10%;
  --foreground: 60 9% 98%;

  /* Primary */
  --primary: 0 84% 71%;
  --primary-foreground: 240 10% 10%;

  /* Secondary */
  --secondary: 174 62% 56%;
  --secondary-foreground: 240 10% 10%;

  /* Accent */
  --accent: 49 100% 71%;
  --accent-foreground: 240 10% 10%;

  /* Muted */
  --muted: 240 10% 20%;
  --muted-foreground: 60 5% 65%;

  /* Card & Popover */
  --card: 240 10% 14%;
  --card-foreground: 60 9% 98%;
  --popover: 240 10% 14%;
  --popover-foreground: 60 9% 98%;

  /* Destructive */
  --destructive: 0 84% 60%;
  --destructive-foreground: 0 0% 100%;

  /* Status — success / warning / info */
  --success: 152 69% 69%;
  --success-foreground: 240 10% 10%;
  --warning: 49 100% 60%;
  --warning-foreground: 240 10% 10%;
  --info: 212 100% 73%;
  --info-foreground: 240 10% 10%;

  /* Border & Input */
  --border: 60 9% 98%;
  --input: 60 9% 98%;
  --ring: 60 9% 98%;

  /* Shadow */
  --shadow-color: 0 0% 0%;

  /* Neon colors */
  --neon-pink: 330 100% 70%;
  --neon-green: 120 100% 55%;
  --neon-blue: 195 100% 55%;
  --neon-orange: 25 100% 60%;
  --neon-purple: 280 100% 65%;

  /* Clash colors */
  --clash-1: 15 85% 65%;
  --clash-2: 280 70% 55%;
  --clash-3: 165 80% 50%;
  --clash-4: 45 95% 60%;
}

```

