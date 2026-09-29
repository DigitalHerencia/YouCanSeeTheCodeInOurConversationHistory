# TO3 Design system alignment

Meetings: Design Meeting @January 5, 2026  (../Meetings/Design%20Meeting%20@January%205,%202026%202dfa4e63bf238195a05ac4433fe46bf2.md)
Parent item: DES-M1-P1.1-UXARCH – UX Architecture  (DES-M1-P1%201-UXARCH%20%E2%80%93%20UX%20Architecture%202e2a4e63bf23804a97a8d04404f1a5ee.md)
Projects: DES-M1-P1.1-UXARCH – UX Architecture  (../Projects/DES-M1-P1%201-UXARCH%20%E2%80%93%20UX%20Architecture%202dba4e63bf2380248131e5d5013a6474.md)
Status: Not started
Tasks: T03 Design system alignment  (../Tasks/T03%20Design%20system%20alignment%202dfa4e63bf238005aa28c5b615f70591.md)
Teams: Design Team (../Teams/Design%20Team%202d5a4e63bf238097bffedd7bde5a3f69.md)

# **TO3 Design System Alignment**

## **Perspective: Design Team Lead (Milestone M1, Phase P1.1)**

---

## **EXECUTIVE SUMMARY**

The **Competitive Advantage** platform is positioned to deliver operationally-driven competitive intelligence, not analytics theater. The design system must be ruthlessly aligned to support:

1. **Speed-to-insight** (first session < 5 minutes to actionable intelligence)
2. **Competitive framing** (comparison is not optional—it's structural)
3. **Operator-first language** (no abstract "metrics"; all decisions tied to shelf/revenue action)
4. **Role-based information architecture** (RBAC reflected in every pixel)

This alignment document establishes the design foundations for M1 and prevents scope creep through P1–P5.

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

### 3.5 **Pattern 5: The Status Indicator (System health)**

**When:** User lands on any page

**Visual Contract:**

- Data freshness indicator (timestamp + refresh status)
- Connection status (online/offline graceful degradation)
- Alerts or anomalies (prominent but not intrusive)

**Notes:**

- Green/yellow/red only (no gradient shades)
- Clicking timestamp shows data lineage (for power users)

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

## **14. RISKS & MITIGATIONS**

| **Risk** | **Impact** | **Mitigation** |
| --- | --- | --- |
| **Design-dev misalignment** | Rework, schedule slip | Weekly sync; Figma → code library link |
| **Competitor data sensitivity** | Legal/trust issue | Legal review before launch; ensure anonymization |
| **Mobile performance** | Slow load times | Optimize charts for mobile; lazy-load secondary data |
| **Accessibility gaps discovered late** | Legal exposure | Audit early + often; bake into QA gate |
| **Scope creep (features not in IA)** | Feature sprawl; design coherence loss | IA document is gospel; reject all out-of-scope features |
| **Color palette accessibility** | 10–15% of users can't distinguish colors | Use symbols + color redundantly; test with color blindness simulator |

---

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

---