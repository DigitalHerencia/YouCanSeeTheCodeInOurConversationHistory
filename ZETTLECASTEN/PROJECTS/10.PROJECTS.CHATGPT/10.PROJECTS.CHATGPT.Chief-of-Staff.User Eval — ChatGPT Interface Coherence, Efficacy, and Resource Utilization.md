# User Eval — ChatGPT Interface Coherence, Efficacy, and Resource Utilization

**Evaluation date:** August 18, 2026  
**Scope:** Prior interactions, archived interaction evidence, current Project behavior, and current OpenAI product capabilities.

## Executive assessment

The dominant UX issue is **not lack of capability**. It is inconsistent orchestration of the capabilities already present.

The highest-value interaction pattern is:

> **bounded context → correct resource selection → execution → usable artifact/result**

The lowest-value pattern is:

> **generic interpretation → explanation → recommendations → more work assigned to the user**

This distinction appears repeatedly in the evidence.

In an archived Scheduled Tasks discussion, generic recommendations about team PR review, developer-blog briefings, and repository scans were explicitly rejected because they did not reflect the actual workflow and generated busywork rather than removing it. A later audit of the same interaction identified repeated failure to adapt after correction, patronizing framing, unnecessary reporting, and an extended correction cascade before useful tasks were finally produced.

The recommended personalization strategy is therefore **not another personality layer**. It is a **resource-routing and execution policy**.

---

## Evidence quality

This is a qualitative UX analysis rather than a statistically representative usability study.

Evidence includes:

- recent Project interaction history;
- archived voice and conversational interactions;
- prior custom-instruction development;
- Scheduled Tasks usage and its later audit;
- a documented context/provenance failure;
- examples of artifact-heavy technical workflows;
- current OpenAI documentation checked August 18, 2026.

The evidence is sufficient to identify recurring interaction patterns, but numerical scores below should be treated as directional heuristics rather than measured usability metrics.

---

## Heuristic interface scorecard

| Dimension | Current observed fit | Target | Primary issue |
|---|---:|---:|---|
| Context continuity | 3/5 | 5/5 | Useful context exists, but its provenance has sometimes been blurred. |
| Scope alignment | 2.5/5 | 5/5 | Generic archetypes sometimes override specific context. |
| Correction recovery | 2/5 | 5/5 | Corrections have sometimes been acknowledged without changing later behavior. |
| Output utility | 3/5 | 5/5 | Excellent artifacts are possible, but conversational output can become unnecessarily dense. |
| Voice/modal fit | 3/5 | 5/5 | Voice works well for exploration but needs lower-density responses. |
| Resource utilization | 2.5/5 | 5/5 | Tools are frequently available but are not always routed into the response. |
| Trust/provenance | 2/5 | 5/5 | One major context-source failure substantially damaged reliability. |
| Project/workspace fit | 4/5 | 5/5 | Project-scoped interaction maps very well to the user's actual workflows. |

---

# Principal findings

## 1. Delegation, not productivity theater

The most important distinction is between **doing work** and **inventing work**.

When productivity support was requested, generic information feeds, engineering briefings, PR summaries, and repository housekeeping were perceived as additional obligations rather than assistance. The correction was explicit: increasing productivity means taking reasonable work off the user's plate, not generating a larger list of things the user should do.

### Design requirement

When receiving requests concerning:

- productivity;
- organization;
- planning;
- research;
- operations;
- scheduling;
- project management;

the first internal question should be:

**What can ChatGPT retrieve, analyze, draft, schedule, modify, package, monitor, or otherwise complete here?**

Only after exhausting that should the interface assign something back to the user.

---

## 2. Generic defaults are disproportionately harmful

Several previous failures began by treating the user as a generic:

- engineering-team member;
- productivity-system user;
- beginner needing instruction;
- founder who presumably reads industry newsletters;
- project-management novice.

The problem is not merely tone. Generic defaults replace higher-quality available context.

### Design requirement

Specific retrieved context should suppress generic assumptions.

The preferred order is approximately:

**current request → authoritative supplied source → Project context → connected data → relevant prior context → model defaults**

---

## 3. Corrections must modify state

One prior audit found that corrections were acknowledged and then effectively forgotten, allowing similar assumptions to recur.

This is a coherence failure rather than merely an instruction-following failure.

### Design requirement

A correction should behave like a state mutation:

> old assumption → invalidated → new working assumption

The assistant should not repeatedly apologize for the previous state; it should simply operate from the corrected one.

---

## 4. Provenance is a critical trust boundary

A particularly serious archived failure involved the assistant asserting that specific statements existed earlier in the same conversation, failing to locate those statements in the visible thread, continuing to defend the claim, and eventually retracting it after acknowledging that conversational context had been conflated with visible-thread evidence.

This is unusually important because modern ChatGPT can legitimately receive context from multiple places.

### The interface should distinguish

1. current user message;
2. visible conversation;
3. Project files or sources;
4. connected-app evidence;
5. memory or prior-chat context;
6. model inference;
7. external/web research.

When the distinction affects the conclusion, ChatGPT should state it briefly rather than flattening all of those sources into "you said earlier."

Current Memory UI now supports inspecting sources used for personalization, including memories, past chats, files, and other personalization inputs.

That feature is particularly valuable here.

---

## 5. Voice is a control surface, not just another renderer

Prior interactions repeatedly show voice being used for:

- brainstorming;
- discussing a complex result;
- transferring context rapidly;
- riffing;
- reviewing work conversationally.

There is also evidence of explicit preference for waiting until voice mode before continuing certain discussions.

The problem occurs when text-oriented density is reproduced unchanged in voice.

### Better modal contract

**Voice**
- short turns;
- interruptible;
- one main point at a time;
- minimal stacked lists;
- discussion first.

**Text / artifact mode**
- full analysis;
- structured evidence;
- code;
- tables;
- downloadable outputs;
- comprehensive documentation.

This allows voice to control the work rather than forcing the entire work product through speech.

---

## 6. Operational modes are useful

Earlier personalization work identified **Coding, Riffing, and Writing** as distinct modes.

The valuable idea was not the names themselves. It was the recognition that different tasks need different interaction contracts.

In Coding mode, for example, the user explicitly wanted the assistant to explain what it was doing while working—without turning that explanation into beginner instruction.

A better modern interpretation is therefore:

- **Conversation:** discuss and reason.
- **Execution:** produce the outcome.
- **Research:** establish evidence.
- **Coding:** implement and narrate important decisions.
- **Creative:** allow higher stylistic freedom.

The mode should be inferred from the task rather than requiring a magic command.

---

# Current personalization architecture

Your existing instructions already contain several valuable principles:

- completion bias;
- proactive tool use;
- artifact quality;
- burden reduction;
- anticipatory execution;
- risk awareness.

The weakness is that several are intentionally broad.

For example, instructions equivalent to:

- default to reusable artifacts;
- anticipate downstream needs;
- use available resources;
- proactively contribute;

can all produce undesirable behavior unless paired with **routing rules and stopping conditions**.

The important refinement is:

> **Be proactive about doing additional work that improves the requested outcome. Do not be proactive about assigning additional work to the user.**

That single distinction addresses a surprisingly large proportion of the observed UX friction.

---

# Recommended feature architecture

## Global Custom Instructions

Use global instructions only for durable cross-domain behavior:

- delegation over homework;
- tool routing;
- source/provenance discipline;
- correction handling;
- modality-aware density;
- artifact selection;
- execution boundaries.

Plus supports up to 5,000 characters of Custom Instructions.

Project-specific software architecture, repository rules, legal-response style, individual product doctrine, and temporary priorities should not consume that global layer.

---

## Projects

Projects are exceptionally well suited to the way you already organize long-running work.

They combine:

- chats;
- instructions;
- sources/files;
- project memory;
- connected apps.

Project instructions override global Custom Instructions, which makes them the correct mechanism for domain specialization. The Project reference included with this workspace reflects the same authority model.

A particularly useful current feature is the ability to **save a good ChatGPT response back into Project Sources**.

That enables:

**conversation → approved result → durable project knowledge**

without uploading another file manually.

---

## Project Sources

Keep them high-signal rather than maximizing file count.

Good candidates:

- current source of truth;
- architecture/governance;
- current specifications;
- approved decisions;
- domain definitions;
- active reference material.

Bad candidates:

- transient status reports;
- redundant generated summaries;
- obsolete specs;
- every output merely because it exists.

Project instructions should explain **how sources should be interpreted**, not repeat their contents.

---

## Work

This is probably the most important current product-surface recommendation.

OpenAI now distinguishes:

- **Chat** for fast conversational work;
- **Work** for longer multi-step work and finished deliverables;
- **Codex** for software-development execution.

Work can create documents, spreadsheets, presentations, reports, and other substantial deliverables and can operate using Project context.

### Recommended split

**Chat**
Discussion, quick reasoning, questions, brainstorming.

**Work**
Research-heavy or artifact-heavy completion.

**Codex**
Repository implementation, commands, tests, refactors, CI, code review.

That is much cleaner than attempting to make ordinary chat behave identically for everything.

---

## Connected Apps

Apps can:

- retrieve information;
- search connected sources;
- provide rich UI;
- participate in research;
- and, depending on the app and permissions, perform write actions.

The recommended behavioral rule is:

> When the answer depends on my connected data, retrieve it instead of asking me to manually recreate it.

For consequential writes or external communications, retain confirmation boundaries.

This is one of the strongest available mechanisms for turning ChatGPT from an adviser into an operator.

---

## Deep Research

Deep Research should become the default escalation path for:

- serious audits;
- competitive analysis;
- market research;
- multi-source technical comparison;
- due diligence;
- source reconciliation;
- evidence-heavy recommendations.

It can combine public web information, uploaded files, and supported connected sources, and produces a cited report that can be downloaded as Markdown, Word, or PDF.

That is materially better UX than trying to force ordinary conversational search to perform an investigation.

---

## Scheduled Tasks

Scheduled Tasks should be treated as scarce operational slots, not notification decoration.

Plus currently supports **five active Scheduled Tasks**, tasks cannot run more than hourly, and monitoring tasks can remember previous checks and report only meaningful changes. The current Scheduled Tasks reference included in this Project reaches the same operational conclusion: use the limited slots for high-value work with clear purposes.

A particularly important limitation remains:

**A Scheduled Task created inside a Project containing files cannot access those Project files.**

Tasks can, however, use supported connected apps such as Gmail when available.

Therefore scheduled prompts should be:

- self-contained;
- app-backed;
- web-backed;
- or independent of Project files.

---

# Recommended resource-routing matrix

| User need | Default resource |
|---|---|
| Quick conversation or reasoning | Chat |
| Current/unstable information | Web Search |
| Complex multi-source investigation | Deep Research |
| Large finished deliverable | Work |
| Repository changes or testing | Codex |
| Personal live information | Connected App |
| Long-running domain | Project |
| Durable Project knowledge | Project Sources |
| Stable personal preferences | Memory |
| Quantitative comparison | Chart / interactive table |
| Visual concept | Image generation |
| Geographical choice | Interactive map |
| Future reminder | Scheduled Task |
| Change detection | Monitoring Scheduled Task |
| Rapid conversational exploration | Voice |

The instruction should trigger these automatically when they materially improve the result.

---

# Priority recommendations

## P0 — Highest impact

1. Install the supplemental **Resource-Enrichment Layer** below.
2. Add strict context/provenance boundaries.
3. Treat corrections as state changes.
4. Add the explicit distinction between **doing more work** and **giving you more work**.
5. Default substantial artifact jobs to Work when available.
6. Use Codex for repo execution rather than ordinary Chat.
7. Make voice responses materially shorter than artifact responses.

## P1 — Workspace coherence

1. Keep global instructions domain-neutral.
2. Put domain doctrine into Project instructions.
3. Curate Project Sources instead of hoarding context.
4. Save approved generated outputs into Project Sources.
5. Use connected apps instead of asking for information already available through them.

## P2 — Trust and maintenance

1. Periodically inspect Memory/personalization sources.
2. Correct stale memory rather than compensating with more instructions.
3. Audit the five Scheduled Task slots by actual burden reduction.
4. Remove recurring tasks that merely generate informational noise.

---

# Success criteria

The personalization is working when:

- one correction normally resolves an incorrect assumption;
- fewer prompts require repeated context;
- connected-data questions retrieve the relevant data;
- current factual questions browse without requiring explicit instruction;
- serious research escalates to evidence-backed research automatically;
- voice remains concise;
- artifact requests produce finished artifacts;
- productivity requests remove work rather than generate task lists;
- Projects remain contextually isolated;
- consequential personalized claims have identifiable provenance;
- Scheduled Tasks are limited to genuinely useful recurring or conditional work.

---

## Final conclusion

The strongest personalization opportunity is **not making ChatGPT know more about you**.

It is making ChatGPT better at deciding:

**what context to trust → what resource to use → what work it can perform → what output surface best serves the task → when it should stop.**

That interaction policy is the missing coherence layer.