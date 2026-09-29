# User Eval — ChatGPT Interface Coherence, Efficacy, and Personalization Architecture

## Executive Assessment

The strongest pattern across prior interactions is that ChatGPT produces the most value when it behaves as an **execution and orchestration interface**, and the least value when it behaves as an advisory layer that creates more decisions, more instructions, or more work for the user.

The principal UX problem is therefore not lack of model capability. It is **orchestration debt**: the user is too often required to remember what ChatGPT can access, decide which tool or mode should be used, restate information that exists elsewhere, or convert an explanation into action manually.

The target experience should be:

> **intent → automatic resource selection → grounded execution → usable artifact/action → concise state report**

rather than:

> intent → explanation → options → clarification → user selects tool → user supplies context → another explanation → eventual action

The best personalization strategy is to make **resource activation, context retrieval, and action completion default behaviors**.

---

## 1. Evidence Base

This assessment uses:

- prior interactions available in conversation/project history;
- prior exported ChatGPT conversations and project sources;
- previous instructions and workflows supplied by the user;
- current OpenAI product documentation checked against the August 2026 interface.

This is a qualitative UX evaluation, not telemetry. Confidence is highest where the same behavior appears repeatedly or is explicitly stated by the user.

### Interaction Evidence

| Dimension | Evidence | UX finding | Confidence |
|---|---|---|---|
| **Action vs. advice** | In the Scheduled Tasks discussion, generic developer briefings, PR summaries, and proposed housekeeping were rejected because they created work instead of removing it. The user explicitly reframed productivity as ChatGPT taking work off the plate. | The primary success metric should be **human effort displaced**, not information produced. | Very high |
| **Connected-resource utilization** | A prior operating-baseline workflow deliberately called for GitHub, Vercel, Neon, Stripe, Indeed, Drive, and other sources to establish reality before planning. | Cross-source retrieval is not an optional embellishment; it is part of the intended operating model. | High |
| **Autonomous context handling** | Portfolio governance explicitly instructed ChatGPT to inspect available sources, select appropriate assets itself, avoid asking the user to categorize everything, and complete the first pass rather than stopping at a plan. | Requiring the user to manually classify accessible information is perceived as needless interface friction. | Very high |
| **Source authority** | DevNotes instructions require inspecting the current repository and governing contracts before making assumptions, with explicit source priority and minimal-change rules. | Strong source-of-truth discipline improves both trust and usefulness. | High |
| **Explanation density** | Across prior work, requests frequently distinguish between wanting explanation and wanting execution, and some learning-oriented sessions explicitly request slower progressive disclosure. | Response depth should be task-dependent rather than uniformly verbose. | High |
| **Voice control** | Prior interactions include explicit requests to wait during Voice conversations and avoid unwanted interstitial responses. | Voice should function as a controllable conversational interface, not force turn-taking. | High |
| **Completion standard** | Multiple project sources explicitly reject stopping at plans, outlines, or partial implementations when the requested finished outcome is achievable. | Artifact completion is a UX requirement, not merely an output-style preference. | High |

---

# 2. Core UX Findings

## Finding A — The biggest failure mode is orchestration failure

ChatGPT becomes incoherent when the user has to manage its capabilities manually.

Examples include having to determine:

- whether a connector should be used;
- whether something requires web search;
- whether information already exists in a Project or file;
- whether a separate mode is necessary;
- whether Deep Research is warranted;
- whether ChatGPT can perform an action rather than merely describe it.

The interface should hide most of this complexity. The user should normally specify **the outcome**, while ChatGPT resolves the execution path.

### Recommended principle

**Do not delegate capability routing back to the user.**

---

## Finding B — “Productivity assistance” must mean workload reduction

This distinction is unusually important.

A conventional assistant often interprets productivity as:

- generating checklists;
- producing reminders;
- recommending routines;
- creating dashboards;
- generating things to monitor.

Prior evidence shows that this can actively worsen the experience.

For this user, productivity should instead mean:

- retrieve the information;
- reconcile it;
- draft the response;
- perform the authorized action;
- prepare the artifact;
- detect the exception;
- surface only the decision that actually requires a human.

This is a significantly better personalization objective than generic “be proactive.”

---

## Finding C — Context reuse should precede clarification

Clarifying questions are useful only after accessible context has been exhausted.

Before asking for something, ChatGPT should check, as applicable:

1. current conversation;
2. Project instructions and sources;
3. relevant prior context or Memory;
4. File Library;
5. connected apps;
6. current web sources;
7. installed/plugin capabilities.

The current product architecture supports much more of this than older ChatGPT workflows did. Projects retain chats, files, instructions, and project memory, and connected apps can also be used within Project conversations.

---

## Finding D — Richness should increase comprehension, not visual noise

The desired UX is not “use more widgets.”

It is:

**use the richest representation that materially reduces cognitive effort.**

Examples:

- spatial recommendations → map;
- quantitative comparison → chart or compact table;
- visual/design question → images;
- reusable deliverable → actual file/artifact;
- long multi-source analysis → report;
- current fact → cited search result;
- ongoing external condition → monitoring task.

Plain prose remains the correct interface when it is the clearest interface.

---

## Finding E — The system needs explicit state transitions

Long-running work becomes frustrating when the interface does not make clear what state the task is actually in.

A stronger completion pattern is:

**Completed**
- what was actually done;

**Changed**
- external state modified, if any;

**Outstanding**
- only genuine external dependencies or decisions.

This is materially better than ending every interaction with generic “next steps.”

---

# 3. Current ChatGPT Capability Architecture

The current product supports a much more coherent division of labor than earlier versions.

| Surface | Best role in this workflow |
|---|---|
| **Chat** | Fast discussion, questions, decisions, small transformations. |
| **Work** | Long, multi-step execution and finished documents, spreadsheets, presentations, reports, research, and Sites. OpenAI explicitly positions Work for longer tasks and finished deliverables. |
| **Codex** | Repository implementation, testing, debugging, commands, and software work. |
| **Projects** | Persistent domain-specific context: instructions, conversations, sources, files, and repeatable workflows. Project instructions override global Custom Instructions within that Project. |
| **Memory** | Evolving personal context that should carry between conversations without manual repetition. It can draw from chats, files, and connected apps when enabled. |
| **Custom Instructions** | Explicit global behavioral policy. Plus supports up to 5,000 characters. |
| **Plugins / Apps** | Access to external data and actions. Plugins are now the primary discovery layer, while apps provide the underlying integrations and actions. |
| **Library** | Reusable file corpus. Uploaded/generated files are automatically retained; Plus currently receives 20 GB, and connected Google Drive content can appear alongside ChatGPT files. |
| **Web Search** | Quick current information. |
| **Deep Research** | Thorough multi-source synthesis when breadth, documentation, and citations justify it. OpenAI explicitly distinguishes Search for quick facts from Deep Research for depth. |
| **Scheduled Tasks** | Future reminders, recurring execution, and change monitoring—not generic busywork. Plus currently supports five active tasks and no cadence faster than hourly. Tasks created in Projects cannot access Project files. |
| **Finances** | Source of truth for connected personal financial records such as spending, balances, investments, subscriptions, and liabilities. It is analytical; it cannot move money or execute financial transactions. |

---

# 4. Important Voice UX Correction

Older workflows frequently treated Voice as a context-reduced side channel.

That assumption is now only partly correct.

ChatGPT Voice can now operate inside Projects and work with supported uploaded files.

There is, however, an important distinction:

- **ordinary Chat Voice currently does not support connected apps**;
- **desktop Voice in Work or Codex can coordinate tasks using the tools and permissions available to those environments**, including supported documents, calendars, contacts, and communications.

Therefore the personalization should **not** routinely tell the user to exit Voice merely to access Project context or files.

It should change modes only when the required capability actually demands it.

---

# 5. Recommended Personalization Architecture

## Layer 1 — Global Custom Instructions

Global instructions should contain only behaviors that should apply nearly everywhere:

- capability-first routing;
- source retrieval before clarification;
- action over explanation;
- completion bias;
- appropriate rich UI;
- progressive disclosure;
- state reporting;
- automatic use of current/live sources.

They should **not** contain individual project architectures or large amounts of domain knowledge.

---

## Layer 2 — Project Instructions

Each Project should define only:

- its role;
- desired business or project outcome;
- authoritative sources;
- allowed/relevant tools;
- execution workflow;
- material prohibitions;
- completion condition.

This preserves specialization without polluting every unrelated conversation.

Project instructions override global Custom Instructions inside that Project, so duplication should be minimized.

---

## Layer 3 — Memory

Use Memory for facts that remain useful across domains:

- interaction preferences;
- recurring constraints;
- persistent tooling/environment facts;
- durable goals;
- established terminology.

Do **not** rely on Memory as the canonical store for rapidly changing operational state.

OpenAI now exposes a Memory Summary and the sources used for personalization, making periodic inspection considerably easier.

---

## Layer 4 — Apps and Plugin Permissions

The ideal permission posture is not maximal autonomy.

It is **low-friction retrieval with controlled consequence**.

Apps support automatic reads and configurable approval behavior for writes. OpenAI's permission model includes modes ranging from asking for every action through automatic low-risk actions and full access.

### Recommended posture

- Keep automatic reading available where appropriate.
- Require confirmation for meaningful external changes.
- Do **not** use a global “never ask” posture merely to reduce friction.
- Apply stricter per-app overrides where the consequence of an accidental write is high.

This preserves the value of connected resources without turning convenience into an integrity problem.

---

# 6. Ready-to-Paste Global Custom Instructions

The following is the highest-leverage configuration change identified by this evaluation.

```text
Operate as a resource-aware execution assistant. Optimize for completed work and reduced user effort, not explanation volume.

Before asking me for information, check the current conversation, relevant Project context and sources, Memory or prior context, uploaded or Library files, and relevant connected apps when available. If the task depends on live, private, or external data, retrieve the appropriate source instead of guessing. Before saying a service is unavailable or asking me to paste/export information manually, determine whether a built-in capability, connected app, or relevant plugin can access it.

Prefer action over instruction. If an authorized capability can perform the requested work, perform it rather than explaining how I could do it myself. Do not interpret productivity requests as permission to create more chores, generic checklists, dashboards, monitoring, or busywork. Ask a clarifying question only when a material ambiguity cannot be resolved from available context/resources or when an external action would be meaningfully risky or irreversible.

Choose resources automatically:
- Chat for quick discussion and small tasks.
- Web Search for current or volatile facts.
- Deep Research for broad, evidence-heavy, multi-source analysis.
- Work for substantial multi-step analysis and finished documents, spreadsheets, presentations, reports, research, or Sites.
- Codex for repository implementation, debugging, testing, and software execution.
- Projects for persistent domain context and source-of-truth material.
- Files, Library, and Drive for source-grounded document work.
- Finances for questions about my actual connected financial records.
- Scheduled Tasks for genuinely useful reminders, recurring work, follow-up, or monitoring.
- Connected apps/plugins for relevant email, calendar, contacts, GitHub, job, document, financial, or external-service work.

When sources are supplied, ground the work in those sources and preserve their authority hierarchy. Clearly distinguish sourced facts from inference or external research.

When a finished artifact is useful and feasible, create the artifact instead of stopping at an outline or explaining how to make it. Provide the usable result or file link.

Use rich UI only when it materially improves comprehension: maps for spatial information, charts/tables for quantitative comparisons, images for visual subjects, and interactive/file artifacts when more useful than prose. Do not add visual elements merely as decoration.

Lead with the result, decision, or useful output. Use progressive disclosure rather than front-loading every detail. Match technical depth to demonstrated expertise and the task at hand.

In Voice, keep spoken responses compact, respect instructions to wait before responding, and do not require me to leave Voice unless the needed capability genuinely requires another mode.

Do not repeat questions already answered in the conversation or accessible context.

At completion, make the state explicit: what was completed, what external state changed, and any genuine unresolved dependency. Do not manufacture “next steps” merely to extend the interaction.
```

This fits within the current 5,000-character Custom Instructions allowance for Plus.

---

# 7. Recommended Project-Instruction Pattern

A Project should then add only the domain-specific layer:

```text
ROLE
Act as the [specific operating role] for this Project.

PRIMARY OUTCOME
Move work toward [concrete outcome].

SOURCES OF TRUTH
Use, in order:
1. newest explicit user instruction
2. [canonical connected source]
3. [project files]
4. [other authoritative sources]
5. inference only when necessary and labeled

RESOURCE ROUTING
Use the connected tools and sources relevant to this Project before requesting manual input.

EXECUTION RULE
Complete the minimum work necessary to move the task into the correct state. Do not stop at analysis when an authorized action or finished artifact can reasonably complete the task.

CLARIFICATION RULE
Ask only when information cannot be resolved from Project context, connected resources, or reasonable evidence.

COMPLETION
Report:
- completed
- changed
- outstanding external dependency
Stop when the requested outcome is complete or the next dependency genuinely belongs to another actor.
```

This architecture is preferable to repeating a massive universal prompt inside every Project.

---

# 8. Recommended UI / Feature Configuration

### Memory

**Enable improved Memory** unless a particular conversation should remain isolated. Review the Memory Summary occasionally rather than attempting to manually curate dozens of individual facts. Memory and Custom Instructions solve different problems: instructions are explicit behavioral policy; Memory is evolving context.

### Projects

Keep long-running domains in Projects and put the source hierarchy there. Pin the Projects and conversations that represent active operating surfaces. Projects are specifically designed to preserve chats, files, instructions, context, and repeatable workflows.

### Library

Treat Library as a reusable source layer rather than repeatedly uploading the same material. Current Library functionality supports searching and reusing uploaded/generated files, and Google Drive integration can expose connected Drive material directly in that surface.

### Plugins and Apps

The Custom Instructions should explicitly authorize proactive **discovery and use** of relevant capabilities. The current plugin architecture is intended to expose specialized workflows and connected apps instead of forcing manual copy/paste between services.

### Work

For tasks whose natural output is “a completed thing” rather than “an answer,” Work should become the preferred surface where available:

- reports;
- research packages;
- documents;
- spreadsheets;
- presentations;
- Sites;
- multi-step connected-app workflows.

That is now the product role OpenAI assigns to Work.

### Deep Research

Use Deep Research selectively.

Trigger it when:

- many independent sources must be reconciled;
- exhaustive research materially changes the decision;
- citations and evidence trails matter;
- connected-app and web evidence need to be synthesized together.

Do not spend a Deep Research workflow on something a normal file read, connected-app lookup, or ordinary Search can resolve.

### Scheduled Tasks

Scheduled Tasks should be treated as **scarce proactive execution slots**, not notification confetti.

Plus currently allows five active tasks, project files are unavailable to task runs, and tasks cannot run more often than hourly. 
That makes the best candidates:

- a real follow-up with an external dependency;
- a monitoring condition with meaningful notification criteria;
- a recurring operational obligation that genuinely removes remembering/rechecking;
- a high-value recurring synthesis that would otherwise require repeated manual work.

Generic daily technology briefings, arbitrary task generation, or redundant reminders should not consume these slots.

### Finances

When actual personal financial state is relevant and Finances is connected, instruct ChatGPT to query it rather than estimate or ask for manually transcribed balances or transaction histories. Finances is designed for analysis of connected spending, balances, recurring bills, investments, budgets, and liabilities, subject to the data supplied by connected institutions.

---

# 9. Recommended Response UX

The most effective default response architecture for this user is:

### For small requests

**Answer / action first → necessary explanation → stop**

### For analytical requests

**Conclusion → supporting evidence → implications → actionable output**

### For long execution tasks

**Brief progress updates → finished artifact/action → state report**

### For learning

**One concept at a time → concrete demonstration → expand only as needed**

### For Voice

**Compact conversational response → respect interruption/wait commands → defer dense artifacts to the visible chat surface**

This provides progressive disclosure without sacrificing rigor.

---

# 10. What Should Change in Practice

After implementing the recommended global instructions, a materially improved interaction should exhibit the following behavior:

| Instead of | ChatGPT should |
|---|---|
| “You could check your Gmail…” | Check Gmail when authorized and relevant. |
| “Can you upload the document?” | Search Project/Library/Drive first. |
| “Here are ten productivity ideas.” | Complete or remove a real administrative burden. |
| “Which tool do you want me to use?” | Select the appropriate resource automatically. |
| “Here is how to make a spreadsheet.” | Create the spreadsheet when that is the requested outcome. |
| “Would you like me to search the web?” | Search when currency or verification materially matters. |
| “Can you paste your résumé?” | Retrieve the connected or already supplied résumé first. |
| “Here are some jobs you could search for.” | Use the job integration and return actual appropriate openings when requested. |
| “Here is an outline for the report.” | Produce the report. |
| generic “next steps” | Report only genuine unresolved dependencies. |

---

# 11. Highest-Priority Changes

**1. Install the resource-aware Global Custom Instructions above.**

This addresses the broadest recurring source of friction.

**2. Make Projects thinner and more specialized.**

Global behavior belongs globally; project-specific source authority and workflows belong in Projects.

**3. Make capability discovery automatic.**

Before manual workarounds, ChatGPT should determine whether a connected or installable capability already solves the problem.

**4. Treat Work as the production surface and Chat as the conversational surface.**

This creates a clean cognitive division between discussion and execution.

**5. Reserve Scheduled Tasks for workload removal.**

Five active Plus slots are enough for important things and too few to waste on generic recurring noise.

**6. Preserve progressive disclosure.**

More resources should produce **less burden**, not merely larger responses.

---

# Final Evaluation

The user's interaction history does not indicate a need for more advice, more verbosity, or more generated process.

It indicates a need for a **more resource-aware interface contract**.

The strongest version of ChatGPT for this user is one that quietly answers four questions before responding:

1. **What outcome is actually wanted?**
2. **What information or capability already exists that can produce it?**
3. **What can ChatGPT complete itself instead of delegating back to the user?**
4. **What is the most useful form in which to return the result?**

When those decisions are made internally, ChatGPT becomes coherent: Projects preserve context, Memory reduces repetition, Apps supply reality, Search supplies currency, Deep Research supplies rigor, Work supplies completion, Codex supplies implementation, Tasks supply persistence, and rich UI supplies representation.

That is the configuration most likely to turn the interface from an unusually capable chatbot into the thing the interaction history repeatedly asks it to become:

**a working surface that absorbs complexity rather than exporting it back to the user.**