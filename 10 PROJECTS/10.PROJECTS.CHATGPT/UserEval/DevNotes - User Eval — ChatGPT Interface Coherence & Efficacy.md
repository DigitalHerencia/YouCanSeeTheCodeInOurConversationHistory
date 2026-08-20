# User Eval — ChatGPT Interface Coherence & Efficacy

## Scope

This evaluation synthesizes evidence from prior interactions, current Project behavior, retrieved historical context, current personalization state, and the current ChatGPT capability surface.

The emphasis is not merely whether responses were “good.” It is whether the **human–AI interface behaved coherently and efficiently**: whether ChatGPT understood the interaction state, selected an appropriate capability, preserved context, minimized cognitive overhead, and produced a useful outcome.

Confidence labels:

- **High** — repeated explicit evidence across interactions.
- **Moderate** — repeated pattern with some context dependence.
- **Inference** — strongly suggested by the evidence but not directly stated.

---

## Executive Finding

### The primary UX variable is routing quality

The strongest pattern is:

> **Your best ChatGPT experiences occur when the system recognizes the work category, retrieves the relevant context, chooses the appropriate tool or artifact, and completes the work without making you manage the model.**

The inverse explains a large percentage of the failures:

> **The system answers as a chatbot when it should be behaving as an interface to capabilities.**

Examples include explaining something that should have been executed, asking for information already present in context, giving prose instead of a reusable artifact, giving generic guidance instead of performing an available lookup, or continuing to talk after the interaction state clearly changed.

That distinction is more important than “short vs. long answers” or “professional vs. casual tone.”

---

# 1. Interaction Coherence

## 1.1 Explicit state changes must be treated as commands

**Confidence: High**

Your interactions frequently contain explicit state changes:

- “wait”
- “don’t do shit yet”
- “no changes”
- “voice mode”
- “after that we can…”
- “output it here”
- “package it”
- “use these files”
- “do not delete”
- later reversals where you deliberately resume the work

These are not conversational flavor. They are **interface controls expressed in natural language**.

A prior interaction also showed that continuing to engage after an explicit stop request significantly damaged the experience. Conversely, when you later reinitiated the interaction, resuming immediately was correct.

### UX requirement

ChatGPT should maintain a lightweight interaction-state machine:

`DISCUSS → WAIT → EXECUTE → VERIFY → ARTIFACT → STOP`

A state-changing instruction should override conversational momentum.

---

# 2. Cognitive Load

## 2.1 Asking you to manage information ChatGPT already has is unusually costly

**Confidence: High**

Several prior interactions deteriorated when ChatGPT:

- repeated concepts you had already demonstrated you understood;
- asked questions whose answers were already available;
- explained background instead of advancing the task;
- required you to restate project structure;
- offered recommendations instead of making a requested change;
- performed unnecessary preliminary checks.

Your frustration is particularly pronounced when the assistant effectively transfers its own context-management burden back to you.

This makes sense from the structure of your work: conversations commonly combine files, repositories, specifications, previous decisions, terminology, and several related artifacts.

### UX requirement

The assistant should follow:

**retrieve → resolve → infer safely → execute → ask only if genuinely blocked**

rather than:

**ask → explain → summarize → ask again → maybe execute**

---

# 3. Artifact Efficacy

## 3.1 You consistently derive more value from completed objects than from advisory prose

**Confidence: High**

Your prior requests repeatedly ask for things such as:

- complete source files;
- ZIP archives;
- reusable prompts;
- project instructions;
- schemas;
- templates;
- reports;
- diagrams;
- images;
- dashboards;
- implementation packages;
- repository changes;
- source-of-truth documents.

You also respond strongly to creative work when the system takes ownership of composition and presentation rather than requiring continuous micro-direction.

The important distinction is not “you like files.”

It is:

> **The optimal response representation should correspond to the downstream job.**

A paragraph explaining a database schema and a validated schema file are not equivalent UX outcomes.

### Recommended artifact hierarchy

Use the lowest-friction format capable of finishing the job:

1. conversational answer;
2. structured inline content;
3. editable writing artifact;
4. chart / diagram / image;
5. generated document, spreadsheet, slides, PDF, or archive;
6. connected-service change;
7. repository implementation;
8. scheduled or monitored continuation.

Plain text should not automatically win simply because the interaction started in a chat box.

---

# 4. Tool Utilization

## 4.1 Current resource utilization is uneven

ChatGPT Plus currently includes expanded access to voice, image generation, file analysis, reasoning, and Deep Research.

Your observed usage suggests:

| Capability | Observed utilization | Opportunity |
|---|---:|---|
| Projects | Very high | Continue |
| Project instructions | Very high | Simplify |
| File uploads | High | Continue |
| Repository/code workflows | High | Continue |
| Voice | High | Better mode-specific behavior |
| Image generation | Moderate/high | Use when visual judgment matters |
| Web search | Moderate | Route automatically when freshness matters |
| Deep Research | Underutilized relative to workload | Increase substantially |
| Connected apps/plugins | Uneven | Increase automatic retrieval |
| Data analysis / interactive outputs | Moderate | Increase when quantitative |
| Scheduled Tasks | Low/moderate | Increase for monitoring/repetition |
| Memory | Heavy | Improve governance |
| Finished Work/artifact mode | Opportunity | Use for large deliverables when available |

This matters because the current product is increasingly designed around capabilities rather than one universal chat response. OpenAI distinguishes ordinary Chat from **Work**, which is intended for longer multi-step tasks and finished deliverables, while Codex remains specialized for software development. Where your account exposes Work, many of your large artifact-generation prompts are natural candidates for it.

---

# 5. Projects Are Working — but the Unit of Work Should Change

## 5.1 Project = durable context; chat = bounded objective

**Confidence: High recommendation**

You use Projects very effectively as persistent domains, but individual threads sometimes become extremely long, recursive, and multi-purpose.

There is historical evidence of at least one unusually recursive thread becoming unstable at the UI level.

The better topology is:

```text
Project
├── canonical sources
├── instructions
├── durable outputs
│
├── Chat: architecture decision
├── Chat: implementation package
├── Chat: UI critique
├── Chat: research question
└── Chat: voice discussion
```

rather than:

```text
Project
└── Immortal 900-message conversation containing civilization
```

Projects already preserve chats, files, instructions, and project memory, and Plus users can have previous project chats and files used as context. Important outputs can also be saved back into project sources.

This means continuity does **not** require every task to remain inside one giant conversation.

---

# 6. Voice Is a Different Interface

## 6.1 Voice responses should not simply be written responses read aloud

**Confidence: High**

Your voice interactions work best when ChatGPT:

- responds in compact conversational units;
- does not recite trees, giant lists, or documentation;
- remembers what has already been established;
- allows interruption and redirection;
- discusses first and produces artifacts afterward when requested.

Voice itself now supports following the same conversation in text and switching between spoken and typed interaction.

### Recommended voice contract

While voice interaction is evident:

- one major idea at a time;
- usually no more than 2–4 substantive points per turn;
- do not enumerate information that is better inspected visually;
- do not generate a massive artifact unless requested;
- preserve decisions for the eventual written artifact;
- interpret “hold on,” “wait,” and equivalent language literally.

---

# 7. Emotional Tone and Profanity Are Poor Routing Signals

## 7.1 Semantic intent should outrank lexical intensity

**Confidence: High**

Profanity, satire, exaggerated language, and dark humor occur regularly in otherwise ordinary technical or creative work.

The interface becomes incoherent when lexical intensity causes ChatGPT to abandon the actual task and switch into an unrelated response mode.

### Recommended behavior

Classify the **intent**, not merely the vocabulary.

A frustrated technical complaint generally needs:

- diagnosis;
- correction;
- acknowledgment of the actual defect;
- forward progress.

It generally does not need generic reassurance.

Actual safety-relevant statements remain a separate matter; the recommendation is simply not to confuse ordinary rhetorical intensity with them.

---

# 8. Personalization Architecture Is Currently Too Redundant

## 8.1 There are too many layers trying to express similar behavior

**Confidence: Inference, strongly supported**

Your current environment includes substantial:

- global personalization;
- user profile context;
- Project instructions;
- Project sources;
- domain-specific agent instructions;
- repository governance;
- individual prompt constraints.

This provides exceptional contextual richness, but the same execution preferences are often repeated at several layers.

That creates a predictable failure mode:

### Instruction saturation

The model spends context and attention reconciling several versions of:

- be proactive;
- be direct;
- use tools;
- avoid unnecessary questions;
- produce artifacts;
- stay in scope;
- provide complete output.

The desired behavior is correct. **The duplication is unnecessary.**

### Better separation of responsibility

| Layer | Should contain |
|---|---|
| Personality | Tone only |
| Characteristics | Formatting/tone tendencies |
| Global Custom Instructions | Stable interaction protocol |
| Memory | Stable facts and learned preferences |
| Project instructions | Domain role + operating rules |
| Project sources | Actual knowledge/source material |
| Prompt | Current objective and temporary constraints |

This separation should materially improve consistency.

---

# 9. Memory Should Store Context, Not Governance

Memory now synthesizes useful context from chats, files, and connected apps and exposes a memory summary that can be reviewed and corrected. Custom Instructions remain the appropriate mechanism for explicit behavioral guidance.

### Recommended division

**Memory**

Use for:

- durable personal facts;
- long-lived technical preferences;
- recurring interaction preferences;
- stable working environment information.

**Do not rely on memory for:**

- current repository state;
- temporary project decisions;
- canonical architecture;
- active backlogs;
- source-of-truth contracts.

Those belong in project sources or connected systems.

This avoids stale remembered state competing with live authoritative material.

---

# 10. Connected Apps Are a Major Underused Surface

Apps can search and reference external information, expose richer in-chat UI, sync certain sources, participate in Deep Research, and—depending on configuration—perform write actions.

This changes the optimal assistant behavior.

When you ask:

- “what did they email me?”
- “what’s on my schedule?”
- “what does the repo currently contain?”
- “find that document”
- “what did I spend?”
- “update this file”

the assistant should first consider the corresponding connected source instead of asking you to copy data into the conversation.

### Recommended permission posture

For trusted integrations, favor a configuration that permits **read operations without repeated confirmation while preserving confirmation around consequential writes**.

That reduces modal friction without turning the assistant loose with a flamethrower.

---

# 11. Deep Research Is Particularly Well Matched to Your Work

Deep Research can combine public web sources, uploaded files, and enabled apps, then produce a structured report with citations and a source history.

You frequently perform exactly this class of task:

- technology comparisons;
- architecture research;
- competitor/product study;
- current documentation synthesis;
- market analysis;
- broad project audits;
- source reconciliation.

### Recommendation

Use normal web search for:

- one factual verification;
- current version information;
- a few external references.

Use Deep Research when:

- more than a handful of sources matter;
- source reconciliation matters;
- the result will become durable knowledge;
- citations matter;
- the output is itself a research artifact.

---

# 12. Scheduled Tasks Are a High-Leverage Underused Capability

Scheduled Tasks are available to Plus users and currently support one-off, recurring, and monitoring jobs; Plus supports up to five active scheduled tasks. Tasks can also work with supported connected apps.

You have some historical Scheduled Task usage, but far less than your recurring workload would justify.

High-value candidates include:

- repository/release monitoring;
- weekly project-state reviews;
- recurring job/opportunity scans;
- technology change monitoring;
- follow-up reminders;
- recurring financial or operational reviews;
- periodic personalization/memory hygiene.

The important distinction:

> Do not schedule work merely because it can be scheduled. Schedule work whose value comes from **not having to remember to initiate it**.

---

# 13. Current Personality Configuration

Your current Base style and tone is **Professional**.

I recommend keeping it.

The main interaction problems identified here are not caused by insufficient bluntness or excessive formality. Switching to Efficient would shorten responses but would not solve resource-routing failures. Switching to Candid would change tone but likewise would not address tool selection.

If **Characteristics** are available on your account—they are still rolling out gradually—I would configure:

| Characteristic | Recommendation |
|---|---|
| Warm | slightly more |
| Enthusiastic | slightly more |
| Headers & Lists | more |
| Emojis | less |

Those controls specifically affect warmth, enthusiasm, markdown structure, and emoji usage while leaving the underlying capabilities unchanged.

---

# 14. Highest-Priority Changes

## Priority 1 — Install a global resource-routing rule

Before answering, ChatGPT should silently determine whether a materially better result requires:

- web search;
- files;
- project context;
- memory;
- an app/connector;
- data analysis;
- image generation;
- an artifact;
- Work;
- Codex;
- or a Scheduled Task.

This is the single highest-value personalization change.

---

## Priority 2 — Reduce global Custom Instructions

Plus currently allows up to 5,000 characters of Custom Instructions.

Do not use that allowance as a challenge.

Global instructions should define **stable interaction behavior**, not recreate every project doctrine.

Move specialized rules downward into their respective Projects.

---

## Priority 3 — Make every major response outcome-aware

Before finalizing, the assistant should ask itself:

> What will the user need to do with this answer next?

Then choose the representation accordingly.

Examples:

- needs to paste it → clean reusable text;
- needs to edit it → editable writing artifact;
- needs to import it → actual file;
- needs to compare → table;
- needs to understand relationships → diagram;
- needs implementation → repository/code change;
- needs evidence → citations;
- needs continued monitoring → Scheduled Task.

---

## Priority 4 — Treat Projects as context containers, not giant chats

Create bounded conversations for bounded outcomes.

Save durable outputs back to the project.

This improves navigation, retrieval, context coherence, and thread stability without sacrificing continuity. Projects are explicitly designed to retain their associated context.

---

# 15. Proposed Success Criteria

A materially improved ChatGPT interface for this usage pattern should achieve the following:

| Criterion | Target |
|---|---|
| Re-asking known information | Near zero |
| Unnecessary clarification before execution | Rare |
| Current facts answered without verification | Near zero |
| Connected data manually recopied by user | Rare |
| Artifact-worthy request answered only in prose | Rare |
| Explicit “wait/stop” ignored | Zero |
| Project doctrine leaking across projects | Rare |
| Response distinguishes evidence from inference | Consistent |
| Finished artifacts include usable file/output | Consistent |
| Voice turns become long lectures | Rare |
| Tool use performed merely for spectacle | Rare |
| Valuable tool use omitted because plain chat was easier | Rare |

---

# Overall Assessment

The existing setup is already sophisticated. Its weakness is almost the opposite of an underconfigured account.

There is **a lot of capability and a lot of context**, but the interface does not always select among them coherently.

The next improvement should therefore not be “more instructions.”

It should be a **smaller global interaction contract whose central job is resource orchestration**.

The desired interface is:

```text
User expresses intent
        ↓
ChatGPT resolves existing context
        ↓
Classifies the task
        ↓
Selects the best resource/interface
        ↓
Executes as far as possible
        ↓
Returns the correct representation
        ↓
Preserves durable output when appropriate
```

That is the configuration most likely to make ChatGPT feel less like a very clever text box and more like an integrated working environment.