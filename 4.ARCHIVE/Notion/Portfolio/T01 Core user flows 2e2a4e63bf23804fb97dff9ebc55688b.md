# T01 Core user flows

Meetings: Design Meeting @January 1, 2026  (../Meetings/Design%20Meeting%20@January%201,%202026%202dba4e63bf23813ab87ecc7dd185003c.md)
Parent item: DES-M1-P1.1-UXARCH – UX Architecture  (DES-M1-P1%201-UXARCH%20%E2%80%93%20UX%20Architecture%202e2a4e63bf23804a97a8d04404f1a5ee.md)
Projects: DES-M1-P1.1-UXARCH – UX Architecture  (../Projects/DES-M1-P1%201-UXARCH%20%E2%80%93%20UX%20Architecture%202dba4e63bf2380248131e5d5013a6474.md)
Status: Not started
Tasks: T01 Core user flows  (../Tasks/T01%20Core%20user%20flows%202dba4e63bf238057bd45f4e86bb80939.md)
Teams: Design Team (../Teams/Design%20Team%202d5a4e63bf238097bffedd7bde5a3f69.md)

**Milestone:** M1 — Market Narrative / Problem Definition

Phase: P1.1 Product Discovery & Business Definition

Project: DES-M1-P1.1-UXARCH – UX Architecture 

**Team:** Design

**Artifact Type:** UX Architecture — Core User Flows

**Owner:** Ivan P. Roman

**Date:** Jan 1, 2026

---

## 0. UX FIRST PRINCIPLES (Context for Design)

Before flows, align on **non-negotiables**:

---

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

---

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

---

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

---

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

---

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

---

## 2. SECONDARY SUPPORTING FLOWS

These flows support depth and retention but are not the first-session core.

---

### FLOW 5 — Market Exploration (Macro → Micro)

- User explores market without starting from their own dispensary
- City → Category → Product drill-down
- Used for research, not urgency

---

### FLOW 6 — Historical Analysis

- User compares performance across months or seasons
- Used for reflection and planning, not immediate action

---

### FLOW 7 — Admin / Data Integrity (Internal)

- Admin users verify data freshness
- Manage access and roles
- Not exposed to standard retail users as value drivers

---

## 3. NON-CORE / EXPLICITLY OUT-OF-SCOPE (For M1)

These are **intentionally excluded** from Core User Flows:

- Gamification mechanics
- Alerts / notifications
- Automated recommendations
- AI narrative summaries
- Social features
- Export / reporting workflows

They belong in **later milestones** once core insight trust is established.

---

## 4. FLOW DEPENDENCIES & ASSUMPTIONS

- Auth must complete **before** any insight is shown
- Home dispensary selection is mandatory
- Market data is assumed to be:
    - Accurate
    - Fresh
    - Trusted by the user base
- UX prioritizes **comparison speed over visual novelty**

---

## 5. DESIGN HANDOFF NOTES

- Each flow should map cleanly to:
    - One primary screen
    - One dominant action
- Avoid multi-purpose screens early
- Optimize for **decision clarity**, not feature density

---

[User Journey Mapping](T01%20Core%20user%20flows/User%20Journey%20Mapping%202dba4e63bf2381239ec1eceb27c1c041_all.csv)