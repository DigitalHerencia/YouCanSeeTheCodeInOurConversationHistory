# DES-M1-P1.1-UXARCH – UX Architecture

Meetings: Sprint Planning @January 3, 2026  (../Meetings/Sprint%20Planning%20@January%203,%202026%202dda4e63bf23819ebd3dfd911c156c9b.md)
Projects: DES-M1-P1.1-UXARCH – UX Architecture  (../Projects/DES-M1-P1%201-UXARCH%20%E2%80%93%20UX%20Architecture%202dba4e63bf2380248131e5d5013a6474.md)
Status: Done
Sub-item: T01 Core user flows  (T01%20Core%20user%20flows%202e2a4e63bf23804fb97dff9ebc55688b.md), T02 Information architecture  (T02%20Information%20architecture%202e2a4e63bf23809381ebf90612ce7c63.md), TO3 Design system alignment (TO3%20Design%20system%20alignment%202e2a4e63bf238191a8a7e7687ac0edd1.md), T04 Low-fidelity prototypes  (T04%20Low-fidelity%20prototypes%202e2a4e63bf23803db3bfee377ace7c55.md), T05 Handoff to Engineering  (T05%20Handoff%20to%20Engineering%202e2a4e63bf2380ccbf42e1d949a2559a.md)
Tasks: T01 Core user flows  (../Tasks/T01%20Core%20user%20flows%202dba4e63bf238057bd45f4e86bb80939.md), T02 Information architecture  (../Tasks/T02%20Information%20architecture%202dca4e63bf2380c2a786e8bb473b9554.md), T03 Design system alignment  (../Tasks/T03%20Design%20system%20alignment%202dfa4e63bf238005aa28c5b615f70591.md), T04 Low-fidelity prototypes  (../Tasks/T04%20Low-fidelity%20prototypes%202e2a4e63bf23804da8edd48c2fed4dd8.md), T05 Handoff to Engineering  (../Tasks/T05%20Handoff%20to%20Engineering%202e2a4e63bf23800a99e4c7b5c9df23f4.md)
Teams: Design Team (../Teams/Design%20Team%202d5a4e63bf238097bffedd7bde5a3f69.md)

# T01 Core User Flow

---

**Milestone:** M1 — Market Narrative / Problem Definition

Phase: P1.1 Product Discovery & Business Definition

Project: DES-M1-P1.1-UXARCH – UX Architecture 

**Team:** Design

**Artifact Type:** UX Architecture — Core User Flows

**Owner:** Ivan P. Roman

**Date:** Jan 1, 2026

## 0. UX FIRST PRINCIPLES (Context for Design)

Before flows, align on **non-negotiables**:

- Users are **already data-literate** but time-constrained.
- Value is delivered when **comparison + trend insight** happens faster than gut instinct.
- Emotional driver: **competitive awareness + control**, not dashboards for their own sake.
- Every core flow must answer at least one of:
    - *What should I stock?*
    - *What should I stop stocking?*
    - *How do I compare to competitors right now?*
    - *What’s about to matter next?*

If a screen does not move the user closer to one of those answers, it is not core.

## 1. PRIMARY CORE FLOWS (Must Work on Day One)

These are the **minimum viable flows** required for the product to deliver its promised transformation.

### FLOW 1 — First-Time User → First Insight (Time-to-Value)

**Goal:** Deliver meaningful competitive insight within first session.

**Trigger:**

User creates account or logs in for the first time.

**Flow:**

1. User logs in
2. System prompts: **“Select your home dispensary”**
3. User selects dispensary (search / dropdown / geo-based)
4. System loads:
    - Home dispensary sales overview
    - Market baseline for same city/region
5. System highlights:
    - Key deltas vs market (sales, product mix, trends)

**Outcome:**

User immediately sees **how they stack up**.

**Success Signal:**

User verbalizes or internally recognizes *“Oh shit — I didn’t know that.”*

### FLOW 2 — Competitive Comparison (Petty-Driven Insight)

**Goal:** Enable side-by-side comparison between dispensaries.

**Trigger:**

User selects “Compare” or competitor view.

**Flow:**

1. User selects competitor dispensary (or set)
2. User selects comparison dimension:
    - Total sales
    - Category mix
    - SKU overlap
    - Price positioning
3. System renders:
    - Overlayed graphs
    - Delta indicators (up/down)
4. User toggles timeframe (daily / monthly / seasonal)

**Outcome:**

User understands **who is winning, where, and why**.

**Success Signal:**

User identifies a **specific actionable difference** (pricing, assortment, timing).

### FLOW 3 — Trending Product Discovery

**Goal:** Identify products gaining momentum before they peak.

**Trigger:**

User navigates to “Trending Products”.

**Flow:**

1. User selects market scope (city / region / statewide)
2. System applies trend algorithm (velocity × distribution × pricing × visibility)
3. System ranks products:
    - Rising
    - Peaking
    - Declining
4. User drills into a product:
    - Where it’s stocked
    - Price range
    - Sales velocity

**Outcome:**

User knows **what to buy now** and **what to avoid**.

**Success Signal:**

User makes or plans a stocking decision based on insight.

### FLOW 4 — Event-Driven Planning (420, Holidays)

**Goal:** Plan inventory around predictable demand spikes.

**Trigger:**

User selects event planning or calendar view.

**Flow:**

1. User selects upcoming event (e.g., 4/20)
2. System shows:
    - Historical performance for similar periods
    - Product categories that spike
3. System surfaces:
    - “Likely winners”
    - “Likely overstock risks”
4. User adjusts timeframe to validate trend consistency

**Outcome:**

User feels **prepared instead of reactive**.

**Success Signal:**

User confirms a pre-event inventory strategy.

## 2. SECONDARY SUPPORTING FLOWS

These flows support depth and retention but are not the first-session core.

### FLOW 5 — Market Exploration (Macro → Micro)

- User explores market without starting from their own dispensary
- City → Category → Product drill-down
- Used for research, not urgency

### FLOW 6 — Historical Analysis

- User compares performance across months or seasons
- Used for reflection and planning, not immediate action

### FLOW 7 — Admin / Data Integrity (Internal)

- Admin users verify data freshness
- Manage access and roles
- Not exposed to standard retail users as value drivers

## 3. NON-CORE / EXPLICITLY OUT-OF-SCOPE (For M1)

These are **intentionally excluded** from Core User Flows:

- Gamification mechanics
- Alerts / notifications
- Automated recommendations
- AI narrative summaries
- Social features
- Export / reporting workflows

They belong in **later milestones** once core insight trust is established.

## 4. FLOW DEPENDENCIES & ASSUMPTIONS

- Auth must complete **before** any insight is shown
- Home dispensary selection is mandatory
- Market data is assumed to be:
    - Accurate
    - Fresh
    - Trusted by the user base
- UX prioritizes **comparison speed over visual novelty**

## 5. DESIGN HANDOFF NOTES

- Each flow should map cleanly to:
    - One primary screen
    - One dominant action
- Avoid multi-purpose screens early
- Optimize for **decision clarity**, not feature density

# T02 Information Architecture

---

**Artifact:** Product Navigation & Structural Definition

**Title:** Page and Section Hierarchy for Competitive Advantage

**Date:** January 2, 2026

**Owner:** Ivan P. Roman

**Team:** Product / Design / Engineering

**Milestone:** M1 – Market Narrative

**Project:** P2 – Product Structure

**Artifact Type:** Information Architecture

## 1. Purpose

This document defines the **canonical page hierarchy and naming system** for Competitive Advantage.

Its goals:

- Keep user flows aligned with **daily operational decision-making**
- Reinforce the product’s **competitive intelligence posture**
- Prevent feature sprawl and semantic drift
- Ensure RBAC and feature gating map cleanly to navigation

If a screen cannot be placed cleanly in this hierarchy, the screen is suspect.

## 2. Core IA Principles

These are not suggestions.

### 2.1 Operator-First, Not Analyst-First

- Pages answer **questions operators actually ask**
- No abstract “analytics layers”
- No dumping ground called “Insights”

### 2.2 Temporal Gravity

The IA follows **decision cadence**, not data taxonomy.

- “What’s happening right now?”
- “What should I do today?”
- “How are we performing?”
- “Who are we up against?”

### 2.3 Competitive Framing Is Explicit

Competition is not hidden behind filters.

If users are competing, the UI should admit it openly.

### 2.4 RBAC-Aware by Construction

Navigation visibility must map directly to role authority.

If a role cannot act on a page, the page should not exist for them.

## 3. Top-Level Navigation (Primary)

This is the **left rail / primary nav**.

Order matters.

```
Dashboard
Daily
Sales
Products
Customers
Market
Performance
Admin

```

No more. No less.

## 4. Section-by-Section Breakdown

### 4.1 **Dashboard**

**Purpose:** Situational awareness in under 30 seconds.

**Primary Question:**

> “What’s going on right now?”
> 

**Contents:**

- KPI tiles (sales, growth, rank, market share)
- Alerts & anomalies
- Quick competitor movement
- Snapshot trends

**Notes:**

- Zero configuration required to be useful
- Customization is additive, not mandatory
- Read-only for Viewer role

This page should feel slightly stressful. That’s the point.

### 4.2 **Daily**

**Purpose:** Bridge analytics and action.

**Primary Question:**

> “What should I do today?”
> 

**Subsections:**

- Calendar view (sales + events)
- Daily notes
- Promotion recommendations
- Trend flags

**Notes:**

- This is where the product earns its keep
- Mutations live here (notes, actions)
- Managers live here, Analysts mostly don’t

If someone skips this page entirely, they’re probably not your user.

### 4.3 **Sales**

**Purpose:** Understand revenue dynamics over time.

**Primary Question:**

> “How are we selling, and why?”
> 

**Subsections:**

- Overview (daily / monthly / rolling)
- Medical vs adult-use splits
- Velocity & momentum
- Market share views

**Notes:**

- Time-series first, tables second
- No raw exports at top level
- Designed for pattern recognition, not accounting

This is not QuickBooks cosplay.

### 4.4 **Products**

**Purpose:** Optimize assortment and pricing.

**Primary Question:**

> “What’s working on the shelf?”
> 

**Subsections:**

- Product performance
- Category trends
- Competitor product comparisons
- Rankings and deltas

**Notes:**

- Every product exists in a competitive context
- Dead SKUs are surfaced aggressively
- “Nice-to-know” metrics are intentionally absent

This page should make underperformers uncomfortable.

### 4.5 **Customers**

**Purpose:** Revenue leverage through behavior.

**Primary Question:**

> “Who’s buying, and how are they changing?”
> 

**Subsections:**

- Segmentation
- Cohorts
- LTV & churn signals
- Customer journey views

**Notes:**

- No CRM pretense
- No inbox, no tickets
- Customers are signals, not relationships

If someone asks for messaging tools here, send them elsewhere.

### 4.6 **Market**

**Purpose:** External competitive awareness.

**Primary Question:**

> “What does the battlefield look like?”
> 

**Subsections:**

- Geography (map-first)
- City performance
- Market density
- External trend signals

**Notes:**

- This is explicitly *not* internal performance
- Competitors are first-class citizens here
- Maps are operational, not decorative

This is where “local” stops being a buzzword.

### 4.7 **Performance**

**Purpose:** Objective competitive benchmarking.

**Primary Question:**

> “Are we winning?”
> 

**Subsections:**

- Dispensary vs dispensary comparisons
- Rank movement
- Benchmarks
- Growth projections

**Notes:**

- Comparison is opt-in but central
- Narrative summaries are allowed here
- This page settles arguments

If someone wants vibes, they can leave.

### 4.8 **Admin**

**Purpose:** Governance and control.

**Primary Question:**

> “Who has power, and how is it configured?”
> 

**Subsections:**

- Users & roles
- Competitor configuration
- Activity logs
- Automated workflows

**Notes:**

- Hidden entirely for non-authorized roles
- No analytics here
- No opinions here

Admin is boring by design. That’s a feature.

## 5. Secondary Navigation Rules

- Subsections must be nouns, not verbs
- No section exceeds 5 subsections without review
- If two pages answer the same question, one is wrong

## 6. Naming Guardrails

**Allowed**

- Direct
- Concrete
- Competitive
- Operational

**Forbidden**

- “Insights”
- “Intelligence”
- “Hub”
- “Center”
- “Solutions”

If the name sounds like a SaaS landing page headline, it’s out.

## 7. Alignment Check (Non-Negotiable)

Each top-level section maps cleanly to the product problem:

| Problem | Section |
| --- | --- |
| Situational awareness | Dashboard |
| Daily action | Daily |
| Revenue understanding | Sales |
| Shelf optimization | Products |
| Buyer behavior | Customers |
| External context | Market |
| Competitive truth | Performance |
| Control & safety | Admin |

No orphan pages. No philosophical drift.

## 8. Summary

This IA:

- Forces competitive framing
- Respects operator time
- Aligns with RBAC and tenancy
- Prevents analytics theater

If a future feature doesn’t fit, the feature is guilty until proven innocent.

# T03 Design System Alignment

---

## **EXECUTIVE SUMMARY**

The **Competitive Advantage** platform is positioned to deliver operationally-driven competitive intelligence, not analytics theater. The design system must be ruthlessly aligned to support:

1. **Speed-to-insight** (first session < 5 minutes to actionable intelligence)
2. **Competitive framing** (comparison is not optional—it's structural)
3. **Operator-first language** (no abstract "metrics"; all decisions tied to shelf/revenue action)
4. **Role-based information architecture** (RBAC reflected in every pixel)

This alignment document establishes the design foundations for M1 and prevents scope creep through P1–P5.

## **1. DESIGN SYSTEM PURPOSE STATEMENT**

The TO3 Design System for Competitive Advantage serves **three core audiences** simultaneously:

### 1.1 **Primary User: Cannabis Retail Manager**

- **Mental Model:** "I run a store. What do I need to do today to outperform competitors?"
- **Time Budget:** 5–15 minutes daily (competitive checks), 30 minutes weekly (planning)
- **Emotional Driver:** Control + competitive awareness
- **Success:** Makes informed assortment/pricing decisions before competitors do

### 1.2 **Secondary User: Store Owner / District Manager**

- **Mental Model:** "How are my dispensaries performing against local competition?"
- **Time Budget:** 30 minutes weekly (strategic review)
- **Emotional Driver:** Confidence in multi-location performance
- **Success:** Identifies top/bottom performers and intervenes early

### 1.3 **Tertiary User: Admin / Compliance**

- **Mental Model:** "Who can access what, and is the system trustworthy?"
- **Time Budget:** Episodic (user management, data verification)
- **Emotional Driver:** Control + risk mitigation
- **Success:** Governance is invisible; system is transparent

## **2. DESIGN SYSTEM PILLARS**

These are the **non-negotiable structural principles** that every design decision must satisfy:

### 2.1 **PILLAR 1: Competitive Framing**

**Definition:** Comparison is not a feature—it is the architecture.

**Implications:**

- Every data point is contextualized against market baseline or specific competitor
- No "your performance in isolation" views (except Admin context)
- Competitor names/dispensaries are visually first-class citizens
- Delta indicators (Δ) are the default quantitative visual
- Color coding: Self vs. Market vs. Competitor is systemically consistent

**Example Application:**

- Dashboard KPI tiles: `Your Sales: $2.3K | Market Avg: $1.8K | Lead: +28%`
- Product page: "Rising Nationally" badge + your current stock position
- Performance page: Rank badge with arrow momentum indicator

**Design Implication:**

- Status quo thinking is structurally impossible; the UI forces competitive consciousness

### 2.2 **PILLAR 2: Speed-to-Value (Sub-5-Minute First Insight)**

**Definition:** No setup, no tutorials, no "getting started" friction. Insight arrives by minute 3.

**Implications:**

- Landing page + auth → Dashboard → First insight decision point ≤ 5 minutes
- Dashboard is **read-only and pre-populated** (no configuration required to be useful)
- Navigation is flat and obvious (8 top-level sections, no sub-menus on first visit)
- All queries are instantaneous or explicitly show loading state (no mystery delays)
- Empty states do not exist; data is seeded for first-time users

**Example Application:**

- User logs in → System auto-selects home dispensary (or prompts once) → Dashboard loads with pre-calculated insights (sales vs market, top-trending products, competitor movement)
- No "Which metrics matter to you?" setup wizard
- No "Customize your dashboard" on day one

**Design Implication:**

- Onboarding is baked into the product itself; no separate flow
- Visual hierarchy prioritizes the most important insight, not comprehensive coverage

### 2.3 **PILLAR 3: Operational Clarity (Language & Metaphor)**

**Definition:** Every label, every button, every visual answers a real business question.

**Implications:**

- Avoid analytics jargon: "Insights," "Intelligence," "Hub," "Center" are banned
- Use operator language: "Products," "Sales," "Daily," "Competitors," "Performance"
- Every screen title is a question the user actually asks (not a feature name)
- No abstract metrics; all numbers tie to action (stock, price, promote, discontinue)

**Example Application:**

- ❌ Bad: "Analytics Hub" → "Metrics Dashboard" → "Custom Dimensions"
- ✅ Good: "Daily" → "What should I do today?" → "Products I should stock" + "Products I should drop"
- ❌ Bad: "Segment Analysis"
- ✅ Good: "Who's buying?" → "Doctors vs. Patients" view + "When do they buy?"

**Design Implication:**

- Microcopy is operational, not playful
- Icons and visual metaphors are literal (calendar = temporal, people = customers, chart = comparison)
- No gamification language ("Achievements," "Streaks," "Badges")

### 2.4 **PILLAR 4: Role-Based Information Architecture (RBAC by Design)**

**Definition:** Every user sees exactly what they need to act. No more, no less.

**Implications:**

- Navigation visibility is gated by role (Owner sees Admin; Manager does not)
- Feature access is granular (Viewer: read-only; Manager: read + daily actions; Owner: read + strategic mutations)
- Performance data is gated by tenancy and role (users cannot see competitors' internal sales details)
- Admin surfaces are hidden entirely from operational users

**Example Application:**

- **Manager:** Dashboard, Daily, Sales, Products, Customers, Market, Performance (read-only)
- **Owner:** Above + Admin section
- **Viewer:** Dashboard, Market, Performance (read-only, cannot access Daily)
- **Analyst:** Custom role with deep access but no mutation authority

**Design Implication:**

- No "disabled" buttons or "coming soon" labels; those options don't appear for unauthorized roles
- Progressive disclosure is role-based, not preference-based
- Left-rail nav updates dynamically as user role context changes

### 2.5 **PILLAR 5: Data Integrity & Freshness**

**Definition:** Users trust the data. The system proves it.

**Implications:**

- Every data visualization includes a "last updated" timestamp (subtle but visible)
- Refresh rates are explicit (real-time, hourly, daily) and consistent
- Data gaps trigger obvious warnings, not silent nulls
- Admin can audit data lineage and source confidence

**Example Application:**

- Dashboard KPI tile footer: "Updated 2 min ago"
- Product comparison: "Data current as of today 4 PM"
- Market section: "Competitor data refreshed daily at 6 AM"

**Design Implication:**

- Trust is visual; timestamps are baked into the design system, not afterthoughts
- Loading states and staleness indicators are consistent and predictable

## **3. INTERACTION PATTERNS (Core to TO3)**

These patterns must be consistent across all pages and roles:

### 3.1 **Pattern 1: The Comparison View (Default)**

**When:** User wants to understand their performance vs. market/competitors

**Visual Contract:**

- Left side: Your data (primary focus, darker or larger)
- Right side: Comparison baseline (lighter, smaller, contextual)
- Center: Delta indicator (Δ, %, arrow, color)
- Timeline controls: Unified across all views (day, week, month, quarter, year)

**Notes:**

- This pattern repeats on Dashboard, Daily, Sales, Products, Performance pages
- Consistency means users build mental shortcuts

### 3.2 **Pattern 2: The Drill-Down (Category → Product → SKU)**

**When:** User wants to go deep on a specific segment

**Visual Contract:**

- Breadcrumb navigation (always visible, always clickable back)
- Contextual header (shows hierarchy level + current selection)
- Filterable results below (sortable, searchable, time-filterable)
- Comparison view available at every level

**Notes:**

- No dead ends; every level has comparison context
- Search is predictive and instant (no submit button)

### 3.3 **Pattern 3: The Action Zone (Daily decisions)**

**When:** User needs to take action (note, promote, stock, discontinue)

**Visual Contract:**

- Primary action button (prominent, high-contrast)
- Secondary actions (menu or inline buttons)
- Confirmation state (success toast with undo option)
- Activity log (recent actions visible in sidebar or modal)

**Notes:**

- Actions must complete instantly or show explicit progress
- Undo is always available for reversible actions (24-hour window)

### 3.4 **Pattern 4: The Market Context (Always visible)**

**When:** User browses any internal data

**Visual Contract:**

- Subtle badge or indicator showing market position
- Rank or percentile (e.g., "Top 15% in city")
- Trend arrow (↑ ↓ → compared to previous period)
- Competitor count (e.g., "2 competitors stock this")

**Notes:**

- This pattern is *always on*, never hidden
- Market context is loaded from precomputed aggregates (no real-time calculation)

### 3.5 **Pattern 5: The Status Indicator (System health)**

**When:** User lands on any page

**Visual Contract:**

- Data freshness indicator (timestamp + refresh status)
- Connection status (online/offline graceful degradation)
- Alerts or anomalies (prominent but not intrusive)

**Notes:**

- Green/yellow/red only (no gradient shades)
- Clicking timestamp shows data lineage (for power users)

## **4. COLOR & VISUAL LANGUAGE**

### 4.1 **Color Palette (M1 Target)**

| **Role** | **Color** | **Usage** | **Hex** |
| --- | --- | --- | --- |
| Primary (Your data) | Deep Green | KPI tiles, main charts, selected state | `#0F766E` |
| Context (Market avg) | Neutral Gray | Comparison baseline, secondary data | `#64748B` |
| Competitor | Warm Orange | Competitor data, rival positioning | `#EA580C` |
| Positive Delta | Growth Green | ↑ indicators, outperformance | `#10B981` |
| Negative Delta | Caution Red | ↓ indicators, underperformance | `#EF4444` |
| Neutral / Trend | Cool Blue | Trends, neutral comparisons | `#3B82F6` |
| Action Prompt | Bold Purple | CTAs, "do this now" buttons | `#8B5CF6` |
| Background (Light) | Off-white | Main surface, read-only zones | `#F8FAFC` |
| Background (Dark) | Slate | Secondary surfaces, data zones | `#1E293B` |
| Text Primary | Near-black | All body text, labels | `#0F172A` |
| Text Secondary | Slate | Supporting text, hints | `#64748B` |

**Rationale:**

- Green/Gray/Orange creates clear competitive framing (Self / Market / Competitor)
- Green & Red deltas are universal (no cultural ambiguity in cannabis retail)
- Purple CTA is intentional contrast, not primary brand color
- Gray background minimizes distraction from data

### 4.2 **Delta Indicators (Mandatory)**

Every comparative metric includes a delta:

**Exception:**

- Rank views use ordinal numbers + arrow: `#5 ↑ (was #8 last month)`

### 4.3 **Typography Hierarchy**

| **Size** | **Weight** | **Usage** | **Tokens** |
| --- | --- | --- | --- |
| 28px | 700 | Page titles | `heading-1` |
| 20px | 600 | Section headers | `heading-2` |
| 16px | 500 | Subsection headers | `heading-3` |
| 14px | 400 | Body text, labels | `body` |
| 12px | 400 | Supporting text, timestamps | `caption` |
| 12px | 600 | Badges, tags | `badge` |

**Rationale:**

- Clear hierarchy prevents cognitive overload
- All sizes are readable at 96 DPI on mobile
- No more than 3 font weights in use (avoids visual chaos)

## **5. COMPONENT LIBRARY (M1 Scope)**

These components are **required** to exist in the design system before development begins:

### 5.1 **Core Components (Non-Negotiable)**

| **Component** | **Usage** | **States** | **Priority** |
| --- | --- | --- | --- |
| **KPI Tile** | Dashboard, Daily overview | Default, Loading, Alert, Trend | P0 |
| **Comparison Chart** | Sales, Products, Performance pages | Line, Bar, Delta overlay | P0 |
| **Rank Badge** | Product cards, competitor views | Integer + arrow + color | P0 |
| **Delta Indicator** | All comparative data | ↑/↓/→ + value + color | P0 |
| **Time Selector** | All temporal views | Day, Week, Month, Quarter, Year | P0 |
| **Data Table** | Detailed views (Products, Customers) | Sortable, Filterable, Paginated | P0 |
| **Alert Box** | Anomalies, system status | Info, Warning, Error, Success | P0 |
| **Action Button** | Daily decisions, mutations | Primary, Secondary, Disabled, Loading | P0 |
| **Left-Rail Nav** | All pages | Active, Inactive, Role-gated, Collapsible | P0 |
| **Breadcrumb** | Drill-down views | Clickable, Truncated for depth | P0 |
| **Search Input** | Products, Competitors, Customers | Instant suggestions, No submit button | P0 |
| **Loading Skeleton** | Async data | Pulsing animation, Predictable shapes | P0 |
| **Empty State** | No data scenarios | Contextual messaging, Not generic | P0 |
| **Timestamp Badge** | Data freshness | Relative time + absolute time tooltip | P0 |

### 5.2 **Secondary Components (P1, P2 Scope)**

These are designed in M1 but implemented in P2:

- Modal dialogs
- Dropdown menus
- Tabs
- Tooltips
- Toast notifications
- Modals (action confirmation)

---

## **6. ACCESSIBILITY (WCAG 2.2 Level AA + Competitive Advantage Extras)**

All components must conform to WCAG 2.2 Level AA by default. Additionally:

### 6.1 **Color Contrast**

- All text on colored backgrounds: 4.5:1 minimum (AA standard)
- Interactive elements (buttons, links): Distinguishable by shape + color, not color alone
- Delta indicators: Use symbol (↑/↓/→) + color redundantly

### 6.2 **Keyboard Navigation**

- All interactive elements are tab-navigable
- Tab order follows reading order (left-to-right, top-to-bottom)
- Left-rail nav is navigable via arrow keys without mouse
- Time selectors are keyboard-accessible (no mouse-only)

### 6.3 **Screen Reader Support**

- All KPI tiles have `aria-label` describing value + context (e.g., "Your sales: two thousand three hundred forty dollars, up 28% from market average")
- Comparison charts have text summary alternative (no chart descriptions—show the numbers)
- Role and rank are announced (e.g., "5th place in city")
- Alerts are announced as `role="alert"` for dynamic content

### 6.4 **Data Density for Power Users**

- Option to view compact mode (for users with strong visual acuity)
- Compact mode reduces whitespace, increases information density by 40%
- Accessible via toggle in settings or keyboard shortcut

## **7. RESPONSIVE DESIGN BREAKPOINTS**

| **Breakpoint** | **Width** | **Primary Use** | **Design Notes** |
| --- | --- | --- | --- |
| **Mobile** | 320–768px | Cannabis retail floor (quick checks) | Stacked layout, 1 KPI per row, full-width buttons |
| **Tablet** | 768–1024px | Retail office/home (tactical review) | 2 KPIs per row, sidebar navigation collapsible |
| **Desktop** | 1024–1440px | Primary work surface (strategic planning) | 4 KPIs per row, persistent sidebar, multi-panel layouts |
| **Large Desktop** | 1440px+ | Multi-monitor setups | 4 KPIs per row, comparison panels side-by-side, data density increased |

**Mobile-First Priority:**

- Dashboard and Daily are optimized for mobile (manager on the floor)
- Products and Performance are desktop-primary (office-bound analysis)
- Market is map-primary on mobile, table-secondary on desktop

## **8. MOTION & MICROINTERACTION LANGUAGE**

### 8.1 **Principles**

- **Purposeful:** Every animation communicates state change or directs attention
- **Fast:** All animations < 300ms (feels instant)
- **Consistent:** Entrance, exit, state-change animations use same easing curve (ease-in-out)

### 8.2 **Specific Microinteractions**

| **Trigger** | **Animation** | **Duration** | **Purpose** |
| --- | --- | --- | --- |
| Page load | Skeleton fade-in, then content fade-in | 200ms stagger | Shows data is loading, not static |
| KPI delta change | Number morphs, color pulses once | 400ms | Draws attention to change without alarm |
| Button click (action) | Button scales slightly, then toast slides in | 150ms + 100ms | Confirms action was registered |
| Comparison toggle (chart) | Old line fades, new line draws itself | 300ms | Shows which data is being compared |
| Drill-down navigation | Fade out + slide in (left-to-right) | 250ms | Shows depth progression |
| Alert dismissal | Slide-up and fade | 200ms | Feels natural, doesn't feel rushed |

### 8.3 **Easing Functions**

- **All animations:** `cubic-bezier(0.4, 0, 0.2, 1)` (Material Design standard)
- **No bounce or elastic easing** (this is not playful; it's operational)

## **9. DATA VISUALIZATION CONVENTIONS**

### 9.1 **Chart Types & Usage**

| **Chart Type** | **Usage** | **When to Avoid** |
| --- | --- | --- |
| **Line Chart** | Sales over time, trend comparison | More than 3 series; categorical data |
| **Bar Chart** | Category comparison (Products, Customers by segment) | Time-series trends; more than 10 categories |
| **Combo (Line + Bar)** | Your data vs. market comparison over time | Complex multi-series; 4+ series |
| **Map (Heatmap)** | Geographic distribution, regional performance | Precise numerical comparisons; sparse data |
| **Rank Badge** | Competitive position | Anything else |
| **KPI Tile** | Single metric + delta + trend | Complex relationships; many dimensions |

### 9.2 **Visual Encoding Rules**

- **X-axis:** Time (always left-to-right, chronological)
- **Y-axis:** Magnitude (always zero-based for area charts; can float for line charts if trend is the focus)
- **Color encoding:** Self (green) vs. Market (gray) vs. Competitor (orange)
- **Line thickness:** Primary data is thicker than supporting data (2px vs. 1px)
- **Legend placement:** Below chart (not embedded, not right-aligned on desktop)

### 9.3 **Null Data Handling**

- Missing data points: Shown as a gap in line (never interpolated)
- Zero values: Explicitly shown as 0, not omitted
- Projected data: Drawn with dashed line, clearly distinguished from actual

---

## **10. INFORMATION ARCHITECTURE VALIDATION (Per IA Document)**

The TO3 Design System reinforces the canonical IA structure:

| **IA Section** | **Primary Question** | **Design System Role** | **Visual Signature** |
| --- | --- | --- | --- |
| **Dashboard** | What's happening right now? | Stressful awareness; KPI tiles + alerts | Green + gray + orange; no deep interaction |
| **Daily** | What should I do today? | Action-focused; decision prompts + notes | Bold purple CTA; compact layout |
| **Sales** | How are we selling? | Time-series primary; minimal comparison | Green line chart; market overlay optional |
| **Products** | What's working on the shelf? | Competitive ranking; dead-SKU highlighting | Rank badges; red underperformers highlighted |
| **Customers** | Who's buying? | Segmentation + cohort views | Neutral blue for exploration; gray comparison |
| **Market** | What does the battlefield look like? | Map-first; external perspective | Orange competitor focus; light green your data |
| **Performance** | Are we winning? | Benchmarking + narrative | Green rank + delta + growth projection |
| **Admin** | Control & governance | Utilitarian; no design flourish | Neutral gray; utilitarian typography |

**Design Validation Rule:**

If a screen does not fit cleanly into one of these 8 sections with a clear visual signature, the screen is suspect and must be re-evaluated.

## **11. DESIGN SYSTEM DELIVERABLES (M1 Handoff to P1)**

### 11.1 **Required Assets**

- [ ]  **Figma component library** (all P0 components + states)
- [ ]  **Color token definitions** (with semantic naming, WCAG validation report)
- [ ]  **Typography scale** (CSS variables + specimen sheet)
- [ ]  **Icon set** (Figma library + SVG exports; cannabis-industry neutral)
- [ ]  **Motion specifications** (easing curves, duration reference)
- [ ]  **Breakpoint guide** (with device mockups)
- [ ]  **Accessibility audit report** (WCAG 2.2 AA + test results)
- [ ]  **8 Core Page Templates** (Dashboard, Daily, Sales, Products, Customers, Market, Performance, Admin)
- [ ]  **Mobile-first variants** for Dashboard and Daily
- [ ]  **Data visualization standards document** (chart types, encoding, nulls)
- [ ]  **Microcopy guide** (button labels, error messages, confirmations)
- [ ]  **Design system documentation** (Storybook or Notion; link from README)

### 11.2 **QA Gate**

Before handing off to P1, validate:

- [ ]  All components render correctly in light + dark mode
- [ ]  All components meet WCAG 2.2 AA contrast + keyboard navigation
- [ ]  All pages satisfy the IA structure + visual signature
- [ ]  Mobile breakpoints are tested on actual devices (iOS + Android)
- [ ]  Figma components are linked to code library (no drift)
- [ ]  Typography hierarchy is consistent across all pages
- [ ]  Delta indicators are present on all comparative data
- [ ]  Competitor framing is explicit on every relevant page

## **12. DESIGN TEAM WORKING AGREEMENTS (M1–P5)**

### 12.1 **Spec-First Design**

Before any mockup:

1. Write EARS requirement
2. Define success signal
3. Map to IA section
4. Identify user role + persona
5. Then design

### 12.2 **Component Reuse Mandate**

Before creating a new component:

1. Check Figma library
2. Check existing pages for similar patterns
3. If similar exists, extend it (don't duplicate)
4. Document override rationale

### 12.3 **Accessibility by Default**

- All designs include WCAG 2.2 AA compliance check before handoff to dev
- No "we'll add alt text later"
- No "keyboard nav is phase 2"
- Contrast ratios are checked in Figma using plugin

### 12.4 **Competitive Framing Non-Negotiable**

Every page must answer: "Where do we stand vs. competition?"

- If no comparison context, the page is incomplete
- If comparison is hidden, the page is failure

### 12.5 **Naming Discipline**

- Reject all marketing-speak (no "Insights," "Hub," "Center")
- Use operator language only
- Validate all microcopy against PRD persona needs

## **13. SUCCESS METRICS (How We Know TO3 Is Working)**

By end of M1, measure:

| **Metric** | **Target** | **How Measured** |
| --- | --- | --- |
| **Time to first insight** | < 5 min | Usability testing with 5 retail managers |
| **Component reuse** | > 80% of UI built from library | Design system audit (Figma) |
| **WCAG 2.2 AA coverage** | 100% | Automated + manual audit |
| **Competitive framing visibility** | 100% of comparative data | Page-by-page checklist |
| **Role-based nav gating** | 100% accurate | QA validation per role |
| **Mobile usability** | SUS score > 70 | Usability testing on actual phones |
| **Design-dev alignment** | < 10% rework | Dev team feedback post-P1 |

## **14. RISKS & MITIGATIONS**

| **Risk** | **Impact** | **Mitigation** |
| --- | --- | --- |
| **Design-dev misalignment** | Rework, schedule slip | Weekly sync; Figma → code library link |
| **Competitor data sensitivity** | Legal/trust issue | Legal review before launch; ensure anonymization |
| **Mobile performance** | Slow load times | Optimize charts for mobile; lazy-load secondary data |
| **Accessibility gaps discovered late** | Legal exposure | Audit early + often; bake into QA gate |
| **Scope creep (features not in IA)** | Feature sprawl; design coherence loss | IA document is gospel; reject all out-of-scope features |
| **Color palette accessibility** | 10–15% of users can't distinguish colors | Use symbols + color redundantly; test with color blindness simulator |

## **15. SUMMARY & NEXT STEPS**

### **What TO3 Establishes:**

1. **Competitive framing is structural**, not optional
2. **Speed-to-value is non-negotiable** (< 5 min to first insight)
3. **Role-based design** ensures users see only what they need
4. **Operator language** prevents analytics theater
5. **Accessibility by default** (WCAG 2.2 AA)
6. **Component reuse** reduces drift and maintenance

### **Design Team Actions (Week 1–2, M1):**

- [ ]  Finalize Figma library (P0 components + states)
- [ ]  Validate color palette against WCAG 2.2 + competitor framing
- [ ]  Design 8 core page templates
- [ ]  Create mobile variants (Dashboard, Daily)
- [ ]  Document microcopy standards
- [ ]  Conduct accessibility audit
- [ ]  Hand off Figma link to engineering for P1

### **Engineering Integration (Week 2–3, M1):**

- [ ]  Review Figma library
- [ ]  Identify component mapping to code (shadcn/ui, custom)
- [ ]  Establish Figma-to-code workflow
- [ ]  Set up design tokens in codebase
- [ ]  Plan accessibility testing automation

### **Validation Gate (End of M1):**

All 14 QA items must pass before P1 kickoff.

# T04 Low-Fidelity Prototypes

---

## Homepage

**Dashboard (Market overview + map)**: State-wide analytics snapshot with KPIs (sales, active dispensaries, growth), regional distribution sliders, top dispensaries list, promotion analytics, top-ranked products, and a geo map of dispensary locations. Good for “What’s happening right now?” at a macro level.

![image.png](T04%20Low-fidelity%20prototypes/image.png)

## Dispensaries

**Dispensaries list**: Searchable, filterable list of dispensaries with status (online), menu item counts, promo codes, and “View Details” CTAs. Supports discovery and quick drill-down.

![image.png](T04%20Low-fidelity%20prototypes/image%201.png)

## Regions

**Regions list**: Region cards with dispensary counts, monthly sales, and growth %, plus “View Details.” Enables regional performance scanning and prioritization.

![image.png](T04%20Low-fidelity%20prototypes/image%202.png)

## Map

**Dispensary map**: Split layout with searchable/filterable list of dispensaries (status, rating) alongside an interactive map plotting locations. Useful for geographic coverage and local ops planning.

![image.png](T04%20Low-fidelity%20prototypes/image%203.png)

## Menu Comparison

**Menu comparison (products grid)**: Product comparison grid with filters (category, ranking), sliders (price range, THC%), and cards showing ratings, price, effects, availability, and best price. Drives side-by-side product competitiveness and pricing checks.

![image.png](T04%20Low-fidelity%20prototypes/image%204.png)

## Promotions

**Promotions list**: Promotions directory with tab filters (all/percentage off/fixed price), showing code, discount type/value, applicability (item/category/brand), description, and participating dispensary count. Helps monitor and benchmark promo activity.

![image.png](T04%20Low-fidelity%20prototypes/image%205.png)

# T05 Handoff to Engineering

---

**From:** Design Team

**To:** Engineering Team

**Phase:** M1 / P1.1 → P1.2

**Date:** January 8, 2026

### **OVERVIEW: WHAT YOU'RE RECEIVING**

The Design System Foundation comprises 4 locked artifacts that define the product's structural constraints, navigation model, and competitive positioning. These are **not suggestions**—they are architectural decisions that flow into your component library, routing structure, and data layer design.

### **ARTIFACT 1: NAVIGATION ARCHITECTURE (T01)**

**What it defines:** Primary navigation structure (static, role-gated)

**For Engineering:**

| Section | Purpose | Who Sees | Implementation Note |
| --- | --- | --- | --- |
| **Dashboard** | Launch page; operator summary | All | Home route; role-filtered widgets |
| **Daily** | Today's operational tasks | Manager+ | Daily context; time-bounded queries |
| **Sales** | Revenue & transaction metrics | Manager+ | Real-time aggregation required |
| **Products** | Inventory, menu, assortment | Manager+ | Product catalog + competitor data |
| **Customers** | Buyer behavior, loyalty | Owner+ | Customer segmentation; RBAC enforced |
| **Market** | Competitive landscape, pricing | Viewer+ | Read-only competitor benchmarking |
| **Performance** | KPI dashboards, trends | Manager+ | Historical aggregation; rolling windows |
| **Admin** | User management, settings | Admin only | Gated by role; audit trail required |

**Technical Requirements:**

1. **Static left-rail navigation** – No dropdown nesting on first load. Sections expand inline or route to detail pages.
2. **Role-based visibility** – Nav sections hidden/shown by RBAC role (Viewer, Manager, Owner, Admin).
3. **No "Explore" or discovery modes** – Users move deterministically: intent → section → outcome.
4. **URL structure** – `/dashboard`, `/daily`, `/sales`, `/products`, `/customers`, `/market`, `/performance`, `/admin`

### **ARTIFACT 2: DESIGN SYSTEM PILLARS (T03)**

**What it defines:** Business logic embedded in design decisions

**For Engineering – Translate These Into Code:**

### **Pillar 1: Competitive Framing (Core Differentiator)**

**Design Decision:** Competitor data is **structurally embedded**, not bolted-on.

**Engineering Translation:**

- Menu Comparison screen requires a `competitors` data model (not optional, not future work).
- Map view includes competitor store locations + pricing as layers.
- Products section shows side-by-side menu/pricing with adjacent competitors.
- **Constraint:** All competitive data must be anonymized; no vendor branding without legal review.

**Implementation:**

- Schema: `competitors { id, storeId, territory, productsOffered, pricingTier, lastUpdated }`
- Competitor data ingestion pipeline must run daily (not batch).
- API endpoint: `GET /api/competitors?territory=<regionId>&updated_since=<timestamp>`

### **Pillar 2: Speed-to-Value (Sub-5-Minute Insight)**

**Design Decision:** Operators must answer their primary question in under 5 minutes.

**Engineering Translation:**

- Dashboard must load in <2 seconds (critical path: yesterday's revenue, today's tasks, inventory alerts).
- Daily page caches recent transactions; refresh rate <30 seconds.
- No multi-step workflows to access core metrics.
- **Constraint:** Every page load starts with cached data; live updates happen asynchronously.

**Implementation:**

- Client-side caching strategy: session cache + local storage for dashboard metrics.
- Server-side caching: Redis for aggregated KPIs (5-minute TTL).
- API response size: Dashboard payload <200KB; Daily payload <150KB.
- Lazy-load secondary charts; prioritize primary question metric.

### **Pillar 3: Operational Clarity (Verb-Object Decision Frames)**

**Design Decision:** Every page asks one question and suggests one action.

**Engineering Translation:**

- No pages with 5+ unrelated metrics or actions.
- Each page has a **primary metric** (bold, larger) and 2–3 supporting metrics.
- CTAs are verb-based: "Adjust Price," "Add Promotion," "Review Inventory," not "Edit," "Manage," "View."
- **Constraint:** Modal dialogs are forbidden; all actions route to dedicated pages or inline editors.

**Implementation:**

- Button text: `<Verb> <Object>` (e.g., `Adjust Price`, `Add Promotion`).
- Page layout: Primary metric in hero section; supporting metrics below.
- Navigation UX: Actions route to `/products/{id}/pricing` not `/modals/pricing/{id}`.

### **Pillar 4: RBAC-by-Design (Role-Based Access Control)**

**Design Decision:** Roles shape what users see **and what they can do**.

**Engineering Translation:**

- Three roles: Viewer, Manager, Owner, Admin.
- **Viewer:** Read-only access (Dashboard, Market, Performance). Cannot drill into transaction details.
- **Manager:** Read-write for daily operations (Dashboard → Daily → Sales → Products → Performance). Cannot access Admin or Customers.
- **Owner:** All Manager permissions + Customers section + Admin settings. Can assign roles.
- **Admin:** Full system access + audit logs.

**Implementation:**

- RBAC middleware: Check role on every API request (not just UI).
- Scope data at query layer: `SELECT * FROM sales WHERE dispensaryId IN (role.dispensaryIds)`.
- Audit trail: Log role changes, bulk updates, and admin actions.
- Nav visibility: Hide sections server-side during initial render.

### **Pillar 5: Data Integrity (Source of Truth)**

**Design Decision:** Competitor and operational data must never conflict.

**Engineering Translation:**

- Single source of truth for product IDs, pricing, inventory.
- Competitor data is read-only in UI; updates require manual data entry or API ingestion (no merging).
- Reconciliation pipeline: Flag discrepancies between internal inventory and competitor pricing.
- **Constraint:** UI never allows editing competitor data.

**Implementation:**

- Database schema: `products` (internal), `competitorProducts` (external). No foreign key relationship.
- Conflict detection: Daily job runs `products` vs. `competitorProducts` pricing diff; alerts on >10% variance.
- API design: Separate endpoints for internal writes (`PATCH /api/products/{id}`) and competitor reads (`GET /api/competitors/{id}/products`).

### **ARTIFACT 3: WIREFRAME SCREENS (T04)**

**What it defines:** Major UI layouts and component placement

**For Engineering – Build These Routes:**

| Route | Wireframe | Purpose | Key Components | RBAC Gate |
| --- | --- | --- | --- | --- |
| `/dashboard` | Homepage | Launch; summary | Revenue card, alerts, quick-action buttons, nav preview | Viewer+ |
| `/daily` | Daily | Today's tasks | Task list, context panel, inline actions | Manager+ |
| `/sales` | Sales | Revenue metrics | Time-series chart, transaction list, drill-down | Manager+ |
| `/products` | Products + Menu Comparison | Inventory + competitor benchmarking | Product grid, menu comparison table, pricing overlay | Manager+ |
| `/regions` | Regions | Multi-location oversight | Map or region selector, store list, aggregated KPIs | Owner+ |
| `/market` | Map | Spatial competitive context | Map component, competitor markers, territory shading | Viewer+ |
| `/performance` | Performance | KPI dashboards | Trend charts, targets vs. actual, rankings | Manager+ |
| `/admin` | Admin | User/system management | Role management table, audit log, settings | Admin only |

**Technical Requirements:**

1. **Responsive layout:** Desktop-first (operators use desktop). Tablet support for on-site quick checks. Mobile not in scope for M1.
2. **Component reuse:** All screens use the same card, chart, and table components (defined in design tokens).
3. **Data binding:** Routes are bound to Redux/Zustand selectors; component props are typed (no `any`).
4. **Loading states:** Skeleton screens for initial load; spinner for < 200ms updates; toast notifications for errors.

### **ARTIFACT 4: RBAC MODEL (T03 Applied)**

**What it defines:** Role permissions matrix

**For Engineering – Implement This:**

| Feature | Viewer | Manager | Owner | Admin |
| --- | --- | --- | --- | --- |
| View Dashboard | ✓ | ✓ | ✓ | ✓ |
| View Daily | ✗ | ✓ | ✓ | ✓ |
| View Sales | ✗ | ✓ | ✓ | ✓ |
| View/Edit Products | ✗ | ✓ | ✓ | ✓ |
| View Customers | ✗ | ✗ | ✓ | ✓ |
| View Market (Competitors) | ✓ | ✓ | ✓ | ✓ |
| View Performance | ✓ | ✓ | ✓ | ✓ |
| Access Admin | ✗ | ✗ | ✓ | ✓ |
| Manage Users | ✗ | ✗ | ✓ | ✓ |
| Audit Logs | ✗ | ✗ | ✗ | ✓ |

**Implementation:**

```tsx
// Example: RBAC gate in middleware
if (route === '/admin' && !['Owner', 'Admin'].includes(user.role)) {
  redirect('/dashboard');
}

// Example: Scoped data query
const sales = await db.sales.find({
  dispensaryId: { $in: user.dispensaryIds }
});

```

### **CRITICAL CONSTRAINTS FOR P1.2**

1. **Navigation is locked.** Do not add sections. Do not rename. If you need a new section, that's a design change (Phase P1.3+).
2. **RBAC roles are immutable.** Do not add a "Supervisor" role or mix permissions. If roles need adjustment, loop back to Design.
3. **Competitor data is read-only in UI.** Operators cannot edit competitor pricing/products. Competitor data flows from external sources only.
4. **No modals for primary workflows.** All CTAs route to dedicated pages (e.g., `/products/{id}/pricing`, not a modal).
5. **Performance targets:** Dashboard <2s, any page <3s. If you can't hit this, flag it in the design review.

### **DEPENDENCIES & HANDOFF CHECKLIST**

**Before you start P1.2 component library work:**

- [ ]  Confirm RBAC roles with Product team (3 roles locked: Viewer, Manager, Owner, Admin).
- [ ]  Establish data model for competitors (schema TBD by Data team).
- [ ]  Design Redux/Zustand store structure (aligned with 8 sections + RBAC).
- [ ]  Define design token system (colors, typography, spacing for component library).
- [ ]  Agree on cache strategy (Redis, client-side, CDN).

**By end of P1.2:**

- [ ]  Component library scaffolded (buttons, cards, charts, tables).
- [ ]  Routing structure in place (`/dashboard`, `/daily`, etc.).
- [ ]  RBAC middleware implemented (nav visibility + API scoping).
- [ ]  Design system tokens documented (colors, typography, spacing, shadows).

**By P1.3:**

- [ ]  All 8 primary pages built with placeholder data.
- [ ]  Live data integration (Sales, Daily, Products connected to backend).
- [ ]  Competitor data ingestion pipeline running.

### **SIGN-OFF & QUESTIONS**

**Design artifacts are approved for engineering implementation.**

If you have clarifying questions:

- **Navigation:** Can sections be reordered? No. Can you add nested menus? No.
- **RBAC:** Can roles have custom permissions? No. Can you add a role? Not in M1.
- **Competitor data:** How is it ingested? (TBD with Data team). Can operators edit it? No.
- **Performance:** What's your caching strategy? (Engineer to decide, must hit <2s dashboard).

**Ready to proceed to P1.2 – Core Infrastructure Setup.**

*—Design Team*

---

This T05 is a **working contract** between Design and Engineering, not a retrospective. It operationalizes each design decision into technical requirements, constraints, and implementation checkpoints.