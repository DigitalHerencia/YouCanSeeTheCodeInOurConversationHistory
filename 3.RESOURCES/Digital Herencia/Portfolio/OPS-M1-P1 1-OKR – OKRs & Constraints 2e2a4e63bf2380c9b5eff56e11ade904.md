# OPS-M1-P1.1-OKR – OKRs & Constraints

Meetings: Sprint Planning @January 3, 2026  (../Meetings/Sprint%20Planning%20@January%203,%202026%202dda4e63bf23819ebd3dfd911c156c9b.md)
Projects: OPS-M1-P1.1-OKR – OKRs & Constraints  (../Projects/OPS-M1-P1%201-OKR%20%E2%80%93%20OKRs%20&%20Constraints%202dba4e63bf2380fe9cbfdd8d6d1b5b62.md)
Status: Done
Sub-item: T01 Define company objectives  (T01%20Define%20company%20objectives%202e2a4e63bf238016acc1d9b9fd71e925.md), T02 Define key results  (T02%20Define%20key%20results%202e2a4e63bf23805f8662cbf32a80daf1.md), TO3 Align team OKRs (TO3%20Align%20team%20OKRs%202e2a4e63bf23816cadc3ef24ca3b01e4.md), T04 Align budgets to OKRs (T04%20Align%20budgets%20to%20OKRs%202e2a4e63bf23800f8c94fda008644c52.md), T05 Publish OKRs  (T05%20Publish%20OKRs%202e2a4e63bf2380388ffbdb9075b32908.md)
Tasks: T01 Define company objectives  (../Tasks/T01%20Define%20company%20objectives%202dba4e63bf2380849285e2e13c44f5ce.md), T02 Define key results  (../Tasks/T02%20Define%20key%20results%202dca4e63bf2380158ef6ced6391a75f2.md), T03 Align team OKRs  (../Tasks/T03%20Align%20team%20OKRs%202dfa4e63bf23803db5ccc36ba2f4c606.md), T04 Align budgets to OKRs  (../Tasks/T04%20Align%20budgets%20to%20OKRs%202e2a4e63bf2380f9afa7c29d36c6e9bb.md), T05 Publish OKRs  (../Tasks/T05%20Publish%20OKRs%202e2a4e63bf23807f807adaf8aabba5e6.md)
Teams: Operations Team (../Teams/Operations%20Team%202d5a4e63bf23808e96c6e13df82c008b.md)

# **Competitive Advantage Platform — M1 Phase P1.1**

---

## **EXECUTIVE SUMMARY**

The Operations OKRs establish an **execution operating system** that makes work visible, traceable, and constrained without micromanagement. This document translates those OKRs into **business outcomes** and aligns them with product, revenue, and team health metrics.

**Core Thesis:** *An organization with clear decision pathways and visible constraints ships faster, reduces rework, and scales without adding process overhead.*

## **BUSINESS CONTEXT**

**Current State Problems:**

- Tasks are created ad-hoc without clear ownership or success criteria
- Meetings generate work without documented decisions
- No visibility into constraint violations (overallocation, scope creep)
- Ops team spends time answering "where is this?" instead of enabling

**Competitive Advantage (Product):**

- Multi-tenant B2B SaaS (cannabis retail analytics)
- High autonomy needed from Design, Eng, Product teams
- M1 focuses on market narrative + product discovery (not shipping)
- Fast iteration required; visibility is non-negotiable

**Business Goal:**

- Ship M1 (UX Architecture + Product Navigation) on-time and in-scope
- Establish repeatable, scalable execution rhythm for M2–M5
- Reduce meeting overhead while improving decision quality

<aside>

[Untitled](../../Untitled%202dba-b988_all.csv)

</aside>

---

# **ALIGNED BUSINESS OKRs (Team Perspective)**

---

## **O1: Establish a Single, Authoritative Operating System for Execution**

**Business Translation:**

One way work enters the system → one way it is reviewed → one way it is closed. This reduces decision-making friction and ensures no work is lost or duplicated.

### **KR1.1: 100% of active projects are created with Domain, Milestone (M1), Phase (P1.1), Owning team**

**Why This Matters:**

- Eliminates ambiguity about scope and accountability
- Enables the system to auto-route work to the right team
- Provides business visibility into what's being built and why

**Business Metric:**

| Metric | Target | Cadence | Owner |
| --- | --- | --- | --- |
| **Projects with complete metadata** | 100% (5/5 active projects in M1) | Weekly audit | Ops Lead |
| **Time to complete project intake** | < 30 min | Per project creation | Product Manager |
| **Rework due to missing metadata** | 0 tasks | Weekly review | Engineering Lead |

**Implementation Details:**

- Create **Project Template** with required fields: Domain, Milestone, Phase, Owner, Success Criteria
- Enforce template at project creation (in GitHub Projects or equivalent)
- Weekly audit: If project exists without metadata, halt its work until completed
- Train all team leads on intake process (30-min onboarding)

**Success Signal:**

No team asks "what milestone is this for?" or "who owns the decision?"

### **KR1.2: 100% of tasks are traceable to (a) a project, (b) a meeting of origin**

**Why This Matters:**

- Prevents orphan work
- Creates audit trail (decision → task → outcome)
- Enables post-mortems: "Where did we decide to do this?"

**Business Metric:**

| Metric | Target | Cadence | Owner |
| --- | --- | --- | --- |
| **Tasks linked to projects** | 100% | Daily audit | Ops Lead |
| **Tasks with meeting origin documented** | 100% | Weekly spot-check | Product Manager |
| **Average time to trace task to decision** | < 2 min | N/A (measure once) | Ops Lead |

**Implementation Details:**

- Update task template to include: `Decision Source: [Meeting Name, Date, Link]`
- Auto-link tasks created in standup/sync meetings to project
- Weekly: Audit 5 random tasks; verify traceability
- If task has no origin, it gets deprioritized or closed

**Success Signal:**

Ops can answer "why did we decide to do this?" in 60 seconds by reading the task and tracing to the meeting decision.

### **KR1.3: Zero orphan tasks (tasks without a parent project or owner)**

**Why This Matters:**

- Orphan tasks create cognitive load (people don't know if it matters)
- They consume energy without contributing to business goals
- They indicate broken decision-making process

**Business Metric:**

| Metric | Target | Cadence | Owner |
| --- | --- | --- | --- |
| **Orphan tasks in backlog** | 0 | Daily | Ops Lead |
| **Tasks without assigned owner** | 0 | Daily | Team Leads |
| **Tasks in "limbo" > 1 week** | 0 | Weekly | Product Manager |

**Implementation Details:**

- Daily: Run query to find tasks without project or owner (automated)
- If found: Ops immediately flags in Slack + assigns to Product Manager for triage
- Triage options: Assign to project, assign owner, or close
- Monthly: Retrospective on why orphans existed

**Success Signal:**

Backlog is clean. No ambiguous tasks. Work backlog = real work.

## **O2: Enforce meeting → decision → task as the only execution pathway**

**Business Translation:**

Meetings are expensive. They should only happen to make decisions. Every decision should generate explicit work or a documented "no-action" outcome. This prevents "meeting about a meeting" cycles.

### **KR2.1: All recurring meetings produce at least one of: (a) a decision, (b) a task, (c) a documented "no-action" outcome**

**Why This Matters:**

- Eliminates low-value meetings that consume time without output
- Creates accountability for meeting organizers
- Forces rigor: "Did we actually decide anything?"

**Business Metric:**

| Metric | Target | Cadence | Owner |
| --- | --- | --- | --- |
| **Meetings with documented decision/task/no-action** | 100% | Weekly audit | Ops Lead |
| **Meetings eliminated due to low value** | ≥ 2 per month | Monthly | Team Leads |
| **Average decision clarity (survey: 1-5)** | 4.5+ | Quarterly | Product Manager |

**Implementation Details:**

- Meeting template: Every recurring meeting has a **Decision Log** (e.g., Notion page or GitHub issue)
- At end of every meeting: 5-min decision capture
    - `Decision: [What did we decide?]`
    - `Action: [What work does this create? Who owns it?]`
    - `Alternative: If no decision/action, document why meeting happened`
- Weekly audit: If meeting has no decision log entry, it gets flagged + cancelled next time
- After 3 weeks with no output, meeting is eliminated

**Success Signal:**

No one complains about "too many meetings." Meetings feel productive. Decision log is the meeting's record.

### **KR2.2: No task is created outside of: Ops meeting, Standup, Design/Eng/Prod meetings**

**Why This Matters:**

- Centralizes decision-making authority
- Prevents ad-hoc work from derailing the roadmap
- Makes planning predictable

**Business Metric:**

| Metric | Target | Cadence | Owner |
| --- | --- | --- | --- |
| **Tasks created via ad-hoc channels (Slack, DMs)** | 0 (tracked via template usage) | Weekly | Ops Lead |
| **% of tasks created in authorized meetings** | 100% | Weekly | Product Manager |
| **Escalations due to missing decision pathway** | 0 | Weekly | Engineering Lead |

**Implementation Details:**

- Centralize task creation in GitHub Issues (single entry point)
- Task creation form requires: `Source Meeting: [dropdown: Ops, Standup, Design Sync, Eng Standup, Prod Review]`
- If source is missing, task is rejected (not created)
- Weekly: Audit task creation audit log for unauthorized sources
- Slack bot (Slackbot or automation): If task is created outside authorized path, bot responds with link to proper process

**Success Signal:**

All work is planned work. No surprises mid-sprint. Roadmap is stable.

### **KR2.3: Tasks generated from meetings include: owner, why, success criteria**

**Why This Matters:**

- Ambiguous tasks cause rework and misalignment
- Clear success criteria enable teams to self-check completion
- Owner prevents diffusion of responsibility

**Business Metric:**

| Metric | Target | Cadence | Owner |
| --- | --- | --- | --- |
| **Tasks with assigned owner** | 100% | Daily | Ops Lead |
| **Tasks with "why" documented** | 100% | Weekly spot-check | Product Manager |
| **Tasks with success criteria** | 100% | Weekly spot-check | Team Leads |
| **Rework rate due to ambiguous requirements** | ≤ 5% | Sprint retrospective | Engineering Lead |

**Implementation Details:**

- Task template (mandatory fields):

<aside>
<img src="https://app.notion.com/icons/arrow-right-basic_gray.svg" alt="https://app.notion.com/icons/arrow-right-basic_gray.svg" width="40px" />

Title: [Clear, action-oriented]
Owner: [Name + team]
Why: [Business context, decision reference]
Success Criteria:

- [ ]  Criterion 1
- [ ]  Criterion 2
- [ ]  Criterion 3
Acceptance Tests: [How will we know it's done?]
</aside>

- Weekly: Audit 10 random tasks; verify all fields are filled
- If incomplete: Task is blocked + owner is notified
- Post-sprint: Measure rework; if > 5%, do root cause analysis

**Success Signal:**

No "what does this actually mean?" questions during execution. Engineers know when they're done.

## **O3: Make Constraints Explicit so Priorities Stay Real**

**Business Translation:**

Constraints are not obstacles — they are guardrails. By making them visible, we prevent the illusion of unlimited capacity and force real prioritization.

### **KR3.1: Document and publish constraint classes: Time, Scope, Cognitive Load**

**Why This Matters:**

- Prevents over-commitment (the #1 cause of missed deadlines)
- Enables data-driven prioritization ("If we do this, what has to stop?")
- Creates credibility: teams trust the roadmap because it's realistic

**Business Metric:**

| Metric | Target | Cadence | Owner |
| --- | --- | --- | --- |
| **Constraints document published** | Yes | M1 kickoff | Ops Lead |
| **% of teams aware of their constraints** | 100% (survey) | Quarterly | Product Manager |
| **Constraint violations caught before commitment** | 100% | Daily | Ops Lead |

**Implementation Details:**

**Constraint Categories:**

1. **Time Constraints:**
    - Design team: Max 60 hours/week (40 hours project work + 20 hours reviews/sync)
    - Engineering team: Max 40 hours/week project work + 10 hours on-call
    - Product: Max 4 concurrent initiatives
    - Ops: Max 15 hours/week on process (rest is facilitation)
2. **Scope Constraints:**
    - Design: Max 2 active features per phase
    - Engineering: Max 3 active backend services
    - Product: Max 1 major narrative shift per milestone
3. **Cognitive Load Constraints:**
    - Individual: Max 3 active tasks per person
    - Team: Max 8 active features per team per phase
    - Cross-team: Max 2 cross-team dependencies per project

**Published Artifacts:**

- Constraint Matrix (GitHub or Notion): Readable by all, updated quarterly
- Weekly utilization report: Visual dashboard showing how close each team is to constraints
- Quarterly review: Revisit constraints based on actual capacity

**Success Signal:**

Team leads can say: "We're at 85% of Design capacity — we can take one more small task, but not a large one." This is data-driven, not gut-feel.

### **KR3.2: Any task that violates a constraint is: flagged, re-scoped, or rejected**

**Why This Matters:**

- Constraints are only real if they are enforced
- Prevents the "just this once" death spiral
- Builds credibility with teams (they know the roadmap is sustainable)

**Business Metric:**

| Metric | Target | Cadence | Owner |
| --- | --- | --- | --- |
| **Constraint violations caught at intake** | 100% | Per task | Ops Lead |
| **Violations resolved via re-scope** | ≥ 80% | Weekly | Product Manager |
| **Violations escalated to Leadership** | ≤ 20% | Weekly | VP Product |

**Implementation Details:**

- At task creation: Ops runs constraint check
    - `Team Capacity Check: Design is at 92% → ⚠️ WARNING`
    - `Cognitive Load Check: Engineer X has 3 active tasks → ⚠️ WARNING`
- Outcome options:
    1. **Flag (Green Light):** Task is within constraints → proceed
    2. **Re-scope (Yellow Light):** Task violates constraint → reduce scope, extend timeline, or defer
    3. **Escalate (Red Light):** Task is strategically critical but violates constraints → escalate to VP Product for trade-off decision
- Weekly: Track how many violations were caught + how they were resolved
- Post-phase: Analyze which constraint types are most frequently violated (indicates unrealistic targets)

**Success Signal:**

Teams feel less chaotic. Deadlines are met more consistently. No surprises mid-sprint.

### **KR3.3: No new project enters "In Progress" without explicit acknowledgment of constraints**

**Why This Matters:**

- Prevents the "invisible project" problem (work that starts and never stops)
- Forces leaders to make explicit trade-offs upfront
- Creates accountability

**Business Metric:**

| Metric | Target | Cadence | Owner |
| --- | --- | --- | --- |
| **Projects starting without constraint review** | 0 | Per project | Ops Lead |
| **% of projects with signed constraint acknowledgment** | 100% | Per project | VP Product |
| **Mid-project scope creep** | ≤ 10% | Sprint review | Engineering Lead |

**Implementation Details:**

- Before a project moves from "Planned" to "In Progress":
    - Ops prepares **Constraint Impact Statement:**
    
    <aside>
    
    Project: [Name]
    Duration: [Weeks]
    Teams Affected: [Design, Eng, Product]
    Design Capacity Impact: 40% of Design time
    Eng Capacity Impact: 60% of 1 FTE
    What Gets De-prioritized: [List items moved to backlog]
    Risk: [If constraints are violated, what happens?]
    
    </aside>
    
    - VP Product + each team lead **signs off** on the impact statement
    - If anyone objects, trade-offs are discussed and agreed **before** work starts
- Weekly: Ops tracks project → constraint adherence (are we within the impact statement?)
- Post-project: Retrospective on whether constraint predictions were accurate

**Success Signal:**

Projects don't balloon. Teams know upfront what they're trading off. Leadership trust increases.

## **O4: Create Execution Confidence Through Visibility, Not Micromanagement**

**Business Translation:**

Ops should see everything without needing to interrupt anyone. Teams should feel trusted, not watched.

### **KR4.1: Conference Room page is the canonical entry point for Ops, Product, Design, Engineering**

**Why This Matters:**

- Reduces context-switching (one dashboard vs. checking 5 tools)
- Increases decision velocity (can answer questions in 60 seconds)
- Prevents Ops from becoming a bottleneck

**Business Metric:**

| Metric | Target | Cadence | Owner |
| --- | --- | --- | --- |
| **Conference Room page is visited by all stakeholders** | 100% | Daily (measured via analytics) | Ops Lead |
| **Time to answer "what's the status?" from Conference Room** | < 60 sec | Per question | N/A |
| **% of work visible on Conference Room** | 100% | Weekly audit | Ops Lead |
| **Tool switching overhead** | 0 (single source of truth) | N/A | Ops Lead |

**Implementation Details:**

- **Conference Room Page** (GitHub Projects or equivalent):
    - **Left Panel:** Real-time project status (M1 phases, ownership, next milestone)
    - **Center Panel:** Active tasks (priority, owner, due date, status)
    - **Right Panel:** Blockers, decisions pending, constraint status
    - **Bottom:** Recent decisions (meeting origin, decision owner, date)
- Auto-sync from GitHub Issues, Slack (decisions from #decisions channel), and meeting logs
- Read-only for most; edit permissions for Ops only (prevents tool sprawl)
- Daily: Ops spends 15 min updating status (pulling data from meetings, standups, GitHub)
- Weekly: Ops validates that 100% of work is visible

**Success Signal:**

Leadership can understand the entire M1 roadmap in 5 minutes. No Slack threads needed.

### **KR4.2: Every project has a visible status and next action at all times**

**Why This Matters:**

- Prevents "invisible failures" (projects stalling without anyone noticing)
- Reduces need for status meeting interruptions
- Enables proactive unblocking

**Business Metric:**

| Metric | Target | Cadence | Owner |
| --- | --- | --- | --- |
| **Projects with current status visible** | 100% | Daily | Ops Lead |
| **Projects with clear next action** | 100% | Daily | Project Owner |
| **Stalled projects caught within 2 days** | 100% | Daily | Ops Lead |
| **Status update latency** | < 4 hours | Daily | Project Owner |

**Implementation Details:**

- Every project has a **Status Card:**
    
    <aside>
    
    Project: [Name]
    Phase: [M1 P1.1]
    Owner: [Name]
    Current Status: [In Progress / Blocked / At Risk / On Track]
    Last Update: [Timestamp]
    Next Milestone: [What's the next decision point or deliverable?]
    Blockers: [If any, list them]
    On Track For? [Expected completion date]
    
    </aside>
    
- Update Cadence:
    - Daily: Ops checks if status is current (< 4 hours old)
    - If stale: Ops sends Slack reminder to project owner
    - If no update for 2 days: Ops escalates to VP Product
- Conference Room dashboard auto-colors:
    - 🟢 Green: On Track, last updated < 24 hours
    - 🟡 Yellow: At Risk, last updated 24–48 hours
    - 🔴 Red: Blocked or stalled, last updated > 48 hours

**Success Signal:**

No surprises at review meetings. Issues are caught early. Teams feel like Ops is helping, not interrogating.

### **KR4.3: End-of-day state can be answered in under 60 seconds: "What's in progress, what's blocked, what moved today?"**

**Why This Matters:**

- Reduces daily status meeting friction
- Enables async communication (leadership doesn't need to meet daily)
- Frees up time for actual work

**Business Metric:**

| Metric | Target | Cadence | Owner |
| --- | --- | --- | --- |
| **Time to answer end-of-day status from Conference Room** | < 60 sec | Daily | Ops Lead |
| **% of decisions made async (vs. in meeting)** | ≥ 80% | Weekly | VP Product |
| **Daily standup duration** | ≤ 15 min | Daily | Scrum Master |

**Implementation Details:**

- **Daily Status Summary** (auto-generated, posted at EOD in #status channel):
    
    <aside>
    
    📊 EOD M1 Status | [Date]
    
    ✅ In Progress (5 active projects)
    
    - UX Architecture (Design): Finalizing page hierarchy — on track
    - Product Navigation (Product): Waiting on UX decision (expected EOD tomorrow)
    - Backend Foundation (Eng): Database schema 80% complete
    
    🚨 Blocked (1)
    
    - Auth Integration (Eng): Waiting for Clerk API key (requested from Ops — ETA: tomorrow AM)
    
    🎯 Moved Today (3 deliverables)
    
    - Completed: Page hierarchy document (UX Architecture)
    - Completed: Competitor comparison spec (Product)
    - Escalated: Scope trade-off decision on user segmentation (awaiting VP Product)
    </aside>
    
- Auto-generated from:
    - Closed GitHub issues (moved today)
    - Status cards updated today (in progress)
    - Blocker tags in GitHub (blocked)
- Posted by Ops at 5 PM every weekday
- Leadership reads async; decisions made in reply threads or next morning meeting

**Success Signal:**

No "What's everyone working on?" in standup. Time is spent on unblocking, not reporting.

## **O5: Prepare the System for Scale Without Adding Process**

**Business Translation:**

As we grow (more projects, more teams), the system should remain lightweight. Scalability comes from reusable templates and clarity, not more rules.

### **KR5.1: All templates (meetings, tasks, projects) are reusable without modification**

**Why This Matters:**

- New team members onboard faster
- Prevents "every project is different" chaos
- Reduces cognitive load (predictable structure)

**Business Metric:**

| Metric | Target | Cadence | Owner |
| --- | --- | --- | --- |
| **Onboarding time for new team members** | < 4 hours | Per hire | Ops Lead |
| **Templates used without modification** | ≥ 90% | Weekly audit | Ops Lead |
| **Variance in how tasks are structured** | < 5% | Monthly audit | Ops Lead |

**Implementation Details:**

- **Template Library** (GitHub, Notion, or equivalent):
    1. **Project Template:** Domain, Milestone, Phase, Owner, Success Criteria, Constraint Impact
    2. **Task Template:** Title, Owner, Why, Success Criteria, Acceptance Tests
    3. **Decision Template:** Decision, Why, Options Considered, Rationale, Impact
    4. **Meeting Template:** Attendees, Agenda, Decisions, Actions, No-Action Items
    5. **Retrospective Template:** What went well, What didn't, What we'll change
- All templates are checked into GitHub (version-controlled)
- New projects/tasks are created from templates (not blank slate)
- Monthly: Ops audits template usage; if variance > 5%, templates are updated

**Success Signal:**

Consistency. Anyone can pick up a project and understand its status without explanation.

### **KR5.2: New work can be onboarded without verbal explanation**

**Why This Matters:**

- Reduces oral history (decisions are documented)
- Enables async work (teams don't need to wait for meetings)
- Scales to multiple time zones

**Business Metric:**

| Metric | Target | Cadence | Owner |
| --- | --- | --- | --- |
| **New projects onboarded without Ops explanation call** | 100% | Per project | Ops Lead |
| **% of teams that understand a new project on first read** | ≥ 95% (survey) | Per project | VP Product |
| **Questions about "how do I" vs. "what do I" during onboarding** | 0 | Per project | Team Leads |

**Implementation Details:**

- Every new project includes:
    - **Onboarding Packet** (GitHub issue or Notion page):
        1. Project brief (1 page, plain English)
        2. Why we're doing this (business context)
        3. Success criteria (what does done look like?)
        4. Timeline (phases and milestones)
        5. Constraints (what teams are involved, what capacity they have)
        6. Dependencies (what other projects are we waiting on?)
        7. Decision log (where decisions are documented)
        8. Communication channel (where updates are posted)
    - No jargon. Written for someone who joined last week.
    - Owners **do not** schedule kickoff calls; teams read the packet and start.
    - If team has questions: They post in project channel (documented for others)

**Success Signal:**

Teams say: "I read the brief and I know what to do." No kickoff meeting friction.

### **KR5.3: Ops workload does not increase linearly with project count**

**Why This Matters:**

- Ops becomes a bottleneck if process is manual
- Automation + clarity = Ops can scale horizontally
- Team retains agility as we grow

**Business Metric:**

| Metric | Target | Cadence | Owner |
| --- | --- | --- | --- |
| **Ops time per active project** | ≤ 2 hours/week | Weekly audit | Ops Lead |
| **Automation coverage of Ops tasks** | ≥ 80% | Quarterly | Ops Lead |
| **Ops team size** | 1 FTE (vs. linear growth) | Quarterly | VP Product |

**Implementation Details:**

- **Automated Ops Tasks:**
    1. Daily constraint checks (scripted query of utilization vs. targets)
    2. Stale status detection (automated Slack reminder if > 48 hours old)
    3. Orphan task detection (automated sweep)
    4. Meeting decision capture (Slack bot integration)
    5. EOD status summary generation (auto-pull from GitHub, format, post)
- **Manual Ops Tasks (Cannot Be Automated):**
    1. Triage escalations (judgment call)
    2. Constraint trade-off decisions (facilitation)
    3. Quarterly template review (improvement)
    4. Stakeholder communication (escalations, unblocking)
- Target: 80% of Ops work is automated; 20% is human judgment
- **Ops Time Budget per Project:**
    - Intake: 30 min (one-time)
    - Weekly: 1 hour (status check, decision capture)
    - Escalations: 30 min (as needed, avg 1–2 per week across all projects)
    - Total: 2 hours/week per project (with 5 projects in M1 = 10 hours/week for one Ops person)

**Success Signal:**

Adding a 6th project doesn't require hiring another Ops person. Process scales, not headcount.

# **IMPLEMENTATION ROADMAP**

---

### **Week 1–2 (M1 P1.1 Kickoff)**

- [ ]  Publish constraint matrix (KR3.1)
- [ ]  Set up Conference Room dashboard (KR4.1)
- [ ]  Create templates for projects, tasks, decisions (KR5.1)
- [ ]  Train all team leads on intake process (30 min each)

### **Week 3–4**

- [ ]  Audit first batch of projects for metadata completeness (KR1.1)
- [ ]  Conduct first constraint review before projects enter "In Progress" (KR3.3)
- [ ]  Post first EOD status summary (KR4.3)

### **Week 5–6**

- [ ]  Review meeting decision logs; eliminate low-value meetings (KR2.1)
- [ ]  Audit task traceability (KR1.2, KR2.3)
- [ ]  Assess task creation sources (KR2.2)

### **Week 7–8**

- [ ]  Mid-phase retrospective on OKR progress
- [ ]  Adjust templates based on team feedback (KR5.1)
- [ ]  Calculate Ops workload vs. target (KR5.3)

## **SUCCESS METRICS DASHBOARD**

| OKR | KR | Target | Current | Status | Owner |
| --- | --- | --- | --- | --- | --- |
| O1 | KR1.1 | 100% of projects have metadata | TBD | 🔄 In Progress | Ops Lead |
| O1 | KR1.2 | 100% of tasks traceable | TBD | 🔄 In Progress | Ops Lead |
| O1 | KR1.3 | 0 orphan tasks | TBD | 🔄 In Progress | Ops Lead |
| O2 | KR2.1 | 100% of meetings have decision/action/no-action | TBD | 🔄 In Progress | Product Manager |
| O2 | KR2.2 | 0% of tasks created outside authorized meetings | TBD | 🔄 In Progress | Ops Lead |
| O2 | KR2.3 | 100% of tasks have owner/why/success criteria | TBD | 🔄 In Progress | Team Leads |
| O3 | KR3.1 | Constraints documented and published | 🟢 Complete | ✅ Done | Ops Lead |
| O3 | KR3.2 | 100% of violations flagged/re-scoped/rejected | TBD | 🔄 In Progress | Ops Lead |
| O3 | KR3.3 | 0 projects start without constraint acknowledgment | TBD | 🔄 In Progress | VP Product |
| O4 | KR4.1 | Conference Room is canonical entry point | 🟢 Complete | ✅ Done | Ops Lead |
| O4 | KR4.2 | 100% of projects have visible status/next action | TBD | 🔄 In Progress | Ops Lead |
| O4 | KR4.3 | EOD status in < 60 sec | TBD | 🔄 In Progress | Ops Lead |
| O5 | KR5.1 | ≥ 90% of templates used without modification | TBD | 🔄 In Progress | Ops Lead |
| O5 | KR5.2 | 100% of new projects onboarded without verbal explanation | TBD | 🔄 In Progress | Ops Lead |
| O5 | KR5.3 | Ops workload ≤ 2 hours/week per project | TBD | 🔄 In Progress | Ops Lead |

## **DEFINITION OF SUCCESS (Binary)**

**M1 Operations OKRs are successful if and only if:**

1. ✅ **Work is flowing without confusion** (KR1.1, KR1.2, KR1.3)
    - No one asks "where does this go?" or "who owns this?"
    - Backlog is clean (no orphan tasks)
2. ✅ **Meetings feel lighter, not heavier** (KR2.1, KR4.3)
    - Daily standup is 15 min or less
    - Leadership can answer "what's the status?" without meetings
    - Teams don't dread standing meetings
3. ✅ **Constraints are real and respected** (KR3.1, KR3.2, KR3.3)
    - Projects don't balloon mid-phase
    - Trade-offs are visible upfront
    - Mid-project surprises are rare
4. ✅ **Visibility is achieved without surveillance** (KR4.1, KR4.2)
    - Ops is a facilitator, not a micromanager
    - Teams feel trusted and autonomous
    - Leadership has high confidence in the roadmap
5. ✅ **The system scales** (KR5.1, KR5.2, KR5.3)
    - New projects onboard smoothly
    - Ops doesn't become a bottleneck
    - Adding more work doesn't add proportional process overhead

## **ANTI-GOALS (What We're NOT Optimizing For)**

❌ **Speed over clarity** — We'd rather ship late with high confidence than early with ambiguity

❌ **Adding tools instead of tightening process** — We use one tool (GitHub) + async channels (Slack), not a new tool for every problem

❌ **Allowing "temporary" exceptions** — "Just this once" decisions create compound problems

❌ **Tracking metrics that don't drive decisions** — We measure what changes behavior, not what looks impressive

## **CRITICAL DEPENDENCIES**

| Dependency | Provider | Impact | Mitigation |
| --- | --- | --- | --- |
| GitHub Projects API (Conference Room) | GitHub | Core visibility mechanism | Fallback: Manual Notion dashboard |
| Slack API (Decision capture, EOD summaries) | Slack | Automation backbone | Fallback: Manual Ops updates |
| Clerk API (Auth for tracking user actions) | Clerk | User activity audit trail | Low priority for M1 (can add later) |
| Calendar access (Meeting decision logging) | Calendar tool | Automatic decision capture from meeting notes | Fallback: Manual logging in Slack #decisions |

## **RISKS & MITIGATIONS**

| Risk | Probability | Impact | Mitigation |
| --- | --- | --- | --- |
| Teams resist "more process" | High | Low (OKRs reduce friction, not add it) | Clear communication: These rules make work easier, not harder |
| Ops becomes bottleneck during intake | Medium | High | Automate constraint checks; make intake self-service |
| Templates feel rigid | Medium | Medium | Review and adjust every 2 weeks based on feedback |
| Meeting decision capture is inconsistent | High | Medium | Slack bot reminder at end of meeting; audit weekly |
| Constraints are set too tight | Low | High | Built-in quarterly review cycle |

## **CONCLUSION**

These OKRs establish an **operating system for execution** that scales from M1 (5 projects, 3 teams) to M5 (15+ projects, 5+ teams) without proportional overhead.

**The north star:** Teams feel autonomous, leadership has visibility, and work flows without friction.

**If we succeed here, the rest of the product roadmap will ship on time.**

# OKR Budget Alignment

---

## **Objective 1 — Single Operating System**

- Budget: PM/Ops tooling (project/meeting templates, traceability dashboards), 10–15% of Ops bandwidth; small automation spend for intake checks.
- Guardrails: Block spend on parallel tools; require all projects to use the single intake path.

## **Objective 2 — Meeting → Decision → Task**

- Budget: Meeting facilitation time, decision-log automation (scripts/bots); allocate facilitator per recurring ceremony.
- Guardrails: No ad-hoc task creation tools; fund only systems that capture decisions with owners/criteria.

### **Objective 3 — Explicit Constraints**

- Budget: Capacity modeling (licenses/time), 1–2 weeks of Ops + FP&A to codify limits; light analytics for utilization reporting.
- Guardrails: Investments must surface constraint violations in real time; deny requests that bypass constraint checks.

### **Objective 4 — Visibility without Micromanagement**

- Budget: “Conference Room” dashboard build/maintenance; analytics credits; observability for freshness/status.
- Guardrails: Funding contingent on 60s status clarity (in-progress/blocked/moved-today); no net-new dashboards outside the canonical view.

### **Objective 5 — Scale without More Process**

- Budget: Reusable templates library, automation of intake/status/orphan-task sweeps; training/onboarding kits.
- Guardrails: No bespoke templates; automation must keep Ops hours ≤2h/week/project; spend only on reusable assets.

## **Funding principles**

- Prioritize automation over headcount growth.
- Deny tooling that fragments intake/traceability.
- Tie any incremental spend to KR attainment (e.g., % traceable tasks, 0 orphan tasks, 100% meetings with decision/task/no-action log).
- Timebox experiments; deprecate tools that don’t reduce Ops load or improve KR compliance.

### **Checks (per KR)**

- KR1.1–1.3: Fund metadata enforcement and orphan-task sweeps; freeze budgets for teams not at 100% traceability.
- KR2.x: Budget only for meetings with decision logs and templated task creation; cut recurring meetings with zero outputs.
- KR3.x: Require constraint acknowledgment before green-lighting new project spend.
- KR4.x: Budget to keep Conference Room real-time; block duplicate status tooling.
- KR5.x: Invest in template/automation upkeep; cap Ops utilization growth vs. project count.

## OPS-M1-P1.1-OKR — T05 Publish OKRs (Executive Publish Memo)

Last updated: 2026-01-08

## EXECUTIVE SUMMARY

- OKR framework selected as the governing execution model for 2026; M1 is scoped for clarity before scale.
- Meeting → project → task linkage is live; task validity requires objective reference; constraint traceability becomes mandatory after T02.
- As of 2026-01-05: T01 (Define company objectives) and T02 (Define key results) are marked completed; OKRs and operational constraints for M1 are established.
- Canonical sources are linked below. This page is the published pointer + operating rules.

### CANONICAL SOURCES (do not reinvent)

- Aligned Business OKRs (Ops): https://www.notion.so/2e2a4e63bf23816cadc3ef24ca3b01e4
- Budgets & Constraints alignment: https://www.notion.so/2e2a4e63bf23800f8c94fda008644c52
- Project page: https://www.notion.so/2dba4e63bf2380fe9cbfdd8d6d1b5b62
- Sprint Planning 2026-01-03: https://www.notion.so/2dda4e63bf23819ebd3dfd911c156c9b
- Weekly Sync 2026-01-03: https://www.notion.so/2dda4e63bf23816ebca9d9f120ea5d0b

### HOW TO USE THESE OKRs (OPERATING RULES)

- A task without an objective reference is invalid.
- No downstream work is considered final until objectives are written.
- Constraints are first-class: write alongside objectives, not after.
- After T02, constraint traceability becomes mandatory.
- Financials are deferred until objectives are locked; add them once the objective set is stable.
- Maintain shared vocabulary across Product/Design/Engineering (no label drift).

### CADENCE & CHECKPOINTS

- Daily Ops meetings: progress, blockers, constraint surfacing.
- Weekly Sync: cross-team status + blockers; confirmed automation rhythm; noted risk: problem definition convergence speed.
- Sprint Planning: sprint goal is to complete P1.1 discovery across all six teams by Jan 15, 2026.
- Review standard: every team deliverable must map to an OKR and constraints (where applicable).

### AUDIT NOTE (OPS meetings Jan 1–7)

- 2026-01-01 and 2026-01-02 contain substantive notes about OKR framework selection and traceability rules.
- 2026-01-05 contains completion confirmations for T01/T02 and OKR/constraints establishment.
- 2026-01-06 and 2026-01-07 pages are template scaffolds (no substantive notes captured); see the annotations added to those pages and use the canonical links above.

### NEXT ACTIONS (keep publish real)

- Ensure every new task references an objective and (when applicable) a constraint.
- When a constraint changes, propagate it to Product/Design/Engineering and update the canonical constraints page.
- If a meeting happens without notes, explicitly annotate it so audits don’t imply history that wasn’t recorded.